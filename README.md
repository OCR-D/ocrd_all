# OCR-D/ocrd_all

[![Built on CircleCI](https://circleci.com/gh/OCR-D/ocrd_all.svg?style=svg)](https://circleci.com/gh/OCR-D/ocrd_all)
[![MIT licensed](https://img.shields.io/github/license/OCR-D/ocrd_all)](https://github.com/OCR-D/ocrd_all/blob/master/LICENSE)
[![](https://images.microbadger.com/badges/image/ocrd/all:maximum.svg)](https://hub.docker.com/r/ocrd/all)

This controls installation of all OCR-D modules from source (as git submodules).

It includes a Makefile for their installation into a virtual environment (venv) or Docker container.

(A venv is a local user directory with shell scripts to load/unload itself
in the current shell environment via PATH and PYTHONHOME.)

* [Preconditions](#preconditions)
    * [Space](#space)
    * [Locale](#locale)
    * [System packages](#system-packages)
 * [Usage](#usage)
    * [Targets](#targets)
       * [<em>deps-ubuntu</em>](#deps-ubuntu)
       * [<em>modules</em>](#modules)
       * [<em>ocrd</em>](#ocrd)
       * [<em>all</em>](#all)
       * [<em>fix-pip</em>](#fix-pip)
       * [<em>docker</em>](#docker)
       * [<em>clean</em>](#clean)
       * [<em>show</em>](#show)
       * [<em>help</em> (default goal)](#help-default-goal)
       * [<em>[any module name]</em>](#any-module-name)
       * [<em>[any executable name]</em>](#any-executable-name)
    * [Variables](#variables)
       * [<em>OCRD_MODULES</em>](#ocrd_modules)
       * [<em>PYTHON</em>](#python)
       * [<em>VIRTUAL_ENV</em>](#virtual_env)
       * [<em>TMPDIR</em>](#tmpdir)
       * [<em>PIP_OPTIONS</em>](#pip_options)
       * [<em>GIT_RECURSIVE</em>](#git_recursive)
       * [<em>TESSERACT_MODELS</em>](#tesseract_models)
    * [Examples](#examples)
    * [Results](#results)
    * [Persistent configuration](#persistent-configuration)
    * [Docker Hub](#docker-hub)
 * [Challenges](#challenges)
    * [No published/recent version on PyPI](#no-publishedrecent-version-on-pypi)
    * [Conflicting requirements](#conflicting-requirements)
    * [System requirements](#system-requirements)

## Preconditions

### Space

Make sure that there is enough free disk space. 7 GiB or more is recommended for
the required submodules, build data, temporary data, installed virtual environment
and pip cache.

If the `/tmp` directory has less than 5 GiB of free space, you can override the location
of temporary files by setting the `TMPDIR` variable when calling make:

```sh
TMPDIR=/path/to/my/tempdir make all
```

### Locale

Next, the (shell) environment must have a Unicode-based localization. (Otherwise Python code based on `click` will not work, i.e. most OCR-D CLIs.) This is true for most installations today, and can be verified by:

    locale | fgrep .UTF-8

This should show several `LC_*` variables. Otherwise, either select another localization globally...

    sudo dpkg-reconfigure locales

... or use the Unicode-based POSIX locale temporarily:

    export LC_ALL=C.UTF-8
    export LANG=C.UTF-8

### System packages

Install GNU make and git, and wget if you want to download Tesseract models.

    # on Debian / Ubuntu:
    sudo apt install make git wget

Install the packages for Python3 development and for Python3 virtual environments
for your operating system / distribution.

    # on Debian / Ubuntu:
    sudo apt install python3-dev python3-venv

Some modules use the Tesseract library. If your distribution provides Tesseract 4.1
or newer, install the development package:

    # on Debian / Ubuntu:
    sudo apt install libtesseract-dev

Ubuntu packages for Tesseract 5.0.0 (alpha) are available at the PPA
https://launchpad.net/~alex-p/+archive/ubuntu/tesseract-ocr-devel.

Otherwise or for the latest Tesseract code it can also be built locally.

Other modules will have additional system dependencies.

System dependencies **for all modules** on Ubuntu 18.04 (or similar) can also be installed **automatically** by running:

    # on Debian / Ubuntu:
    sudo apt install make git
    sudo make deps-ubuntu

(And you can define the scope of _all modules_ by setting the `OCRD_MODULES` [variable](#Variables).)

## Usage

Run `make` with optional parameters for _variables_ and _targets_ like so:

    make [PYTHON=python3] [VIRTUAL_ENV=./venv] [OCRD_MODULES="..."] [TARGET...]

### Targets

#### _deps-ubuntu_

Install system packages for all modules. (Depends on [_modules_](#modules).)

#### _modules_

Download/update all modules, but do not install anything.

#### _ocrd_

Install only OCR-D/core and its CLI `ocrd` into the venv.

#### _all_

Install executables from all modules into the venv. (Depends on [_modules_](#modules) and [_ocrd_](#ocrd).)

#### _fix-pip_

Fix incompatible/inconsistent pip requirements between all modules

#### _docker_

(Re-)build a docker image for all modules/executables. (Depends on [_modules_](#modules).)

#### _clean_

Remove the venv and the modules' build directories.

#### _show_

Print the venv directory, the module directories, and the executable names.

#### _help_ (default goal)

Print available targets and variables.

---

Further targets:
#### _[any module name]_

Download/update that module, but do not install anything.

#### _[any executable name]_

Install that CLI into the venv. (Depends on that module and on [_ocrd_](#ocrd).)

### Variables

#### _OCRD_MODULES_

Override the list of git submodules to include. Targets affected by this include:
- [deps-ubuntu](#deps-ubuntu) (reducing the list of system packages to install)
- [modules](#modules) (reducing the list of modules to checkout/update)
- [all](#all) (reducing the list of executables to install)
- [docker](#docker) (reducing the list of executables and modules to install)
- [show](#show) (reducing the list of `OCRD_MODULES` and of `OCRD_EXECUTABLES` to print)

#### _PYTHON_

Name of the Python binary to use (at least python3 required).

#### _VIRTUAL_ENV_

Directory prefix to use for local installation. 

(This is set automatically when activating a virtual environment on the shell. The build system will re-use the venv if one already exists here, or create one.)

#### _TMPDIR_

Override the default path (`/tmp` on Unix) where temporary files during build are stored.

#### _PIP_OPTIONS_

Add extra options to the `pip install` command like `-q` or `-v` or `-e`.

(The latter will install Python modules in _editable mode_, i.e. any update to the source will directly affect the executables.)

#### _GIT_RECURSIVE_

Set to `--recursive` to checkout/update all modules recursively. (This usually installs additional tests and models.)

#### _TESSERACT_MODELS_

Add more models to the minimum required list of languages (`eng equ osd`) to install along with Tesseract.

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

Optionally install Tesseract training tools.

    make install-tesseract-training

Running `make ocrd` or just `make` downloads/updates and installs the `core` module,
including the `ocrd` CLI in a virtual Python 3 environment under `./venv`.

Running `make ocrd-tesserocr-recognize` downloads/updates the `ocrd_tesserocr` module
and installs its CLIs, including `ocrd-tesserocr-recognize` in the venv.

Running `make modules` downloads/updates all modules.

Running `make all` additionally installs the executables from all modules.

Running `make all OCRD_MODULES="core tesseract ocrd_tesserocr ocrd_cis"` installs only the executables from these modules.

### Results

To use the built executables, simply activate the virtual environment:

    . ${VIRTUAL_ENV:-venv}/bin/activate
    ocrd --help
    ocrd-...

For the Docker image, run it with your data path mounted as a user:

    docker run -it -u $(id -u):$(id -g) $PWD:/data ocrd/all
    ocrd --help
    ocrd-...

### Persistent configuration

In order to make choices permanent, you can put your variable preferences
(or any custom rules) into `local.mk`. This file is always included if it exists.
So you don't have to type (and memorise) them on the command line or shell environment.

For example, its content could be:
```make
# restrict everything to a subset of modules
OCRD_MODULES = core ocrd_im6convert ocrd_cis ocrd_tesserocr tesserocr tesseract

# use a non-default path for the virtual environment
VIRTUAL_ENV = $(CURDIR)/.venv

# install in editable mode (i.e. referencing the git sources)
PIP_OPTIONS = -e

# use non-default temporary storage
TMPDIR = $(CURDIR)/.tmp

# install more languages/models for Tesseract
TESSERACT_MODELS = deu frk script/Fraktur script/Latin

# install all of Tesseract's submodules to support unit tests and training tools, too
tesseract: GIT_RECURSIVE = --recursive
```

Note: When `local.mk` exists, variables can still be overridden on the command line,
(i.e. `make all OCRD_MODULES=` will build all executables for all modules again),
but not from the shell environment
(i.e. `OCRD_MODULES= make all` will still use the value from local.mk).

### Docker Hub

The project is available as prebuilt Docker images from [Docker Hub as
`ocrd/all`](https://hub.docker.com/r/ocrd/all). You can choose from three tags,
`minimum`, `medium` and `maximum`. These differ in which modules are included,
with `maximum` being the equivalent of doing `make all` with the default (unset) value for `OCRD_MODULES`. To download the images
on the command line:

```sh
docker pull ocrd/all:minimum
# or
docker pull ocrd/all:medium
# or
docker pull ocrd/all:maximum
```

Usage is the same [as if you had built the image yourself](#results).

This table lists which tag contains which module:

| Module                      | `minimum` | `medium` | `maximum` |
| -----                       | ----      | ----     | ----      |
| core                        | ☑         | ☑        | ☑         |
| ocrd_cis                    | ☑         | ☑        | ☑         |
| ocrd_im6convert             | ☑         | ☑        | ☑         |
| ocrd_repair_inconsistencies | ☑         | ☑        | ☑         |
| ocrd_tesserocr              | ☑         | ☑        | ☑         |
| ocrd_wrap                   | ☑         | ☑        | ☑         |
| tesserocr                   | ☑         | ☑        | ☑         |
| workflow-configuration      | ☑         | ☑        | ☑         |
| cor-asv-ann                 | -         | ☑        | ☑         |
| dinglehopper                | -         | ☑        | ☑         |
| format-converters           | -         | ☑        | ☑         |
| ocrd_calamari               | -         | ☑        | ☑         |
| ocrd_keraslm                | -         | ☑        | ☑         |
| ocrd_olena                  | -         | ☑        | ☑         |
| ocrd_segment                | -         | ☑        | ☑         |
| tesseract                   | -         | ☑        | ☑         |
| ocrd_anybaseocr             | -         | -        | ☑         |
| ocrd_pc_segmentation        | -         | -        | ☑         |
| ocrd_typegroups_classifier  | -         | -        | ☑         |
| sbb_textline_detector       | -         | -        | ☑         |
| cor-asv-fst                 | -         | -        | -         |
| clstm                       | -         | -        | -         |
| ocrd_kraken                 | -         | -        | -         |
| ocrd_ocropy                 | -         | -        | -         |

**Note**: The following modules have been disabled by default and can only be
enabled by explicitly setting `OCRD_MODULES` or `DISABLED_MODULES`:

* cor-asv-fst (runtime issues)
* ocrd_ocropy (better implementation in ocrd_cis available)
* ocrd_kraken (currently unmaintained)
* clstm (required only for ocrd_kraken)


## Challenges

This repo offers solutions to the following problems with OCR-D integration.

### No published/recent version on PyPI

The following Python modules need an installation from code for different reasons:

- clstm (needs modified code for Python3)
- cor-asv-ann (not available in PyPI)
- cor-asv-fst (not available in PyPI)
- dinglehopper (not available in PyPI)
- tesserocr (too old in PyPI)

_(Solved by installation from source.)_

### Conflicting requirements

Merging all packages into one venv does not always work.
Modules may require mutually exclusive sets of dependent packages.

`pip` does not even stop or resolve conflicts – it merely warns!

- Tensorflow:
   * `tensorflow-gpu==1.14.0` (required by ocrd_calamari and ocrd_anybaseocr)
   * `tensorflow` (required by cor-asv-ann and ocrd_keraslm)
   
   Both can be installed in parallel in different versions, but may depend on a mutually exclusive set of `tensorboard` and `tensorflow_estimator`.
   
   Moreover, in the future, some modules (but not others) may depend on `tensorflow>=2.0`, which again is incompatible.
- OpenCV:
   * `opencv-python-headlesss` (required by core and others, avoids pulling in X11 libraries)
   * `opencv-python` (required by ocrd_anybaseocr)
   * custom build on ARM...

- ...

_(Solved temporarily by post-installation `fix-pip`.)_

### System requirements

Not all modules advertise their system package requirements via `make deps-ubuntu`.

- `clstm`: depends on `scons libprotobuf-dev protobuf-compiler libpng-dev libeigen3-dev swig`
- `tesseract` (when installing from source not PPA): depends on `libleptonica-dev` etc

_(Solved by maintaining these requirements under `deps-ubuntu` here.)_
