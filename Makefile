# Makefile for OCR-D

# Allow repo-independent site-local customization of variables
-include local.mk

# Python version (python3 required).
export PYTHON ?= python3
# Set to 1 to skip all submodule updates. For development.
NO_UPDATE ?= 0
# Set to non-empty to try running all executables with --help / -h during make check
CHECK_HELP ?= -h
GIT = git
ifdef SUDO_USER
ifneq ($(USER),$(SUDO_USER))
# When running with sudo, git commands must use the original user.
GIT = sudo -u $(SUDO_USER) git
endif
endif
GIT_RECURSIVE = # --recursive
GIT_DEPTH = # --depth 1 or --single-branch

# directory for virtual Python environment
# (but re-use if already active)
export VIRTUAL_ENV ?= $(CURDIR)/venv

BIN = $(VIRTUAL_ENV)/bin
SHARE = $(VIRTUAL_ENV)/share
ACTIVATE_VENV = $(BIN)/activate

define SEMGIT
$(if $(shell sem --version 2>/dev/null),sem -q --will-cite --fg --id ocrd_all_git,$(error cannot find package GNU parallel))
endef

define WGET
$(if $(shell wget --version 2>/dev/null),wget -nv -O $(1) $(2),$(if $(shell curl --version 2>/dev/null),curl -L -o $(1) $(2),$(error found no cmdline downloader (wget/curl))))
endef

SHELL := $(shell which bash)

OCRD_EXECUTABLES = # add more CLIs below
OCRD_IMAGES =

DEFAULT_DISABLED_MODULES = cor-asv-fst ocrd_ocropy ocrd_neat
DISABLED_MODULES ?= $(DEFAULT_DISABLED_MODULES)

# Default to all submodules, but allow overriding by user
# (and treat the empty value as if it was unset)
ifeq ($(strip $(OCRD_MODULES)),)
override OCRD_MODULES := $(filter-out $(DISABLED_MODULES),$(shell $(GIT) submodule status | while read commit dir ref; do echo $$dir; done))
endif

# `all` is too much for a default, and `ocrd` is too little
.DEFAULT_GOAL = help

# delete file targets (e.g. executables / venvs) when recipes fail
# to ensure they are re-built (not considered up-to-date) when re-entering
.DELETE_ON_ERROR:

.PHONY: all modules clean help show check always-update install-models

clean: network-clean images-clean
	$(RM) -r $(CURDIR)/venv # deliberately not using VIRTUAL_ENV here
	$(RM) -r $(HOME)/.parallel/semaphores/id-ocrd_*
	$(RM) ocrd-all-tool.json ocrd-all-module-dir.json ocrd-all-meta.json ocrd-all-images.yaml

.PHONY: images-clean
images-clean:
	for image in $(OCRD_IMAGES); do docker rmi $$image; $(RM) $$image; done

define HELP
cat <<"EOF"
Rules to download and install all OCR-D module processors
from their source repositories into a single virtualenv.

Targets (general):
	help: show this message
	show: list the venv path and all executables (to be) installed
	show-VAR: print the value of make variable VAR

Targets (module management):
	modules: download all submodules to the managed revision
	deinit: clean, then deinit and rmdir all submodules
	tidy: clean, then git-clean all submodules
	      (WARNING: potential data loss; if unsure, try with `make -n` and `git clean -n`)

Targets (system dependencies, may need root privileges):
	deps-ubuntu: install system dependencies

Targets (build and installation into venv):
	images: download/rebuild Docker images associated with submodules
	all: install all executables of all modules/images
	ocrd: only install the multi-purpose CLI of OCR-D/core
	clean: remove the virtual environment directory

Targets (testing):
	check: verify that all executables are runnable
	test-cuda: verify that CUDA is available for Tensorflow and Pytorch
	test-workflow: verify that most executables work correctly via test runs on test data

Targets (auxiliary data):
	ocrd-all-tool.json: generate union of ocrd-tool.json's tools section for all executables of all modules
	ocrd-all-meta.json: map executable to ocrd-tool.json's metadata section for all executables of all modules
	init-vol-models: initialise shared Docker volume with files from module images but user permissions
	install-models: download commonly used models to appropriate locations

Variables:
	OCRD_MODULES: selection of submodules to include. Default: all git submodules (see `show`)
	DISABLED_MODULES: list of disabled modules. Default: "$(DISABLED_MODULES)"
	DOCKER_PULL_POLICY: set to `build` to `docker build` instead of `docker pull` images
	DOCKER_VOL_MODELS: name of named volume to be mounted for processor resources (see `init-vol-models`)
	DOCKER_RUN_OPTS: additional options for `docker run`
	GIT_RECURSIVE: set to `--recursive` to checkout/update all submodules recursively
	GIT_DEPTH: set to `--depth 1` to truncate all history when cloning subrepos
	NO_UPDATE: set to `1` to omit git submodule sync and update
	VIRTUAL_ENV: absolute path to (re-)use for the virtual environment
	TMPDIR: path to use for temporary storage instead of the system default
	PYTHON: name of the Python binary (also used for target `deps-ubuntu` unless set to `python`)
	PIP_OPTIONS: extra options for the `pip install` command like `-q` or `-v` or `-e`
	CHECK_HELP: set to `1` to also check each executable can generate help output
EOF
endef
export HELP
help: ;	@eval "$$HELP"

# update subrepos to the committed revisions:
# - depends on phony always-update,
#   so this will not only work on first checkout
# - updates the module to the revision registered here,
#   unless it is already up-to-date
# - then updates the time stamp of the module directory
#   so the directory can be used as a dependency
# - synchronize via mutex to avoid race for git lock file
# - for minimal image sizes in Docker builds, avoid cloning all branches
#   by using GIT_DEPTH="--depth 1" or GIT_DEPTH=--single-branch
modules: $(OCRD_MODULES)
# but bypass updates if we have no repo here (e.g. Docker build)
ifneq (,$(wildcard .git))
ifneq ($(NO_UPDATE),1)
$(OCRD_MODULES): always-update
	$(SEMGIT) $(GIT) submodule sync $(GIT_RECURSIVE) $@
	if $(GIT) submodule status $(GIT_RECURSIVE) $@ | grep -qv '^ '; then \
		$(SEMGIT) $(GIT) submodule update --init $(GIT_RECURSIVE) $(GIT_DEPTH) $@ && \
		touch $@; fi
endif
endif

.PHONY: deinit
deinit: clean
	git submodule deinit --all # --force
	git submodule status | while read stat dir ver; do rmdir $$dir; done

.PHONY: tidy
tidy: clean
	git submodule foreach --recursive git clean -fxd
# if you already have a clone with too many refs, consider the following recipe:
#git submodule foreach 'for ref in $(git for-each-ref --no-contains=HEAD --format="%(refname)" refs/remotes/ | sed s,^refs/remotes/,,); do git branch -d -r $ref; done'
	git gc


# Get Python modules.

%/bin/activate:
	$(PYTHON) -m venv $(subst /bin/activate,,$@)
	. $@ && pip install --upgrade pip setuptools wheel
	. $@ && pip install click requests pyaml ocrd dotenv

# Install modules from source.

.PHONY: ocrd
ocrd: $(BIN)/ocrd
ifneq ($(filter core, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(CORE)
CORE := $(BIN)/ocrd
CORE += $(BIN)/ocrd-dummy
CORE += $(BIN)/ocrd-filter
OCRD_IMAGES += ocrd/core
$(CORE): ocrd/core
	$(call delegate_docker,$@,$<)
ocrd/core: DOCKER_PROFILES =
ocrd/core: ./core
	$(call pullpolicy_docker,$<,$@)
endif

# Convert the executable names (1) to a pattern rule,
# so that the recipe will be used with single-recipe-
# multiple-output semantics (make >= 4.3 implements
# 'grouped-target' for this, but we cannot rely on that):
multirule = $(patsubst $(BIN)/%,\%/%,$(1))


ifneq ($(filter ocrd_kraken, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_KRAKEN)
install-models: install-models-kraken
.PHONY: install-models-kraken
install-models-kraken: ocrd-kraken-ocrd
	ocrd-kraken-ocrd resmgr download ocrd-kraken-segment '*'
	ocrd-kraken-ocrd resmgr download ocrd-kraken-recognize '*'
OCRD_KRAKEN := $(BIN)/ocrd-kraken-ocrd
OCRD_KRAKEN += $(BIN)/ocrd-kraken-binarize
OCRD_KRAKEN += $(BIN)/ocrd-kraken-segment
OCRD_KRAKEN += $(BIN)/ocrd-kraken-recognize
OCRD_KRAKEN += $(BIN)/kraken
OCRD_KRAKEN += $(BIN)/ketos
OCRD_IMAGES += ocrd/kraken
$(OCRD_KRAKEN): ocrd/kraken
	$(call delegate_docker,$@,$<)
ocrd/kraken: DOCKER_PROFILES = maximum
ocrd/kraken: ./ocrd_kraken
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter ocrd_detectron2, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_DETECTRON2)
OCRD_DETECTRON2 := $(BIN)/ocrd-detectron2-ocrd
OCRD_DETECTRON2 += $(BIN)/ocrd-detectron2-segment
OCRD_IMAGES += ocrd/detectron2
$(OCRD_DETECTRON2): ocrd/detectron2
	$(call delegate_docker,$@,$<)
ocrd/detectron2: DOCKER_PROFILES = maximum
ocrd/detectron2: ./ocrd_detectron2
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter ocrd_page2alto, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_PAGE_TO_ALTO)
OCRD_PAGE_TO_ALTO := $(BIN)/ocrd-page2alto-ocrd
OCRD_PAGE_TO_ALTO += $(BIN)/ocrd-page2alto-transform
OCRD_PAGE_TO_ALTO += $(BIN)/page-to-alto
OCRD_IMAGES += ocrd/page2alto
$(OCRD_PAGE_TO_ALTO): ocrd/page2alto
	$(call delegate_docker,$@,$<)
ocrd/page2alto: DOCKER_PROFILES =
ocrd/page2alto: ./ocrd_page2alto
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter ocrd_ocropy, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_OCROPY)
OCRD_OCROPY := $(BIN)/ocrd-ocropy-ocrd
OCRD_OCROPY += $(BIN)/ocrd-ocropy-segment
OCRD_IMAGES += ocrd/ocropy
$(OCRD_OCROPY): ocrd/ocropy
	$(call delegate_docker,$@,$<)
ocrd/ocropy: DOCKER_PROFILES =
ocrd/ocropy: ./ocrd_ocropy
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter cor-asv-ann, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_COR_ASV_ANN)
OCRD_COR_ASV_ANN := $(BIN)/ocrd-cor-asv-ann-ocrd
OCRD_COR_ASV_ANN += $(BIN)/ocrd-cor-asv-ann-evaluate
OCRD_COR_ASV_ANN += $(BIN)/ocrd-cor-asv-ann-process
OCRD_COR_ASV_ANN += $(BIN)/ocrd-cor-asv-ann-align
OCRD_COR_ASV_ANN += $(BIN)/ocrd-cor-asv-ann-join
OCRD_COR_ASV_ANN += $(BIN)/ocrd-cor-asv-ann-mark
OCRD_COR_ASV_ANN += $(BIN)/cor-asv-ann-train
OCRD_COR_ASV_ANN += $(BIN)/cor-asv-ann-proc
OCRD_COR_ASV_ANN += $(BIN)/cor-asv-ann-eval
OCRD_COR_ASV_ANN += $(BIN)/cor-asv-ann-compare
OCRD_COR_ASV_ANN += $(BIN)/cor-asv-ann-repl
OCRD_IMAGES += ocrd/cor-asv-ann
$(OCRD_COR_ASV_ANN): ocrd/cor-asv-ann
	$(call delegate_docker,$@,$<)
ocrd/cor-asv-ann: DOCKER_PROFILES = medium maximum
ocrd/cor-asv-ann: ./cor-asv-ann
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter cor-asv-fst, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_COR_ASV_FST)
OCRD_COR_ASV_FST := $(BIN)/ocrd-cor-asv-fst-ocrd
OCRD_COR_ASV_FST += $(BIN)/ocrd-cor-asv-fst-process
OCRD_COR_ASV_FST += $(BIN)/cor-asv-fst-train
OCRD_IMAGES += ocrd/cor-asv-fst
$(OCRD_COR_ASV_FST): ocrd/cor-asv-fst
	$(call delegate_docker,$@,$<)
ocrd/cor-asv-fst: DOCKER_PROFILES = maximum
ocrd/cor-asv-fst: ./cor-asv-fst
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter ocrd_keraslm, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_KERASLM)
OCRD_KERASLM := $(BIN)/ocrd-keraslm-ocrd
OCRD_KERASLM += $(BIN)/ocrd-keraslm-rate
OCRD_KERASLM += $(BIN)/keraslm-rate
OCRD_IMAGES += ocrd/keraslm
$(OCRD_KERASLM): DOCKER_PROFILES = medium, maximum
$(OCRD_KERASLM): ocrd/keraslm
	$(call delegate_docker,$@,$<)
ocrd/keraslm: ./ocrd_keraslm
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter ocrd_neat, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_NEAT)
OCRD_NEAT := $(BIN)/ocrd-neat-import
OCRD_NEAT += $(BIN)/ocrd-neat-export
OCRD_NEAT += $(BIN)/extract-doc-links
OCRD_NEAT += $(BIN)/annotate-tsv
OCRD_NEAT += $(BIN)/page2tsv
OCRD_NEAT += $(BIN)/tsv2page
OCRD_NEAT += $(BIN)/make-page2tsv-commands
OCRD_IMAGES += ocrd/neat
$(OCRD_NEAT): ocrd/neat
	$(call delegate_docker,$@,$<)
ocrd/neat: DOCKER_PROFILES = maximum
ocrd/neat: ./ocrd_neat
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter ocrd_wrap, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_WRAP)
OCRD_WRAP := $(BIN)/ocrd-wrap-ocrd
OCRD_WRAP += $(BIN)/ocrd-preprocess-image
OCRD_WRAP += $(BIN)/ocrd-skimage-normalize
OCRD_WRAP += $(BIN)/ocrd-skimage-denoise-raw
OCRD_WRAP += $(BIN)/ocrd-skimage-binarize
OCRD_WRAP += $(BIN)/ocrd-skimage-denoise
OCRD_IMAGES += ocrd/wrap
$(OCRD_WRAP): ocrd/wrap
	$(call delegate_docker,$@,$<)
ocrd/wrap: DOCKER_PROFILES =
ocrd/wrap: ./ocrd_wrap
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter ocrd_fileformat, $(OCRD_MODULES)),)
ocrd_fileformat: GIT_RECURSIVE = --recursive
OCRD_EXECUTABLES += $(OCRD_FILEFORMAT)
OCRD_FILEFORMAT := $(BIN)/ocrd-fileformat-ocrd
OCRD_FILEFORMAT += $(BIN)/ocrd-fileformat-transform
OCRD_FILEFORMAT += $(BIN)/ocr-transform
OCRD_FILEFORMAT += $(BIN)/ocr-validate
OCRD_IMAGES += ocrd/fileformat
$(OCRD_FILEFORMAT): ocrd/fileformat
	$(call delegate_docker,$@,$<)
ocrd/fileformat: DOCKER_PROFILES =
ocrd/fileformat: ./ocrd_fileformat
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter ocrd_olena, $(OCRD_MODULES)),)
ocrd_olena: GIT_RECURSIVE = --recursive
OCRD_EXECUTABLES += $(OCRD_OLENA)
OCRD_OLENA := $(BIN)/ocrd-olena-ocrd
OCRD_OLENA += $(BIN)/ocrd-olena-binarize
OCRD_OLENA += $(BIN)/scribo-cli
OCRD_IMAGES += ocrd/olena
$(OCRD_OLENA): ocrd/olena
	$(call delegate_docker,$@,$<)
ocrd/olena: DOCKER_PROFILES = medium maximum
ocrd/olena: ./ocrd_olena
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter dinglehopper, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_DINGLEHOPPER)
OCRD_DINGLEHOPPER := $(BIN)/ocrd-dinglehopper-ocrd
OCRD_DINGLEHOPPER += $(BIN)/ocrd-dinglehopper
OCRD_DINGLEHOPPER += $(BIN)/dinglehopper
OCRD_DINGLEHOPPER += $(BIN)/dinglehopper-extract
OCRD_DINGLEHOPPER += $(BIN)/dinglehopper-summarize
OCRD_DINGLEHOPPER += $(BIN)/dinglehopper-line-dirs
OCRD_IMAGES += ocrd/dinglehopper
$(OCRD_DINGLEHOPPER): ocrd/dinglehopper
	$(call delegate_docker,$@,$<)
ocrd/dinglehopper: DOCKER_PROFILES = medium maximum
ocrd/dinglehopper: ./dinglehopper
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter docstruct, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_DOCSTRUCT)
OCRD_DOCSTRUCT := $(BIN)/ocrd-docstruct-ocrd
OCRD_DOCSTRUCT += $(BIN)/ocrd-docstruct
OCRD_IMAGES += ocrd/docstruct
$(OCRD_DOCSTRUCT): ocrd/docstruct
	$(call delegate_docker,$@,$<)
ocrd/docstruct: DOCKER_PROFILES = medium maximum
ocrd/docstruct: ./docstruct
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter nmalign, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_NMALIGN)
OCRD_NMALIGN := $(BIN)/ocrd-nmalign-ocrd
OCRD_NMALIGN += $(BIN)/ocrd-nmalign-merge
OCRD_NMALIGN += $(BIN)/nmalign
OCRD_IMAGES += ocrd/nmalign
$(OCRD_NMALIGN): ocrd/nmalign
	$(call delegate_docker,$@,$<)
ocrd/nmalign: DOCKER_PROFILES = medium maximum
ocrd/nmalign: ./nmalign
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter ocrd_segment, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_SEGMENT)
OCRD_SEGMENT := $(BIN)/ocrd-segment-ocrd
OCRD_SEGMENT += $(BIN)/ocrd-segment-evaluate
OCRD_SEGMENT += $(BIN)/page-segment-evaluate
OCRD_SEGMENT += $(BIN)/ocrd-segment-from-masks
OCRD_SEGMENT += $(BIN)/ocrd-segment-from-coco
OCRD_SEGMENT += $(BIN)/ocrd-segment-extract-glyphs
OCRD_SEGMENT += $(BIN)/ocrd-segment-extract-words
OCRD_SEGMENT += $(BIN)/ocrd-segment-extract-lines
OCRD_SEGMENT += $(BIN)/ocrd-segment-extract-regions
OCRD_SEGMENT += $(BIN)/ocrd-segment-extract-pages
OCRD_SEGMENT += $(BIN)/ocrd-segment-replace-original
OCRD_SEGMENT += $(BIN)/ocrd-segment-replace-page
OCRD_SEGMENT += $(BIN)/ocrd-segment-replace-text
OCRD_SEGMENT += $(BIN)/ocrd-segment-repair
OCRD_SEGMENT += $(BIN)/ocrd-segment-project
OCRD_IMAGES += ocrd/segment
$(OCRD_SEGMENT): ocrd/segment
	$(call delegate_docker,$@,$<)
ocrd/segment: DOCKER_PROFILES = medium maximum
ocrd/segment: ./ocrd_segment
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter ocrd_tesserocr, $(OCRD_MODULES)),)
ocrd_tesserocr: GIT_RECURSIVE = --recursive
install-models: install-models-tesseract
.PHONY: install-models-tesseract
install-models-tesseract: ocrd-tesserocr-ocrd
	ocrd-tesserocr-ocrd resmgr download ocrd-tesserocr-recognize '*'

OCRD_EXECUTABLES += $(OCRD_TESSEROCR)
OCRD_TESSEROCR := $(BIN)/ocrd-tesserocr-ocrd
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-fontshape
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-binarize
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-crop
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-deskew
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-recognize
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-line
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-region
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-table
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-word
OCRD_TESSEROCR += $(BIN)/tesseract
OCRD_TESSEROCR += $(BIN)/ambiguous_words
OCRD_TESSEROCR += $(BIN)/classifier_tester
OCRD_TESSEROCR += $(BIN)/cntraining
OCRD_TESSEROCR += $(BIN)/combine_lang_model
OCRD_TESSEROCR += $(BIN)/combine_tessdata
OCRD_TESSEROCR += $(BIN)/dawg2wordlist
OCRD_TESSEROCR += $(BIN)/lstmeval
OCRD_TESSEROCR += $(BIN)/lstmtraining
OCRD_TESSEROCR += $(BIN)/merge_unicharsets
OCRD_TESSEROCR += $(BIN)/mftraining
OCRD_TESSEROCR += $(BIN)/set_unicharset_properties
OCRD_TESSEROCR += $(BIN)/shapeclustering
OCRD_TESSEROCR += $(BIN)/text2image
OCRD_TESSEROCR += $(BIN)/unicharset_extractor
OCRD_TESSEROCR += $(BIN)/wordlist2dawg
OCRD_IMAGES += ocrd/tesserocr
$(OCRD_TESSEROCR): ocrd/tesserocr
	$(call delegate_docker,$@,$<)
ocrd/tesserocr: DOCKER_PROFILES =
ocrd/tesserocr: ./ocrd_tesserocr
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter ocrd_cis, $(OCRD_MODULES)),)
install-models: install-models-ocropus
.PHONY: install-models-ocropus
install-models-ocropus: ocrd-cis-ocrd
	ocrd-cis-ocrd resmgr download ocrd-cis-ocropy-recognize '*'

OCRD_EXECUTABLES += $(OCRD_CIS)
OCRD_CIS := $(BIN)/ocrd-cis-ocrd
OCRD_CIS += $(BIN)/ocrd-cis-align
OCRD_CIS += $(BIN)/ocrd-cis-data
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-binarize
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-clip
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-denoise
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-deskew
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-dewarp
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-recognize
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-resegment
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-segment
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-train
OCRD_CIS += $(BIN)/ocrd-cis-postcorrect
OCRD_IMAGES += ocrd/cis
$(OCRD_CIS): ocrd/cis
	$(call delegate_docker,$@,$<)
ocrd/cis: DOCKER_PROFILES =
ocrd/cis: ./ocrd_cis
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter ocrd_pagetopdf, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_PAGETOPDF)
OCRD_PAGETOPDF := $(BIN)/ocrd-pagetopdf-ocrd
OCRD_PAGETOPDF += $(BIN)/ocrd-pagetopdf
OCRD_PAGETOPDF += $(BIN)/ocrd-altotopdf
OCRD_IMAGES += ocrd/pagetopdf
$(OCRD_PAGETOPDF): ocrd/pagetopdf
	$(call delegate_docker,$@,$<)
ocrd/pagetopdf: DOCKER_PROFILES =
ocrd/pagetopdf: ./ocrd_pagetopdf
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter ocrd_calamari, $(OCRD_MODULES)),)
install-models: install-models-calamari
.PHONY: install-models-calamari
install-models-calamari: ocrd-calamari-ocrd
	ocrd-calamari-ocrd resmgr download ocrd-calamari-recognize '*'
OCRD_EXECUTABLES += $(OCRD_CALAMARI)
OCRD_CALAMARI := $(BIN)/ocrd-calamari-ocrd
OCRD_CALAMARI += $(BIN)/ocrd-calamari-recognize
OCRD_CALAMARI += $(BIN)/calamari-ocr
OCRD_IMAGES += ocrd/calamari
$(OCRD_CALAMARI): ocrd/calamari
	$(call delegate_docker,$@,$<)
ocrd/calamari: DOCKER_PROFILES = medium maximum
ocrd/calamari: ./ocrd_calamari
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter ocrd_anybaseocr, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_ANYBASEOCR)
OCRD_ANYBASEOCR := $(BIN)/ocrd-anybaseocr-ocrd
OCRD_ANYBASEOCR += $(BIN)/ocrd-anybaseocr-crop
OCRD_ANYBASEOCR += $(BIN)/ocrd-anybaseocr-layout-analysis
OCRD_IMAGES += ocrd/anybaseocr
$(OCRD_ANYBASEOCR): ocrd/anybaseocr
	$(call delegate_docker,$@,$<)
ocrd/anybaseocr: DOCKER_PROFILES = maximum
ocrd/anybaseocr: ./ocrd_anybaseocr
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter ocrd_froc, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_FROC)
OCRD_FROC := $(BIN)/ocrd-froc-ocrd
OCRD_FROC += $(BIN)/ocrd-froc-recognize
OCRD_IMAGES += ocrd/froc
$(OCRD_FROC): ocrd/froc
	$(call delegate_docker,$@,$<)
ocrd/froc: DOCKER_PROFILES = maximum
ocrd/froc: ./ocrd_froc
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter ocrd_doxa, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_DOXA)
OCRD_DOXA := $(BIN)/ocrd-doxa-ocrd
OCRD_DOXA += $(BIN)/ocrd-doxa-binarize
OCRD_IMAGES += ocrd/doxa
$(OCRD_DOXA): ocrd/doxa
	$(call delegate_docker,$@,$<)
ocrd/doxa: DOCKER_PROFILES = maximum
ocrd/doxa: ./ocrd_doxa
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter eynollah, $(OCRD_MODULES)),)
install-models: install-models-eynollah
.PHONY: install-models-eynollah
install-models-eynollah: ocrd-eynollah-ocrd
	ocrd-eynollah-ocrd resmgr download ocrd-eynollah-segment '*'
OCRD_EXECUTABLES += $(EYNOLLAH_SEGMENT)
EYNOLLAH_SEGMENT := $(BIN)/ocrd-eynollah-ocrd
EYNOLLAH_SEGMENT += $(BIN)/ocrd-eynollah-segment
EYNOLLAH_SEGMENT += $(BIN)/ocrd-sbb-binarize
EYNOLLAH_SEGMENT += $(BIN)/eynollah
OCRD_IMAGES += ocrd/eynollah
$(EYNOLLAH_SEGMENT): ocrd/eynollah
	$(call delegate_docker,$@,$<)
ocrd/eynollah: DOCKER_PROFILES = maximum
ocrd/eynollah: ./eynollah
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter ocrd_olahd_client, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_OLAHD_CLIENT)
OCRD_OLAHD_CLIENT := $(BIN)/ocrd-olahd-ocrd
OCRD_OLAHD_CLIENT += $(BIN)/ocrd-olahd-client
OCRD_IMAGES += ocrd/olahd-client
$(OCRD_OLAHD_CLIENT): ocrd/olahd-client
	$(call delegate_docker,$@,$<)
ocrd/olahd-client: DOCKER_PROFILES =
ocrd/olahd-client: ./ocrd_olahd_client
	$(call pullpolicy_docker,$<,$@)
endif

ifneq ($(filter workflow-configuration, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(WORKFLOW_CONFIGURATION)
WORKFLOW_CONFIGURATION := $(BIN)/ocrd-make-ocrd
WORKFLOW_CONFIGURATION += $(BIN)/ocrd-make
WORKFLOW_CONFIGURATION += $(BIN)/ocrd-import
WORKFLOW_CONFIGURATION += $(BIN)/ocrd-page-transform
OCRD_IMAGES += ocrd/workflow-configuration
# fixme: add others...
$(WORKFLOW_CONFIGURATION): ocrd/workflow-configuration
	$(call delegate_docker,$@,$<)
ocrd/workflow-configuration: DOCKER_PROFILES =
ocrd/workflow-configuration: ./workflow-configuration
	$(call pullpolicy_docker,$<,$@)
endif

# canned recipes for executables as Docker runners:

# create shell scripts for each executable that either
# 1) run the ocrd network client for the passed Processing Server
#    (if a .env config for the network setup exists)
# 2) run the standalone CLI in the passed Docker image
#    (otherwise)
define delegate_docker
. $(ACTIVATE_VENV) && python run-network/creator.py create-client --docker-run-opts "$(DOCKER_RUN_OPTS)" $(1) $(notdir $(1:%-ocrd=ocrd)) $(2)
endef


DOCKER_PULL_POLICY ?= pull
DOCKER_VOL_MODELS ?= ocrd-models
DOCKER_RUN_OPTS ?= -v $(DOCKER_VOL_MODELS):/usr/local/share/ocrd-resources -u $$UID

ifeq ($(DOCKER_PULL_POLICY),build)
define pullpolicy_docker
$(MAKE) -C $1 docker DOCKER_TAG=$2
endif
mkdir -p $(dir $2)
@echo built: `date -Iseconds` > $2
@echo tools: `jq -c ".tools|keys" $1/ocrd-tool.json` >> $2
@echo profiles: $(DOCKER_PROFILES) >> $2
endef
else
define pullpolicy_docker
docker pull $2
mkdir -p $(dir $2)
@echo pulled: `date -Iseconds` > $2
@echo tools: `jq -c ".tools|keys" $1/ocrd-tool.json` >> $2
@echo profiles: $(DOCKER_PROFILES), >> $2
endef
endif

# copy any module-provided models into the shared named-volume
# allow non-root model updates in the named-volume
define initmodels_docker
docker run --rm -v $(DOCKER_VOL_MODELS):/models $1 bash -O nullglob -c 'for executable in /usr/local/share/ocrd-resources/*; do cp -t /models -rv $$executable; done; find /models -type d -exec chmod 777 {} \;; find /models -type f -exec chmod 666 {} \;'
endef

# At last, we know what all OCRD_EXECUTABLES are:
# (json targets depend on OCRD_MODULES and OCRD_EXECUTABLES)
all: $(OCRD_EXECUTABLES)
all: ocrd-all-tool.json ocrd-all-meta.json ocrd-all-images.yaml

images: $(OCRD_IMAGES)
#.PHONY: $(OCRD_IMAGES)

show:
	@echo VIRTUAL_ENV = $(VIRTUAL_ENV)
	@echo OCRD_MODULES = $(OCRD_MODULES)
	@echo OCRD_IMAGES = $(OCRD_IMAGES)
	@echo OCRD_EXECUTABLES = $(OCRD_EXECUTABLES:$(BIN)/%=%)

show-%: ; @echo $($*)

init-vol-models: $(OCRD_IMAGES:%=init-vol-models/%)
init-vol-models/%: %
	$(call initmodels_docker,$*)

check: $(OCRD_EXECUTABLES:%=%-check)

.PHONY: test-workflow

# download models and run some processors (not for result quality, only coverage)
test-workflow: core/tests/assets
	cd core/tests/assets/SBB0000F29300010000/data/ && bash -x $(CURDIR)/test-workflow.sh

core/tests/assets: core
	$(MAKE) -C core assets

# concatenate executables
ocrd-all-tool.json: $(OCRD_MODULES:%=%/ocrd-tool.json) $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && $(PYTHON) ocrd-all-tool.py $(wildcard $(OCRD_MODULES:%=%/ocrd-tool.json)) > $@

# concatenate everything but tools, and add current git revision
ocrd-all-meta.json: $(OCRD_MODULES:%=%/ocrd-tool.json) $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && $(PYTHON) ocrd-all-meta.py $(wildcard $(OCRD_MODULES:%=%/ocrd-tool.json)) > $@

ocrd-all-images.yaml: $(OCRD_IMAGES)
	$(file > $@)
	$(foreach IMAGE, $^, $(file >> $@, - $(IMAGE)))

%/ocrd-tool.json: %

.PHONY: $(OCRD_EXECUTABLES:%=%-check)
$(OCRD_EXECUTABLES:%=%-check):
	. $(ACTIVATE_VENV) \
	&& test -x ${@:%-check=%} \
	&& command -v $(notdir ${@:%-check=%}) >/dev/null \
	&& $(if $(CHECK_HELP), { ${@:%-check=%} --help >/dev/null 2>&1 \
	|| ${@:%-check=%} -h >/dev/null; }, true)

# offer abbreviated forms (just the CLI name in the PATH,
# without its directory):
.PHONY: $(OCRD_EXECUTABLES:$(BIN)/%=%)
$(OCRD_EXECUTABLES:$(BIN)/%=%): %: $(BIN)/%

# do not delete intermediate targets:
.SECONDARY:

# suppress all built-in suffix rules:
.SUFFIXES:

# install git and parallel first (which is required for the module updates)
deps-ubuntu:
	apt-get -y install git parallel
ifneq ($(PYTHON),python)
	apt-get install -y --no-install-recommends $(notdir $(PYTHON))-dev $(notdir $(PYTHON))-venv
endif

.PHONY: deps-ubuntu

OCRD_NETWORK_CONFIG ?= run-network/ocrd-all-config.yaml

.PHONY: network-setup network-start network-stop network-clean
network-setup: init-vol-models
network-setup: docker-compose.yml
network-setup: .env
network-setup: ocrd-processing-server-config.yaml

docker-compose.yml: $(ACTIVATE_VENV) ocrd-all-images.yaml
	. $(ACTIVATE_VENV) && python run-network/creator.py create-compose $(OCRD_NETWORK_CONFIG) $@
.env: $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && python run-network/creator.py create-dotenv $(OCRD_NETWORK_CONFIG) $@
	@# overrides
	@echo RES_VOL=$(DOCKER_VOL_MODELS) >> $@
	@echo USER_ID=`id -u` >> $@
	@echo GROUP_ID=`id -g` >> $@
#	. $(ACTIVATE_VENV) && python run-network/creator.py create-clients $(BIN) $(OCRD_NETWORK_CONFIG)
ocrd-processing-server-config.yaml: $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && python run-network/creator.py create-psconfig $(OCRD_NETWORK_CONFIG) $@
network-start:
	# docker compose up -d
	. $(ACTIVATE_VENV) && python run-network/creator.py start
network-stop:
	# docker compose down
	. $(ACTIVATE_VENV) && python run-network/creator.py stop
network-clean:
	$(RM) -r $(VIRTUAL_ENV) .env docker-compose.yml ocrd-processing-server-config.yaml
	docker volume rm $(DOCKER_VOL_MODELS)
# do not search for implicit rules here:
Makefile: ;
local.mk: ;

# eof
