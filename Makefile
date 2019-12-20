# Makefile for OCR-D

# Allow repo-independent site-local customization of variables
-include local.mk

# Python version (python3 required).
PYTHON := python3
# Python packaging
PIP ?= pip3
# PIP_OPTIONS ?= # empty
# Derived variable to allow filtering -e, or inserting other options
# (the option --editable must always be last and only applies to src install)
PIP_OPTIONS_E = $(filter-out -e,$(PIP_OPTIONS))
GIT_RECURSIVE = # --recursive
# Required and optional Tesseract models.
ALL_TESSERACT_MODELS = eng equ osd $(TESSERACT_MODELS)

# directory for virtual Python environment
# (but re-use if already active):
VIRTUAL_ENV ?= $(CURDIR)/venv

BIN := $(VIRTUAL_ENV)/bin
SHARE := $(VIRTUAL_ENV)/share
ACTIVATE_VENV := $(VIRTUAL_ENV)/bin/activate

define WGET
$(if $(shell which wget),wget -O $(1) $(2),$(if $(shell which curl),curl -o $(1) $(2),$(error "found no cmdline downloader (wget/curl)")))
endef

PKG_CONFIG_PATH := $(VIRTUAL_ENV)/lib/pkgconfig
export PKG_CONFIG_PATH

OCRD_EXECUTABLES = $(BIN)/ocrd # add more CLIs below
CUSTOM_INSTALL = $(BIN)/ocrd # add more non-pip installation targets below
CUSTOM_DEPS = wget python3-venv # add more packages for deps-ubuntu below (or modules as preqrequisites)

# Default to all submodules, but allow overriding by user
# (and treat the empty value as if it was unset)
ifeq ($(strip $(OCRD_MODULES)),)
override OCRD_MODULES := $(shell git submodule status | while read commit dir ref; do echo $$dir; done)
endif

.DEFAULT_GOAL = help # all is too much for a default, and ocrd is too little

.PHONY: all modules clean help show always-update

all: modules # add OCRD_EXECUTABLES at the end

clean: # add more prerequisites for clean below
	$(RM) -r $(CURDIR)/venv

define HELP
cat <<"EOF"
Rules to download and install all OCR-D module processors
from their source repositories into a single virtualenv.

Targets:
	help: this message
	show: lists the venv path and all executables (to be) installed
	ocrd: installs only the virtual environment and OCR-D/core packages
	modules: download all submodules to the managed revision
	all: installs all executables of all modules
	install-tesseract: download, build and install Tesseract (with required models)
	fix-pip: try to repair conflicting requirements
	clean: removes the virtual environment directory, and clean-*
	clean-tesseract: remove the build directory for tesseract
	clean-olena: remove the build directory for ocrd_olena
	docker: (re)build a docker image including all executables
	dockers: (re)build docker images for some pre-selected subsets of modules

Variables:
	VIRTUAL_ENV: path to (re-)use for the virtual environment
	TMPDIR: path to use for temporary storage instead of the system default
	PYTHON: name of the Python binary
	PIP: name of the Python packaging binary
	PIP_OPTIONS: extra options for the `pip install` command like `-q` or `-v` or `-e`
	GIT_RECURSIVE: set to `--recursive` to checkout/update all submodules recursively
	OCRD_MODULES: list of submodules to include (defaults to all git submodules, see `show`)
	TESSERACT_MODELS: list of additional models/languages to download for Tesseract
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
modules: $(OCRD_MODULES)
# but bypass updates if we have no repo here (e.g. Docker build)
ifneq (,$(wildcard .git))
$(OCRD_MODULES): always-update
	git submodule sync $(GIT_RECURSIVE) $@
	if git submodule status $(GIT_RECURSIVE) $@ | grep -qv '^ '; then \
		git submodule update --init $(GIT_RECURSIVE) $@ && \
		touch $@; fi
endif

# Get Python modules.

$(ACTIVATE_VENV) $(VIRTUAL_ENV):
	$(PYTHON) -m venv $(VIRTUAL_ENV)
	. $(ACTIVATE_VENV) && $(PIP) install --upgrade $(PIP_OPTIONS_E) pip

.PHONY: wheel
wheel: $(BIN)/wheel
$(BIN)/wheel: | $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && $(PIP) install --force-reinstall $(PIP_OPTIONS_E) wheel

# avoid making this .PHONY so it does not have to be repeated
$(SHARE)/numpy: | $(ACTIVATE_VENV) $(SHARE)
	. $(ACTIVATE_VENV) && $(PIP) install $(PIP_OPTIONS_E) numpy
	@touch $@

# Install modules from source.

.PHONY: ocrd
ocrd: $(BIN)/ocrd
deps-ubuntu: core
$(BIN)/ocrd: core
	. $(ACTIVATE_VENV) && $(MAKE) -C $< install PIP_INSTALL="$(PIP) install --force-reinstall $(PIP_OPTIONS)"
	# workaround for core#351:
	. $(ACTIVATE_VENV) && $(MAKE) -C $< install PIP_INSTALL="$(PIP) install --no-deps $(PIP_OPTIONS)"

ifneq ($(findstring ocrd_kraken, $(OCRD_MODULES)),)
$(SHARE)/clstm: | $(SHARE)/numpy $(SHARE)
CUSTOM_DEPS += scons libprotobuf-dev protobuf-compiler libpng-dev libeigen3-dev swig

OCRD_EXECUTABLES += $(OCRD_KRAKEN)
OCRD_KRAKEN := $(BIN)/ocrd-kraken-binarize
OCRD_KRAKEN += $(BIN)/ocrd-kraken-segment
$(OCRD_KRAKEN): ocrd_kraken $(SHARE)/clstm
endif

ifneq ($(findstring ocrd_ocropy, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_OCROPY)
OCRD_OCROPY := $(BIN)/ocrd-ocropy-segment
$(OCRD_OCROPY): ocrd_ocropy
endif

ifneq ($(findstring cor-asv-ann, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_COR_ASV_ANN)
OCRD_COR_ASV_ANN := $(BIN)/ocrd-cor-asv-ann-evaluate
OCRD_COR_ASV_ANN += $(BIN)/ocrd-cor-asv-ann-process
OCRD_COR_ASV_ANN += $(BIN)/cor-asv-ann-train
OCRD_COR_ASV_ANN += $(BIN)/cor-asv-ann-eval
OCRD_COR_ASV_ANN += $(BIN)/cor-asv-ann-repl
$(OCRD_COR_ASV_ANN): cor-asv-ann
endif

ifneq ($(findstring cor-asv-fst, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_COR_ASV_FST)
OCRD_COR_ASV_FST := $(BIN)/ocrd-cor-asv-fst-process
OCRD_COR_ASV_FST += $(BIN)/cor-asv-fst-train
$(OCRD_COR_ASV_FST): cor-asv-fst
endif

ifneq ($(findstring ocrd_keraslm, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_KERASLM)
OCRD_KERASLM := $(BIN)/ocrd-keraslm-rate
OCRD_KERASLM += $(BIN)/keraslm-rate
$(OCRD_KERASLM): ocrd_keraslm
endif

ifneq ($(findstring ocrd_im6convert, $(OCRD_MODULES)),)
deps-ubuntu: ocrd_im6convert
OCRD_EXECUTABLES += $(BIN)/ocrd-im6convert
CUSTOM_INSTALL += $(BIN)/ocrd-im6convert
$(BIN)/ocrd-im6convert: ocrd_im6convert
	. $(ACTIVATE_VENV) && $(MAKE) -C $< install
endif

ifneq ($(findstring ocrd_olena, $(OCRD_MODULES)),)
deps-ubuntu: ocrd_olena
OCRD_EXECUTABLES += $(BIN)/ocrd-olena-binarize
CUSTOM_INSTALL += $(BIN)/ocrd-olena-binarize
$(BIN)/ocrd-olena-binarize: ocrd_olena
	. $(ACTIVATE_VENV) && $(MAKE) -C $< install
clean: clean-olena
.PHONY: clean-olena
clean-olena:
	$(MAKE) -C ocrd_olena clean-olena
endif

ifneq ($(findstring dinglehopper, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(BIN)/ocrd-dinglehopper
.PHONY: ocrd-dinglehopper
ocrd-dinglehopper: $(BIN)/ocrd-dinglehopper
$(BIN)/ocrd-dinglehopper: dinglehopper
endif

ifneq ($(findstring ocrd_segment, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_SEGMENT)
OCRD_SEGMENT := $(BIN)/ocrd-segment-evaluate
OCRD_SEGMENT += $(BIN)/ocrd-segment-extract-lines
OCRD_SEGMENT += $(BIN)/ocrd-segment-extract-regions
OCRD_SEGMENT += $(BIN)/ocrd-segment-repair
$(OCRD_SEGMENT): ocrd_segment
endif

ifneq ($(findstring ocrd_tesserocr, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_TESSEROCR)
# only add custom PPA when not building tesseract from source
ifeq ($(findstring tesseract, $(OCRD_MODULES)),)
deps-ubuntu: ocrd_tesserocr
# convert Tesseract model names into Ubuntu/Debian pkg names
# (does not work with names under script/ though)
CUSTOM_DEPS += $(subst _,-,$(ALL_TESSERACT_MODELS:%=tesseract-ocr-%))
endif

OCRD_TESSEROCR := $(BIN)/ocrd-tesserocr-binarize
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-crop
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-deskew
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-recognize
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-line
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-region
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-word
$(OCRD_TESSEROCR): ocrd_tesserocr $(SHARE)/tesserocr
endif

ifneq ($(findstring ocrd_cis, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_CIS)
OCRD_CIS := $(BIN)/ocrd-cis-align
OCRD_CIS += $(BIN)/ocrd-cis-data
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-binarize
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-clip
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-denoise
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-deskew
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-dewarp
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-rec
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-recognize
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-resegment
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-segment
#OCRD_CIS += $(BIN)/ocrd-cis-ocropy-train
OCRD_CIS += $(BIN)/ocrd-cis-profile
OCRD_CIS += $(BIN)/ocrd-cis-wer
$(OCRD_CIS): ocrd_cis
endif

ifneq ($(findstring ocrd_calamari, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_CALAMARI)
OCRD_CALAMARI := $(BIN)/ocrd-calamari-recognize
$(OCRD_CALAMARI): ocrd_calamari
endif

ifneq ($(findstring ocrd_pc_segmentation, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_PC_SEGMENTATION)
OCRD_PC_SEGMENTATION := $(BIN)/ocrd-pc-segmentation
$(OCRD_PC_SEGMENTATION): ocrd_pc_segmentation
endif

ifneq ($(findstring ocrd_anybaseocr, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_ANYBASEOCR)
OCRD_ANYBASEOCR := $(BIN)/ocrd-anybaseocr-crop
OCRD_ANYBASEOCR += $(BIN)/ocrd-anybaseocr-binarize
OCRD_ANYBASEOCR += $(BIN)/ocrd-anybaseocr-deskew
OCRD_ANYBASEOCR += $(BIN)/ocrd-anybaseocr-dewarp
OCRD_ANYBASEOCR += $(BIN)/ocrd-anybaseocr-tiseg
OCRD_ANYBASEOCR += $(BIN)/ocrd-anybaseocr-textline
OCRD_ANYBASEOCR += $(BIN)/ocrd-anybaseocr-layout-analysis
OCRD_ANYBASEOCR += $(BIN)/ocrd-anybaseocr-block-segmentation
$(OCRD_ANYBASEOCR): ocrd_anybaseocr
endif

ifneq ($(findstring ocrd_typegroups_classifier, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_TYPECLASS)
OCRD_TYPECLASS := $(BIN)/ocrd-typegroups-classifier
OCRD_TYPECLASS += $(BIN)/typegroups-classifier
$(OCRD_TYPECLASS): ocrd_typegroups_classifier
endif

ifneq ($(findstring sbb_textline_detector, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(SBB_LINE_DETECTOR)
SBB_LINE_DETECTOR := $(BIN)/ocrd-sbb-line-detector
$(SBB_LINE_DETECTOR): sbb_textline_detector
endif

ifneq ($(findstring ocrd_repair_inconsistencies, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_REPAIR_INCONSISTENCIES)
OCRD_REPAIR_INCONSISTENCIES := $(BIN)/ocrd-repair-inconsistencies
$(OCRD_REPAIR_INCONSISTENCIES): ocrd_repair_inconsistencies
endif

ifneq ($(findstring workflow-configuration, $(OCRD_MODULES)),)
deps-ubuntu: workflow-configuration
OCRD_EXECUTABLES += $(WORKFLOW_CONFIGURATION)
WORKFLOW_CONFIGURATION := $(BIN)/ocrd-make
WORKFLOW_CONFIGURATION += $(BIN)/ocrd-import
CUSTOM_INSTALL += $(WORKFLOW_CONFIGURATION)
$(call multirule,$(WORKFLOW_CONFIGURATION)): workflow-configuration
	$(MAKE) -C $< install
endif

# Convert the executable names (1) to a pattern rule,
# so that the recipe will be used with single-recipe-
# multiple-output semantics:
multirule = $(patsubst $(BIN)/%,\%/%,$(1))

# Build by entering subdir (first dependent), then
# install gracefully with dependencies, and finally
# install again forcefully without depds (to ensure
# the binary itself updates):
$(call multirule,$(filter-out $(CUSTOM_INSTALL),$(OCRD_EXECUTABLES))):
	. $(ACTIVATE_VENV) && cd $< && $(PIP) install $(PIP_OPTIONS_E) .
	. $(ACTIVATE_VENV) && cd $< && $(PIP) install --no-deps --force-reinstall $(PIP_OPTIONS) .

# avoid making these .PHONY so they do not have to be repeated:
# clstm tesserocr
$(SHARE)/%: % | $(ACTIVATE_VENV) $(SHARE)
	. $(ACTIVATE_VENV) && cd $< && $(PIP) install $(PIP_OPTIONS) .
	@touch $@

$(SHARE):
	@mkdir -p "$@"

# At last, add venv dependency (must not become first):
$(OCRD_EXECUTABLES) $(BIN)/wheel: | $(ACTIVATE_VENV)
$(OCRD_EXECUTABLES): | $(BIN)/wheel

.PHONY: fix-pip
# temporary workaround for conflicting requirements between modules:
# - opencv-python instead of opencv-python-headless (which needs X11 libs)
#   (pulled by ocrd_anybaseocr and segmentation-runner)
# - tensorflow>=2.0, tensorflow_gpu in another version
# - pillow==5.4.1 instead of >=6.2
fix-pip:
	. $(ACTIVATE_VENV) && $(PIP) install --force-reinstall $(PIP_OPTIONS_E) \
		opencv-python-headless \
		"pillow>=6.2.0" \
		$$($(PIP) list | grep tensorflow-gpu | sed -E 's/-gpu +/==/')


# At last, we know what all OCRD_EXECUTABLES are:
all: $(OCRD_EXECUTABLES)
show:
	@echo VIRTUAL_ENV = $(VIRTUAL_ENV)
	@echo OCRD_MODULES = $(OCRD_MODULES)
	@echo OCRD_EXECUTABLES = $(OCRD_EXECUTABLES:$(BIN)/%=%)

# offer abbreviated forms (just the CLI name in the PATH,
# without its directory):
.PHONY: $(OCRD_EXECUTABLES:$(BIN)/%=%)
$(OCRD_EXECUTABLES:$(BIN)/%=%): %: $(BIN)/%

ifneq ($(findstring tesseract, $(OCRD_MODULES)),)
# Tesseract.

# when not installing via PPA, we must cope without ocrd_tesserocr's deps-ubuntu
CUSTOM_DEPS += g++ make automake libleptonica-dev
# but since we are building statically, we need more (static) libs at build time
CUSTOM_DEPS += libarchive-dev libcurl4-nss-dev libgif-dev libjpeg-dev libpng-dev libtiff-dev

TESSDATA := $(VIRTUAL_ENV)/share/tessdata
TESSDATA_URL := https://github.com/tesseract-ocr/tessdata_fast
TESSERACT_TRAINEDDATA = $(ALL_TESSERACT_MODELS:%=$(TESSDATA)/%.traineddata)

stripdir = $(patsubst %/,%,$(dir $(1)))

# Install Tesseract with models.
.PHONY: install-tesseract
install-tesseract: $(BIN)/tesseract $(TESSERACT_TRAINEDDATA)
all: install-tesseract

# Convenience shortcut without the full path:
%.traineddata: $(TESSDATA)/%.traineddata
	$(MAKE) $^
script/%.traineddata: $(TESSDATA)/script/%.traineddata
	$(MAKE) $^

# Special rule for equ.traineddata which is only available from tesseract-ocr/tessdata.
$(TESSDATA)/equ.traineddata:
	@mkdir -p $(dir $@)
	$(call WGET,$@,https://github.com/tesseract-ocr/tessdata/raw/master/$(notdir $@)) || \
		{ $(RM) $@; false; }

# Default rule for all other traineddata models.
$(TESSDATA)/%.traineddata:
	@mkdir -p $(dir $@)
	$(call WGET,$@,$(TESSDATA_URL)/raw/master/$(notdir $@)) || \
	$(call WGET,$@,$(TESSDATA_URL)/raw/master/$(notdir $(call stripdir,$@))/$(notdir $@)) || \
		{ $(RM) $@; false; }

tesseract/configure: tesseract
	cd tesseract && ./autogen.sh

# Build and install Tesseract.
$(BIN)/tesseract: tesseract/configure
	mkdir -p tesseract/build
	cd tesseract/build && ../configure --disable-openmp --disable-shared --prefix="$(VIRTUAL_ENV)" CXXFLAGS="-g -O2 -fPIC"
	cd tesseract/build && $(MAKE) install

clean: clean-tesseract
.PHONY: clean-tesseract
clean-tesseract:
	$(RM) -r tesseract/build
endif

# do not delete intermediate targets:
.SECONDARY:

# suppress all built-in suffix rules:
.SUFFIXES:

# allow installing system dependencies for all modules
# (mainly intended for docker, not recommended to use directly for live systems)
# reset ownership of submodules to that of ocrd_all
# (in case deps-ubuntu has been used with sudo and some modules were updated)
deps-ubuntu:
	set -e; for dir in $^; do $(MAKE) -C $$dir deps-ubuntu; done
	chown -R --reference=$(CURDIR) $^
	apt-get -y install $(CUSTOM_DEPS)

# Docker builds.
DOCKER_TAG ?= ocrd/all
# opencv-python is not needed for Ubuntu x86_64
DOCKER_MODULES ?= $(filter-out opencv-python,$(OCRD_MODULES))

# Several predefined selections
# (note: to arrive at smallest possible image size individually,
#  these variants won't share common layers / steps / data,
#  so build-time and bandwidth are n-fold)
.PHONY: dockers
ifdef DOCKERS_WITHOUT_REPOS
dockers: docker-minimum docker-medium docker-maximum
else
dockers: docker-minimum-git docker-medium-git docker-maximum-git
endif

# Selections which keep git repos and reference them for install
# (so components can be updated via git from the container alone)
docker-minimum-git docker-medium-git docker-maximum-git: PIP_OPTIONS = -e

# Minimum-size selection: use Ocropy binarization, use Tesseract from PPA
docker-minimum docker-minimum-git: DOCKER_MODULES = ocrd_im6convert ocrd_cis ocrd_tesserocr tesserocr workflow-configuration ocrd_repair_inconsistencies
# Medium-size selection: add Olena binarization and Calamari, use Tesseract from git, add evaluation
docker-medium docker-medium-git: DOCKER_MODULES = ocrd_im6convert format-converters ocrd_cis ocrd_tesserocr tesserocr tesseract ocrd_olena ocrd_segment ocrd_keraslm ocrd_calamari dinglehopper cor-asv-ann workflow-configuration ocrd_repair_inconsistencies
# Maximum-size selection: use all modules
docker-maximum docker-maximum-git: DOCKER_MODULES = $(filter-out core,$(filter-out opencv-python,$(OCRD_MODULES)))

# Build rule for all selections
# (maybe we should add --network=host here for smoother build-time?)
docker%: Dockerfile $(DOCKER_MODULES)
	docker build \
	--build-arg OCRD_MODULES="$(DOCKER_MODULES)" \
	--build-arg PIP_OPTIONS="$(PIP_OPTIONS)" \
	-t $(DOCKER_TAG):$(or $(*:-%=%),latest) .


# do not search for implicit rules here:
Makefile: ;

# eof
