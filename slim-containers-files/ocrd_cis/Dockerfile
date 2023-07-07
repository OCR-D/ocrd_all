FROM ocrd/core:latest AS base
WORKDIR /build-ocrd
# Remove the next RUN, this is only to checkout my branch while the changes are not in core yet
RUN git clone https://github.com/ocr-d/core.git && \
	cd core && \
	git checkout network-for-slim-prep && \
	make install

# Not based on ocrd_cis "original" Dockerfile. That seems out of date and in ocrd_all ocrd_cis is
# simply installed with pip so I do the same here
COPY ocrd_cis/ ./ocrd_cis/
COPY setup.py README.md LICENSE ocrd-tool.json Manifest.in ./
RUN pip install . && rm -rf /build-ocrd
# TODO: install models for ocrd-cis
WORKDIR /data
