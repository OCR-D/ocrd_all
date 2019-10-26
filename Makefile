# Makefile for OCR-D

# Python version (python3 required).
PYTHON := python3
PIP_OPTIONS :=

# directory for virtual Python environment
# (but re-use if already active):
VENV := $(if $(VIRTUAL_ENV),$(VIRTUAL_ENV),$(CURDIR)/venv)

BIN := $(VENV)/bin
ACTIVATE_VENV := $(VENV)/bin/activate

WGET := $(if $(shell which wget),wget -O,$(if $(shell which curl),curl -o,$(error "found no cmdline downloader (wget/curl)")))

export PKG_CONFIG_PATH := $(VENV)/lib/pkgconfig

OCRD_EXECUTABLES = $(BIN)/ocrd # add more CLIs below
CUSTOM_INSTALL := $(BIN)/ocrd # add more non-pip installation targets below

OCRD_MODULES := $(shell git submodule status | while read commit dir ref; do echo $$dir; done)

.DEFAULT_GOAL = ocrd # all is too much for a default

.PHONY: all modules clean help show always-update

all: modules # add OCRD_EXECUTABLES at the end

clean:
	$(RM) -r $(CURDIR)/venv

export define HELP
cat <<EOF
Rules to download and install all OCR-D module processors
from their source repositories into a single virtualenv.

Targets:
	ocrd: installs only the virtual environment and OCR-D/core packages
	modules: download all submodules to the managed revision
	all: installs all executables of all modules
	tesseract: download, builds and installs Tesseract
	clean: removes the virtual environment directory
	show: lists the venv path and all executables (to be) installed

Variables:
	VENV: path to (re-)use for the virtual environment
	PYTHON: path to the Python binary
	PIP_OPTIONS: extra options to pass pip install like -q or -v
EOF
endef
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
	git submodule status $@ | grep -q '^ ' || { \
		git submodule update --init $@ && \
		touch -r $$(find $@ -type f -newer $@ | tail -1 || echo $@) $@; }

$(ACTIVATE_VENV) $(VENV):
	$(PYTHON) -m venv $(VENV)
	. $(ACTIVATE_VENV) && pip install --upgrade pip

# Get Python modules.

.PHONY: install-numpy
install-numpy: $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && pip install numpy

OCRD_EXECUTABLES += $(OCRD_KRAKEN)

OCRD_KRAKEN := $(BIN)/ocrd-kraken-binarize
OCRD_KRAKEN += $(BIN)/ocrd-kraken-segment

$(OCRD_KRAKEN): ocrd_kraken install-clstm

OCRD_EXECUTABLES += $(OCRD_OCROPY)

OCRD_OCROPY := $(BIN)/ocrd-ocropy-segment

$(OCRD_OCROPY): ocrd_ocropy

.PHONY: ocrd
ocrd: $(BIN)/ocrd
$(BIN)/ocrd: core
	. $(ACTIVATE_VENV) && cd $< && make install PIP_INSTALL="pip install --force-reinstall $(PIP_OPTIONS)"

.PHONY: wheel
wheel: $(BIN)/wheel
$(BIN)/wheel: $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && pip install --force-reinstall $(PIP_OPTIONS) wheel

# Install Python modules from local code.

.PHONY: install-clstm
install-clstm: clstm
install-clstm: install-numpy

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
OCRD_KERASLM += $(BIN)/keraslm-train

$(OCRD_KERASLM): ocrd_keraslm

OCRD_EXECUTABLES += $(BIN)/ocrd-im6convert
CUSTOM_INSTALL += $(BIN)/ocrd-im6convert

$(BIN)/ocrd-im6convert: ocrd_im6convert
	. $(ACTIVATE_VENV) && cd $< && make install

OCRD_EXECUTABLES += $(BIN)/ocrd-olena-binarize
CUSTOM_INSTALL += $(BIN)/ocrd-olena-binarize

$(BIN)/ocrd-olena-binarize: ocrd_olena
	. $(ACTIVATE_VENV) && cd $< && make install

OCRD_EXECUTABLES += $(BIN)/ocrd-dinglehopper

.PHONY: ocrd-dinglehopper
ocrd-dinglehopper: $(BIN)/ocrd-dinglehopper
$(BIN)/ocrd-dinglehopper: dinglehopper

OCRD_EXECUTABLES += $(OCRD_TESSEROCR)

OCRD_TESSEROCR := $(BIN)/ocrd-tesserocr-binarize
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-crop
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-deskew
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-recognize
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-line
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-region
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-word

$(OCRD_TESSEROCR): ocrd_tesserocr install-tesserocr

.PHONY: install-tesserocr
install-tesserocr: tesserocr

OCRD_EXECUTABLES += $(OCRD_CIS)

OCRD_CIS := $(BIN)/ocrd-cis-aio
OCRD_CIS += $(BIN)/ocrd-cis-align
OCRD_CIS += $(BIN)/ocrd-cis-clean
OCRD_CIS += $(BIN)/ocrd-cis-cutter
OCRD_CIS += $(BIN)/ocrd-cis-importer
OCRD_CIS += $(BIN)/ocrd-cis-lang
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-binarize
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-clip
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-denoise
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-deskew
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-dewarp
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-rec
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-recognize
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-resegment
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-segment
OCRD_CIS += $(BIN)/ocrd-cis-ocropy-train
OCRD_CIS += $(BIN)/ocrd-cis-profile
OCRD_CIS += $(BIN)/ocrd-cis-stats
# these are from calamari_ocr, a pip requirement:
OCRD_CIS += $(BIN)/tqdm
OCRD_CIS += $(BIN)/calamari-eval
OCRD_CIS += $(BIN)/calamari-train
OCRD_CIS += $(BIN)/edit-distance

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

OCRD_ANYBASEOCR := ocrd-anybaseocr-crop
OCRD_ANYBASEOCR += ocrd-anybaseocr-binarize
OCRD_ANYBASEOCR += ocrd-anybaseocr-deskew
OCRD_ANYBASEOCR += ocrd-anybaseocr-dewarp
OCRD_ANYBASEOCR += ocrd-anybaseocr-tiseg
OCRD_ANYBASEOCR += ocrd-anybaseocr-textline
OCRD_ANYBASEOCR += ocrd-anybaseocr-layout-analysis
OCRD_ANYBASEOCR += ocrd-anybaseocr-block-segmentation

$(OCRD_ANYBASEOCR): LAYoutERkennung

OCRD_EXECUTABLES += $(OCRD_TYPECLASS)

OCRD_TYPECLASS := ocrd-typegroups-classifier
OCRD_TYPECLASS += typegroups-classifier

$(OCRD_TYPECLASS): ocrd_typegroups_classifier

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
$(filter-out $(CUSTOM_INSTALL),$(OCRD_EXECUTABLES)) install-clstm install-tesserocr:
	. $(ACTIVATE_VENV) && cd $< && pip install $(PIP_OPTIONS) .
	. $(ACTIVATE_VENV) && cd $< && pip install --no-deps --force-reinstall $(PIP_OPTIONS) .

# At last, add venv dependency (must not become first):
$(OCRD_EXECUTABLES) install-clstm install-tesserocr $(BIN)/wheel: $(ACTIVATE_VENV)
$(OCRD_EXECUTABLES) install-clstm install-tesserocr: $(BIN)/wheel

# At last, we know what all OCRD_EXECUTABLES are:
all: $(OCRD_EXECUTABLES)

show:
	@echo VENV = $(VENV)
	@echo OCRD_MODULES = $(OCRD_MODULES)
	@echo OCRD_EXECUTABLES = $(OCRD_EXECUTABLES:$(BIN)/%=%)

# offer abbreviated forms (just the CLI name in the PATH,
# without its directory):
.PHONY: $(OCRD_EXECUTABLES:$(BIN)/%=%)
$(OCRD_EXECUTABLES:$(BIN)/%=%): %: $(BIN)/%

# Tesseract.

TESSDATA := $(VENV)/share/tessdata
TESSDATA_URL := https://github.com/tesseract-ocr/tessdata_fast
TESSERACT_TRAINEDDATA := $(TESSDATA)/eng.traineddata
TESSERACT_TRAINEDDATA += $(TESSDATA)/equ.traineddata
TESSERACT_TRAINEDDATA += $(TESSDATA)/osd.traineddata

# Install Tesseract and required models.
.PHONY: tesseract
tesseract: $(BIN)/tesseract $(TESSERACT_TRAINEDDATA)

# Special rule for equ.traineddata which is only available from tesseract-ocr/tessdata.
$(TESSDATA)/equ.traineddata:
	@mkdir -p $(dir $@)
	$(WGET) $@ https://github.com/tesseract-ocr/tessdata/raw/master/$(notdir $@) || \
		{ $(RM) $@; false; }

# Default rule for all other traineddata models.
%.traineddata:
	@mkdir -p $(dir $@)
	$(WGET) $@ $(TESSDATA_URL)/raw/master/$(notdir $@) || \
	$(WGET) $@ $(TESSDATA_URL)/raw/master/$(notdir $(dir $@))/$(notdir $@) || \
		{ $(RM) $@; false; }

tesseract/configure.ac:
	git submodule update --init tesseract

tesseract/configure: tesseract/configure.ac
	cd tesseract && ./autogen.sh

# Build and install Tesseract.
$(BIN)/tesseract: tesseract/configure
	mkdir -p tesseract/build
	cd tesseract/build && ../configure --disable-openmp --disable-shared --prefix="$(VENV)" CXXFLAGS="-g -O2 -fPIC"
	cd tesseract/build && make install

# do not search for implicit rules here:
Makefile: ;

# eof
