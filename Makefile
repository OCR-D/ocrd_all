# Makefile for OCR-D

# Python version (python3 required).
PYTHON := python3

# Directory for virtual Python environment.
VENV := $(PWD)/venv

BIN := $(VENV)/bin
ACTIVATE_VENV := $(VENV)/bin/activate

TESSDATA := $(VENV)/share/tessdata
TESSDATA_URL := https://github.com/tesseract-ocr/tessdata_fast
TESSERACT_TRAINEDDATA := $(TESSDATA)/eng.traineddata
TESSERACT_TRAINEDDATA += $(TESSDATA)/equ.traineddata
TESSERACT_TRAINEDDATA += $(TESSDATA)/osd.traineddata

PKG_CONFIG_PATH := $(VENV)/lib/pkgconfig

OCRD_EXECUTABLES :=

OCRD_CIS += $(BIN)/calamari-eval
OCRD_CIS := $(BIN)/calamari-train
OCRD_CIS += $(BIN)/edit-distance
OCRD_CIS += $(BIN)/ocrd-cis-aio
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
OCRD_CIS += $(BIN)/tqdm
OCRD_EXECUTABLES += $(OCRD_CIS)

OCRD_COR_ASV_ANN := $(BIN)/ocrd-cor-asv-ann-evaluate
OCRD_COR_ASV_ANN += $(BIN)/ocrd-cor-asv-ann-process
OCRD_EXECUTABLES += $(OCRD_COR_ASV_ANN)

OCRD_EXECUTABLES += $(BIN)/ocrd-dinglehopper

OCRD_KRAKEN := $(BIN)/ocrd-kraken-binarize
OCRD_KRAKEN += $(BIN)/ocrd-kraken-segment

OCRD_OCROPY := $(BIN)/ocrd-ocropy-segment
OCRD_EXECUTABLES += $(OCRD_OCROPY)

OCRD_TESSEROCR := $(BIN)/ocrd-tesserocr-binarize
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-crop
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-deskew
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-recognize
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-line
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-region
OCRD_TESSEROCR += $(BIN)/ocrd-tesserocr-segment-word
OCRD_EXECUTABLES += $(OCRD_TESSEROCR)

OCRD_EXECUTABLES += $(BIN)/ocrd

.PHONY: all clstm numpy ocrd tesserocr

all: $(VENV) $(OCRD_EXECUTABLES) $(OCRD_MODULES)

$(ACTIVATE_VENV) $(VENV):
	$(PYTHON) -m venv $(VENV)

# Get Python modules.

numpy: $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && pip install $@

$(OCRD_KRAKEN): $(ACTIVATE_VENV) clstm
	. $(ACTIVATE_VENV) && pip install ocrd-kraken

$(OCRD_OCROPY): $(ACTIVATE_VENV) $(BIN)/wheel
	. $(ACTIVATE_VENV) && pip install ocrd-ocropy

ocrd: $(BIN)/ocrd
$(BIN)/ocrd: $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && pip install o

wheel: $(BIN)/wheel
$(BIN)/wheel: $(ACTIVATE_VENV)
	. $(ACTIVATE_VENV) && pip install wheel

# Install Python modules from local code.

clstm/setup.py:
	git submodule update --init clstm

clstm: $(ACTIVATE_VENV) clstm/setup.py numpy $(BIN)/wheel
	. $(ACTIVATE_VENV) && cd $@ && pip install .

cor-asv-ann/setup.py:
	git submodule update --init cor-asv-ann

$(OCRD_COR_ASV_ANN): $(ACTIVATE_VENV) cor-asv-ann/setup.py $(BIN)/wheel
	. $(ACTIVATE_VENV) && cd cor-asv-ann && pip install .

dinglehopper/setup.py:
	git submodule update --init dinglehopper

ocrd-dinglehopper: $(BIN)/ocrd-dinglehopper
$(BIN)/ocrd-dinglehopper: $(ACTIVATE_VENV) dinglehopper/setup.py $(BIN)/wheel
	. $(ACTIVATE_VENV) && cd dinglehopper && pip install .

ocrd_cis/setup.py:
	git submodule update --init ocrd_cis

$(OCRD_CIS): $(ACTIVATE_VENV) ocrd_cis/setup.py $(BIN)/wheel
	. $(ACTIVATE_VENV) && cd ocrd_cis && pip install .

ocrd_tesserocr/setup.py:
	git submodule update --init ocrd_tesserocr

$(OCRD_TESSEROCR): $(ACTIVATE_VENV) ocrd_tesserocr/setup.py tesserocr
	. $(ACTIVATE_VENV) && cd ocrd_tesserocr && pip install .

tesserocr/setup.py:
	git submodule update --init tesserocr

tesserocr: $(ACTIVATE_VENV) tesserocr/setup.py $(BIN)/wheel
	. $(ACTIVATE_VENV) && cd $@ && PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) pip install .

# Tesseract.

# Install Tesseract and required models.
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

# eof
