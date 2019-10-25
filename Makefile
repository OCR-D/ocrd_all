# Makefile for OCR-D

# Python version (python3 required).
PYTHON := python3

# Directory for virtual Python environment.
VENV := $(PWD)/venv

BIN := $(VENV)/bin
ACTIVATE_VENV := $(VENV)/bin/activate

export PKG_CONFIG_PATH := $(VENV)/lib/pkgconfig

OCRD_EXECUTABLES = $(BIN)/ocrd # add more CLIs below

OCRD_MODULES := $(shell git submodule status | while read commit dir ref; do echo $$dir; done)

.PHONY: all always-update
all: $(VENV) $(OCRD_EXECUTABLES) $(OCRD_MODULES)

# update subrepos to the commited revisions:
# - depends on phony always-update,
#   so this will not only work on first checkout
# - updates the module to the revision registered here
# - then changes the time stamp of the directory to that
#   of the latest modified file contained in it,
#   so the directory can be used as a dependency
$(OCRD_MODULES): always-update
	git submodule status $@ | grep -q '^ ' || { \
		git submodule update --init $@ && \
		touch -t $$(find $@ -type f -printf '%TY%Tm%Td%TH%TM\n' | sort -n | tail -1) $@; }

$(ACTIVATE_VENV) $(VENV):
	$(PYTHON) -m venv $(VENV)

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
	. $(ACTIVATE_VENV) && cd $< && make install PIP_INSTALL="pip install -I"

.PHONY: wheel
wheel: $(BIN)/wheel
$(BIN)/wheel: $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && pip install wheel

# Install Python modules from local code.

.PHONY: install-clstm
install-clstm: clstm install-numpy

OCRD_EXECUTABLES += $(OCRD_COR_ASV_ANN)

OCRD_COR_ASV_ANN := $(BIN)/ocrd-cor-asv-ann-evaluate
OCRD_COR_ASV_ANN += $(BIN)/ocrd-cor-asv-ann-process

$(OCRD_COR_ASV_ANN): cor-asv-ann

OCRD_EXECUTABLES += $(BIN)/ocrd-dinglehopper

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

# Most recipes install more than one tool at once,
# which make does not know; To avoid races, these
# rules must be serialised. GNU make does not have
# local serialisation, so we can as well state it
# globally:
.NOTPARALLEL:

# Build by entering subdir (first dependent), then
# install ignoring the existing version (to ensure
# the binary updates):
$(filter-out $(BIN)/ocrd,$(OCRD_EXECUTABLES)) install-clstm install-tesserocr:
	. $(ACTIVATE_VENV) && cd $< && pip install -I .

# At last, add venv dependency (must not become first):
$(OCRD_EXECUTABLES) install-clstm install-tesserocr $(BIN)/wheel: $(ACTIVATE_VENV)
$(OCRD_EXECUTABLES) install-clstm install-tesserocr: $(BIN)/wheel

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
	cd $(dir $@) && wget https://github.com/tesseract-ocr/tessdata/raw/master/$(notdir $@)

# Default rule for all other traineddata models.
%.traineddata:
	@mkdir -p $(dir $@)
	cd $(dir $@) && ( \
		wget $(TESSDATA_URL)/raw/master/$(notdir $@) || \
		wget $(TESSDATA_URL)/raw/master/$(notdir $(dir $@))/$(notdir $@) \
	)

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
