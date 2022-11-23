# OCR-D/ocrd_all

[![Built on CircleCI](https://circleci.com/gh/OCR-D/ocrd_all.svg?style=svg)](https://circleci.com/gh/OCR-D/ocrd_all)
[![MIT licensed](https://img.shields.io/github/license/OCR-D/ocrd_all)](https://github.com/OCR-D/ocrd_all/blob/master/LICENSE)
[![](https://images.microbadger.com/badges/image/ocrd/all:maximum.svg)](https://hub.docker.com/r/ocrd/all)

This controls installation of all OCR-D modules from source (as git submodules).

It includes a Makefile for their installation into a virtual environment (venv) or Docker container.

(A venv is a local user directory with shell scripts to load/unload itself
in the current shell environment via PATH and PYTHONHOME.)

(NOTE: If you are going to install ocrd_all, you may want to first reference the [OCR-D setup guide](https://ocr-d.de/en/setup) at the OCR-D website. If you are a non-IT user, it is especially recommended you utilize the guide.)

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
       * [<em>TESSERACT_CONFIG</em>](#tesseract_config)
    * [Examples](#examples)
    * [Results](#results)
    * [Persistent configuration](#persistent-configuration)
    * [Docker Hub](#docker-hub)
 * [Challenges](#challenges)
    * [No published/recent version on PyPI](#no-publishedrecent-version-on-pypi)
    * [Conflicting requirements](#conflicting-requirements)
    * [System requirements](#system-requirements)
  * [Contributing](#contributing)

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

Install GNU make, git and GNU parallel.

    # on Debian / Ubuntu:
    sudo apt install make git parallel

Install wget or curl if you want to download Tesseract models.

    # on Debian / Ubuntu:
    sudo apt install wget

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
    sudo apt install make
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

#### _all_

Install executables from all modules into the venv. (Depends on [_modules_](#modules) and [_ocrd_](#ocrd).)

#### _ocrd_

Install only OCR-D/core and its CLI `ocrd` into the venv.

#### _docker_

(Re-)build a docker image for all modules/executables. (Depends on [_modules_](#modules).)

#### _clean_

Remove the venv and the modules' build directories.

#### _show_

Print the venv directory, the module directories, and the executable names.

#### _check_

Verify that all executables are runnable and the venv is consistent.

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

Note: this only affects `make install-tesseract` (or `all`), but is independent of the `install-models` step. 
(The latter delegates to `ocrd resmgr download`, which fetches all registered resources.)

#### _TESSERACT_CONFIG_

Set `configure` options for building Tesseract from source (`--disable-openmp --disable-shared CXXFLAGS="-g -O2 -fPIC"`).

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

    docker run -it -u $(id -u):$(id -g) -v $PWD:/data ocrd/all
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

In addition to these base variants, there are `minimum-cuda`, `medium-cuda` and `maximum-cuda` with GPU support. (Also needs [nvidia-docker](https://github.com/NVIDIA/nvidia-docker), which adds the `docker --gpus` option.)

Usage is the same [as if you had built the image yourself](#results).

This table lists which tag contains which module:
| Module                      | `minimum` | `medium` | `maximum` |
| -----                       | ----      | ----     | ----      |
| core                        | ☑         | ☑        | ☑         |
| ocrd_cis                    | ☑         | ☑        | ☑         |
| ocrd_fileformat             | ☑         | ☑        | ☑         |
| ocrd_olahd_client           | ☑         | ☑        | ☑         |
| ocrd_im6convert             | ☑         | ☑        | ☑         |
| ocrd_pagetopdf              | ☑         | ☑        | ☑         |
| ocrd_repair_inconsistencies | ☑         | ☑        | ☑         |
| ocrd_tesserocr              | ☑         | ☑        | ☑         |
| ocrd_wrap                   | ☑         | ☑        | ☑         |
| tesserocr                   | ☑         | ☑        | ☑         |
| workflow-configuration      | ☑         | ☑        | ☑         |
| cor-asv-ann                 | -         | ☑        | ☑         |
| dinglehopper                | -         | ☑        | ☑         |
| docstruct                   | -         | ☑        | ☑         |
| format-converters           | -         | ☑        | ☑         |
| nmalign                     | -         | ☑        | ☑         |
| ocrd_calamari               | -         | ☑        | ☑         |
| ocrd_keraslm                | -         | ☑        | ☑         |
| ocrd_neat                   | -         | ☑        | ☑         |
| ocrd_olena                  | -         | ☑        | ☑         |
| ocrd_segment                | -         | ☑        | ☑         |
| tesseract                   | -         | ☑        | ☑         |
| ocrd_anybaseocr             | -         | -        | ☑         |
| ocrd_detectron2             | -         | -        | ☑         |
| ocrd_doxa                   | -         | -        | ☑         |
| ocrd_kraken                 | -         | -        | ☑         |
| ocrd_typegroups_classifier  | -         | -        | ☑         |
| sbb_binarization            | -         | -        | ☑         |
| cor-asv-fst                 | -         | -        | -         |
| ocrd_ocropy                 | -         | -        | -         |
| ocrd_pc_segmentation        | -         | -        | -         |

**Note**: The following modules have been disabled by default and can only be
enabled by explicitly setting `OCRD_MODULES` or `DISABLED_MODULES`:

* cor-asv-fst (runtime issues)
* ocrd_ocropy (better implementation in ocrd_cis available)

### Uninstall

If you have installed ocrd_all natively and wish to uninstall, first `deactivate` the virtual environment  and remove the `ocrd_all` directory:
```
rm -rf ocrd_all
```

Next, remove all contents under ~/.parallel/semaphores:
```
rm -rf ~/.parallel/semaphores
```

## Challenges

This repo offers solutions to the following problems with OCR-D integration.

### No published/recent version on PyPI

The following Python modules need an installation from code for different reasons:

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
   * version 2 (required by ocrd_calamari, ocrd_anybaseocr and ocrd_pc_segmentation)
   * version 1 (required by cor-asv-ann and ocrd_keraslm)
   
   The temporary solution is to require different package names:
   - `tensorflow>=2`
   - `tensorflow-gpu==1.15.*`
   
   Both cannot be installed in parallel in different versions, and usually also depend on different versions of CUDA toolkit.)
   
- OpenCV:
   * `opencv-python-headless` (required by core and others, avoids pulling in X11 libraries)
   * `opencv-python` (probably dragged in by third party packages)
   
   As long as we keep reinstalling the headless variant and no such package attempts GUI, we should be fine. 
   Custom build (as needed for ARM) under the _module_ `opencv-python` already creates the headless variant.

- PyTorch:
   * `torch<1.0`
   * `torch>=1.0`
   
- ...

_(Solved by managing and delegating to different subsets of venvs.)_

### System requirements

Not all modules advertise their system package requirements via `make deps-ubuntu`.

- `tesseract` (when installing from source not PPA): depends on `libleptonica-dev` etc

_(Solved by maintaining these requirements under `deps-ubuntu` here.)_

## Contributing

Please see our [contributing
guide](https://github.com/OCR-D/ocrd_all/blob/master/.github/contributing.md)
to learn how you can support the project.

## Acknowledgments

This software uses GNU parallel.
GNU Parallel is a general parallelizer to run multiple serial command line
programs in parallel without changing them.

### Reference

Tange, Ole. (2020). _GNU Parallel 20200722 ('Privacy Shield')_. Zenodo. https://doi.org/10.5281/zenodo.3956817
