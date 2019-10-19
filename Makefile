# Makefile for OCR-D

PYTHON := python3.7
VENV := $(PWD)/venv

OCRD_MODULES :=
OCRD_MODULES += ocrd-kraken
OCRD_MODULES += ocrd-ocropy
OCRD_MODULES += ocrd-tesserocr

.PHONY: all clstm tesserocr wheel $(OCRD_MODULES)

all: $(VENV) $(OCRD_MODULES)

$(VENV):
	$(PYTHON) -m venv $(VENV)

ocrd-kraken: clstm

# Get Python modules.

numpy ocrd-kraken ocrd-ocropy wheel:
	. $(VENV)/bin/activate && pip install $@

# Install Python modules from local code.

clstm: numpy wheel
	. $(VENV)/bin/activate && cd $@ && python setup.py build
	. $(VENV)/bin/activate && cd $@ && pip install .

ocrd-tesserocr: tesserocr
	. $(VENV)/bin/activate && cd ocrd_tesserocr && pip install .

tesserocr: wheel
	. $(VENV)/bin/activate && cd $@ && pip install .
