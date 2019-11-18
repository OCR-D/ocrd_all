# OCR-D/ocrd_all

This is a project which gets the source of all OCR-D modules.
It also includes a Makefile for their installation into a virtual environment (venv).
(A venv is a local user directory with shell scripts to load/unload itself
in the current shell environment via PATH and PYTHONHOME.)

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

System dependencies for Ubuntu 18.04 (or similar) for all modules can be automatically installed by running:

    # Debian / Ubuntu packages.
    [sudo] make deps-ubuntu


## Usage

Run `make` with optional parameters for _variables_ and _targets_ like so:

    make [PYTHON=python3] [VIRTUAL_ENV=./venv] [target(s)]

### Targets

<dl>
  <dt>ocrd</dt>
  <dd>(default goal) Install OCR-D/core and its CLI `ocrd` into the venv.</dd>
  <dt>all</dt>
  <dd>Install executables from all modules into the venv. (Depends on _modules_ and _ocrd_.)</dd>
  <dt>modules</dt>
  <dd>Download/update all modules, but do not install anything.</dd>
  <dt>deps-ubuntu</dt>
  <dd>Install system packages for all modules</dd>
  <dt>docker</dt>
  <dd>(Re-)build a docker image for all modules/executables.</dd>
  <dt>clean</dt>
  <dd>Remove the venv.</dd>
  <dt>show</dt>
  <dd>Print the venv directory, the module directories, and the executable names.</dd>
  <dt>help</dt>
  <dd>Print available targets and variables.</dd>
</dl>

Further targets:
<dl>
  <dt>[any module name]</dt>
  <dd>Download/update that module, but do not install anything.</dd>
  <dt>[any executable name]</dt>
  <dd>Install that CLI into the venv. (Depends on that module and on _ocrd_.)</dd>
</dl>

### Variables

<dl>
  <dt>PYTHON</dt>
  <dd>name of the Python binary to use (at least python3 required)</dd>
  <dt>VIRTUAL_ENV</dt>
  <dd>Directory prefix to use for local installation. (This is set automatically when activating a virtual environment on the shell. The build system will re-use existing venvs.)</dd>
  <dt>PIP_OPTIONS</dt>
  <dd>Extra options to pass to `pip install` (e.g. -q or -v)</dd>
</dl>

### Examples

The following examples assume a working development installation of Tesseract.
To build the latest Tesseract locally, run this command first:

    # Get code, build and install Tesseract with the default English model.
    make tesseract

Optionally install additional Tesseract models.

    # Download models from tessdata_fast into the venv's tessdata directory.
    make frk.traineddata
    make script/Latin.traineddata
    make script/Fraktur.traineddata

Running `make ocrd` or just `make` downloads/updates and installs the `core` module,
including the `ocrd` CLI in a virtual Python 3 environment under `./venv`.

Running `make ocrd-tesserocr-recognize` downloads/updates the `ocrd_tesserocr` module
and installs its CLIs, including `ocrd-tesserocr-recognize` in the venv.

Running `make modules` downloads/updates all modules.

Running `make all` additionally installs the executables from all modules.

## Issues

### No published/recent version on PyPI

The following Python modules need an installation from code for different reasons:

- clstm (needs modified code for Python3)
- cor-asv-ann (not available in PyPI)
- cor-asv-fst (not available in PyPI)
- dinglehopper (not available in PyPI)
- ocrd_cis (not available in PyPI; needs `ocrd>=2.0.0`)
- ocrd_tesserocr (too old in PyPI; needs `ocrd>=2.0.0`)
- tesserocr (too old in PyPI)

### Conflicting requirements

Merging all packages into one venv does not always work.
Modules may require mutually exclusive sets of dependent packages.

_pip does not stop or resolve conflicts – it merely warns._

- `Pillow`:
   * `==5.4.1` (required by ocrd_typegroups_classifier)
   * `>=6.2.0` (required by all others)
- Tensorflow:
   * `tensorflow-gpu==1.14.0` (required by ocrd_calamari and OCR-D-LAYoutERkennung)
   * `tensorflow` (which pulls in `>=2.0` which is incompatible; required by cor-asv-ann and ocrd_keraslm)
- OpenCV:
   * `opencv-python-headlesss` (required by core and others, avoids pulling in X11 libraries)
   * `opencv-python` (required by OCR-D-LAYoutERkennung and segmentation-runner)
   * custom build on ARM...

- ...

### System requirements

Not all modules advertise their system package requirements via `make deps-ubuntu`.

- clstm: depends on `scons libprotobuf-dev protobuf-compiler libpng-dev libeigen3-dev swig`
