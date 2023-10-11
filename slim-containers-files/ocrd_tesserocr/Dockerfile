FROM ocrd/core:latest AS base
WORKDIR /build-ocrd-core
# Remove the next RUN, this is only to checkout my branch while the changes are not in core yet
RUN git clone https://github.com/ocr-d/core.git && \
	cd core && \
	git checkout network-for-slim-prep && \
	make install

# copied from https://github.com/OCR-D/ocrd_tesserocr/blob/master/Dockerfile and modified
ARG VCS_REF
ARG BUILD_DATE
LABEL \
    maintainer="https://ocr-d.de/kontakt" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/OCR-D/ocrd_tesserocr" \
    org.label-schema.build-date=$BUILD_DATE

ENV DEBIAN_FRONTEND noninteractive
ENV PYTHONIOENCODING utf8

# avoid HOME/.local/share (hard to predict USER here)
# so let XDG_DATA_HOME coincide with fixed system location
# (can still be overridden by derived stages)
ENV XDG_DATA_HOME /usr/local/share

WORKDIR /build-ocrd
COPY setup.py .
COPY ocrd_tesserocr/ocrd-tool.json .
COPY README.md .
COPY requirements.txt .
COPY requirements_test.txt .
COPY ocrd_tesserocr ./ocrd_tesserocr
COPY Makefile .
RUN make deps-ubuntu && \
    apt-get install -y --no-install-recommends \
    g++ \
    && make deps install \
    && rm -rf /build-ocrd \
    && apt-get -y remove --auto-remove g++ libtesseract-dev make
RUN ocrd resmgr download ocrd-tesserocr-recognize Fraktur.traineddata
RUN ocrd resmgr download ocrd-tesserocr-recognize deu.traineddata

WORKDIR /data
VOLUME /data
