# Makefile for OCR-D

# Python version (python3 required).
PYTHON := python3.7

# Directory for virtual Python environment.
VENV := $(PWD)/venv

BIN := $(VENV)/bin

OCRD_EXECUTABLES :=

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

$(VENV):
	$(PYTHON) -m venv $(VENV)

# Get Python modules.

numpy:
	. $(VENV)/bin/activate && pip install $@

$(OCRD_KRAKEN): clstm
	. $(VENV)/bin/activate && pip install ocrd-kraken

$(OCRD_OCROPY): $(BIN)/wheel
	. $(VENV)/bin/activate && pip install ocrd-ocropy

ocrd: $(BIN)/ocrd
$(BIN)/ocrd:
	. $(VENV)/bin/activate && pip install o

wheel: $(BIN)/wheel
$(BIN)/wheel:
	. $(VENV)/bin/activate && pip install wheel

# Install Python modules from local code.

clstm: numpy $(BIN)/wheel
	#~ . $(VENV)/bin/activate && cd $@ && python setup.py build
	. $(VENV)/bin/activate && cd $@ && pip install .

$(OCRD_COR_ASV_ANN): $(BIN)/wheel
	. $(VENV)/bin/activate && cd cor-asv-ann && pip install .

ocrd-dinglehopper: $(BIN)/ocrd-dinglehopper
$(BIN)/ocrd-dinglehopper: $(BIN)/wheel
	. $(VENV)/bin/activate && cd dinglehopper && pip install .

$(OCRD_TESSEROCR): tesserocr
	. $(VENV)/bin/activate && cd ocrd_tesserocr && pip install .

tesserocr: $(BIN)/wheel
	. $(VENV)/bin/activate && cd $@ && pip install .

# eof
