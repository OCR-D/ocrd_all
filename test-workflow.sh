#!/usr/bin/env bash
set -e

ocrd resmgr download ocrd-sbb-binarize default-2021-03-09
ocrd-sbb-binarize -I OCR-D-IMG -O OCR-D-BIN -P model default-2021-03-09

ocrd resmgr download ocrd-detectron2-segment Jambo-sudo_X101.pth
ocrd resmgr download ocrd-detectron2-segment Jambo-sudo_X101.yaml
ocrd-detectron2-segment -p $(python -c "import ocrd_detectron2; print(ocrd_detectron2.__path__[0])")/presets_Jambo-sudo_X101.json -I OCR-D-BIN -O OCR-D-SEG -P device ${CUDA_DEVICE:-cpu}

ocrd-typegroups-classifier -I OCR-D-IMG -O FONT

ocrd resmgr download ocrd-eynollah-segment default
ocrd-eynollah-segment -P models default -I OCR-D-IMG -O OCR-D-SEG2

ocrd resmgr download ocrd-calamari-recognize qurator-gt4histocr-1.0
ocrd-calamari-recognize -I OCR-D-SEG2 -O OCR-D-OCR -P checkpoint_dir qurator-gt4histocr-1.0 -P textequiv_level glyph

ocrd resmgr download ocrd-kraken-segment blla.mlmodel
ocrd-kraken-segment -I OCR-D-BIN -O OCR-D-SEG3 -P device ${CUDA_DEVICE:-cpu}
ocrd-cis-ocropy-resegment -I OCR-D-SEG3 -O OCR-D-SEG3X -P method baseline

ocrd resmgr download ocrd-kraken-recognize reichsanzeiger.mlmodel
ocrd-kraken-recognize -I OCR-D-SEG3X -O OCR-D-OCR2 -P model reichsanzeiger.mlmodel -P device ${CUDA_DEVICE:-cpu}

wget "https://git.informatik.uni-leipzig.de/ocr-d/cor-asv-ann-models/-/raw/master/s2s.gt4histocr.s-%C5%BF.d2.w0512.adam.attention.stateless.variational-dropout.char.transfer-lm.h5"
ocrd resmgr download -n s2s.gt4histocr.s-ſ.d2.w0512.adam.attention.stateless.variational-dropout.char.transfer-lm.h5 ocrd-cor-asv-ann-process s2s.gt4histocr.s-ſ.d2.w0512.adam.attention.stateless.variational-dropout.char.transfer-lm.h5
ocrd-cor-asv-ann-process -I OCR-D-OCR -O OCR-D-COR -P model_file s2s.gt4histocr.s-ſ.d2.w0512.adam.attention.stateless.variational-dropout.char.transfer-lm.h5

ocrd-anybaseocr-crop -I OCR-D-BIN -O OCR-D-CROP
ocrd-skimage-denoise -I OCR-D-CROP -O OCR-D-DEN
ocrd-cis-ocropy-segment -I OCR-D-DEN -O OCR-D-SEG4 -P level-of-operation page

ocrd-segment-evaluate -I OCR-D-SEG,OCR-D-SEG2 -O OCR-D-SEGEVAL

ocrd resmgr download ocrd-tesserocr-recognize frak2021.traineddata
ocrd-tesserocr-recognize -I OCR-D-SEG2 -O OCR-D-OCR3 -P model frak2021

ocrd resmgr download ocrd-cis-ocropy-recognize LatinHist.pyrnn.gz
ocrd-cis-ocropy-recognize -I OCR-D-SEG2 -O OCR-D-OCR4 -P model LatinHist.pyrnn.gz -P textequiv_level glyph

ocrd-cor-asv-ann-align -I OCR-D-OCR,OCR-D-OCR3,OCR-D-OCR4 -O OCR-D-OCR5

ocrd-cor-asv-ann-evaluate -I OCR-D-OCR,OCR-D-OCR3,OCR-D-OCR4,OCR-D-OCR5 -O OCR-D-OCREVAL

ocrd-page-transform -I OCR-D-OCR4 -O OCR-D-OCR4X -P xsl page-textequiv-lines-to-regions.xsl
ocrd-fileformat-transform -I OCR-D-OCR4X -O TXT -P from-to "page text" -P script-args level=region pb="$(echo -e \v)"
ocrd-fileformat-transform -I OCR-D-OCR4X -O FULLTEXT -P from-to "page alto" -P script-args "--no-check-border --dummy-word"

