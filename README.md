# OCR-D/ocrd_all

This is a project which gets the source of all OCR-D modules.
It also includes a Makefile for the installation.

## Preconditions

Make sure that there is enough free disk space. 3 GiB or more is recommended for
the required submodules, build data, temporary data, installed virtual environment
and pip cache.

Install the packages for Python3 development and for Python3 virtual environments
for your operating system / distribution.

    # Debian / Ubuntu packages.
    sudo apt install python3-dev python3-venv

Some modules use the Tesseract library. If your distribution provides Tesseract 4.1
or newer, install the development package:

    # Debian / Ubuntu package.
    sudo apt install libtesseract-dev

Ubuntu packages for Tesseract 5.0.0 (alpha) are available at the PPA
https://launchpad.net/~alex-p/+archive/ubuntu/tesseract-ocr-devel.

Otherwise or for the latest Tesseract code it can also be built locally.

## Usage

Run `make` with optional parameters:

    make [PYTHON=python3] [VENV=venv] [target(s)]

Optional parameters:

- PYTHON        Python version (python3 required)
- VENV          Directory for virtual Python environment

### Examples

The following examples assume a working development installation of Tesseract.
To build the latest Tesseract locally, run this command first:

    # Get code, build and install Tesseract with the default English model.
    make tesseract

Optionally install additional Tesseract models.

    # Make sure to use the correct tessdata directory.
    make venv/share/tessdata/script/Latin.traineddata
    make venv/share/tessdata/script/Fraktur.traineddata

Running `make` without any parameter hopefully installs all OCR-D modules
in a virtual Python 3 environment in directory `venv`.

Running `make ocrd-tesserocr-recognize` installs `ocrd-tesserocr-recognize`
in the virtual Python environment.

`make` automatically gets the necessary submodules.
It is also possible to get all OCR-D modules by running

    git submodule update --init

## Open issues

The following Python modules need an installation from code for different reasons:

- clstm (needs modified code for Python3)
- cor-asv-ann (not available in PyPI)
- dinglehopper (not available in PyPI)
- ocrd_tesserocr (to old in PyPI)
- tesserocr (to old in PyPI)
