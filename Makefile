# Makefile for OCR-D

# Allow repo-independent site-local customization of variables
-include local.mk

# Python version (python3 required).
export PYTHON ?= python3
# Python packaging
export PIP ?= pip3
# PIP_OPTIONS ?= # empty
# Derived variable to allow filtering -e, or inserting other options
# (the option --editable must always be last and only applies to src install)
PIP_OPTIONS_E = $(filter-out -e,$(PIP_OPTIONS))
# Set to 1 to skip all submodule updates. For development.
NO_UPDATE ?= 0
# Set to non-empty to try running all executables with --help / -h during make check
CHECK_HELP ?=
GIT_RECURSIVE = # --recursive
GIT_DEPTH = # --depth 1
# Required and optional Tesseract models.
ALL_TESSERACT_MODELS = eng equ osd $(TESSERACT_MODELS)

# directory for virtual Python environment
# (but re-use if already active); overriden
# to nested venv in recursive calls for modules
# that have known dependency clashes with others
export VIRTUAL_ENV ?= $(CURDIR)/venv
SUB_VENV = $(VIRTUAL_ENV)/local/sub-venv

BIN = $(VIRTUAL_ENV)/bin
SHARE = $(VIRTUAL_ENV)/share
ACTIVATE_VENV = $(VIRTUAL_ENV)/bin/activate

define SEM
$(if $(shell sem --version 2>/dev/null),sem --will-cite --fg --id ocrd_all_git,$(error cannot find package GNU parallel))
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

OCRD_EXECUTABLES = $(BIN)/ocrd # add more CLIs below
CUSTOM_DEPS = unzip wget python3-venv parallel git less # add more packages for deps-ubuntu below (or modules as preqrequisites)

DISABLED_MODULES ?= cor-asv-fst opencv-python ocrd_kraken clstm ocrd_ocropy
# Default to all submodules, but allow overriding by user
# (and treat the empty value as if it was unset)
# opencv-python is only needed for aarch64-linux-gnu and other less common platforms,
# so don't include it by default.
ifeq ($(strip $(OCRD_MODULES)),)
override OCRD_MODULES := $(filter-out $(DISABLED_MODULES),$(shell git submodule status | while read commit dir ref; do echo $$dir; done))
endif

# `all` is too much for a default, and `ocrd` is too little
.DEFAULT_GOAL = help

# delete file targets (e.g. executables / venvs) when recipes fail
# to ensure they are re-built (not considered up-to-date) when re-entering
.DELETE_ON_ERROR:

.PHONY: all modules clean help show check always-update install-models

clean: # add more prerequisites for clean below
	$(RM) -r $(SUB_VENV)/*
	$(RM) -r $(CURDIR)/venv # deliberately not using VIRTUAL_ENV here
	$(RM) -r $(HOME)/.parallel/semaphores/id-ocrd_all_git/

define HELP
cat <<"EOF"
Rules to download and install all OCR-D module processors
from their source repositories into a single virtualenv.

Targets:
	help: show this message
	show: list the venv path and all executables (to be) installed
	check: verify that all executables are runnable and the venv is consistent
	modules: download all submodules to the managed revision
	all: install all executables of all modules
	ocrd: only install the virtual environment and OCR-D/core packages
	install-tesseract: only build and install Tesseract (with TESSERACT_MODELS)
	install-tesseract-training: build and install Tesseract training tools
	install-models: download commonly used models to appropriate locations
	clean: remove the virtual environment directory, and make clean-*
	clean-tesseract: remove the build directory for tesseract
	clean-olena: remove the build directory for ocrd_olena
	deinit: clean, then deinit and rmdir all submodules
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
	PYTHON: name of the Python binary
	PIP: name of the Python packaging binary
	PIP_OPTIONS: extra options for the `pip install` command like `-q` or `-v` or `-e`
	TESSERACT_MODELS: list of additional models/languages to download for Tesseract. Default: "$(ALL_TESSERACT_MODELS)"
	TESSERACT_CONFIG: command line options for Tesseract `configure`. Default: "$(TESSERACT_CONFIG)"
	TESSDATA: directory path where to install Tesseract models. Default (based on XDG_DATA_HOME): "$(TESSDATA)"
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
modules: $(OCRD_MODULES)
# but bypass updates if we have no repo here (e.g. Docker build)
ifneq (,$(wildcard .git))
ifneq ($(NO_UPDATE),1)
$(OCRD_MODULES): always-update
	$(SEM) git submodule sync $(GIT_RECURSIVE) $@
	if git submodule status $(GIT_RECURSIVE) $@ | grep -qv '^ '; then \
		$(SEM) git submodule update --init $(GIT_RECURSIVE) $(GIT_DEPTH) $@ && \
		touch $@; fi
endif
endif

deinit: clean
.PHONY: deinit
deinit:
	git submodule deinit --all # --force
	git submodule status | while read stat dir ver; do rmdir $$dir; done

# Get Python modules.

$(VIRTUAL_ENV)/bin/$(PIP): $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && $(SEM) $(PIP) install --upgrade pip setuptools

$(ACTIVATE_VENV) $(VIRTUAL_ENV):
	$(SEM) $(PYTHON) -m venv $(VIRTUAL_ENV)

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
deps-ubuntu-modules: core
$(BIN)/ocrd: core
	. $(ACTIVATE_VENV) && $(MAKE) -C $< install PIP_INSTALL="$(PIP) install $(PIP_OPTIONS)"
	# workaround for core#351:
	. $(ACTIVATE_VENV) && $(MAKE) -C $< install PIP_INSTALL="$(PIP) install --no-deps --force-reinstall $(PIP_OPTIONS)"

# Convert the executable names (1) to a pattern rule,
# so that the recipe will be used with single-recipe-
# multiple-output semantics:
multirule = $(patsubst $(BIN)/%,\%/%,$(1))


ifneq ($(findstring format-converters, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(PAGE2IMG)
PAGE2IMG := $(BIN)/page2img
$(PAGE2IMG): format-converters/page2img.py
	. $(ACTIVATE_VENV) && $(PIP) install validators
	echo "#!$(BIN)/python3" | cat - $< >$@
	chmod +x $@
endif

ifneq ($(findstring opencv-python, $(OCRD_MODULES)),)
CUSTOM_DEPS += cmake gcc g++
# libavcodec-dev libavformat-dev libswscale-dev libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev
# libpng-dev libjpeg-dev libopenexr-dev libtiff-dev libwebp-dev libjasper-dev
opencv-python: GIT_RECURSIVE = --recursive
opencv-python/setup.py: opencv-python
$(SHARE)/opencv-python: opencv-python/setup.py | $(ACTIVATE_VENV) $(SHARE) $(SHARE)/numpy
	. $(ACTIVATE_VENV) && cd opencv-python && ENABLE_HEADLESS=1 $(PYTHON) setup.py bdist_wheel
	. $(ACTIVATE_VENV) && $(PIP) install $(<D)/dist/opencv_python_headless-*.whl
	@touch $@
$(BIN)/ocrd: $(SHARE)/opencv-python
endif

ifneq ($(findstring ocrd_kraken, $(OCRD_MODULES)),)
$(SHARE)/clstm: | $(SHARE)/numpy $(SHARE)
CUSTOM_DEPS += scons libprotobuf-dev protobuf-compiler libpng-dev libeigen3-dev swig

OCRD_EXECUTABLES += $(OCRD_KRAKEN)
install-models: install-models-kraken
.PHONY: install-models-kraken
install-models-kraken:
	. $(ACTIVATE_VENV) && ocrd resmgr download ocrd-kraken-segment '*'
	. $(ACTIVATE_VENV) && ocrd resmgr download ocrd-kraken-recognize '*'
OCRD_KRAKEN := $(BIN)/ocrd-kraken-binarize
OCRD_KRAKEN += $(BIN)/ocrd-kraken-segment
$(call multirule,$(OCRD_KRAKEN)): ocrd_kraken $(SHARE)/clstm $(BIN)/ocrd
	$(pip_install)
endif

ifneq ($(findstring ocrd_ocropy, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_OCROPY)
OCRD_OCROPY := $(BIN)/ocrd-ocropy-segment
$(OCRD_OCROPY): ocrd_ocropy $(BIN)/ocrd
	$(pip_install)
endif

ifneq ($(findstring cor-asv-ann, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_COR_ASV_ANN)
OCRD_COR_ASV_ANN := $(BIN)/ocrd-cor-asv-ann-evaluate
OCRD_COR_ASV_ANN += $(BIN)/ocrd-cor-asv-ann-process
OCRD_COR_ASV_ANN += $(BIN)/cor-asv-ann-train
OCRD_COR_ASV_ANN += $(BIN)/cor-asv-ann-eval
OCRD_COR_ASV_ANN += $(BIN)/cor-asv-ann-repl
$(call multirule,$(OCRD_COR_ASV_ANN)): cor-asv-ann
ifeq (0,$(MAKELEVEL))
	$(MAKE) -B -o $< $(notdir $(OCRD_COR_ASV_ANN)) VIRTUAL_ENV=$(SUB_VENV)/headless-tf1
	$(call delegate_venv,$(OCRD_COR_ASV_ANN),$(SUB_VENV)/headless-tf1)
cor-asv-ann-check:
	$(MAKE) check OCRD_MODULES=cor-asv-ann VIRTUAL_ENV=$(SUB_VENV)/headless-tf1
else
	$(pip_install)
endif
endif

ifneq ($(findstring cor-asv-fst, $(OCRD_MODULES)),)
deps-ubuntu-modules: cor-asv-fst
OCRD_EXECUTABLES += $(OCRD_COR_ASV_FST)
OCRD_COR_ASV_FST := $(BIN)/ocrd-cor-asv-fst-process
OCRD_COR_ASV_FST += $(BIN)/cor-asv-fst-train
$(call multirule,$(OCRD_COR_ASV_FST)): cor-asv-fst
ifeq (0,$(MAKELEVEL))
	$(MAKE) -B -o $< $(notdir $(OCRD_COR_ASV_FST)) VIRTUAL_ENV=$(SUB_VENV)/headless-tf1
	$(call delegate_venv,$(OCRD_COR_ASV_FST),$(SUB_VENV)/headless-tf1)
cor-asv-fst-check:
	$(MAKE) check OCRD_MODULES=cor-asv-fst VIRTUAL_ENV=$(SUB_VENV)/headless-tf1
else
	. $(ACTIVATE_VENV) && $(MAKE) -C $< deps
	$(pip_install)
endif
endif

ifneq ($(findstring ocrd_keraslm, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_KERASLM)
OCRD_KERASLM := $(BIN)/ocrd-keraslm-rate
OCRD_KERASLM += $(BIN)/keraslm-rate
$(call multirule,$(OCRD_KERASLM)): ocrd_keraslm
ifeq (0,$(MAKELEVEL))
	$(MAKE) -B -o $< $(notdir $(OCRD_KERASLM)) VIRTUAL_ENV=$(SUB_VENV)/headless-tf1
	$(call delegate_venv,$(OCRD_KERASLM),$(SUB_VENV)/headless-tf1)
ocrd_keraslm-check:
	$(MAKE) check OCRD_MODULES=ocrd_keraslm VIRTUAL_ENV=$(SUB_VENV)/headless-tf1
else
	$(pip_install)
endif
endif

ifneq ($(findstring ocrd_im6convert, $(OCRD_MODULES)),)
deps-ubuntu-modules: ocrd_im6convert
OCRD_EXECUTABLES += $(BIN)/ocrd-im6convert
$(BIN)/ocrd-im6convert: ocrd_im6convert $(BIN)/ocrd
	. $(ACTIVATE_VENV) && $(MAKE) -C $< install
endif

ifneq ($(findstring ocrd_wrap, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_WRAP)
OCRD_WRAP := $(BIN)/ocrd-preprocess-image
OCRD_WRAP += $(BIN)/ocrd-skimage-normalize
OCRD_WRAP += $(BIN)/ocrd-skimage-denoise-raw
OCRD_WRAP += $(BIN)/ocrd-skimage-binarize
OCRD_WRAP += $(BIN)/ocrd-skimage-denoise
$(call multirule,$(OCRD_WRAP)): ocrd_wrap $(BIN)/ocrd
	$(pip_install)
endif

ifneq ($(findstring ocrd_fileformat, $(OCRD_MODULES)),)
ocrd_fileformat: GIT_RECURSIVE = --recursive
OCRD_EXECUTABLES += $(BIN)/ocrd-fileformat-transform
$(BIN)/ocrd-fileformat-transform: ocrd_fileformat $(BIN)/ocrd
	. $(ACTIVATE_VENV) && $(MAKE) -C $< install-fileformat install
endif

ifneq ($(findstring ocrd_olena, $(OCRD_MODULES)),)
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

ifneq ($(findstring dinglehopper, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(BIN)/ocrd-dinglehopper
.PHONY: ocrd-dinglehopper
ocrd-dinglehopper: $(BIN)/ocrd-dinglehopper
$(BIN)/ocrd-dinglehopper: dinglehopper $(BIN)/ocrd
	$(pip_install)
endif

ifneq ($(findstring ocrd_segment, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_SEGMENT)
OCRD_SEGMENT := $(BIN)/ocrd-segment-evaluate
OCRD_SEGMENT += $(BIN)/ocrd-segment-from-masks
OCRD_SEGMENT += $(BIN)/ocrd-segment-from-coco
OCRD_SEGMENT += $(BIN)/ocrd-segment-extract-lines
OCRD_SEGMENT += $(BIN)/ocrd-segment-extract-regions
OCRD_SEGMENT += $(BIN)/ocrd-segment-extract-pages
OCRD_SEGMENT += $(BIN)/ocrd-segment-replace-original
OCRD_SEGMENT += $(BIN)/ocrd-segment-replace-page
OCRD_SEGMENT += $(BIN)/ocrd-segment-repair
$(call multirule,$(OCRD_SEGMENT)): ocrd_segment
ifeq (0,$(MAKELEVEL))
	$(MAKE) -B -o $< $(notdir $(OCRD_SEGMENT)) VIRTUAL_ENV=$(SUB_VENV)/headless-tf1
	$(call delegate_venv,$(OCRD_SEGMENT),$(SUB_VENV)/headless-tf1)
ocrd_segment-check:
	$(MAKE) check OCRD_MODULES=ocrd_segment VIRTUAL_ENV=$(SUB_VENV)/headless-tf1
else
	$(pip_install)
endif
endif

ifneq ($(findstring ocrd_tesserocr, $(OCRD_MODULES)),)
install-models: install-models-tesseract
.PHONY: install-models-tesseract
install-models-tesseract:
	. $(ACTIVATE_VENV) && ocrd resmgr download ocrd-tesserocr-recognize '*'

OCRD_EXECUTABLES += $(OCRD_TESSEROCR)
# only add custom PPA when not building tesseract from source
ifeq ($(findstring tesseract, $(OCRD_MODULES)),)
deps-ubuntu-modules: ocrd_tesserocr
# convert Tesseract model names into Ubuntu/Debian pkg names
# (does not work with names under script/ though)
CUSTOM_DEPS += $(filter-out tesseract-ocr-equ,$(subst _,-,$(ALL_TESSERACT_MODELS:%=tesseract-ocr-%)))
CUSTOM_DEPS += libarchive-dev
endif

OCRD_TESSEROCR := $(BIN)/ocrd-tesserocr-binarize
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-crop
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-deskew
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-recognize
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-line
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-region
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-word
$(call multirule,$(OCRD_TESSEROCR)): ocrd_tesserocr $(SHARE)/tesserocr $(BIN)/ocrd
	$(pip_install)

# tesserocr must wait for tesseract in parallel builds.
ifneq ($(findstring tesseract, $(OCRD_MODULES)),)
$(SHARE)/tesserocr: $(BIN)/tesseract
endif

endif

ifneq ($(findstring ocrd_cis, $(OCRD_MODULES)),)
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

ifneq ($(findstring ocrd_pagetopdf, $(OCRD_MODULES)),)
deps-ubuntu-modules: ocrd_pagetopdf
OCRD_EXECUTABLES += $(OCRD_PAGETOPDF)
OCRD_PAGETOPDF := $(BIN)/ocrd-pagetopdf
$(OCRD_PAGETOPDF): ocrd_pagetopdf $(BIN)/ocrd
	. $(ACTIVATE_VENV) && $(MAKE) -C $< install
endif

ifneq ($(findstring ocrd_calamari, $(OCRD_MODULES)),)
install-models: install-models-calamari
.PHONY: install-models-calamari
install-models-calamari: $(BIN)/ocrd
	. $(ACTIVATE_VENV) && ocrd resmgr download ocrd-calamari-recognize '*'
OCRD_EXECUTABLES += $(OCRD_CALAMARI)
OCRD_CALAMARI := $(BIN)/ocrd-calamari-recognize
$(OCRD_CALAMARI): ocrd_calamari
ifeq (0,$(MAKELEVEL))
	$(MAKE) -B -o $< $(notdir $(OCRD_CALAMARI)) VIRTUAL_ENV=$(SUB_VENV)/headless-tf2
	$(call delegate_venv,$(OCRD_CALAMARI),$(SUB_VENV)/headless-tf2)
ocrd_calamari-check:
	$(MAKE) check OCRD_EXECUTABLES=$(OCRD_CALAMARI) VIRTUAL_ENV=$(SUB_VENV)/headless-tf2
else
	$(pip_install)
endif
endif

ifneq ($(findstring ocrd_pc_segmentation, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_PC_SEGMENTATION)
OCRD_PC_SEGMENTATION := $(BIN)/ocrd-pc-segmentation
$(OCRD_PC_SEGMENTATION): ocrd_pc_segmentation
ifeq (0,$(MAKELEVEL))
	$(MAKE) -B -o $< $(notdir $(OCRD_PC_SEGMENTATION)) VIRTUAL_ENV=$(SUB_VENV)/headless-tf21
	$(call delegate_venv,$(OCRD_PC_SEGMENTATION),$(SUB_VENV)/headless-tf21)
ocrd_pc_segmentation-check:
	$(MAKE) check OCRD_MODULES=ocrd_pc_segmentation VIRTUAL_ENV=$(SUB_VENV)/headless-tf21
else
	. $(ACTIVATE_VENV) && $(MAKE) -C $< deps
	$(pip_install)
endif
endif

ifneq ($(findstring ocrd_anybaseocr, $(OCRD_MODULES)),)
install-models: install-models-anybaseocr
.PHONY: install-models-anybaseocr
install-models-anybaseocr:
	. $(ACTIVATE_VENV) && ocrd resmgr download ocrd-anybaseocr-dewarp '*'
	. $(ACTIVATE_VENV) && ocrd resmgr download ocrd-anybaseocr-block-segmentation '*'
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
OCRD_ANYBASEOCR += $(BIN)/ocrd-anybaseocr-block-segmentation
$(call multirule,$(OCRD_ANYBASEOCR)): ocrd_anybaseocr
ifeq (0,$(MAKELEVEL))
	$(MAKE) -B -o $< $(notdir $(OCRD_ANYBASEOCR)) VIRTUAL_ENV=$(SUB_VENV)/headless-tf21
	$(call delegate_venv,$(OCRD_ANYBASEOCR),$(SUB_VENV)/headless-tf21)
ocrd_anybaseocr-check:
	$(MAKE) check OCRD_MODULES=ocrd_anybaseocr VIRTUAL_ENV=$(SUB_VENV)/headless-tf21
else
	cd $< ; $(MAKE) patch-pix2pixhd
	$(pip_install)
endif
endif

ifneq ($(findstring ocrd_typegroups_classifier, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_TYPECLASS)
OCRD_TYPECLASS := $(BIN)/ocrd-typegroups-classifier
OCRD_TYPECLASS += $(BIN)/typegroups-classifier
$(call multirule,$(OCRD_TYPECLASS)): ocrd_typegroups_classifier
ifeq (0,$(MAKELEVEL))
	$(MAKE) -B -o $< $(notdir $(OCRD_TYPECLASS)) VIRTUAL_ENV=$(SUB_VENV)/headless-torch14
	$(call delegate_venv,$(OCRD_TYPECLASS),$(SUB_VENV)/headless-torch14)
ocrd_typegroups_classifier-check:
	$(MAKE) check OCRD_MODULES=ocrd_typegroups_classifier VIRTUAL_ENV=$(SUB_VENV)/headless-torch14
else
	$(pip_install)
endif
endif

ifneq ($(findstring sbb_binarization, $(OCRD_MODULES)),)
install-models: install-models-sbb-binarization
.PHONY: install-models-sbb-binarization
install-models-sbb-binarization:
	. $(ACTIVATE_VENV) && ocrd resmgr download ocrd-sbb-binarize '*'

OCRD_EXECUTABLES += $(SBB_BINARIZATION)
SBB_BINARIZATION := $(BIN)/ocrd-sbb-binarize
$(SBB_BINARIZATION): sbb_binarization
ifeq (0,$(MAKELEVEL))
	$(MAKE) -B -o $< $(notdir $(SBB_BINARIZATION)) VIRTUAL_ENV=$(SUB_VENV)/headless-tf1
	$(call delegate_venv,$(SBB_BINARIZATION),$(SUB_VENV)/headless-tf1)
sbb_binarization-check:
	$(MAKE) check OCRD_MODULES=sbb_binarization VIRTUAL_ENV=$(SUB_VENV)/headless-tf1
else
	$(pip_install)
endif
endif

ifneq ($(findstring sbb_textline_detector, $(OCRD_MODULES)),)
install-models: install-models-sbb-textline
.PHONY: install-models-sbb-textline
install-models-sbb-textline:
	. $(ACTIVATE_VENV) && ocrd resmgr download ocrd-sbb-textline-detector '*'
OCRD_EXECUTABLES += $(SBB_LINE_DETECTOR)
SBB_LINE_DETECTOR := $(BIN)/ocrd-sbb-textline-detector
$(SBB_LINE_DETECTOR): sbb_textline_detector
ifeq (0,$(MAKELEVEL))
	$(MAKE) -B -o $< $(notdir $(SBB_LINE_DETECTOR)) VIRTUAL_ENV=$(SUB_VENV)/headless-tf1
	$(call delegate_venv,$(SBB_LINE_DETECTOR),$(SUB_VENV)/headless-tf1)
sbb_textline_detector-check:
	$(MAKE) check OCRD_MODULES=sbb_textline_detector VIRTUAL_ENV=$(SUB_VENV)/headless-tf1
else
	$(pip_install)
endif
endif

ifneq ($(findstring ocrd_repair_inconsistencies, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_REPAIR_INCONSISTENCIES)
OCRD_REPAIR_INCONSISTENCIES := $(BIN)/ocrd-repair-inconsistencies
$(OCRD_REPAIR_INCONSISTENCIES): ocrd_repair_inconsistencies $(BIN)/ocrd
	$(pip_install)
endif

ifneq ($(findstring ocrd_olahd_client, $(OCRD_MODULES)),)
OCRD_EXECUTABLES += $(OCRD_OLAHD_CLIENT)
OCRD_OLAHD_CLIENT := $(BIN)/ocrd-olahd-client
$(OCRD_OLAHD_CLIENT): ocrd_olahd_client $(BIN)/ocrd
	$(pip_install)
endif

ifneq ($(findstring workflow-configuration, $(OCRD_MODULES)),)
deps-ubuntu-modules: workflow-configuration
OCRD_EXECUTABLES += $(WORKFLOW_CONFIGURATION)
WORKFLOW_CONFIGURATION := $(BIN)/ocrd-make
WORKFLOW_CONFIGURATION += $(BIN)/ocrd-import
$(BIN)/ocrd-make-check: override CHECK_HELP=
$(call multirule,$(WORKFLOW_CONFIGURATION)): workflow-configuration $(BIN)/ocrd
	$(MAKE) -C $< install
endif

# Build by entering subdir (first dependent), then
# install gracefully with dependencies, and finally
# install again forcefully without depds (to ensure
# the binary itself updates):
define pip_install
. $(ACTIVATE_VENV) && cd $< && $(PIP) install $(PIP_OPTIONS_E) .
. $(ACTIVATE_VENV) && cd $< && $(PIP) install --no-deps --force-reinstall $(PIP_OPTIONS) .
endef

# pattern for recursive make:
# $(executables...): module...
# ifeq (0,$(MAKELEVEL))
# 	$(MAKE) -B -o $< $(notdir $(executables...)) VIRTUAL_ENV=$(SUB_VENV)/name
# 	$(call delegate_venv,$(executables...),$(SUB_VENV)/name)
# else
# 	actual recipe...
# fi
# -- calls make with -B to ensure the nested recipe is run as well,
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
#!/bin/bash
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
@echo '#!/bin/bash' > $(1)
@echo '. $(2)/bin/activate && $(2)/bin/$(notdir $(1)) "$$@"' >> $(1)

endef
define delegate_venv
$(foreach executable,$(1),$(call delegator,$(executable),$(2)))
chmod +x $(1)
endef
endif

# avoid making these .PHONY so they do not have to be repeated:
# clstm tesserocr
$(SHARE)/%: % | $(ACTIVATE_VENV) $(SHARE)
	. $(ACTIVATE_VENV) && cd $< && $(PIP) install $(PIP_OPTIONS) .
	@touch $@

$(SHARE):
	@mkdir -p "$@"

# At last, add venv dependency (must not become first):
$(OCRD_EXECUTABLES) $(BIN)/wheel: | $(VIRTUAL_ENV)/bin/$(PIP)
$(OCRD_EXECUTABLES): | $(BIN)/wheel
# Also, add core dependency (but in a non-circular way):
$(filter-out $(BIN)/ocrd,$(OCRD_EXECUTABLES)): $(BIN)/ocrd

# At last, we know what all OCRD_EXECUTABLES are:
all: $(OCRD_MODULES) $(OCRD_EXECUTABLES)
show:
	@echo VIRTUAL_ENV = $(VIRTUAL_ENV)
	@echo OCRD_MODULES = $(OCRD_MODULES)
	@echo OCRD_EXECUTABLES = $(OCRD_EXECUTABLES:$(BIN)/%=%)

check: $(OCRD_EXECUTABLES:%=%-check) $(OCRD_MODULES:%=%-check)
	. $(ACTIVATE_VENV) && $(PIP) check
%-check: ;

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

ifneq ($(findstring tesseract, $(OCRD_MODULES)),)
# Tesseract.

# when not installing via PPA, we must cope without ocrd_tesserocr's deps-ubuntu-modules
CUSTOM_DEPS += g++ make automake libleptonica-dev
# but since we are building statically, we need more (static) libs at build time
CUSTOM_DEPS += libarchive-dev libcurl4-nss-dev libgif-dev libjpeg-dev libpng-dev libtiff-dev

XDG_DATA_HOME ?= $(if $(HOME),$(HOME)/.local/share,/usr/local/share)
DEFAULT_RESLOC ?= $(XDG_DATA_HOME)/ocrd-resources
TESSDATA ?= $(DEFAULT_RESLOC)/ocrd-tesserocr-recognize
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

tesseract/Makefile.in: tesseract
	cd tesseract && ./autogen.sh

# Build and install Tesseract.
# We do not want to compile-in TESSDATA_PREFIX here, because our preferred TESSDATA path
# would still get incorrectly suffixed by "/tessdata" at runtime.
# Instead, we will rely on TESSDATA_PREFIX=$(TESSDATA) as a shell variable for the standalone CLI.
TESSERACT_CONFIG ?= --disable-tessdata-prefix --disable-openmp --disable-shared CXXFLAGS="-g -O2 -fPIC"
$(BIN)/tesseract: tesseract/Makefile.in
	mkdir -p $(VIRTUAL_ENV)/build/tesseract
	cd $(VIRTUAL_ENV)/build/tesseract && $(CURDIR)/tesseract/configure --prefix="$(VIRTUAL_ENV)" $(TESSERACT_CONFIG)
	cd $(VIRTUAL_ENV)/build/tesseract && $(MAKE) install
	@mkdir -p $(TESSDATA)
	cp -pr $(VIRTUAL_ENV)/share/tessdata/* $(TESSDATA)/

# Build and install Tesseract training tools.

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

.PHONY: install-tesseract-training
install-tesseract-training: $(TESSTRAIN_EXECUTABLES)

$(call multirule,$(TESSTRAIN_EXECUTABLES)): tesseract/Makefile.in
	mkdir -p $(VIRTUAL_ENV)/build/tesseract
	$(MAKE) -C $(VIRTUAL_ENV)/build/tesseract training-install

# offer abbreviated forms (just the CLI name in the PATH,
# without its directory):
.PHONY: $(TESSTRAIN_EXECUTABLES:$(BIN)/%=%)
$(TESSTRAIN_EXECUTABLES:$(BIN)/%=%): %: $(BIN)/%

endif

clean: clean-tesseract
.PHONY: clean-tesseract
clean-tesseract:
	$(RM) -r $(VIRTUAL_ENV)/build/tesseract

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
	$(MAKE) deps-ubuntu-modules
	chown -R --reference=$(CURDIR) .git $(OCRD_MODULES)
# prevent the sem commands during above module updates from imposing sudo perms on HOME:
	chown -R --reference=$(HOME) $(HOME)/.parallel

deps-ubuntu-modules:
	set -e; for dir in $^; do $(MAKE) -C $$dir deps-ubuntu; done
	apt-get -y install $(CUSTOM_DEPS)

.PHONY: deps-ubuntu deps-ubuntu-modules

# Docker builds.
DOCKER_TAG ?= ocrd/all

# Several predefined selections
# (note: to arrive at smallest possible image size individually,
#  these variants won't share common layers / steps / data,
#  so build-time and bandwidth are n-fold)
.PHONY: dockers
ifdef DOCKERS_WITHOUT_REPOS
dockers: docker-minimum docker-minimum-cuda docker-medium docker-medium-cuda docker-maximum docker-maximum-cuda
else
dockers: docker-minimum-git docker-minimum-cuda-git docker-medium-git docker-medium-cuda-git docker-maximum-git docker-maximum-cuda-git
endif

# Selections which keep git repos and reference them for install
# (so components can be updated via git from the container alone)
docker-%-git: PIP_OPTIONS = -e

# Minimum-size selection: use Ocropy binarization, use Tesseract from PPA
docker-mini%: DOCKER_MODULES = core ocrd_cis ocrd_fileformat ocrd_im6convert ocrd_pagetopdf ocrd_repair_inconsistencies ocrd_tesserocr ocrd_wrap tesserocr workflow-configuration ocrd_olahd_client
# Medium-size selection: add Olena binarization and Calamari, use Tesseract from git, add evaluation
docker-medi%: DOCKER_MODULES = core cor-asv-ann dinglehopper format-converters ocrd_calamari ocrd_cis ocrd_fileformat ocrd_im6convert ocrd_keraslm ocrd_olena ocrd_pagetopdf ocrd_repair_inconsistencies ocrd_segment ocrd_tesserocr ocrd_wrap tesseract tesserocr workflow-configuration ocrd_olahd_client
# Maximum-size selection: use all modules
docker-maxi%: DOCKER_MODULES = $(OCRD_MODULES)

# DOCKER_BASE_IMAGE
docker%um docke%um-git: DOCKER_BASE_IMAGE = ocrd/core
# CUDA variants
docker%-cuda docker%-cuda-git: DOCKER_BASE_IMAGE = ocrd/core-cuda

# Build rule for all selections
# (maybe we should add --network=host here for smoother build-time?)
docker%: Dockerfile $(DOCKER_MODULES)
	docker build \
	--build-arg BASE_IMAGE=$(DOCKER_BASE_IMAGE) \
	--build-arg VCS_REF=$$(git rev-parse --short HEAD) \
	--build-arg BUILD_DATE=$$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
	--build-arg OCRD_MODULES="$(DOCKER_MODULES)" \
	--build-arg PIP_OPTIONS="$(PIP_OPTIONS)" \
	-t $(DOCKER_TAG):$(or $(*:-%=%),latest) .


docker: DOCKER_MODULES ?= $(OCRD_MODULES)
docker: docker-latest

# do not search for implicit rules here:
Makefile: ;
local.mk: ;

# eof
