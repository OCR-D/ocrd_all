# OCR-D/ocrd_all

[![Built on CircleCI](https://circleci.com/gh/OCR-D/ocrd_all.svg?style=svg)](https://circleci.com/gh/OCR-D/ocrd_all)
[![MIT licensed](https://img.shields.io/github/license/OCR-D/ocrd_all)](https://github.com/OCR-D/ocrd_all/blob/master/LICENSE)
[![](https://images.microbadger.com/badges/image/ocrd/all:maximum.svg)](https://hub.docker.com/r/ocrd/all)

This controls installation of all OCR-D modules from source (as git submodules).

It includes a Makefile for their installation into a virtual environment (venv) or Docker container.

(A [venv](https://packaging.python.org/tutorials/installing-packages/#creating-virtual-environments)
is a local user directory with shell scripts to load/unload itself
in the current shell environment via PATH and PYTHONHOME.)

> **Note**: If you are going to install ocrd_all, you may want to first consult
the [OCR-D setup guide](https://ocr-d.de/en/setup) on the [OCR-D website](https://ocr-d.de).
If you are a non-IT user, it is especially recommended you utilize the guide.

* [Prerequisites](#prerequisites)
    * [Space](#space)
    * [Locale](#locale)
    * [System packages](#system-packages)
    * [GPU support](#gpu-support)
 * [Usage](#usage)
    * [Targets](#targets)
       * [<em>deps-ubuntu</em>](#deps-ubuntu)
       * [<em>deps-cuda</em>](#deps-cuda)
       * [<em>modules</em>](#modules)
       * [<em>ocrd</em>](#ocrd)
       * [<em>all</em>](#all)
       * [<em>docker</em>](#docker)
       * [<em>dockers</em>](#dockers)
       * [<em>clean</em>](#clean)
       * [<em>show</em>](#show)
       * [<em>help</em> (default goal)](#help-default-goal)
       * [<em>[any module name]</em>](#any-module-name)
       * [<em>[any executable name]</em>](#any-executable-name)
    * [Variables](#variables)
       * [<em>OCRD_MODULES</em>](#ocrd_modules)
       * [<em>NO_UPDATE</em>](#no_update)
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

## Prerequisites

### Space

Make sure that there is enough free disk space. For a **full installation** including executables from all modules,
around **22 GiB** will be needed (mostly on the same filesystem as the ocrd_all checkout). The same goes for the
[`maximum-cuda`](#docker-hub) variant of the prebuilt Docker images (due on the filesystem harboring Docker, typically
`/var/lib/docker`).

Also, during build, an additional 5 GiB may be needed for temporary files, typically in the `/tmp` directory.
To use a different location path with more free space, set the `TMPDIR` variable when calling `make`:

    TMPDIR=/path/to/my/tempdir make all


### Locale

The (shell) environment must have a Unicode-based localization.
(Otherwise Python code based on `click` will not work, i.e. most OCR-D CLIs.)
This is true for most installations today, and can be verified by:

    locale | fgrep .UTF-8

This should show several `LC_*` variables. Otherwise, either select another localization globally...

    sudo dpkg-reconfigure locales

... or use the Unicode-based POSIX locale temporarily:

    export LC_ALL=C.UTF-8
    export LANG=C.UTF-8

### System packages

* Install git, GNU make and GNU parallel.

        # on Debian / Ubuntu:
        sudo apt install make git parallel

* Install wget or curl if you want to download Tesseract models.

        # on Debian / Ubuntu:
        sudo apt install wget

* Install the packages for Python3 development and Python3 virtual environments
for your operating system / distribution.

        # on Debian / Ubuntu:
        sudo apt install python3-dev python3-venv

* Some modules require [Tesseract](https://github.com/tesseract-ocr/tesseract).
If your operating system / distribution already provides Tesseract 4.1
or newer, then just install its development package:

        # on Debian / Ubuntu:
        sudo apt install libtesseract-dev

   Otherwise, recent Tesseract packages for Ubuntu are available via PPA
   [alex-p](https://launchpad.net/~alex-p/+archive/ubuntu/tesseract-ocr-devel).

   Alternatively, the latest version of Tesseract can also be built as a module locally.

* Other modules will have additional system dependencies.

> **Note**: System dependencies **for all modules** on Ubuntu 20.04 (or similar)
can also be installed **automatically** by running:

        # on Debian / Ubuntu:
	make modules
        sudo apt install make
        sudo make deps-ubuntu

> (And you can define the scope of _all modules_ by setting the `OCRD_MODULES`
[variable](#Variables) as described below. If unsure, consider doing a dry-run
first, by using `make -n`.)

### GPU support

Many executables can utilize Nvidia GPU for much faster computation, _if available_ (i.e. optionally).

For that, as a further prerequisite you need an installation of
[CUDA Toolkit](https://developer.nvidia.com/cuda-downloads) and additional optimised
libraries like [cuDNN](https://developer.nvidia.com/cudnn) for your system.

The CUDA version currently supported is 11.8 (but other's may work as well).

> **Note**: CUDA toolkit and libraries (in a  development version with CUDA compiler)
can also be installed **automatically** by running:

        make ocrd
        sudo make deps-cuda

> This will deploy [Micromamba](https://mamba.readthedocs.io/en/latest/index.html)
non-intrusively (without system packages or Conda environments), but also share some
of the CUDA libraries installed as Python packages system-wide via ld.so.conf rules.
If unsure, consider doing a dry-run first, by using `make -n`.)

## Usage

Run `make` with optional parameters for __variables__ and __targets__ like so:

    make [PYTHON=python3] [VIRTUAL_ENV=./venv] [OCRD_MODULES="..."] [TARGET...]

### Targets

#### _deps-ubuntu_

Install system packages for all modules. (Depends on [_modules_](#modules).)

See [system package prerequisites](#system-packages) above.

#### _deps-cuda_

Install CUDA toolkit and libraries. (Depends on [_ocrd_](#ocrd).)

See (optional) [GPU support prerequisites](#gpu-support) above.

#### _modules_

Checkout/update all modules, but do not install anything.

#### _all_

Install executables from all modules into the venv. (Depends on [_modules_](#modules) and [_ocrd_](#ocrd).)

#### _ocrd_

Install only the `core` module and its CLI `ocrd` into the venv.

#### _docker_

(Re-)build a Docker image for all modules/executables. (Depends on [_modules_](#modules).)

#### _dockers_

(Re-)build Docker images for some pre-selected subsets of modules/executables. (Depends on [_modules_](#modules).)

(These are the very same variants published as [prebuilt images on Docker Hub](#docker-hub).)

#### _clean_

Remove the venv and the modules' build directories.

#### _show_

Print the venv directory, the module directories, and the executable names – as configured by the current variables.

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

#### _NO_UPDATE_

If set to `1`, then when installing executables, does not attempt to `git submodule update`
any currently checked out modules. (Useful for development when testing different module version
prior to a commit.)

#### _PYTHON_

Name of the Python binary to use (at least python3 required).

#### _VIRTUAL_ENV_

Directory prefix to use for local installation. 

(This is set automatically when activating a virtual environment on the shell.
The build system will re-use the venv if one already exists here, or create one otherwise.)

#### _TMPDIR_

Override the default path (`/tmp` on Unix) where temporary files during build are stored.

#### _PIP_OPTIONS_

Add extra options to the `pip install` command like `-q` or `-v` or `-e`.

> **Note**: The latter option will install Python modules in __editable mode__,
i.e. any update to the source would directly affect the executables.

#### _GIT_RECURSIVE_

Set to `--recursive` to checkout/update all modules recursively. (This usually installs additional tests and models.)

#### _TESSERACT_MODELS_

Add more models to the minimum required list of languages (`eng equ osd`) to install along with Tesseract.

Note: this only affects `make install-tesseract` (or `all`), but is independent of the `install-models` step. 
(The latter delegates to `ocrd resmgr download`, which fetches all registered resources.)

#### _TESSERACT_CONFIG_

Set `configure` options for building Tesseract from source (`--disable-openmp --disable-shared CXXFLAGS="-g -O2 -fPIC"`).

### Examples

To build the latest Tesseract locally, run this command first:

    # Get code, build and install Tesseract with the default English model.
    make install-tesseract

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

# avoid automatic submodule updates
NO_UPDATE = 1
```

Note: When `local.mk` exists, variables can still be overridden on the command line,
(i.e. `make all OCRD_MODULES=` will build all executables for all modules again),
but not from the shell environment
(i.e. `OCRD_MODULES= make all` will still use the value from local.mk).

### Docker Hub

Besides native installation, `ocrd_all` is also available as prebuilt Docker images
from [Docker Hub as `ocrd/all`](https://hub.docker.com/r/ocrd/all). You can choose from three tags,
`minimum`, `medium` and `maximum`. These differ w.r.t. which modules are included,
with `maximum` being the equivalent of doing `make all` with the default (unset) value for `OCRD_MODULES`.

To download the images on the command line:

    docker pull ocrd/all:minimum
    # or
    docker pull ocrd/all:medium
    # or
    docker pull ocrd/all:maximum

In addition to these base variants, there are `minimum-cuda`, `medium-cuda` and `maximum-cuda` with GPU support.
(These also need [nvidia-docker](https://github.com/NVIDIA/nvidia-docker) runtime, which will add the
`docker --gpus` option.)

These tags will be overwritten with every new release of ocrd_all. However, the `maximum` variant of each release
will also be aliased to a permanent tag by ISO date, e.g. `2023-04-02`.

Usage of the prebuilt Docker image is the same [as if you had built the image yourself](#results).

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

* `cor-asv-fst` (runtime issues)
* `ocrd_ocropy` (better implementation in ocrd_cis available)
* `ocrd_pc_segmentation` (dependency and quality issues)

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
