# Makefile for OCR-D

# Python version (python3 required).
PYTHON := python3
PIP_INSTALL ?= pip3 install

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
CUSTOM_DEPS = core # add more modules which need deps-ubuntu below

OCRD_MODULES := $(shell git submodule status | while read commit dir ref; do echo $$dir; done)

.DEFAULT_GOAL = help # all is too much for a default, and ocrd is too little

.PHONY: all modules clean help show always-update

all: modules # add OCRD_EXECUTABLES at the end

clean:
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
	fix-pip: try to repair conflicting requirements
	install-tesseract: download, build and install Tesseract
	clean: removes the virtual environment directory
	docker: (re)build a docker image including all executables

Variables:
	VIRTUAL_ENV: path to (re-)use for the virtual environment
	TMPDIR: path to use for temporary storage instead of the system default
	PYTHON: name of the Python binary
	PIP_INSTALL: `pip install` command, optionally with extra options like `-q` or `-v`
EOF
endef
export HELP
help: ;	@eval "$$HELP"

# update subrepos to the committed revisions:
# - depends on phony always-update,
#   so this will not only work on first checkout
# - updates the module to the revision registered here
# - then changes the time stamp of the directory to that
#   of the latest modified file contained in it,
#   so the directory can be used as a dependency
modules: $(OCRD_MODULES)
$(OCRD_MODULES): always-update
	git submodule sync --recursive $@
	git submodule status $@ | grep -q '^ ' || { \
		git submodule update --init --recursive $@ && \
		touch -r $$(find $@ -type f -newer $@ -o -type d -name $@ | tail -1) $@; }

$(ACTIVATE_VENV) $(VIRTUAL_ENV):
	$(PYTHON) -m venv $(VIRTUAL_ENV)
	. $(ACTIVATE_VENV) && $(PIP_INSTALL) --upgrade pip

# Get Python modules.

# avoid making this .PHONY so it does not have to be repeated
$(SHARE)/numpy: | $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && $(PIP_INSTALL) numpy
	@touch $@

OCRD_EXECUTABLES += $(OCRD_KRAKEN)

OCRD_KRAKEN := $(BIN)/ocrd-kraken-binarize
OCRD_KRAKEN += $(BIN)/ocrd-kraken-segment

$(OCRD_KRAKEN): ocrd_kraken $(SHARE)/clstm

OCRD_EXECUTABLES += $(OCRD_OCROPY)

OCRD_OCROPY := $(BIN)/ocrd-ocropy-segment

$(OCRD_OCROPY): ocrd_ocropy

.PHONY: ocrd
ocrd: $(BIN)/ocrd
$(BIN)/ocrd: core
	. $(ACTIVATE_VENV) && cd $< && make install PIP_INSTALL="$(PIP_INSTALL) --force-reinstall"
	# workaround for core#351:
	. $(ACTIVATE_VENV) && cd $< && make install PIP_INSTALL="$(PIP_INSTALL) --no-deps"

.PHONY: wheel
wheel: $(BIN)/wheel
$(BIN)/wheel: | $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && $(PIP_INSTALL) --force-reinstall wheel

# Install Python modules from local code.

$(SHARE)/clstm: | $(SHARE)/numpy

OCRD_EXECUTABLES += $(OCRD_COR_ASV_ANN)

OCRD_COR_ASV_ANN := $(BIN)/ocrd-cor-asv-ann-evaluate
OCRD_COR_ASV_ANN += $(BIN)/ocrd-cor-asv-ann-process
OCRD_COR_ASV_ANN += $(BIN)/cor-asv-ann-train
OCRD_COR_ASV_ANN += $(BIN)/cor-asv-ann-eval
OCRD_COR_ASV_ANN += $(BIN)/cor-asv-ann-repl

$(OCRD_COR_ASV_ANN): cor-asv-ann

OCRD_EXECUTABLES += $(OCRD_COR_ASV_FST)

OCRD_COR_ASV_FST := $(BIN)/ocrd-cor-asv-fst-process
OCRD_COR_ASV_FST += $(BIN)/cor-asv-fst-train

$(OCRD_COR_ASV_FST): cor-asv-fst

OCRD_EXECUTABLES += $(OCRD_KERASLM)

OCRD_KERASLM := $(BIN)/ocrd-keraslm-rate
OCRD_KERASLM += $(BIN)/keraslm-rate

$(OCRD_KERASLM): ocrd_keraslm

OCRD_EXECUTABLES += $(BIN)/ocrd-im6convert
CUSTOM_INSTALL += $(BIN)/ocrd-im6convert
CUSTOM_DEPS += ocrd_im6convert

$(BIN)/ocrd-im6convert: ocrd_im6convert
	. $(ACTIVATE_VENV) && cd $< && $(MAKE) install

OCRD_EXECUTABLES += $(BIN)/ocrd-olena-binarize
CUSTOM_INSTALL += $(BIN)/ocrd-olena-binarize
CUSTOM_DEPS += ocrd_olena

$(BIN)/ocrd-olena-binarize: ocrd_olena
	. $(ACTIVATE_VENV) && cd $< && $(MAKE) install

OCRD_EXECUTABLES += $(BIN)/ocrd-dinglehopper

.PHONY: ocrd-dinglehopper
ocrd-dinglehopper: $(BIN)/ocrd-dinglehopper
$(BIN)/ocrd-dinglehopper: dinglehopper

OCRD_EXECUTABLES += $(OCRD_SEGMENT)
OCRD_SEGMENT := $(BIN)/ocrd-segment-evaluate
OCRD_SEGMENT += $(BIN)/ocrd-segment-extract-lines
OCRD_SEGMENT += $(BIN)/ocrd-segment-extract-regions
OCRD_SEGMENT += $(BIN)/ocrd-segment-repair
$(OCRD_SEGMENT): ocrd_segment

OCRD_EXECUTABLES += $(OCRD_TESSEROCR)
CUSTOM_DEPS += ocrd_tesserocr

OCRD_TESSEROCR := $(BIN)/ocrd-tesserocr-binarize
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-crop
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-deskew
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-recognize
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-line
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-region
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-word

$(OCRD_TESSEROCR): ocrd_tesserocr $(SHARE)/tesserocr

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

OCRD_EXECUTABLES += $(OCRD_CALAMARI)

OCRD_CALAMARI := $(BIN)/ocrd-calamari-recognize

$(OCRD_CALAMARI): ocrd_calamari

OCRD_EXECUTABLES += $(OCRD_SEGMENTATION_RUNNER)

OCRD_SEGMENTATION_RUNNER := $(BIN)/ocropus-gpageseg-with-coords
OCRD_SEGMENTATION_RUNNER += $(BIN)/ocrd-pc-seg-process
OCRD_SEGMENTATION_RUNNER += $(BIN)/ocrd-pc-seg-single

$(OCRD_SEGMENTATION_RUNNER): segmentation-runner

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

OCRD_EXECUTABLES += $(OCRD_TYPECLASS)

OCRD_TYPECLASS := $(BIN)/ocrd-typegroups-classifier
OCRD_TYPECLASS += $(BIN)/typegroups-classifier

$(OCRD_TYPECLASS): ocrd_typegroups_classifier

OCRD_EXECUTABLES += $(WORKFLOW_CONFIGURATION)
CUSTOM_INSTALL += $(WORKFLOW_CONFIGURATION)
CUSTOM_DEPS += workflow-configuration

WORKFLOW_CONFIGURATION := $(BIN)/ocrd-make
WORKFLOW_CONFIGURATION += $(BIN)/ocrd-import

$(BIN)/ocrd-make: workflow-configuration
	cd $< && $(MAKE) install

# Most recipes install more than one tool at once,
# which make does not know; To avoid races, these
# rules must be serialised. GNU make does not have
# local serialisation, so we can as well state it
# globally:
.NOTPARALLEL:

# Build by entering subdir (first dependent), then
# install gracefully with dependencies, and finally
# install again forcefully without depds (to ensure
# the binary itself updates):
$(filter-out $(CUSTOM_INSTALL),$(OCRD_EXECUTABLES)):
	. $(ACTIVATE_VENV) && cd $< && $(PIP_INSTALL) .
	. $(ACTIVATE_VENV) && cd $< && $(PIP_INSTALL) --no-deps --force-reinstall .

# avoid making these .PHONY so they do not have to be repeated:
# clstm tesserocr
$(SHARE)/%: % | $(ACTIVATE_VENV) $(SHARE)
	. $(ACTIVATE_VENV) && cd $< && $(PIP_INSTALL) .
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
	. $(ACTIVATE_VENV) && $(PIP_INSTALL) --force-reinstall \
		opencv-python-headless \
		pillow>=6.2.0 \
		$(pip list | grep tensorflow-gpu | sed -E 's/-gpu +/==/')


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

# Tesseract.

TESSDATA := $(VIRTUAL_ENV)/share/tessdata
TESSDATA_URL := https://github.com/tesseract-ocr/tessdata_fast
TESSERACT_TRAINEDDATA := $(TESSDATA)/eng.traineddata
TESSERACT_TRAINEDDATA += $(TESSDATA)/equ.traineddata
TESSERACT_TRAINEDDATA += $(TESSDATA)/osd.traineddata

stripdir = $(patsubst %/,%,$(dir $(1)))

# Install Tesseract and required models.
.PHONY: install-tesseract
install-tesseract: $(BIN)/tesseract $(TESSERACT_TRAINEDDATA)

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

# do not delete intermediate targets:
.SECONDARY:

# suppress all built-in suffix rules:
.SUFFIXES:

# get the modules required by the given (1) executables
define requires-modules
$(shell LC_MESSAGES=C $(MAKE) -R -nd $(1) 2>&1 | \
	fgrep -e 'Considering target file' -e 'Trying rule prerequisite' | \
	cut -d\' -f2 | tr ' ' '\n' | fgrep -x $(OCRD_MODULES:%=-e %))
endef
# get only those (1) executables which depend on the given (2) set of allowed modules
define filter-executables
$(foreach tool, $(1), $(if $(filter-out $(2),$(call requires-modules, $(tool))),,$(tool)))
endef

# allow installing system dependencies for all modules
# (mainly intended for docker, not recommended for live systems)
# FIXME: we should find a way to filter based on the actual executables required
deps-ubuntu: CLSTM_DEPS = scons libprotobuf-dev protobuf-compiler libpng-dev libeigen3-dev swig
deps-ubuntu: TESSERACT_DEPS = g++ make automake
deps-ubuntu: $(CUSTOM_DEPS)
	set -e; for dir in $^; do $(MAKE) -C $$dir deps-ubuntu; done
	apt-get -y install wget python3-venv $(TESSERACT_DEPS) $(CLSTM_DEPS)

.PHONY: docker
docker: DOCKER_TAG ?= ocrd/all
# opencv-python is not needed for Ubuntu x86_64
docker: DOCKER_MODULES ?= $(filter-out opencv-python/,$(OCRD_MODULES))
# get all available processors
docker: DOCKER_EXECUTABLES ?= $(OCRD_EXECUTABLES:$(BIN)/%=%)
docker: ALLOWED_EXECUTABLES = $(call filter-executables, $(DOCKER_EXECUTABLES), $(DOCKER_MODULES))
docker: Dockerfile modules
	docker build \
	--build-arg OCRD_EXECUTABLES="$(ALLOWED_EXECUTABLES)" \
	-t $(DOCKER_TAG) .

# do not search for implicit rules here:
Makefile: ;

# eof
