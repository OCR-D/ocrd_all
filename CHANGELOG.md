# Changelog

## [v2020-08-24](https://github.com/OCR-D/ocrd_all/releases/v2020-08-24)

Fixed:

  * Permission issue with `make modules`, #179, #180

### [cor-asv-ann](https://github.com/ASVLeipzig/cor-asv-ann) [479564a](https://github.com/ASVLeipzig/cor-asv-ann/commits479564a)..[69bae66](https://github.com/ASVLeipzig/cor-asv-ann/commits/69bae66)

> Release: [v0.1.3](https://github.com/ASVLeipzig/cor-asv-ann/releases/v0.1.3)

  > * delegate adding MetadataItem to core
  > * fix get_AllRegions (PcGts→Page)
  > * Merge pull request #4 from kba/fileids-and-such

### [cor-asv-fst](https://github.com/ASVLeipzig/cor-asv-fst) [bc6d84c](https://github.com/ASVLeipzig/cor-asv-fst/commitsbc6d84c)..[2428cca](https://github.com/ASVLeipzig/cor-asv-fst/commits/2428cca)

  > * :package: 0.2.1
  > * Merge pull request #5 from kba/fileids-and-such

### [core](https://github.com/OCR-D/core) [dc3ffe4](https://github.com/OCR-D/core/commitsdc3ffe4)..[e41ba75](https://github.com/OCR-D/core/commits/e41ba75)

> Release: [v2.14.0](https://github.com/OCR-D/core/releases/v2.14.0)

  > * Merge pull request #575 from OCR-D/ci-38
  > * :package: v2.14.0
  > * :memo: changelog
  > * test ocrd-dummy respects self.input_files
  > * run_cli: capture and return stdout/stderr
  > * ocrd-dummy: use add_metadata, create PAGE-XML for copied image files
  > * Processor.add_metadata to log processingStep in PAGE-XML, fix #561
  > * :memo: changelog
  > * Merge branch 'refactor-ocrdwf'
  > * :memo: changelog
  > * ocrd_utils.make_file_id: fix str conversion… (#570)
  > * Merge pull request #572 from stweil/typos

### [ocrd_anybaseocr](https://github.com/OCR-D/ocrd_anybaseocr) [9abe7bf](https://github.com/OCR-D/ocrd_anybaseocr/commits9abe7bf)..[85f2387](https://github.com/OCR-D/ocrd_anybaseocr/commits/85f2387)

> Release: [v1.0.1](https://github.com/OCR-D/ocrd_anybaseocr/releases/v1.0.1)

  > * :package: v1.0.1
  > * :memo: changelog
  > * Merge pull request #67 from OCR-D/add-metadata


## [v2020-08-22](https://github.com/OCR-D/ocrd_all/releases/v2020-08-22)

Fixed:

  * Obsolete executable for ocrd_tesserocr caused unnecessary rebuilds, #177

## [v2020-08-21](https://github.com/OCR-D/ocrd_all/releases/v2020-08-21)

### [core](https://github.com/OCR-D/core) [a07568e](https://github.com/OCR-D/core/commitsa07568e)..[dc3ffe4](https://github.com/OCR-D/core/commits/dc3ffe4)

> Release: [v2.13.2](https://github.com/OCR-D/core/releases/v2.13.2)

  > * :package: v2.13.2
  > * workspace: ensure PIL.Image.open FD gets closed
  > * :package: v2.13.1
  > * assert_file_grp_cardinality: allow optional "msg" keyword param

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [c3709e2](https://github.com/qurator-spk/dinglehopper/commitsc3709e2)..[7930ecd](https://github.com/qurator-spk/dinglehopper/commits/7930ecd)

  > * 🔧 dinglehopper: Add PyCharm code style config

### [ocrd_anybaseocr](https://github.com/OCR-D/ocrd_anybaseocr) [962617d](https://github.com/OCR-D/ocrd_anybaseocr/commits962617d)..[9abe7bf](https://github.com/OCR-D/ocrd_anybaseocr/commits/9abe7bf)

> Release: [v1.0.0](https://github.com/OCR-D/ocrd_anybaseocr/releases/v1.0.0)

  > * :package: v1.0.0
  > * Merge pull request #66 from OCR-D/file-ids-and-such

### [ocrd_calamari](https://github.com/OCR-D/ocrd_calamari) [027fcd7](https://github.com/OCR-D/ocrd_calamari/commits027fcd7)..[210c126](https://github.com/OCR-D/ocrd_calamari/commits/210c126)

> Release: [v0.0.7](https://github.com/OCR-D/ocrd_calamari/releases/v0.0.7)

  > * Merge pull request #42 from OCR-D/file-ids-and-such
  > * 🗒️ README-DEV: Also release on GitHub
  > * 📦 v0.0.7
  > * Merge pull request #41 from OCR-D/fix/set-pcgtsid
  > * 🚧 Tests: Add some TODOs re data + namespace version changes

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [fdd7345](https://github.com/cisocrgroup/ocrd_cis/commitsfdd7345)..[5bb73c3](https://github.com/cisocrgroup/ocrd_cis/commits/5bb73c3)

> Release: [v0.0.10](https://github.com/cisocrgroup/ocrd_cis/releases/v0.0.10)

  > * Trainining -> Training
  > * typos
  > * Fix lgtm alert
  > * fix 4a1d2e39d32
  > * set pcGtsId to METS file ID everywhere
  > * remove old entry point for ocropy recognition
  > * ocrolib: ensure closing FDs after mkstemp and PIL.Image.open
  > * binarize: zoom wrt. DPI to avoid inverse edges (and gain speed) at high DPI
  > * processors: use make_file_id and assert_file_grp_cardinality
  > * ocropy processors: put derived images under output fileGrp…

### [ocrd_keraslm](https://github.com/OCR-D/ocrd_keraslm) [be69c97](https://github.com/OCR-D/ocrd_keraslm/commitsbe69c97)..[52cb4ce](https://github.com/OCR-D/ocrd_keraslm/commits/52cb4ce)

> Release: [v0.4.0](https://github.com/OCR-D/ocrd_keraslm/releases/v0.4.0)

  > * :package: v0.4.0
  > * wrapper: set pcGtsId to METS file ID
  > * ocrd cli: use make_file_id and assert_file_grp_cardinality

### [ocrd_olena](https://github.com/OCR-D/ocrd_olena) [50ecb0b](https://github.com/OCR-D/ocrd_olena/commits50ecb0b)..[54792be](https://github.com/OCR-D/ocrd_olena/commits/54792be)

> Release: [v1.2.1](https://github.com/OCR-D/ocrd_olena/releases/v1.2.1)

  > * :package: 1.2.1
  > * fix handling input fileGrps where PAGE is mixed with derived images: (#68)

### [ocrd_pc_segmentation](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation) [db0128f](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/commitsdb0128f)..[5e433e3](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/commits/5e433e3)

> Release: [v0.1.3](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/releases/v0.1.3)

  > * use make_file_id and assert_file_grp_cardinality

### [ocrd_repair_inconsistencies](https://github.com/qurator-spk/ocrd_repair_inconsistencies) [ba27aba](https://github.com/qurator-spk/ocrd_repair_inconsistencies/commitsba27aba)..[8182063](https://github.com/qurator-spk/ocrd_repair_inconsistencies/commits/8182063)

  > * Merge pull request #10 from kba/file-ids-and-such

### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [06fb5ba](https://github.com/OCR-D/ocrd_segment/commits06fb5ba)..[7596e9c](https://github.com/OCR-D/ocrd_segment/commits/7596e9c)

> Release: [v0.1.0](https://github.com/OCR-D/ocrd_segment/releases/v0.1.0)

  > * :package: v0.1.0
  > * Merge remote-tracking branch 'origin/typo_conent_content'
  > * replace_original: update docstring
  > * extract_pages: no pageId for COCO, input_file.pageId for json
  > * revert to old 3-output-file-grp logic in extract_pages.py
  > * extract_regions, extract_pages: pass pageId
  > * Use 'make_file_id' and 'assert_file_grp_cardinality' throughout

### [ocrd_tesserocr](https://github.com/OCR-D/ocrd_tesserocr) [1159fbf](https://github.com/OCR-D/ocrd_tesserocr/commits1159fbf)..[49e93b9](https://github.com/OCR-D/ocrd_tesserocr/commits/49e93b9)

> Release: [v0.9.1](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.9.1)

  > * :package: v0.9.1
  > * changelog
  > * Merge pull request #143 from OCR-D/fix-142
  > * pip install -U pip before pip install (#138)
  > * Merge pull request #132 from bertsky/crop-relative
  > * :package: v0.9.0
  > * Merge pull request #133 from bertsky/alternativeimage-same-filegrp

### [ocrd_typegroups_classifier](https://github.com/OCR-D/ocrd_typegroups_classifier) [94a3630](https://github.com/OCR-D/ocrd_typegroups_classifier/commits94a3630)..[3dddd94](https://github.com/OCR-D/ocrd_typegroups_classifier/commits/3dddd94)

> Release: [v0.1.1](https://github.com/OCR-D/ocrd_typegroups_classifier/releases/v0.1.1)

  > * :package: v0.1.0
  > * use make_file_id/assert_file_grp_cardinality
  > * fix test
  > * heatmap.py --help: grad_cam -> heatmap
  > * Merge remote-tracking branch 'seuretm/master' into HEAD

### [ocrd_wrap](https://github.com/bertsky/ocrd_wrap) [2cfffed](https://github.com/bertsky/ocrd_wrap/commits2cfffed)..[6d92c02](https://github.com/bertsky/ocrd_wrap/commits/6d92c02)

> Release: [v0.1.0](https://github.com/bertsky/ocrd_wrap/releases/v0.1.0)

  > * ocrd-preprocess-image: avoid passing commas from parameter value to image file IDs
  > * fix spaces in makefile (ht @kba)
  > * set pcGtsId to METS file ID everywhere
  > * put derived images under output fileGrp…
  > * ensure mkstemp fd gets closed afterwards
  > * ensure PIL.Image gets closed afterwards

### [opencv-python](https://github.com/skvark/opencv-python) [83acfc9](https://github.com/skvark/opencv-python/commits83acfc9)..[e4893f2](https://github.com/skvark/opencv-python/commits/e4893f2)

> Release: [42](https://github.com/skvark/opencv-python/releases/42)

  > * update README [skip ci]
  > * add ccache and cmake to aarch64 Dockerfile (requires rebuild)
  > * aarch64 needs to be rebuilt with cmake
  > * test aarch64 build
  > * drop Python 3.5 support
  > * use switch instead
  > * force qt uninstall
  > * unlink and reinstall
  > * just use the raw url directly
  > * no auto update, use extract
  > * direct link
  > * 5.13.2
  > * force Qt 5.13
  > * add aarch64 Dockerfile
  > * another typo
  > * fix typo in version
  > * Add note about manylinux2014
  > * OpenCV 4.4.0
  > * add minimum supported Python version
  > * fix the travis USER issue
  > * fix twine upload command
  > * fix sdist upload
  > * fix min numpy version for 3.6
  > * reduce verbosity
  > * patch only on linux
  > * fix windows builds
  > * update licenses
  > * update license info
  > * wrong dir
  > * update patch
  > * update patch
  > * update patch
  > * copy fonts
  > * set QT_QPA_FONTDIR
  > * add fonts to the package
  > * azure-cli should work now
  > * use py27 compatible version
  > * use pip
  > * Install azure-cli from Ubuntu repo because latest update broke batch upload
  > * fix patch location
  > * auditwheel is installed under py37
  > * try to whitelist libxcb.so.1
  > * fix patch
  > * change path
  > * qt5.15 again
  > * fix typo, try without xcb helpers
  > * add ld lib path
  > * qt 5.13 test

### [sbb_textline_detector](https://github.com/qurator-spk/sbb_textline_detector) [eba5f54](https://github.com/qurator-spk/sbb_textline_detector/commitseba5f54)..[a7c92c9](https://github.com/qurator-spk/sbb_textline_detector/commits/a7c92c9)

  > * Merge pull request #38 from qurator-spk/printspace-vs-border
  > * Merge pull request #37 from qurator-spk/update-readme
  > * add travis CI badge
  > * Merge pull request #13 from stweil/travis
  > * Merge pull request #36 from kba/file-ids-and-such
  > * 🐛 sbb_textline_detection: Set pcGtsId

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [7edcb90](https://github.com/bertsky/workflow-configuration/commits7edcb90)..[7c89037](https://github.com/bertsky/workflow-configuration/commits/7c89037)

  > * avoid citation notice for GNU parallel

## [v2020-08-04](https://github.com/OCR-D/ocrd_all/releases/v2020-08-04)

### [core](https://github.com/OCR-D/core) [320a2fd](https://github.com/OCR-D/core/commits320a2fd)..[a07568e](https://github.com/OCR-D/core/commits/a07568e)

> Release: [v2.13.0](https://github.com/OCR-D/core/releases/v2.13.0)

  > * :package: v2.13.0
  > * fix test_exif
  > * update tests
  > * BaseProcessor.input_files: Implement logic for PAGEXML/image in same folder
  > * :package: v2.12.7
  > * Support -P in ocrd process, fix #551

### [ocrd_anybaseocr](https://github.com/OCR-D/ocrd_anybaseocr) [958a998](https://github.com/OCR-D/ocrd_anybaseocr/commits958a998)..[962617d](https://github.com/OCR-D/ocrd_anybaseocr/commits/962617d)

> Release: [v0.0.5](https://github.com/OCR-D/ocrd_anybaseocr/releases/v0.0.5)

  > * :package: v0.0.5
  > * .
  > * circleci: patch pix2pixhd and install pytest
  > * circleci: fix setup and badge
  > * Merge remote-tracking branch 'origin/master' into fix-installation
  > * remove "force" parameter
  > * dewarp: use assert_file_grp_cardinality
  > * document prepare_options hack in dewarp
  > * layout analysis: allow CPU processing
  > * makefile: executables will always be ocrd-anybaseocr-*
  > * circleci: run make test and cli-test
  > * fix setup.py cli paths
  > * smoke test all CLI for --help and --dump-json
  > * make test: overrideable test set
  > * layout-analysis: use tensorflow_importer
  > * deccouple CLIs (not all need tensorflow)
  > * ocrd-tool: fix --help breaking typos, fix #57
  > * :art: fix imports ocrd_anybaseocr_block_segmentation
  > * :art: autopep8 ocrd_anybaseocr_block_segmentation
  > * Update Makefile
  > * prepare_data is a function, not a method
  > * prepare_data is a function, not a method
  > * make assets: copy models as before
  > * :memo: update CLI test comments
  > * MANIFEST.in: drop "graft pix2pixHD"
  > * :memo: update install instructions
  > * dewarp: modify prepare_options so they are actually picked up ...
  > * make patch-pix2pixhd: fix string exceptions regex
  > * torchvision is requird
  > * more pix2pix sed-i-patching
  > * minimal unittest for dewarp
  > * tool-json: dewarp: Add download URL to description
  > * make patch-pix2pixhd: typo
  > * dewarp: eliminate multiple output groups, OCR-D/spec#164
  > * dewarp: factor pix2pixhd option setup out of class
  > * ocrd-tool: dewarp: drop checkpoint_dir param
  > * ocrd-tool: dewarp: set cacheable=true and content-type for 'model_path'
  > * dewarp: ocrd-tool:
  > * :art: dewarp: clean up code (wip)
  > * dewarp: properly import pix2pixhd
  > * make {patch-,}pix2pixhd: Patch pix2pixhd to work alongside like a subpackage
  > * massage requirements.txt to avoid VersionConflictError
  > * move pix2pixhd to package root
  > * Merge remote-tracking branch 'bertsky/fix-crop-reshape' into fix-installation
  > * Merge remote-tracking branch 'bertsky/fix-dewarp' into fix-installation
  > * :art: autopep8 dewarp
  > * add pix2pixHD as a submodule, bundle using MANIFEST.in

### [ocrd_olena](https://github.com/OCR-D/ocrd_olena) [f9bd786](https://github.com/OCR-D/ocrd_olena/commitsf9bd786)..[ed7720d](https://github.com/OCR-D/ocrd_olena/commits/ed7720d)

> Release: [v1.2.0](https://github.com/OCR-D/ocrd_olena/releases/v1.2.0)

  > * Merge pull request #66 from mikegerber/fix/travis-install
  > * :package: v1.2.0
  > * make install: more robust check whether ocrd CLI installed, fix #61

### [opencv-python](https://github.com/skvark/opencv-python) [914404d](https://github.com/skvark/opencv-python/commits914404d)..[83acfc9](https://github.com/skvark/opencv-python/commits/83acfc9)

> Release: [36](https://github.com/skvark/opencv-python/releases/36)

  > * Merge pull request #368 from tedski/master

### [sbb_textline_detector](https://github.com/qurator-spk/sbb_textline_detector) [4036e2a](https://github.com/qurator-spk/sbb_textline_detector/commits4036e2a)..[eba5f54](https://github.com/qurator-spk/sbb_textline_detector/commits/eba5f54)

  > * Update README.md
  > * Update README.md
  > * Update README.md
  > * Update README.md
  > * Update README.md
  > * Update README.md


## [v2020-07-28](https://github.com/OCR-D/ocrd_all/releases/v2020-07-28)

### [core](https://github.com/OCR-D/core) [14e30a2](https://github.com/OCR-D/core/commits14e30a2)..[320a2fd](https://github.com/OCR-D/core/commits/320a2fd)

> Release: [v2.12.6](https://github.com/OCR-D/core/releases/v2.12.6)

  > * :package: v2.12.6
  > * Merge pull request #550 from OCR-D/pillow-security-fixes
  > * Merge pull request #547 from OCR-D/refactor-dummy
  > * :package: v2.12.5
  > * Merge pull request #548 from OCR-D/fix-540-again
  > * Merge pull request #549 from OCR-D/maninfest-in

### [sbb_textline_detector](https://github.com/qurator-spk/sbb_textline_detector) [3593506](https://github.com/qurator-spk/sbb_textline_detector/commits3593506)..[4036e2a](https://github.com/qurator-spk/sbb_textline_detector/commits/4036e2a)

  > * Merge pull request #34 from stweil/master

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [7f2766c](https://github.com/bertsky/workflow-configuration/commits7f2766c)..[7edcb90](https://github.com/bertsky/workflow-configuration/commits/7edcb90)

  > * workflow examples: replace + with - in fileGrp names


## [v2020-07-24](https://github.com/OCR-D/ocrd_all/releases/v2020-07-24)

### [core](https://github.com/OCR-D/core) [044cdad2](https://github.com/OCR-D/core/commits044cdad2)..[14e30a2e](https://github.com/OCR-D/core/commits/14e30a2e)

> Release: [v2.12.4](https://github.com/OCR-D/core/releases/v2.12.4)

  > * :package: v2.12.4
  > * Merge pull request #546 from OCR-D/logging-interference
  > * :package: v2.12.3
  > * Merge pull request #543 from OCR-D/workspace-validator-logspam


## [v2020-07-23](https://github.com/OCR-D/ocrd_all/releases/v2020-07-23)

### [core](https://github.com/OCR-D/core) [f708420d](https://github.com/OCR-D/core/commitsf708420d)..[044cdad2](https://github.com/OCR-D/core/commits/044cdad2)

> Release: [v2.12.2](https://github.com/OCR-D/core/releases/v2.12.2)

  > * :package: v2.12.2
  > * ocrd_validators: adapt ocrd-tool schema to include OCR-D/spec#152
  > * :package: v2.12.1
  > * ocrd process: don't skip first task, fix #529
  > * unit test to trigger #540/#529
  > * :package: v2.12.0
  > * Merge pull request #503 from OCR-D/processors-wo-args
  > * Merge pull request #535 from OCR-D/patch-bashlib-minversion-set-x
  > * Merge pull request #536 from OCR-D/refactor-utils-tests
  > * :package: v2.11.0
  > * parse_json_string_or_file: handle FNFE and OSError in one clause
  > * more robust test for param output
  > * allow #-prefixed line comments in JSON parameter files
  > * processors CLI: support  repeatable parameters, OCR-D/spec#158

### [ocrd_anybaseocr](https://github.com/OCR-D/ocrd_anybaseocr) [287adce](https://github.com/OCR-D/ocrd_anybaseocr/commits287adce)..[958a998](https://github.com/OCR-D/ocrd_anybaseocr/commits/958a998)

> Release: [v0.0.4](https://github.com/OCR-D/ocrd_anybaseocr/releases/v0.0.4)

  > * :package: v0.0.4
  > * keras should be >= 2.3.0 but < 2.4.0

### [ocrd_calamari](https://github.com/OCR-D/ocrd_calamari) [c6ced9b](https://github.com/OCR-D/ocrd_calamari/commitsc6ced9b)..[027fcd7](https://github.com/OCR-D/ocrd_calamari/commits/027fcd7)

> Release: [v0.0.6](https://github.com/OCR-D/ocrd_calamari/releases/v0.0.6)

  > * 🐛 Fix test file path

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [06b27d4](https://github.com/OCR-D/ocrd_fileformat/commits06b27d4)..[8fc5313](https://github.com/OCR-D/ocrd_fileformat/commits/8fc5313)

> Release: [v0.0.3](https://github.com/OCR-D/ocrd_fileformat/releases/v0.0.3)

  > * Merge pull request #9 from bertsky/page-id


### [ocrd_wrap](https://github.com/bertsky/ocrd_wrap) [f5347ff](https://github.com/bertsky/ocrd_wrap/commitsf5347ff)..[2cfffed](https://github.com/bertsky/ocrd_wrap/commits/2cfffed)

> Release: [v0.0.5](https://github.com/bertsky/ocrd_wrap/releases/v0.0.5)

  > * fix badge URL
  > * :package: 0.0.5
  > * update requirements
  > * all: fix region level, raise pylint happiness

Submodule opencv-python 11e478c...914404d (commits not present)

### [tesseract](https://github.com/tesseract-ocr/tesseract) [d01b2e43](https://github.com/tesseract-ocr/tesseract/commitsd01b2e43)..[d33edbc4](https://github.com/tesseract-ocr/tesseract/commits/d33edbc4)

> Release: [5.0.0-alpha](https://github.com/tesseract-ocr/tesseract/releases/5.0.0-alpha)

  > * Merge pull request #3066 from robinwatts/pushback14
  > * Merge pull request #3065 from robinwatts/pushback13
  > * Merge pull request #3064 from robinwatts/pushback12
  > * Merge pull request #3061 from stweil/neon
  > * Merge pull request #3058 from stweil/scrollview
  > * Use strtok_s for MSVC in class SVNetwork
  > * Merge pull request #3060 from edwinnyawoli/patch-1
  > * Fix division by 0.0 in BaselineRow::PerpDistanceFromBaseline
  > * Merge pull request #3055 from stweil/string

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [8469b0a](https://github.com/bertsky/workflow-configuration/commits8469b0a)..[7f2766c](https://github.com/bertsky/workflow-configuration/commits/7f2766c)

  > * ocrd-import: annotate correct DPI after downsampling PDFs
  > * Merge pull request #17 from stweil/master


## [v2020-07-07](https://github.com/OCR-D/ocrd_all/releases/v2020-07-07)

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [cdfd4d3](https://github.com/qurator-spk/dinglehopper/commitscdfd4d3)..[c3709e2](https://github.com/qurator-spk/dinglehopper/commits/c3709e2)

  > * 🧹 dinglehopper: Remove .vimrc again (security)
  > * 💄 Set maximum line length to 90

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [fa40e7e](https://github.com/cisocrgroup/ocrd_cis/commitsfa40e7e)..[fdd7345](https://github.com/cisocrgroup/ocrd_cis/commits/fdd7345)

> Release: [v0.0.10](https://github.com/cisocrgroup/ocrd_cis/releases/v0.0.10)

  > * Remove old internal files
  > * README: add PyPI badge
  > * fix setup (needs json)
  > * add empty travis ci file

### [ocrd_keraslm](https://github.com/OCR-D/ocrd_keraslm) [7bfffef](https://github.com/OCR-D/ocrd_keraslm/commits7bfffef)..[be69c97](https://github.com/OCR-D/ocrd_keraslm/commits/be69c97)

> Release: [0.3.1](https://github.com/OCR-D/ocrd_keraslm/releases/0.3.1)

  > * Update requirements.txt

### [ocrd_repair_inconsistencies](https://github.com/qurator-spk/ocrd_repair_inconsistencies) [6897996](https://github.com/qurator-spk/ocrd_repair_inconsistencies/commits6897996)..[ba27aba](https://github.com/qurator-spk/ocrd_repair_inconsistencies/commits/ba27aba)

  > * 🧹 examples/fix-ocr-d-gt-page.sh: rmdir after ocrd workspace remove-group is not necessary anymore
  > * 🧹 examples/fix-ocr-d-gt-page.sh: rmdir after ocrd workspace remove-group is not necessary anymore
  > * ✨ Support TextRegions nested in Table/GraphicRegions

### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [f8a8daa](https://github.com/OCR-D/ocrd_segment/commitsf8a8daa)..[06fb5ba](https://github.com/OCR-D/ocrd_segment/commits/06fb5ba)

> Release: [v0.0.2](https://github.com/OCR-D/ocrd_segment/releases/v0.0.2)

  > * replace-original: use OCR-D-IMG-SUBST instead of -CROP
  > * replace-original: add parameters for image feature filtering…

### [ocrd_wrap](https://github.com/bertsky/ocrd_wrap) [7a0c136](https://github.com/bertsky/ocrd_wrap/commits7a0c136)..[f5347ff](https://github.com/bertsky/ocrd_wrap/commits/f5347ff)

> Release: [v0.0.4](https://github.com/bertsky/ocrd_wrap/releases/v0.0.4)

  > * skimage-denoise-raw: skip images with too little noise
  > * skimage_\*: preserve depth

### [opencv-python](https://github.com/skvark/opencv-python) [3073e9e](https://github.com/skvark/opencv-python/commits3073e9e)..[11e478c](https://github.com/skvark/opencv-python/commits/11e478c)

> Release: [36](https://github.com/skvark/opencv-python/releases/36)

  > * resolve merge conflicts
  > * merge manylinux2014 support

### [tesseract](https://github.com/tesseract-ocr/tesseract) [380466e0](https://github.com/tesseract-ocr/tesseract/commits380466e0)..[d01b2e43](https://github.com/tesseract-ocr/tesseract/commits/d01b2e43)

> Release: [5.0.0-alpha](https://github.com/tesseract-ocr/tesseract/releases/5.0.0-alpha)

  > * unittest: Update comments in normstrngs_test.cc
  > * cmake: add NEON compile support
  > * cmake: remove custom CheckCCompilerFlag/CheckCXXCompilerFlag
  > * cmake: fix policy setting for newer cmake (CheckIPOSupported)
  > * Fix runtime error with null pointer argument
  > * Fix unsigned integer overflow
  > * unittest: Remove unused local variables
  > * Fix out of bounds array access
  > * Update README.md
  > * README.md: Show only open issues of oss-fuzz
  > * cmake: allow to enable LTO
  > * Update imagedata.cpp
  > * Improve debug message in ColPartition::ComputeLimits
  > * Remove obsolescent macro AC_HEADER_STDC
  > * Remove obsolescent macro AC_HEADER_TIME
  > * Remove checks for unused types off_t, mbstate_t, \_Bool
  > * Fix conversion of images with 16 bpp or 24 bpp to grey
  > * Classify: Run sort only for more than one element
  > * Fix CMake build with DISABLED_LEGACY_ENGINE
  > * ScrollView: Fix typo in comment

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [33d8786](https://github.com/bertsky/workflow-configuration/commits33d8786)..[8469b0a](https://github.com/bertsky/workflow-configuration/commits/8469b0a)

  > * make larex: new target for LAREX export on top of default target
  > * ocrd-export-larex: fix for fallback of 'TextRegion/@type' to 'other'
  > * make view: protect against running this in-place inside workspaces
  > * fix workflow templating skeleton
  > * ocrd-export-larex: fix regression in PAGE post-processing
  > * ocrd-export-larex: fix loglevel retval


## [v2020-06-17.2](https://github.com/OCR-D/ocrd_all/releases/v2020-06-17.2)

Fixed:

  * `make fix-pip` correct the tensorflow logic, #115


## [v2020-06-17.1](https://github.com/OCR-D/ocrd_all/releases/v2020-06-17.1)

### [core](https://github.com/OCR-D/core) [574bbad](https://github.com/OCR-D/core/commits574bbad)..[f708420](https://github.com/OCR-D/core/commits/f708420)

> Release: [v2.10.4](https://github.com/OCR-D/core/releases/v2.10.4)

  > * :package: v2.10.4
  > * bashlib: --overwrite, #476

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [f2b42d4](https://github.com/cisocrgroup/ocrd_cis/commitsf2b42d4)..[fa40e7e](https://github.com/cisocrgroup/ocrd_cis/commits/fa40e7e)


### [ocrd_im6convert](https://github.com/OCR-D/ocrd_im6convert) [31eb2ae](https://github.com/OCR-D/ocrd_im6convert/commits31eb2ae)..[11bfea3](https://github.com/OCR-D/ocrd_im6convert/commits/11bfea3)

> Release: [v0.0.4](https://github.com/OCR-D/ocrd_im6convert/releases/v0.0.4)

  > * :package: v0.0.4

### [ocrd_olena](https://github.com/OCR-D/ocrd_olena) [6adee3d](https://github.com/OCR-D/ocrd_olena/commits6adee3d)..[f9bd786](https://github.com/OCR-D/ocrd_olena/commits/f9bd786)

> Release: [v1.1.10](https://github.com/OCR-D/ocrd_olena/releases/v1.1.10)

  > * :package: v1.1.10

### [ocrd_pagetopdf](https://github.com/UB-Mannheim/ocrd_pagetopdf) [a606632](https://github.com/UB-Mannheim/ocrd_pagetopdf/commitsa606632)..[88faa74](https://github.com/UB-Mannheim/ocrd_pagetopdf/commits/88faa74)


### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [ee5f36d](https://github.com/OCR-D/ocrd_segment/commitsee5f36d)..[f8a8daa](https://github.com/OCR-D/ocrd_segment/commits/f8a8daa)

> Release: [v0.0.2](https://github.com/OCR-D/ocrd_segment/releases/v0.0.2)

  > * replace-original: new...


## [v2020-06-17](https://github.com/OCR-D/ocrd_all/releases/v2020-06-17)

### [core](https://github.com/OCR-D/core) [2e4c16e](https://github.com/OCR-D/core/commits2e4c16e)..[574bbad](https://github.com/OCR-D/core/commits/574bbad)

> Release: [v2.10.3](https://github.com/OCR-D/core/releases/v2.10.3)

  > * :package: v2.10.3
  > * workspace add: check whether filename is absolute
  > * workspace add: os.path.join behavior led to faulty existence check, fix #519
  > * :package: v2.10.2

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [7b8671c](https://github.com/OCR-D/ocrd_fileformat/commits7b8671c)..[06b27d4](https://github.com/OCR-D/ocrd_fileformat/commits/06b27d4)

> Release: [v0.0.3](https://github.com/OCR-D/ocrd_fileformat/releases/v0.0.3)

  > * :package: v0.0.3
  > * require ocrd/core >= 2.10.2
  > * properly pass on script-args, #4

Submodule ocrd_wrap c47a9dd...7a0c136 (not checked out)

### [tesseract](https://github.com/tesseract-ocr/tesseract) [62eae84](https://github.com/tesseract-ocr/tesseract/commits62eae84)..[380466e](https://github.com/tesseract-ocr/tesseract/commits/380466e)

> Release: [5.0.0-alpha](https://github.com/tesseract-ocr/tesseract/releases/5.0.0-alpha)

  > * Allow inlining of function TruncateParam
  > * Remove unused argument from function TruncateParam
  > * Remove assertion which is triggered by tests
  > * StrokeWidth: Remove unused local variable (fixes compiler warning)
  > * Remove old unused code from imagedata.h
  > * Fix crash caused by missing thread synchronization (issues #757, #1168 and #2191)


## [v2020-06-14](https://github.com/OCR-D/ocrd_all/releases/v2020-06-14)

### [core](https://github.com/OCR-D/core) [2e4c16e](https://github.com/OCR-D/core/commits2e4c16e)..[86f788a](https://github.com/OCR-D/core/commits/86f788a)

> Release: [v2.10.2](https://github.com/OCR-D/core/releases/v2.10.2)

  > * :package: v2.10.2

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [7b8671c](https://github.com/OCR-D/ocrd_fileformat/commits7b8671c)..[06b27d4](https://github.com/OCR-D/ocrd_fileformat/commits/06b27d4)

> Release: [v0.0.3](https://github.com/OCR-D/ocrd_fileformat/releases/v0.0.3)

  > * :package: v0.0.3
  > * require ocrd/core >= 2.10.2
  > * properly pass on script-args, #4

### [tesseract](https://github.com/tesseract-ocr/tesseract) [62eae84f](https://github.com/tesseract-ocr/tesseract/commits62eae84f)..[6ee36989](https://github.com/tesseract-ocr/tesseract/commits/6ee36989)

> Release: [5.0.0-alpha](https://github.com/tesseract-ocr/tesseract/releases/5.0.0-alpha)

  > * Remove old unused code from imagedata.h
  > * Fix crash caused by missing thread synchronization (issues #757, #1168 and #2191)


## [v2020-06-13](https://github.com/OCR-D/ocrd_all/releases/v2020-06-13)

### [core](https://github.com/OCR-D/core) [cd7be4e8](https://github.com/OCR-D/core/commitscd7be4e8)..[2e4c16e5](https://github.com/OCR-D/core/commits/2e4c16e5)

> Release: [v2.10.1](https://github.com/OCR-D/core/releases/v2.10.1)

  > * Makefile: Fix location of PAGE XSD
  > * :package: v2.10.1
  > * XSD: move schema files to package root
  > * bashlib: add an ocrd__minversion check to check core
  > * bashlib: input/output grp must be set, logging regression, fix #511

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [32848eb](https://github.com/qurator-spk/dinglehopper/commits32848eb)..[cdfd4d3](https://github.com/qurator-spk/dinglehopper/commits/cdfd4d3)

  > * 🐛 dinglehopper: Add missing requirement MarkupSafe

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [5698cd7](https://github.com/OCR-D/ocrd_fileformat/commits5698cd7)..[7b8671c](https://github.com/OCR-D/ocrd_fileformat/commits/7b8671c)

> Release: [v0.0.2](https://github.com/OCR-D/ocrd_fileformat/releases/v0.0.2)

  > * :package: v0.0.2
  > * Use ocrd/core 2.10.1+, logging


## [v2020-06-12](https://github.com/OCR-D/ocrd_all/releases/v2020-06-12)

### [core](https://github.com/OCR-D/core) [377ed159](https://github.com/OCR-D/core/commits377ed159)..[cd7be4e8](https://github.com/OCR-D/core/commits/cd7be4e8)

> Release: [v2.10.0](https://github.com/OCR-D/core/releases/v2.10.0)

  > * :package: v2.10.0
  > * Implement --overwrite with "overwrite_mode" on workspace
  > * get_All{,Alternative}ImagePaths: only return Alternative Image paths
  > * bundle PAGE XSD in ocrd_validators
  > * Workspace.save_image_file: force should now default to False b/c --overwrite
  > * TaskSequencec.validate_tasks: Check output file groups are not in METS unless overwrite for every task
  > * revert d96b532a until OCR-D/spec#121 is unresolved
  > * Fixes by @bertsky
  > * ocrd process: support --overwrite and pass on to processor calls
  > * TaskSequence: set in/out groups from ocrd-tool.json
  > * `overwrite` passed on to processors in run_cli
  > * Revert "TaskSequence.Task can have a `-g`/`--page-id` attr"
  > * ocrd_cli_wrap_processor: take page_id into account when checking file groups, #471
  > * WorkspaceValidator: Allow non-destructive reuse of output group
  > * TaskSequence.Task can have a `-g`/`--page-id` attr
  > * Workspace.remove_file: remove images linked in PAGE-XML if page_recursive==True
  > * generateDS PAGE API: `get_AllImagePaths` to list all images
  > * generateDS PAGE API: Move PAGE_REGION_TYPES to ocrd_models.constants
  > * Add --overwrite parameter to processor base, #434, OCR-D/spec#151

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [745095e](https://github.com/qurator-spk/dinglehopper/commits745095e)..[32848eb](https://github.com/qurator-spk/dinglehopper/commits/32848eb)

  > * 🎨 dinglehopper: Set code width for flake8
  > * 🗒️ dinglehopper: Remove superfluous `-m mets.xml` in the README OCR-D example
  > * ✨ dinglehopper: Support disabling metrics in the OCR-D interface
  > * 🐛 dinglehopper: Fix reading OCR-D workspace files when only URLs are provided
  > * 🧹 dinglehopper: .gitignore Python stuff
  > * 🐛 dinglehopper: Fix tests by making metrics a keyword argument
  > * 🗒️ dinglehopper: Describe what dinglehopper does in the README
  > * ✨ dinglehopper: Support disabling the metrics using CLI option --no-metrics

### [ocrd_calamari](https://github.com/OCR-D/ocrd_calamari) [fb53884](https://github.com/OCR-D/ocrd_calamari/commitsfb53884)..[c6ced9b](https://github.com/OCR-D/ocrd_calamari/commits/c6ced9b)

> Release: [v0.0.6](https://github.com/OCR-D/ocrd_calamari/releases/v0.0.6)


### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [a6a2ecd](https://github.com/cisocrgroup/ocrd_cis/commitsa6a2ecd)..[f2b42d4](https://github.com/cisocrgroup/ocrd_cis/commits/f2b42d4)

  > * Update to latest jar
  > * only override log level if it is actually set
  > * load gzipped models

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [de5b532](https://github.com/OCR-D/ocrd_fileformat/commitsde5b532)..[5698cd7](https://github.com/OCR-D/ocrd_fileformat/commits/5698cd7)

> Release: [v0.0.1](https://github.com/OCR-D/ocrd_fileformat/releases/v0.0.1)

  > * :package: v0.0.1
  > * readme: combine native CLI and workflow-configuration calls
  > * ocrd-tool: add steps/categories, #3

### [ocrd_olena](https://github.com/OCR-D/ocrd_olena) [e000f24](https://github.com/OCR-D/ocrd_olena/commitse000f24)..[6adee3d](https://github.com/OCR-D/ocrd_olena/commits/6adee3d)

> Release: [v1.1.9](https://github.com/OCR-D/ocrd_olena/releases/v1.1.9)

  > * :package: v1.1.9
  > * :package: v1.1.8

### [ocrd_tesserocr](https://github.com/OCR-D/ocrd_tesserocr) [9d2253e](https://github.com/OCR-D/ocrd_tesserocr/commits9d2253e)..[1159fbf](https://github.com/OCR-D/ocrd_tesserocr/commits/1159fbf)

> Release: [v0.8.5](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.8.5)

  > * :package: v0.8.5
  > * segment-region: clip polygons to parent...

Submodule ocrd_wrap 0000000...c47a9dd (new submodule)

### [opencv-python](https://github.com/skvark/opencv-python) [1ca69aa](https://github.com/skvark/opencv-python/commits1ca69aa)..[3073e9e](https://github.com/skvark/opencv-python/commits/3073e9e)

> Release: [34](https://github.com/skvark/opencv-python/releases/34)

  > * OpenCV 4.3.0
  > * update README
  > * disable MSMF in headless builds #263
  > * fix typo
  > * update README and licenses
  > * update multibuild
  > * try to fix cmake python 3.7 errors
  > * workaround for multibuild error in cache step
  > * update multibuild and remove global MB_PYTHON_VERSION
  > * add missing language
  > * matrix -> jobs, disable global default build by moving params to the matrix
  > * remove Python 2.7 from appveyor.yml
  > * fix variable name typo
  > * drop Python 2.7, experimental Azure Storage artifact upload support

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [403ef75](https://github.com/bertsky/workflow-configuration/commits403ef75)..[33d8786](https://github.com/bertsky/workflow-configuration/commits/33d8786)

  > * ocrd-export-larex: support more OCR-D CLI options…
  > * adapt to --overwrite and --page-id support in core 2.10…
  > * alias 'clean' for 'cleanup', documentation
  > * ocrd-export-larex: replace original image in result...

# CHANGELOG

## 2020-06-10

Added:

  * `ocrd_wrap`

## 2020-05-31

Update:

  * `ocrd_olena`: e000f24 (1.1.7)
  * `tesseract`: 62eae84
  * `ocrd_cis`: a6a2ecd
  * `ocrd_tesserocr`: 9d2253e (0.8.3 +1)
  * `sbb_textline_detector`: 3593506
  * `workflow-configuration`: 403ef75

Added:

  * `CHANGELOG.md` to track changes
