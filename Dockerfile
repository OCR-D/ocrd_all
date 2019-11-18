# ocrd/all: fat container integrating (most) OCR-D modules
# pros:
# - single-point of update for docker installation
#   (just as ocrd_all is single-point of update for
#    repo/executable names and dependencies/idiosyncrasies)
# - flexibility in using unpublished changes from modules
#   in a consistent state (just as ocrd_all for local installation)
# - no need to prepare/synchronize module containers for
#   docker-compose / kubernetes
# cons:
# - needs submodules checked out at build time,
#   which implies a huge (1.5GB) build context
# - needs to pull in all possible dependencies,
#   which implies a huge (6.7GB) final image
# - danger of running into inconsistent dependencies
#   between modules (just as ocrd_all for local installation)

# use OCR-D base container (from ubuntu:18.04)
FROM ocrd/core

MAINTAINER OCR-D

ENV PREFIX=/usr/local
ENV VIRTUAL_ENV $PREFIX

# make apt run non-interactive during build
ENV DEBIAN_FRONTEND noninteractive

# make apt system functional
RUN apt-get update && \
    apt-get install -y apt-utils

# allow passing build-time parameter
# for list of modules to be installed
# (defaults to all except opencv-python)
ARG OCRD_MODULES="\
    format-converters \
    core \
    ocrd_im6convert \
    ocrd_olena \
    pixelwise_segmentation_SBB \
    segmentation-runner \
    OCR-D-LAYoutERkennung \
    ocrd_segment \
    ocrd_ocropy \
    ocrd_calamari \
    ocrd_cis \
    ocrd_tesserocr \
    clstm \
    ocrd_kraken \
    ocrd_typegroups_classifier \
    tesseract \
    tesserocr \
    ocrd_keraslm \
    cor-asv-ann \
    cor-asv-fst \
    dinglehopper \
    workflow-configuration"

# allow passing build-time parameter
# for list of tools to be installed
# (defaults to all, which also requires all modules to be present)
ARG OCRD_EXECUTABLES=all

WORKDIR /build

# copy (sub)module directories to build
# (ADD/COPY cannot copy a list of directories,
#  so we must rely on .dockerignore here)
COPY . .

ENV BUILDDEPS="build-essential automake autoconf libtool pkg-config git"

# start a shell script (so we can comment individual steps here)
RUN echo "set -x" > docker.sh
# get packages for build
RUN echo "apt-get -y install $BUILDDEPS make" >> docker.sh
# create git repo just so the (unconditional) submodule update recipes don't fail
RUN echo "git init" >> docker.sh
# we want to use PREFIX as venv
RUN echo "> $PREFIX/bin/activate" >> docker.sh
# try to fetch all modules system requirements
RUN echo "make -i deps-ubuntu" >> docker.sh
# instead of the PPA version:
RUN echo "make -j install-tesseract" >> docker.sh
# build/install all requested tools:
RUN echo "make ${OCRD_EXECUTABLES}" >> docker.sh
# remove build pkgs, but keep `make` for makefile-based workflow processing
RUN echo "apt-get -y remove $BUILDDEPS" >> docker.sh
# remove unneeded automatic deps and clear pkg cache
RUN echo "apt-get -y autoremove && apt-get clean" >> docker.sh
# post-install fixup: conflicting requirements
# - opencv-python instead of opencv-python-headless (which needs X11 libs)
#   (pulled by OCR-D-LAYoutERkennung and segmentation-runner)
# - tensorflow>=2.0, tensorflow_gpu in another version
# - pillow==5.4.1 instead of >=6.2
RUN echo "pip install --force-reinstall \
          opencv-python-headless \
          pillow>=6.2.0 \
          \$(pip list | grep tensorflow-gpu | sed -E 's/-gpu +/==/')" >> docker.sh
# remove source directories from image
RUN echo "rm -fr /build" >> docker.sh
# run the script in one layer/step (to minimise image size)
RUN bash docker.sh

ENV DEBIAN_FRONTEND teletype

WORKDIR /data
VOLUME /data

# no fixed entrypoint
CMD /bin/bash

# further data files (like OCR models) could be installed
# in a multi-staged build using FROM ocrd/all...
