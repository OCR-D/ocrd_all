# Makefile for OCR-D

# Allow repo-independent site-local customization of variables
-include local.mk

# Python version (python3 required).
export PYTHON ?= python3
# PIP_OPTIONS ?= # empty
# Derived variable to allow filtering -e, or inserting other options
# (the option --editable must always be last and only applies to src install)
PIP_OPTIONS_E = $(filter-out -e,$(PIP_OPTIONS))
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
# (but re-use if already active); overridden
# to nested venv in recursive calls for modules
# that have known dependency clashes with others
export VIRTUAL_ENV ?= $(CURDIR)/venv
ifeq (0, $(MAKELEVEL))
SUB_VENV = $(VIRTUAL_ENV)/sub-venv
SUB_VENV_TF1 = $(SUB_VENV)/headless-tf1
else
SUB_VENV_TF1 = $(VIRTUAL_ENV)
endif

BIN = $(VIRTUAL_ENV)/bin
SHARE = $(VIRTUAL_ENV)/share
ACTIVATE_VENV = $(BIN)/activate

# Get Python major and minor versions for some conditional rules.
PYTHON_VERSION := $(shell $(PYTHON) -c 'import sys; print("%u.%u" % (sys.version_info.major, sys.version_info.minor))')

# core version to ensure docker images are based on the latest tagged release
CORE_VERSION = $(shell git -C core describe --tags --abbrev=0)

define SEMGIT
$(if $(shell sem --version 2>/dev/null),sem -q --will-cite --fg --id ocrd_all_git,$(error cannot find package GNU parallel))
endef

define SEMPIP
$(if $(shell sem --version 2>/dev/null),sem -q --will-cite --fg --id ocrd_all_pip$(notdir $(VIRTUAL_ENV)),$(error cannot find package GNU parallel))
endef

define WGET
$(if $(shell wget --version 2>/dev/null),wget -nv -O $(1) $(2),$(if $(shell curl --version 2>/dev/null),curl -L -o $(1) $(2),$(error found no cmdline downloader (wget/curl))))
endef

ifeq ($(PKG_CONFIG_PATH),)
PKG_CONFIG_PATH := $(VIRTUAL_ENV)/lib/pkgconfig
else
PKG_CONFIG_PATH := $(VIRTUAL_ENV)/lib/pkgconfig:$(PKG_CONFIG_PATH)
endif
export PKG_CONFIG_PATH

SHELL := $(shell which bash)

OCRD_EXECUTABLES = $(BIN)/ocrd # add more CLIs below
CUSTOM_DEPS = unzip wget parallel git less # add more packages for deps-ubuntu below (or modules as preqrequisites)

DEFAULT_DISABLED_MODULES = cor-asv-fst opencv-python ocrd_ocropy ocrd_pc_segmentation ocrd_neat
ifeq ($(filter docker-%,$(MAKECMDGOALS)),)
ifneq ($(PYTHON_VERSION),3.8)
# Disable modules which require tensorflow-gpu 1.15 unless running a Python version which provides it.
DEFAULT_DISABLED_MODULES += cor-asv-ann ocrd_keraslm
endif
endif
ifeq ($(PYTHON_VERSION),3.11)
# Detectron2 relies on Pytorch 1 which still uses pkg_resources
DEFAULT_DISABLED_MODULES += ocrd_detectron2
endif
ifeq ($(PYTHON_VERSION),3.12)
# The required tensorflow is not available for Python 3.12.
DEFAULT_DISABLED_MODULES += eynollah ocrd_anybaseocr ocrd_calamari sbb_binarization
# The required coremltools does not support Python 3.12.
DEFAULT_DISABLED_MODULES += ocrd_kraken
# Detectron2 relies on Pytorch 1 which still uses pkg_resources
DEFAULT_DISABLED_MODULES += ocrd_detectron2
endif
ifeq ($(shell uname -s),Darwin)
# Disable ocrd_olena for macOS because build is broken.
DEFAULT_DISABLED_MODULES += ocrd_olena
endif
DISABLED_MODULES ?= $(DEFAULT_DISABLED_MODULES)

# Default to all submodules, but allow overriding by user
# (and treat the empty value as if it was unset)
# opencv-python is only needed for aarch64-linux-gnu and other less common platforms,
# so don't include it by default.
ifeq ($(strip $(OCRD_MODULES)),)
override OCRD_MODULES := $(filter-out $(DISABLED_MODULES),$(shell $(GIT) submodule status | while read commit dir ref; do echo $$dir; done))
endif

# `all` is too much for a default, and `ocrd` is too little
.DEFAULT_GOAL = help

# delete file targets (e.g. executables / venvs) when recipes fail
# to ensure they are re-built (not considered up-to-date) when re-entering
.DELETE_ON_ERROR:

.PHONY: all modules clean help show check always-update install-models

clean: # add more prerequisites for clean below
	$(RM) -r $(SUB_VENV)
	$(RM) -r $(CURDIR)/venv # deliberately not using VIRTUAL_ENV here
	$(RM) -r $(HOME)/.parallel/semaphores/id-ocrd_*
	$(RM) ocrd-all-tool.json ocrd-all-module-dir.json

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
	tidy: clean, then deinit opencv-python and git-clean all submodules
	      (WARNING: potential data loss; if unsure, try with `make -n` and `git clean -n`)

Targets (system dependencies, may need root privileges):
	deps-ubuntu: install all system dependencies of all modules
	deps-cuda: install CUDA toolkit and libraries (via micromamba and nvidia-pyindex)

Targets (build and installation into venv):
	all: install all executables of all modules
	ocrd: only install the virtual environment and OCR-D/core packages
	fix-cuda: workaround for non-conflicting CUDA libs after installation
	clean: remove the virtual environment directory, and make clean-*

Targets (testing):
	check: verify that all executables are runnable and the venv is consistent
	test-core: verify ocrd via core module regression tests
	test-cuda: verify that CUDA is available for Tensorflow and Pytorch
	test-workflow: verify that most executables work correctly via test runs on test data

Targets (auxiliary data):
	ocrd-all-tool.json: generate union of ocrd-tool.json for all executables of all modules
	ocrd-all-module-dir.json: mapping of module locations for all executables of all modules
	install-models: download commonly used models to appropriate locations

Targets (build of container images):
	docker: (re)build a docker image including all executables
	dockers: (re)build docker images for some pre-selected subsets of modules

Variables:
	OCRD_MODULES: selection of submodules to include. Default: all git submodules (see `show`)
	DISABLED_MODULES: list of disabled modules. Default: "$(DISABLED_MODULES)"
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
	git submodule status opencv-python | grep -q ^- || git submodule deinit opencv-python
	git submodule foreach --recursive git clean -fxd
# if you already have a clone with too many refs, consider the following recipe:
#git submodule foreach 'for ref in $(git for-each-ref --no-contains=HEAD --format="%(refname)" refs/remotes/ | sed s,^refs/remotes/,,); do git branch -d -r $ref; done'
	git gc


# Get Python modules.

$(BIN)/pip: $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && $(SEMPIP) pip install --upgrade pip setuptools

%/bin/activate:
	$(PYTHON) -m venv $(subst /bin/activate,,$@)
	. $@ && pip install --upgrade pip setuptools wheel

.PHONY: wheel
wheel: $(BIN)/wheel
$(BIN)/wheel: | $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && $(SEMPIP) pip install --force-reinstall $(PIP_OPTIONS_E) wheel

# Install modules from source.

.PHONY: ocrd
ocrd: $(BIN)/ocrd
ifneq ($(filter core, $(OCRD_MODULES)),)
deps-ubuntu-modules: core
$(BIN)/ocrd: core
	. $(ACTIVATE_VENV) && $(MAKE) -C $< install PIP="$(SEMPIP) pip" PIP_INSTALL="$(SEMPIP) pip install $(PIP_OPTIONS)" && touch -c $@
else
CUSTOM_DEPS += python3 imagemagick libgeos-dev
$(BIN)/ocrd: | $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && $(SEMPIP) pip install $(PIP_OPTIONS_E) ocrd ocrd_network
endif

.PHONY: test-core
test-core: core $(BIN)/ocrd
	. $(ACTIVATE_VENV) && $(MAKE) -C $< deps-test test

# Convert the executable names (1) to a pattern rule,
# so that the recipe will be used with single-recipe-
# multiple-output semantics:
multirule = $(patsubst $(BIN)/%,\%/%,$(1))


ifneq ($(filter format-converters, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(PAGE2IMG)
PAGE2IMG := $(BIN)/page2img
format-converters/page2img.py: format-converters
$(PAGE2IMG): format-converters/page2img.py
	. $(ACTIVATE_VENV) && $(SEMPIP) pip install validators
	echo "#!$(BIN)/python3" | cat - $< >$@
	chmod +x $@
endif

ifneq ($(filter opencv-python, $(OCRD_MODULES)),)
CUSTOM_DEPS += cmake gcc g++
# libavcodec-dev libavformat-dev libswscale-dev libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev
# libpng-dev libjpeg-dev libopenexr-dev libtiff-dev libwebp-dev libjasper-dev
opencv-python: GIT_RECURSIVE = --recursive
opencv-python/setup.py: opencv-python
$(SHARE)/opencv-python: opencv-python/setup.py | $(ACTIVATE_VENV) $(SHARE)
	. $(ACTIVATE_VENV) && cd $(<D) && ENABLE_HEADLESS=1 pip wheel . --verbose
	. $(ACTIVATE_VENV) && cd $(<D) && $(SEMPIP) pip install opencv_python_headless-*.whl
	@touch $@
$(BIN)/ocrd: $(SHARE)/opencv-python
endif

ifneq ($(filter ocrd_kraken, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_KRAKEN)
install-models: install-models-kraken
.PHONY: install-models-kraken
install-models-kraken:
	. $(ACTIVATE_VENV) && ocrd resmgr download ocrd-kraken-segment '*'
	. $(ACTIVATE_VENV) && ocrd resmgr download ocrd-kraken-recognize '*'
OCRD_KRAKEN := $(BIN)/ocrd-kraken-binarize
OCRD_KRAKEN += $(BIN)/ocrd-kraken-segment
OCRD_KRAKEN += $(BIN)/ocrd-kraken-recognize
$(call multirule,$(OCRD_KRAKEN)): ocrd_kraken $(BIN)/ocrd
# now needs to be in sub-venv because shapely<2 clashes with shapely>=2 in other modules
ifeq (0,$(MAKELEVEL))
	$(MAKE) -o $< $(notdir $(OCRD_KRAKEN)) VIRTUAL_ENV=$(SUB_VENV_TF1)
	$(call delegate_venv,$(OCRD_KRAKEN),$(SUB_VENV_TF1))
ocrd_kraken-check:
	$(MAKE) check OCRD_MODULES=ocrd_kraken VIRTUAL_ENV=$(SUB_VENV_TF1)
else
	$(pip_install)
endif
endif

ifneq ($(filter ocrd_detectron2, $(OCRD_MODULES)),)
# ocrd_detectron patches detectron2 until there is a new detectron2 release.
# See https://github.com/facebookresearch/detectron2/pull/5011 for details.
CUSTOM_DEPS += patch
OCRD_EXECUTABLES += $(OCRD_DETECTRON2)
OCRD_DETECTRON2 := $(BIN)/ocrd-detectron2-segment
$(call multirule,$(OCRD_DETECTRON2)): ocrd_detectron2 $(BIN)/ocrd | $(OCRD_KRAKEN)
	. $(ACTIVATE_VENV) && $(MAKE) -C $< deps
	$(pip_install)
endif

ifneq ($(filter ocrd_ocropy, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_OCROPY)
OCRD_OCROPY := $(BIN)/ocrd-ocropy-segment
$(OCRD_OCROPY): ocrd_ocropy $(BIN)/ocrd
	$(pip_install)
endif

ifneq ($(filter cor-asv-ann, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_COR_ASV_ANN)
OCRD_COR_ASV_ANN := $(BIN)/ocrd-cor-asv-ann-evaluate
OCRD_COR_ASV_ANN += $(BIN)/ocrd-cor-asv-ann-process
OCRD_COR_ASV_ANN += $(BIN)/ocrd-cor-asv-ann-align
OCRD_COR_ASV_ANN += $(BIN)/ocrd-cor-asv-ann-join
OCRD_COR_ASV_ANN += $(BIN)/ocrd-cor-asv-ann-mark
OCRD_COR_ASV_ANN += $(BIN)/cor-asv-ann-train
OCRD_COR_ASV_ANN += $(BIN)/cor-asv-ann-proc
OCRD_COR_ASV_ANN += $(BIN)/cor-asv-ann-eval
OCRD_COR_ASV_ANN += $(BIN)/cor-asv-ann-compare
OCRD_COR_ASV_ANN += $(BIN)/cor-asv-ann-repl
$(call multirule,$(OCRD_COR_ASV_ANN)): cor-asv-ann $(BIN)/ocrd
ifeq (0,$(MAKELEVEL))
	$(MAKE) -o $< $(notdir $(OCRD_COR_ASV_ANN)) VIRTUAL_ENV=$(SUB_VENV_TF1)
	$(call delegate_venv,$(OCRD_COR_ASV_ANN),$(SUB_VENV_TF1))
cor-asv-ann-check:
	$(MAKE) check OCRD_MODULES=cor-asv-ann VIRTUAL_ENV=$(SUB_VENV_TF1)
else
	$(pip_install_tf1nvidia)
	$(pip_install)
endif
endif

ifneq ($(filter cor-asv-fst, $(OCRD_MODULES)),)
deps-ubuntu-modules: cor-asv-fst
OCRD_EXECUTABLES += $(OCRD_COR_ASV_FST)
OCRD_COR_ASV_FST := $(BIN)/ocrd-cor-asv-fst-process
OCRD_COR_ASV_FST += $(BIN)/cor-asv-fst-train
$(call multirule,$(OCRD_COR_ASV_FST)): cor-asv-fst $(BIN)/ocrd
ifeq (0,$(MAKELEVEL))
	$(MAKE) -o $< $(notdir $(OCRD_COR_ASV_FST)) VIRTUAL_ENV=$(SUB_VENV_TF1)
	$(call delegate_venv,$(OCRD_COR_ASV_FST),$(SUB_VENV_TF1))
cor-asv-fst-check:
	$(MAKE) check OCRD_MODULES=cor-asv-fst VIRTUAL_ENV=$(SUB_VENV_TF1)
else
	$(pip_install_tf1nvidia)
	. $(ACTIVATE_VENV) && $(MAKE) -C $< deps
	$(pip_install)
endif
endif

ifneq ($(filter ocrd_keraslm, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_KERASLM)
OCRD_KERASLM := $(BIN)/ocrd-keraslm-rate
OCRD_KERASLM += $(BIN)/keraslm-rate
$(call multirule,$(OCRD_KERASLM)): ocrd_keraslm $(BIN)/ocrd
ifeq (0,$(MAKELEVEL))
	$(MAKE) -o $< $(notdir $(OCRD_KERASLM)) VIRTUAL_ENV=$(SUB_VENV_TF1)
	$(call delegate_venv,$(OCRD_KERASLM),$(SUB_VENV_TF1))
ocrd_keraslm-check:
	$(MAKE) check OCRD_MODULES=ocrd_keraslm VIRTUAL_ENV=$(SUB_VENV_TF1)
else
	$(pip_install_tf1nvidia)
	$(pip_install)
endif
endif

ifneq ($(filter ocrd_im6convert, $(OCRD_MODULES)),)
deps-ubuntu-modules: ocrd_im6convert
OCRD_EXECUTABLES += $(BIN)/ocrd-im6convert
$(BIN)/ocrd-im6convert: ocrd_im6convert $(BIN)/ocrd
	. $(ACTIVATE_VENV) && $(MAKE) -C $< install
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
$(call multirule,$(OCRD_NEAT)): ocrd_neat $(BIN)/ocrd
	$(pip_install)
endif


ifneq ($(filter ocrd_wrap, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_WRAP)
OCRD_WRAP := $(BIN)/ocrd-preprocess-image
OCRD_WRAP += $(BIN)/ocrd-skimage-normalize
OCRD_WRAP += $(BIN)/ocrd-skimage-denoise-raw
OCRD_WRAP += $(BIN)/ocrd-skimage-binarize
OCRD_WRAP += $(BIN)/ocrd-skimage-denoise
$(call multirule,$(OCRD_WRAP)): ocrd_wrap $(BIN)/ocrd
	$(pip_install)
endif

ifneq ($(filter ocrd_fileformat, $(OCRD_MODULES)),)
ocrd_fileformat: GIT_RECURSIVE = --recursive
OCRD_EXECUTABLES += $(BIN)/ocrd-fileformat-transform
$(BIN)/ocrd-fileformat-transform: ocrd_fileformat $(BIN)/ocrd
	. $(ACTIVATE_VENV) && $(MAKE) -C $< install-fileformat install
endif

ifneq ($(filter ocrd_olena, $(OCRD_MODULES)),)
ocrd_olena: GIT_RECURSIVE = --recursive
deps-ubuntu-modules: ocrd_olena
OCRD_EXECUTABLES += $(BIN)/ocrd-olena-binarize
$(BIN)/ocrd-olena-binarize: ocrd_olena $(BIN)/ocrd
	. $(ACTIVATE_VENV) && $(MAKE) -C $< install BUILD_DIR=$(VIRTUAL_ENV)/build/ocrd_olena
endif
clean: clean-olena
.PHONY: clean-olena
clean-olena:
	test ! -f ocrd_olena/Makefile || \
	$(MAKE) -C ocrd_olena clean-olena BUILD_DIR=$(VIRTUAL_ENV)/build/ocrd_olena

ifneq ($(filter dinglehopper, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(BIN)/ocrd-dinglehopper
$(BIN)/ocrd-dinglehopper: dinglehopper $(BIN)/ocrd
	$(pip_install)
endif

ifneq ($(filter docstruct, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(BIN)/ocrd-docstruct
$(BIN)/ocrd-docstruct: docstruct $(BIN)/ocrd
	$(pip_install)
endif

ifneq ($(filter nmalign, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(BIN)/ocrd-nmalign-merge
$(BIN)/ocrd-nmalign-merge: nmalign $(BIN)/ocrd
	$(pip_install)
endif

ifneq ($(filter ocrd_segment, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_SEGMENT)
OCRD_SEGMENT := $(BIN)/ocrd-segment-evaluate
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
$(call multirule,$(OCRD_SEGMENT)): ocrd_segment $(BIN)/ocrd
	$(pip_install)
endif

ifneq ($(filter ocrd_tesserocr, $(OCRD_MODULES)),)
ocrd_tesserocr: GIT_RECURSIVE = --recursive
install-models: install-models-tesseract
.PHONY: install-models-tesseract
install-models-tesseract:
	. $(ACTIVATE_VENV) && ocrd resmgr download ocrd-tesserocr-recognize '*'

OCRD_EXECUTABLES += $(OCRD_TESSEROCR)
deps-ubuntu-modules: ocrd_tesserocr
OCRD_TESSEROCR := $(BIN)/ocrd-tesserocr-binarize
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-crop
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-deskew
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-recognize
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-line
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-region
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-word
OCRD_TESSEROCR += $(BIN)/tesseract
TESSTRAIN_EXECUTABLES =
TESSTRAIN_EXECUTABLES += $(BIN)/ambiguous_words
TESSTRAIN_EXECUTABLES += $(BIN)/classifier_tester
TESSTRAIN_EXECUTABLES += $(BIN)/cntraining
TESSTRAIN_EXECUTABLES += $(BIN)/combine_lang_model
TESSTRAIN_EXECUTABLES += $(BIN)/combine_tessdata
TESSTRAIN_EXECUTABLES += $(BIN)/dawg2wordlist
TESSTRAIN_EXECUTABLES += $(BIN)/lstmeval
TESSTRAIN_EXECUTABLES += $(BIN)/lstmtraining
TESSTRAIN_EXECUTABLES += $(BIN)/merge_unicharsets
TESSTRAIN_EXECUTABLES += $(BIN)/mftraining
TESSTRAIN_EXECUTABLES += $(BIN)/set_unicharset_properties
TESSTRAIN_EXECUTABLES += $(BIN)/shapeclustering
TESSTRAIN_EXECUTABLES += $(BIN)/text2image
TESSTRAIN_EXECUTABLES += $(BIN)/unicharset_extractor
TESSTRAIN_EXECUTABLES += $(BIN)/wordlist2dawg
$(call multirule,$(OCRD_TESSEROCR)): ocrd_tesserocr $(BIN)/ocrd
	. $(ACTIVATE_VENV) && $(MAKE) -C $< install # install-tesseract-training

endif
clean: clean-tesseract
clean-tesseract: ocrd_tesserocr
	-$(MAKE) -C $< $@ clean-assets
# (keep these rules merely for backwards compatibility)
install-tesseract: ocrd_tesserocr $(BIN)/tesseract
install-tesseract-training: ocrd_tesserocr $(TESSTRAIN_EXECUTABLES)
install-tesseract install-tesseract-training:
	$(MAKE) -C $< $@
.PHONY: clean-tesseract install-tesseract install-tesseract-training

ifneq ($(filter ocrd_cis, $(OCRD_MODULES)),)
install-models: install-models-ocropus
.PHONY: install-models-ocropus
install-models-ocropus:
	. $(ACTIVATE_VENV) && ocrd resmgr download ocrd-cis-ocropy-recognize '*'

OCRD_EXECUTABLES += $(OCRD_CIS)
OCRD_CIS := $(BIN)/ocrd-cis-align
OCRD_CIS += $(BIN)/ocrd-cis-data
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-binarize
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-clip
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-denoise
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-deskew
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-dewarp
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-recognize
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-resegment
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-segment
#OCRD_CIS += $(BIN)/ocrd-cis-ocropy-train
OCRD_CIS += $(BIN)/ocrd-cis-postcorrect
$(call multirule,$(OCRD_CIS)): ocrd_cis $(BIN)/ocrd
	$(pip_install)
endif

ifneq ($(filter ocrd_pagetopdf, $(OCRD_MODULES)),)
deps-ubuntu-modules: ocrd_pagetopdf
OCRD_EXECUTABLES += $(OCRD_PAGETOPDF)
OCRD_PAGETOPDF := $(BIN)/ocrd-pagetopdf
$(OCRD_PAGETOPDF): ocrd_pagetopdf $(BIN)/ocrd
	. $(ACTIVATE_VENV) && $(MAKE) -C $< install
endif

ifneq ($(filter ocrd_calamari, $(OCRD_MODULES)),)
install-models: install-models-calamari
.PHONY: install-models-calamari
install-models-calamari: $(BIN)/ocrd
	. $(ACTIVATE_VENV) && ocrd resmgr download ocrd-calamari-recognize '*'
OCRD_EXECUTABLES += $(OCRD_CALAMARI)
OCRD_CALAMARI := $(BIN)/ocrd-calamari-recognize
$(OCRD_CALAMARI): ocrd_calamari $(BIN)/ocrd
	@# workaround for Calamari#337:
	. $(ACTIVATE_VENV) && $(SEMPIP) pip install "protobuf<4"
	$(pip_install)
endif

ifneq ($(filter ocrd_pc_segmentation, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_PC_SEGMENTATION)
OCRD_PC_SEGMENTATION := $(BIN)/ocrd-pc-segmentation
$(OCRD_PC_SEGMENTATION): ocrd_pc_segmentation
	. $(ACTIVATE_VENV) && $(MAKE) -C $< deps
	$(pip_install)
endif

ifneq ($(filter ocrd_anybaseocr, $(OCRD_MODULES)),)
install-models: install-models-anybaseocr
.PHONY: install-models-anybaseocr
install-models-anybaseocr:
	. $(ACTIVATE_VENV) && ocrd resmgr download ocrd-anybaseocr-dewarp '*'
	. $(ACTIVATE_VENV) && ocrd resmgr download ocrd-anybaseocr-layout-analysis '*'
	. $(ACTIVATE_VENV) && ocrd resmgr download ocrd-anybaseocr-tiseg '*'

OCRD_EXECUTABLES += $(OCRD_ANYBASEOCR)
OCRD_ANYBASEOCR := $(BIN)/ocrd-anybaseocr-crop
OCRD_ANYBASEOCR += $(BIN)/ocrd-anybaseocr-binarize
OCRD_ANYBASEOCR += $(BIN)/ocrd-anybaseocr-deskew
OCRD_ANYBASEOCR += $(BIN)/ocrd-anybaseocr-dewarp
OCRD_ANYBASEOCR += $(BIN)/ocrd-anybaseocr-tiseg
OCRD_ANYBASEOCR += $(BIN)/ocrd-anybaseocr-textline
OCRD_ANYBASEOCR += $(BIN)/ocrd-anybaseocr-layout-analysis
$(call multirule,$(OCRD_ANYBASEOCR)): ocrd_anybaseocr $(BIN)/ocrd
	$(pip_install)
endif

ifneq ($(filter ocrd_froc, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_FROC)
OCRD_FROC := $(BIN)/ocrd-froc-recognize
$(OCRD_FROC): ocrd_froc $(BIN)/ocrd
	$(pip_install)
endif

ifneq ($(filter ocrd_doxa, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_DOXA)
OCRD_DOXA := $(BIN)/ocrd-doxa-binarize
$(OCRD_DOXA): ocrd_doxa $(BIN)/ocrd
	$(pip_install)
endif

ifneq ($(filter sbb_binarization, $(OCRD_MODULES)),)
install-models: install-models-sbb-binarization
.PHONY: install-models-sbb-binarization
install-models-sbb-binarization:
	. $(ACTIVATE_VENV) && ocrd resmgr download ocrd-sbb-binarize '*'

OCRD_EXECUTABLES += $(SBB_BINARIZATION)
SBB_BINARIZATION := $(BIN)/ocrd-sbb-binarize
SBB_BINARIZATION += $(BIN)/sbb_binarize
$(call multirule,$(SBB_BINARIZATION)): sbb_binarization $(BIN)/ocrd
	$(pip_install)
endif

ifneq ($(filter eynollah, $(OCRD_MODULES)),)
install-models: install-models-eynollah
.PHONY: install-models-eynollah
install-models-eynollah:
	. $(ACTIVATE_VENV) && ocrd resmgr download ocrd-eynollah-segment '*'
OCRD_EXECUTABLES += $(EYNOLLAH_SEGMENT)
EYNOLLAH_SEGMENT := $(BIN)/ocrd-eynollah-segment
$(EYNOLLAH_SEGMENT): eynollah $(BIN)/ocrd
	$(pip_install)
endif

ifneq ($(filter ocrd_repair_inconsistencies, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_REPAIR_INCONSISTENCIES)
OCRD_REPAIR_INCONSISTENCIES := $(BIN)/ocrd-repair-inconsistencies
$(OCRD_REPAIR_INCONSISTENCIES): ocrd_repair_inconsistencies $(BIN)/ocrd
	$(pip_install)
endif

ifneq ($(filter ocrd_olahd_client, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_OLAHD_CLIENT)
OCRD_OLAHD_CLIENT := $(BIN)/ocrd-olahd-client
$(OCRD_OLAHD_CLIENT): ocrd_olahd_client $(BIN)/ocrd
	$(pip_install)
endif

ifneq ($(filter workflow-configuration, $(OCRD_MODULES)),)
deps-ubuntu-modules: workflow-configuration
OCRD_EXECUTABLES += $(WORKFLOW_CONFIGURATION)
WORKFLOW_CONFIGURATION := $(BIN)/ocrd-make
WORKFLOW_CONFIGURATION += $(BIN)/ocrd-import
WORKFLOW_CONFIGURATION += $(BIN)/ocrd-page-transform
$(BIN)/ocrd-make-check: override CHECK_HELP=
$(call multirule,$(WORKFLOW_CONFIGURATION)): workflow-configuration $(BIN)/ocrd
	$(MAKE) -C $< install
endif

define pip_install
. $(ACTIVATE_VENV) && cd $< && $(SEMPIP) pip install $(PIP_OPTIONS) . && touch -c $@
endef

# Workaround for missing prebuilt versions of TF<2 for Python==3.8
# todo: find another solution for 3.9, 3.10 etc
# https://docs.nvidia.com/deeplearning/frameworks/tensorflow-wheel-release-notes/tf-wheel-rel.html
# Nvidia has them, but under a different name, so let's rewrite that:
# (hold at nv22.12, because newer releases require CUDA 12, which is not supported by TF2,
#  and therefore not in our ocrd/core-cuda base image yet)
define pip_install_tf1nvidia =
. $(ACTIVATE_VENV) && if test $(PYTHON_VERSION) = 3.8 && ! pip show -q tensorflow-gpu; then \
	$(SEMPIP) pip install nvidia-pyindex && \
	pushd $$(mktemp -d) && \
	$(SEMPIP) pip download --no-deps "nvidia-tensorflow==1.15.5+nv22.12" && \
	for name in nvidia_tensorflow-*.whl; do name=$${name%.whl}; done && \
	$(PYTHON) -m wheel unpack $$name.whl && \
	for name in nvidia_tensorflow-*/; do name=$${name%/}; done && \
	newname=$${name/nvidia_tensorflow/tensorflow_gpu} &&\
	sed -i s/nvidia_tensorflow/tensorflow_gpu/g $$name/$$name.dist-info/METADATA && \
	sed -i s/nvidia_tensorflow/tensorflow_gpu/g $$name/$$name.dist-info/RECORD && \
	sed -i s/nvidia_tensorflow/tensorflow_gpu/g $$name/tensorflow_core/tools/pip_package/setup.py && \
	pushd $$name && for path in $$name*; do mv $$path $${path/$$name/$$newname}; done && popd && \
	$(PYTHON) -m wheel pack $$name && \
	$(SEMPIP) pip install --no-cache-dir $$newname*.whl && popd && rm -fr $$OLDPWD; fi
# - preempt conflict over numpy between scikit-image and tensorflow
# - preempt conflict over numpy between tifffile and tensorflow (and allow py36)
. $(ACTIVATE_VENV) && $(SEMPIP) pip install imageio==2.14.1 "tifffile<2022"
# - preempt conflict over numpy between h5py and tensorflow
. $(ACTIVATE_VENV) && $(SEMPIP) pip install "numpy<1.24"
endef

# pattern for recursive make:
# $(executables...): module... $(BIN)/ocrd
# ifeq (0,$(MAKELEVEL))
# 	$(MAKE) -o $< $(notdir $(executables...)) VIRTUAL_ENV=$(SUB_VENV_name)
# 	$(call delegate_venv,$(executables...),$(SUB_VENV_name))
# else
# 	actual recipe...
# fi
# -- adds ocrd as dependency to ensure the venv gets created first,
#    but also with -o $< to avoid updating the submodule twice);
#    overrides the venv path for nested make via target-specific var

# canned recipes after recursive make for
# modules in nested venvs:

# echo a shell script that relays to
# the (currently active) sub-venv
# (replacing the outer by the inner
#  venv directory to ensure there
#  is no infinite recursion when
#  the sub-venv does not have the
#  executable)
# TODO: variant for relay to Docker
ifeq ($(firstword $(subst ., ,$(MAKE_VERSION))),4)
# make >=4 has file function
define delegator
#!/usr/bin/env bash
. $(2)/bin/activate && $(2)/bin/$(notdir $(1)) "$$@"
endef
# create shell scripts that relay to
# the (currently active) sub-venv
define delegate_venv
$(foreach executable,$(1),$(file >$(executable),$(call delegator,$(executable),$(2))))
chmod +x $(1)
endef
else
# make <4 needs to echo (third recipe line must be empty!)
define delegator
@echo '#!/usr/bin/env bash' > $(1)
@echo '. $(2)/bin/activate && $(2)/bin/$(notdir $(1)) "$$@"' >> $(1)

endef
define delegate_venv
$(foreach executable,$(1),$(call delegator,$(executable),$(2)))
chmod +x $(1)
endef
endif

$(SHARE):
	@mkdir -p "$@"

# At last, add venv dependency (must not become first):
$(OCRD_EXECUTABLES) $(BIN)/wheel: | $(BIN)/pip
$(OCRD_EXECUTABLES): | $(BIN)/wheel
# Also, add core dependency (but in a non-circular way):
$(filter-out $(BIN)/ocrd,$(OCRD_EXECUTABLES)): $(BIN)/ocrd

# At last, we know what all OCRD_EXECUTABLES are:
all: $(OCRD_MODULES) $(OCRD_EXECUTABLES)
show:
	@echo VIRTUAL_ENV = $(VIRTUAL_ENV)
	@echo OCRD_MODULES = $(OCRD_MODULES)
	@echo OCRD_EXECUTABLES = $(OCRD_EXECUTABLES:$(BIN)/%=%)

show-%: ; @echo $($*)

check: $(OCRD_EXECUTABLES:%=%-check) $(OCRD_MODULES:%=%-check)
	. $(ACTIVATE_VENV) && pip check
%-check: ;

.PHONY: testcuda test-cuda test-assets test-workflow
# ensure shapely#1598 workaround works
# ensure CUDA works for Torch and TF
testcuda test-cuda: $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && $(PYTHON) -c "from shapely.geometry import Polygon; import torch; torch.randn(10).cuda()"
	. $(ACTIVATE_VENV) && $(PYTHON) -c "import torch, sys; sys.exit(0 if torch.cuda.is_available() else 1)"
	. $(ACTIVATE_VENV) && $(PYTHON) -c "import tensorflow as tf, sys; sys.exit(0 if tf.test.is_gpu_available() else 1)"
	. $(SUB_VENV_TF1)/bin/activate && $(PYTHON) -c "import tensorflow as tf, sys; sys.exit(0 if tf.test.is_gpu_available() else 1)"
	@echo everything seems to be fine

# download models and run some processors (not for result quality, only coverage)
test-workflow: test-assets core $(BIN)/ocrd $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && cd core/tests/assets/SBB0000F29300010000/data/ && bash -x $(CURDIR)/test-workflow.sh

test-assets:
	$(MAKE) -C core assets

ocrd-all-tool.json: $(OCRD_MODULES) $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && $(PYTHON) ocrd-all-tool.py $(wildcard $(OCRD_MODULES:%=%/ocrd-tool.json)) > $@

ocrd-all-module-dir.json: ocrd-all-tool.json $(OCRD_EXECUTABLES) $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && TF_CPP_MIN_LOG_LEVEL=3 $(PYTHON) ocrd-all-module-dir.py $< > $@

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

XDG_DATA_HOME ?= $(if $(HOME),$(HOME)/.local/share,/usr/local/share)
DEFAULT_RESLOC ?= $(XDG_DATA_HOME)/ocrd-resources

# do not delete intermediate targets:
.SECONDARY:

# suppress all built-in suffix rules:
.SUFFIXES:

# allow installing system dependencies for all modules
# (mainly intended for docker, not recommended to use directly for live systems)
# reset ownership of submodules to that of ocrd_all
# (in case deps-ubuntu has been used with sudo and some modules were updated)
# install git and parallel first (which is required for the module updates)
deps-ubuntu:
	apt-get -y install git parallel
ifneq ($(PYTHON),python)
ifneq ($(suffix $(PYTHON)),)
# install specific Python version in system via PPA
	apt-get install -y software-properties-common
	add-apt-repository -y ppa:deadsnakes/ppa
	apt-get update
endif
	apt-get install -y --no-install-recommends $(notdir $(PYTHON))-dev $(notdir $(PYTHON))-venv
endif
	$(MAKE) deps-ubuntu-modules

deps-ubuntu-modules:
	set -e; for dir in $^; do $(MAKE) -C $$dir deps-ubuntu PYTHON=$(PYTHON); done
	apt-get -y install $(CUSTOM_DEPS)

.PHONY: deps-ubuntu deps-ubuntu-modules

# For native (non-Docker) installations, install CUDA system dependencies
deps-cuda: core $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && $(MAKE) -C $< $@

# For standalone use ("just get me tensorflow-gpu<2.0 into the current venv")
tf1nvidia: $(ACTIVATE_VENV)
	$(pip_install_tf1nvidia)

# post-fix workaround for clash between cuDNN of Tensorflow 2.12 (→8.6) and Pytorch 1.13 (→8.5)
# the latter is explicit (but unnecessary), the former is implicit (and causes "DNN library not found" crashes at runtime)
# so we have three potential options:
# 1. revert to the version required by TF after pip overruled our choice via Torch dependency
#    pip3 install nvidia-cudnn-cu11==8.6.0.*
# 2. downgrade TF so there is no overt conflict
#    pip3 install "tensorflow<2.12"
# 3. upgrade Torch so there is no overt conflict
#    pip install "torch>=2.0"
# Since ATM we don't know whether Torch 2.x will work everywhere, we opt for 2:
fix-cuda: $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && $(SEMPIP) pip install "tensorflow<2.12"

.PHONY: deps-cuda tf1nvidia fix-cuda


# Docker builds.
DOCKER_TAG ?= ocrd/all
DOCKER_BASE_IMAGE ?= ocrd/core:$(CORE_VERSION)

# Several predefined selections
# (note: to arrive at smallest possible image size individually,
#  these variants won't share common layers / steps / data,
#  so build-time and bandwidth are n-fold)
.PHONY: dockers
dockers: docker-minimum docker-minimum-cuda docker-medium docker-medium-cuda docker-maximum docker-maximum-cuda

# keep git repos and reference them for install
# (so components can be updated via git from the container alone)
docker-%: PIP_OPTIONS = -e

# Minimum-size selection: use Ocropy binarization, use Tesseract from git
docker-mini%: DOCKER_MODULES := ocrd_cis ocrd_fileformat ocrd_im6convert ocrd_pagetopdf ocrd_repair_inconsistencies ocrd_tesserocr ocrd_wrap workflow-configuration ocrd_olahd_client
# Medium-size selection: add Olena binarization and Calamari, add evaluation
docker-medi%: DOCKER_MODULES := cor-asv-ann dinglehopper docstruct format-converters nmalign ocrd_calamari ocrd_cis ocrd_fileformat ocrd_im6convert ocrd_keraslm ocrd_olahd_client ocrd_olena ocrd_pagetopdf ocrd_repair_inconsistencies ocrd_segment ocrd_tesserocr ocrd_wrap workflow-configuration
# Maximum-size selection: use all modules
docker-maxi%: DOCKER_MODULES := $(OCRD_MODULES)

# DOCKER_BASE_IMAGE
docker-minimum: DOCKER_BASE_IMAGE = ocrd/core:$(CORE_VERSION)
docker-medium: DOCKER_BASE_IMAGE = $(DOCKER_TAG):minimum
docker-maximum: DOCKER_BASE_IMAGE = $(DOCKER_TAG):medium
# CUDA variants
docker-minimum-cuda: DOCKER_BASE_IMAGE = ocrd/core-cuda:$(CORE_VERSION)
docker-medium-cuda: DOCKER_BASE_IMAGE = $(DOCKER_TAG):minimum-cuda
docker-maximum-cuda: DOCKER_BASE_IMAGE = $(DOCKER_TAG):medium-cuda
# explicit interdependencies
docker-medium: docker-minimum
docker-maximum: docker-medium
docker-medium-cuda: docker-minimum-cuda
docker-maximum-cuda: docker-medium-cuda

# Build rule for all selections
# FIXME: $(DOCKER_MODULES) ref does not work at phase 1; workaround: all modules
docker-%: Dockerfile modules
	docker build \
	--progress=plain \
	--build-arg BASE_IMAGE=$(DOCKER_BASE_IMAGE) \
	--build-arg VCS_REF=$$(git rev-parse --short HEAD) \
	--build-arg BUILD_DATE=$$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
	--build-arg OCRD_MODULES="$(DOCKER_MODULES)" \
	--build-arg PIP_OPTIONS="$(PIP_OPTIONS)" \
	--build-arg PARALLEL="$(DOCKER_PARALLEL)" \
	--build-arg PYTHON="$(PYTHON)" \
	--network=host \
	-t $(DOCKER_TAG):$* .

docker: DOCKER_MODULES ?= $(OCRD_MODULES)
docker: DOCKER_PARALLEL ?= -j1
docker: docker-latest

# do not search for implicit rules here:
Makefile: ;
local.mk: ;

# eof
