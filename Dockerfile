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

ARG VCS_REF
ARG BUILD_DATE
LABEL \
    maintainer="https://ocr-d.de/kontakt" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/OCR-D/ocrd_all" \
    org.label-schema.build-date=$BUILD_DATE


ENV PREFIX=/usr/local
ENV VIRTUAL_ENV $PREFIX

# make apt run non-interactive during build
ENV DEBIAN_FRONTEND noninteractive

# make apt system functional
RUN apt-get -y update \
 && apt-get install -y apt-utils

# allow passing build-time parameter for list of tools to be installed
# (defaults to medium, which also requires those modules to be present)
ARG OCRD_MODULES="core dinglehopper format-converters ocrd_calamari ocrd_cis ocrd_im6convert ocrd_keraslm ocrd_olena ocrd_segment ocrd_tesserocr tesseract tesserocr cor-asv-ann workflow-configuration"
# persist that variable for build-time make to pick it up and run-time users to know what to expect
ENV OCRD_MODULES="${OCRD_MODULES}"

# allow passing build-time parameter for pip install options
# (defaults to no extra options)
ARG PIP_OPTIONS=""

WORKDIR /build

# copy (sub)module directories to build
# (ADD/COPY cannot copy a list of directories,
#  so we must rely on .dockerignore here)
COPY . .

# increase default network timeouts (so builds don't fail because of small bandwidth)
ENV PIP_OPTIONS="--timeout=3000 ${PIP_OPTIONS}"
RUN echo "Acquire::http::Timeout \"3000\";" >> /etc/apt/apt.conf.d/99network
RUN echo "Acquire::https::Timeout \"3000\";" >> /etc/apt/apt.conf.d/99network
RUN echo "Acquire::ftp::Timeout \"3000\";" >> /etc/apt/apt.conf.d/99network

# start a shell script (so we can comment individual steps here)
RUN echo "set -ex" > docker.sh
# get packages for build
RUN echo "apt-get -y install automake autoconf libtool pkg-config g++" >> docker.sh
# we want to use PREFIX as venv
RUN echo "> $PREFIX/bin/activate" >> docker.sh
# try to fetch all modules system requirements
RUN echo "make deps-ubuntu" >> docker.sh
# build/install all tools of the requested modules:
RUN echo "make all" >> docker.sh
# remove unneeded automatic deps and clear pkg cache
RUN echo "apt-get -y autoremove && apt-get clean" >> docker.sh
# remove source directories from image, unless using editable mode
# (in the latter case, the git repos are also the installation targets
#  and must be kept; so merely clean-up some temporary files)
RUN echo "if [[ '${PIP_OPTIONS}' =~ -e|--editable ]]; then make -i clean; else rm -fr /build; fi" >> docker.sh
# run the script in one layer/step (to minimise image size)
# (and export all variables)
RUN set -a; bash docker.sh
# update ld.so cache for new libs in /usr/local
RUN ldconfig

# remove (dated) security workaround preventing use of
# ImageMagick's convert on PDF/PS/EPS/XPS:
RUN sed -i 's/rights="none"/rights="read|write"/g' /etc/ImageMagick-6/policy.xml || true
# prevent cache resources exhausted errors
RUN sed -i 's/name="disk" value="1GiB"/name="disk" value="8GiB"/g' /etc/ImageMagick-6/policy.xml || true

# reset to interactive
ENV DEBIAN_FRONTEND teletype

WORKDIR /data
VOLUME /data

# no fixed entrypoint
CMD /bin/bash

# further data files (like OCR models) could be installed
# in a multi-staged build using FROM ocrd/all...
