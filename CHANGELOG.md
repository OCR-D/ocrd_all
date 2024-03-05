# Changelog

## Unreleased

## [v2024-03-05](https://github.com/OCR-D/ocrd_all/releases/v2024-03-05)

### [core](https://github.com/OCR-D/core) [3a1b3a2](https://github.com/OCR-D/core/commits/3a1b3a2)..[f54b002](https://github.com/OCR-D/core/commits/f54b002)

> Release: [v2.63.2](https://github.com/OCR-D/core/releases/v2.63.2)

  > * :package: v2.63.2
  > * :package: v2.63.1
  > * Merge branch 'fix-get-physical-pages'
  > * make coverage: omit generateDS code

### [cor-asv-ann](https://github.com/ASVLeipzig/cor-asv-ann) [0a4f684](https://github.com/ASVLeipzig/cor-asv-ann/commits/0a4f684)..[f7ebb74](https://github.com/ASVLeipzig/cor-asv-ann/commits/f7ebb74)
  > * compare/evaluate: ensure lines are shown verbatim on single file level
  > * compare/evaluate: do not record worst lines verbatim
  > * compare/evaluate: also record 1% worst lines

### [ocrd_keraslm](https://github.com/OCR-D/ocrd_keraslm) [759805b](https://github.com/OCR-D/ocrd_keraslm/commits/759805b)..[472197f](https://github.com/OCR-D/ocrd_keraslm/commits/472197f)

> Release: [v0.4.2](https://github.com/OCR-D/ocrd_keraslm/releases/v0.4.2)

  > * update assets
  > * :package: v0.4.2
  > * generators: do not require input length > window size
  > * train: allow passing directory for training data, too
  > * add checkpointing, allow continuing from ckpt
  > * suppress TF gibberish

### [tesseract](https://github.com/tesseract-ocr/tesseract) [becd395](https://github.com/tesseract-ocr/tesseract/commits/becd395)..[8690d5a](https://github.com/tesseract-ocr/tesseract/commits/8690d5a)

> Release: [5.3.4](https://github.com/tesseract-ocr/tesseract/releases/5.3.4)

  > * Remove unneeded constant kNumSingleQuoteUnicodes
  > * Remove unneeded constant kNumDoubleQuoteUnicodes
  > * Remove unneeded constant kNumHyphenPuncUnicodes
  > * fix initializer syntax
  > * normstrngs: add more hyphens and quotes
  > * Update unittest-disablelegacy.yml
  > * cmake.yml: Remove the clang++ 14 on Linux job
  > * autotools.yml: Remove the clang++ 14 on Linux job
  > * Update msys2.yml: Drop the 32-bit job
  > * Update GitHub actions/checkout to v4
  > * [pdfrenderer] Add some debugging capabilities. Do not compress symbol table and text data during debug.
  > * [pdfrenderer] Do not include space symbol into the word pdf box.
  > * Move include line.
  > * Fix some typos
  > * [ci][appveyor] Switch to VS2022.

### [tesserocr](https://github.com/sirfz/tesserocr) [1f960e9](https://github.com/sirfz/tesserocr/commits/1f960e9)..[f900cbd](https://github.com/sirfz/tesserocr/commits/f900cbd)

> Release: [v2.6.2](https://github.com/sirfz/tesserocr/releases/v2.6.2)

  > * skip unit test for GetComponentImages if Pillow is missing

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [cb0ef1a](https://github.com/bertsky/workflow-configuration/commits/cb0ef1a)..[8418b3f](https://github.com/bertsky/workflow-configuration/commits/8418b3f)

> Release: [0.1.3](https://github.com/bertsky/workflow-configuration/releases/0.1.3)

  > * ocrd-import: use coproc instead of handcrafted FIFOs for loggers
  > * ocrd-import: rewrite (no parallel jobs, but parallel logging)…
  > * ocrd-import: add option --basename, default to using directory as well
  > * ocrd-import: simplify+speedup…


## [v2024-02-20](https://github.com/OCR-D/ocrd_all/releases/v2024-02-20)

Added:

  - https://github.com/OCR-D/ocrd_froc

Removed:

  - https://github.com/OCR-D/ocrd_typegroups_classifier

### [core](https://github.com/OCR-D/core) [60dcd7e](https://github.com/OCR-D/core/commits/60dcd7e)..[3a1b3a2](https://github.com/OCR-D/core/commits/3a1b3a2)

> Release: [v2.63.0](https://github.com/OCR-D/core/releases/v2.63.0)

  > * :package: v2.63.0
  > * :memo: changelog
  > * Merge branch 'master' into lxml-stubs
  > * clean up lxml code
  > * use lxml-stubs/types-lxml for typing support of lxml.etree
  > * :memo: changelog
  > * Merge branch 'local-filename-path-to-str'
  > * :memo: changelog
  > * Merge pull request #1181 from OCR-D/downgrade-log-msg-debug

### [cor-asv-ann](https://github.com/ASVLeipzig/cor-asv-ann) [0a4f684](https://github.com/ASVLeipzig/cor-asv-ann/commits/0a4f684)..[4216c16](https://github.com/ASVLeipzig/cor-asv-ann/commits/4216c16)

> Release: [v0.1.15](https://github.com/ASVLeipzig/cor-asv-ann/releases/tag/v0.1.15)

  > * readme: add Dockerhub badge
  > * add CD to Dockerhub
  > * update readme
  > * join: add param add-filegrp-index
  > * process: adapt to Numpy changes
  > * add dockerfile
  > * compare/evaluate: reverse order of pair (to match actual order in confusion and history)
  > * align: clarify that 1st fileGrp is privileged
  > * evaluate: add param match_on, allow comparing across @index of same fileGrp, too
  > * downgrade plotting to optional dependency
  > * adopt word splitting from dinglehopper
  > * edits, compare/evaluate: micro- (per char) instead of macro-average (per line), fix num-lines vs num-chars
  > * join: add param match-on, offer baseline and coords as alternative to id
  > adapt to Numpy deprecations

### [ocrd_anybaseocr](https://github.com/OCR-D/ocrd_anybaseocr) [5978a1f](https://github.com/OCR-D/ocrd_anybaseocr/commits/5978a1f)..[eb6ea8e](https://github.com/OCR-D/ocrd_anybaseocr/commits/eb6ea8e)

> Release: [v1.10.0](https://github.com/OCR-D/ocrd_anybaseocr/releases/v1.10.0)

  > * :package: v1.10.0
  > * docker: build on top of 2.63
  > * Base Docker on core-cuda
  > * Set docker metadata with makefile
  > * Add things required by spec to Dockerfile
  > * Clear pip cache after installing in Dockerfile
  > * Rename build folder to not interfere with core-img
  > * Update dockerfile

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [fcc02fd](https://github.com/cisocrgroup/ocrd_cis/commits/fcc02fd)..[1d2e858](https://github.com/cisocrgroup/ocrd_cis/commits/1d2e858)

> Release: [v0.1.5](https://github.com/cisocrgroup/ocrd_cis/releases/v0.1.5)

  > * Merge pull request #4 from joschrew/update-dockerfile

### [ocrd_im6convert](https://github.com/OCR-D/ocrd_im6convert) [db18917](https://github.com/OCR-D/ocrd_im6convert/commits/db18917)..[be794f6](https://github.com/OCR-D/ocrd_im6convert/commits/be794f6)

> Release: [v0.1.1](https://github.com/OCR-D/ocrd_im6convert/releases/v0.1.1)

  > * Create LICENSE

### [ocrd_keraslm](https://github.com/OCR-D/ocrd_keraslm) [dd78976](https://github.com/OCR-D/ocrd_keraslm/commits/dd78976)..[759805b](https://github.com/OCR-D/ocrd_keraslm/commits/759805b)

> Release: [v0.4.1](https://github.com/OCR-D/ocrd_keraslm/releases/v0.4.1)

  > * Updated config.yml
  > * Dockerfile: forgot to cp makefile
  > * CD: fix syntax
  > * add CD via Dockerhub
  > * docker: defer to makefile for TF1 recipe
  > * CI: try to fix ocrd/tesserocr TESSDATA_PREFIX
  > * add dockerfile
  > * improve augmentation and modes:
  > * vectorize: fix final batch if stateless and steps>1 during training

### [ocrd_olena](https://github.com/OCR-D/ocrd_olena) [c1f7cab](https://github.com/OCR-D/ocrd_olena/commits/c1f7cab)..[4d4aded](https://github.com/OCR-D/ocrd_olena/commits/4d4aded)

> Release: [v1.6.0](https://github.com/OCR-D/ocrd_olena/releases/v1.6.0)

  > * :package: v1.6.0
  > * Dockerfile: Be explicit about the source image repository
  > * Set docker metadata with makefile
  > * Dockerfile: Adhere to spec
  > * Base dockerfile on concrete core version

### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [ebc7e1f](https://github.com/OCR-D/ocrd_segment/commits/ebc7e1f)..[3993139](https://github.com/OCR-D/ocrd_segment/commits/3993139)

> Release: [v0.1.22](https://github.com/OCR-D/ocrd_segment/releases/v0.1.22)

  > * README.md: add CircleCI badge
  > * README.md: add Dockerhub badge
  > * Merge pull request #66 from joschrew/dockerfile

### [ocrd_tesserocr](https://github.com/OCR-D/ocrd_tesserocr) [f1036e3](https://github.com/OCR-D/ocrd_tesserocr/commits/f1036e3)..[08a020f](https://github.com/OCR-D/ocrd_tesserocr/commits/08a020f)

> Release: [v0.18.0](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.18.0)

  > * :package: v0.18.0
  > * ci/gha: checkout git submodules, too
  > * conftest: simplify workspace fixtures
  > * ci: make deps-test for coverage
  > * convert tests to pytest, make coverage works again
  > * CD: depends on subrepos, too
  > * docker build depends on subrepos, too
  > * Merge pull request #197 from joschrew/dockerfile-update

### [tesseract](https://github.com/tesseract-ocr/tesseract) [8ee020e](https://github.com/tesseract-ocr/tesseract/commits/8ee020e)..[becd395](https://github.com/tesseract-ocr/tesseract/commits/becd395)

> Release: [5.3.4](https://github.com/tesseract-ocr/tesseract/releases/5.3.4)

  > * Merge pull request #4189 from sjbronner/main
  > * Merge pull request #4188 from softwaretirol/main

### [tesserocr](https://github.com/sirfz/tesserocr) [94c8b73](https://github.com/sirfz/tesserocr/commits/94c8b73)..[1f960e9](https://github.com/sirfz/tesserocr/commits/1f960e9)

> Release: [v2.6.2](https://github.com/sirfz/tesserocr/releases/v2.6.2)

  > * mentioned about the version dependencies
  > * Clarified the comments for tesserdata path

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [f54c91a](https://github.com/bertsky/workflow-configuration/commits/f54c91a)..[cb0ef1a](https://github.com/bertsky/workflow-configuration/commits/cb0ef1a)

> Release: [0.1.3](https://github.com/bertsky/workflow-configuration/releases/0.1.3)

  > * add page-remove-textequiv.xsl


## [v2024-01-31](https://github.com/OCR-D/ocrd_all/releases/v2024-01-31)

### [cor-asv-fst](https://github.com/ASVLeipzig/cor-asv-fst) [076e04e](https://github.com/ASVLeipzig/cor-asv-fst/commits/076e04e)..[4211371](https://github.com/ASVLeipzig/cor-asv-fst/commits/4211371)

  > * Merge pull request #4 from stweil/master

### [core](https://github.com/OCR-D/core) [ac1f15b](https://github.com/OCR-D/core/commits/ac1f15b)..[b94b185](https://github.com/OCR-D/core/commits/b94b185)

> Release: [v2.62.0](https://github.com/OCR-D/core/releases/v2.62.0)

  > * reenable circle because docker failed to build on ghcr.io
  > * :package: v2.62.0
  > * {pypi,build}-workaround: missed a commit, s/get_distribution(...).version/dist_version(...)
  > * Merge branch 'circle-to-gha'
  > * :memo: changelog
  > * Merge branch 'master' into ocrd-tool-json-root
  > * expose ocrd-tool.json for ocrd-dummy in root like processors
  > * :package: v2.60.3
  > * :memo: changelog
  > * Fix --editable install for setuptools>=64, setuptools#3548
  > * :package: v2.60.2
  > * :memo: changelog
  > * Merge pull request #1161 from OCR-D/logging-downgrade-level
  > * Merge pull request #1160 from OCR-D/is-oai-content-loglevel-debug

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [f077ce2](https://github.com/qurator-spk/dinglehopper/commits/f077ce2)..[f8e3108](https://github.com/qurator-spk/dinglehopper/commits/f8e3108)

> Release: [v0.9.4](https://github.com/qurator-spk/dinglehopper/releases/v0.9.4)

  > * 🚧 GitLab CI Test: Push after pulling
  > * 🚧 GitLab CI Test: Trigger only on default branch (and do not hardcode it)
  > * 🚧 GitLab CI Test
  > * 🔍 ruff: Remove ignore configuration, we use multimethods in a compatible way now
  > * ⚙ pre-commit: Update hooks
  > * 🚧 GitLab CI Test
  > * 🔍 mypy: Use an almost strict mypy configuration, and fix any issues
  > * 🔍 mypy: Use a compatible syntax for multimethod
  > * 🔍 mypy: Remove ExtractedText.segments converter
  > * 🔍 mypy: Avoid using check() for all attr validators
  > * 🔍 mypy: Make cli.process() typed so mypy checks it (and issues no warning)
  > * Merge branch 'pr103'
  > * ⚙ Update ruff+mypy dependencies
  > * ⚙ pre-commit: Update hooks
  > * ⬆ Move on to supporting Python >= 3.8 only
  > * 🐛 Use typing.List instead of list, for Python <3.9
  > * 🐛 Use Optional instead of | none, for Python <3.10
  > * ⚙ pre-commit: Update hooks
  > * 🐛 Fix generating word differences
  > * ⚙ pre-commit: Update hooks
  > * Merge branch 'master' of https://github.com/qurator-spk/dinglehopper
  > * Merge branch 'master' into performance
  > * ⬆ Update uniseg dependency
  > * ❎ Make joining grapheme clusters more robust by checking joiner and handling an empty joiner
  > * 🐛 Fix score_hint call in cli_line_dirs
  > * 🐛 Fix docstring of distance() for grapheme clusters
  > * 🐛 Fix calculation of score_hint for edge cases, e.g. when CER is infinite
  > * 🕸Do not use deprecated ID, pageId options
  > * ✔ Add mets:FLocat's @LOCTYPE/OTHERLOCTYPE to test data
  > * ⬆ Update multimethod dependency
  > * 🐛 Update tests for ExtractedText
  > * use uniseg again
  > * update rapidfuzz version
  > * replace uniseg with uniseg2
  > * apply black
  > * move grapheme clusters to ExtractedText
  > * remove python2.7 futures
  > * remove unused includes
  > * only call `words_normalized` once

### [eynollah](https://github.com/qurator-spk/eynollah) [706433c](https://github.com/qurator-spk/eynollah/commits/706433c)..[032a99e](https://github.com/qurator-spk/eynollah/commits/032a99e)

> Release: [v0.2.0](https://github.com/qurator-spk/eynollah/releases/v0.2.0)

  > * adapt to OcrdFile.local_filename now :Path
  > * adapt to ocrd>=2.54 url vs local_filename

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [c5f0c52](https://github.com/OCR-D/ocrd_fileformat/commits/c5f0c52)..[ba79de9](https://github.com/OCR-D/ocrd_fileformat/commits/ba79de9)

> Release: [v0.10.0](https://github.com/OCR-D/ocrd_fileformat/releases/v0.10.0)

  > * :package: v0.10.0
  > * :memo: changelog
  > * Update ocr-fileformat to include UB-Mannheim/ocr-fileformat#172
  > * Merge branch 'fix-textract2page'
  > * update ocr-fileformat to latest
  > * Update ocr-fileformat to v0.6.0

### [ocrd_repair_inconsistencies](https://github.com/qurator-spk/ocrd_repair_inconsistencies) [cf879c1](https://github.com/qurator-spk/ocrd_repair_inconsistencies/commits/cf879c1)..[94c482f](https://github.com/qurator-spk/ocrd_repair_inconsistencies/commits/94c482f)

  > * 🕸 README: Mention archival of the project

### [opencv-python](https://github.com/skvark/opencv-python) [7cfd1ee](https://github.com/skvark/opencv-python/commits/7cfd1ee)..[8ad8ec1](https://github.com/skvark/opencv-python/commits/8ad8ec1)

> Release: [80](https://github.com/skvark/opencv-python/releases/80)

  > * Merge branch 'as/4.9.0-readme-update' into 4.x
  > * Merge pull request #941 from asmorkalov/as/mac_m1_venv_for_test
  > * Merge pull request #940 from asmorkalov:as/donation
  > * Merge pull request #938 from asmorkalov"as/4.9.0-pre
  > * Merge pull request #934 from asmorkalov/as/native_mac_m1_runner
  > * Merge pull request #936 from asmorkalov:as/mac_intel_update
  > * Merge pull request #932 from asmorkalov/as/pre-4.9.0_linux_upgrade
  > * Merge pull request #931 from asmorkalov:as/ipp_icv_license
  > * Merge pull request #904 from asmorkalov:as/python_3.12
  > * Merge pull request #927 from dkurt:try_enable_dependents

### [sbb_binarization](https://github.com/qurator-spk/sbb_binarization) [f3c6ac8](https://github.com/qurator-spk/sbb_binarization/commits/f3c6ac8)..[b89ec49](https://github.com/qurator-spk/sbb_binarization/commits/b89ec49)

> Release: [v0.1.0](https://github.com/qurator-spk/sbb_binarization/releases/v0.1.0)

  > * Merge pull request #65 from rettinghaus/update-tests

### [tesseract](https://github.com/tesseract-ocr/tesseract) [ea0b245](https://github.com/tesseract-ocr/tesseract/commits/ea0b245)..[8ee020e](https://github.com/tesseract-ocr/tesseract/commits/8ee020e)

> Release: [5.3.4](https://github.com/tesseract-ocr/tesseract/releases/5.3.4)

  > * Create new release 5.3.4
  > * Set User-Agent: header field in HTTP request for curl downloads
  > * Merge pull request #4178 from sadra-barikbin/patch-1
  > * Merge pull request #4174 from stweil/warnings

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [cbc3234](https://github.com/bertsky/workflow-configuration/commits/cbc3234)..[f54c91a](https://github.com/bertsky/workflow-configuration/commits/f54c91a)

> Release: [0.1.3](https://github.com/bertsky/workflow-configuration/releases/0.1.3)

  > * ocrd-page-transform: local_filename instead of url
  > * ocrd-page-transform: fix unbound variable


## [v2023-12-15](https://github.com/OCR-D/ocrd_all/releases/v2023-12-15)

### [core](https://github.com/OCR-D/core) [742906e](https://github.com/OCR-D/core/commits/742906e)..[ac1f15b](https://github.com/OCR-D/core/commits/ac1f15b)

> Release: [v2.60.1](https://github.com/OCR-D/core/releases/v2.60.1)

  > * :package: v2.60.1
  > * docker: we need .git during build for setuptools_scm
  > * :memo: changelog
  > * Merge branch 'git-versioning'
  > * :memo: changelog
  > * defaults for mets_basename and mets_server_url
  > * Merge branch 'master' of https://github.com/OCR-D/core
  > * :memo: changelog
  > * ocrd workpace list-page: ignore files without pageId, fix #1148

## [v2023-12-07](https://github.com/OCR-D/ocrd_all/releases/v2023-12-07)

### [core](https://github.com/OCR-D/core) [d8c5813](https://github.com/OCR-D/core/commits/d8c5813)..[742906e](https://github.com/OCR-D/core/commits/742906e)

> Release: [v2.59.1](https://github.com/OCR-D/core/releases/v2.59.1)

  > * :package: v2.59.1
  > * :memo: changelog
  > * Merge pull request #1142 from OCR-D/fix-ws-locks
  > * :memo: changelog
  > * fix ranges, use numpy
  > * :package: v2.59.0
  > * :memo: changelog
  > * Merge branch 'network-workflow-api'
  > * :memo: changelog
  > * Merge pull request #1139 from OCR-D/bagger-filegrp-filter
  > * :memo: changelog
  > * Merge branch 'list-page-extended'
  > * :memo: changelog
  > * Merge pull request #1136 from OCR-D/network-processor-api
  > * :memo: changelog
  > * bagger: fallback to ID-derived filename to avoid filename conflicts
  > * test bagger: sample workflow with conflicting basenames
  > * bagger test: rewrite as pytest
  > * :memo: changelog
  > * Merge pull request #1134 from OCR-D/page-update
  > * :memo: changelog
  > * Merge branch 'update-apidocs'
  > * OcrdMets: remove dead code __exit__ method, #1130

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [dbaccdd](https://github.com/qurator-spk/dinglehopper/commits/dbaccdd)..[f077ce2](https://github.com/qurator-spk/dinglehopper/commits/f077ce2)

> Release: [v0.9.4](https://github.com/qurator-spk/dinglehopper/releases/v0.9.4)

  > * 🐛 dinglehopper-summarize: Handle reports without difference stats
  > * Merge pull request #97 from qurator-spk/clean-remove-six-dep-again
  > * Merge pull request #96 from qurator-spk/test-on-pr-but-really
  > * Merge pull request #94 from qurator-spk/test-on-pr
  > * Merge pull request #93 from qurator-spk/update-dep-multimethod
  > * Merge pull request #92 from qurator-spk/update-pre-commit
  > * Merge pull request #91 from qurator-spk/test-remove-circleci
  > * Merge pull request #90 from qurator-spk/test-on-python-3.12
  > * ✔ Add mets:FLocat's @LOCTYPE/OTHERLOCTYPE to test data

### [format-converters](https://github.com/OCR-D/format-converters) [9615db1](https://github.com/OCR-D/format-converters/commits/9615db1)..[fa8b4b5](https://github.com/OCR-D/format-converters/commits/fa8b4b5)

  > * Merge pull request #24 from stweil/orientation
  > * Merge pull request #18 from stweil/rotate
  > * Merge pull request #23 from stweil/TextEquivNone
  > * Merge pull request #22 from stweil/image
  > * Merge pull request #19 from stweil/page_version
  > * Merge pull request #21 from stweil/image_dimensions
  > * Merge pull request #20 from stweil/close_statement
  > * Merge pull request #17 from stweil/update

### [ocrd_calamari](https://github.com/OCR-D/ocrd_calamari) [c0a4dfd](https://github.com/OCR-D/ocrd_calamari/commits/c0a4dfd)..[ad8febd](https://github.com/OCR-D/ocrd_calamari/commits/ad8febd)

> Release: [v1.0.6](https://github.com/OCR-D/ocrd_calamari/releases/v1.0.6)

  > * ⚙ pre-commit: update config (using pre-commit-update hook)
  > * 🎨 Remove extra whitespace in CircleCI confg
  > * ✔ CircleCI: Update codecov orb
  > * Merge pull request #102 from OCR-D/review-test-base
  > * Merge pull request #106 from OCR-D/setup-update-description
  > * ✔ CircleCI: Try to fix caching of pip cache
  > * Merge pull request #107 from OCR-D/circleci-pip-cache-1
  > * Merge pull request #101 from OCR-D/use-ruff-config-like-dinglehoppers
  > * Merge pull request #100 from OCR-D/fix/set-default-MODEL-for-bare-pytest
  > * 🐛 Fix importing + exporting test.base.assets
  > * 🐛 pre-commit/mypy: Install missing types-setuptools depedency
  > * 🧹 Remove unused exports (done by ruff --fix .)
  > * 🛠Add pre-commit configuration
  > * 🐛 Require ocrd >= 2.54.0 for tf_disable_interactive_logs
  > * ✒ README: Minor changes
  > * ✒ README: Fix and simplify example instructions
  > * 🎨 Reformat using Black + ruff
  > * 🧹 Remove protobuf restriction (→ calamari-ocr 1.0.6 has it now)
  > * Merge pull request #78 from mikegerber/test-python-3.11
  > * 💩 Add a script fix-calamari1-model to fix regexen in 1.0 models
  > * ✒ README: Wrap long line
  > * 🧹 Remove workaround for fixed np.str problem in Calamari

### [ocrd_neat](https://github.com/qurator-spk/page2tsv) [0f64f07](https://github.com/qurator-spk/page2tsv/commits/0f64f07)..[2f7d01c](https://github.com/qurator-spk/page2tsv/commits/2f7d01c)

> Release: [v0.0.1](https://github.com/qurator-spk/page2tsv/releases/v0.0.1)

  > * fix alto2tsv bug
  > * Merge pull request #15 from stweil/typo
  > * Merge pull request #14 from stweil/gitignore
  > * add alto2tsv

### [ocrd_pagetopdf](https://github.com/UB-Mannheim/ocrd_pagetopdf) [7368f51](https://github.com/UB-Mannheim/ocrd_pagetopdf/commits/7368f51)..[24f77d3](https://github.com/UB-Mannheim/ocrd_pagetopdf/commits/24f77d3)

> Release: [v1.1.0](https://github.com/UB-Mannheim/ocrd_pagetopdf/releases/v1.1.0)

  > * Use first bash from PATH (allows running on macOS)
  > * Merge pull request #23 from kba/mets-server-url-support

### [tesseract](https://github.com/tesseract-ocr/tesseract) [dc228ed](https://github.com/tesseract-ocr/tesseract/commits/dc228ed)..[ea0b245](https://github.com/tesseract-ocr/tesseract/commits/ea0b245)

> Release: [5.3.3](https://github.com/tesseract-ocr/tesseract/releases/5.3.3)

  > * Update status badge for GitHub workflow sw (add missing line break)
  > * Update status badge for GitHub workflow sw
  > * Correct indefinite articles before vowels
  > * Update issue-bug.yml
  > * Merge pull request #4162 from tfmorris/3000-tcp-scrollview
  > * Avoid conversions from std::string to char* to std::string
  > * Remove unnecessary conversions from std::string to C string
  > * Remove whitespace at line endings
  > * Update sw.yml
  > * Update README.md
  > * Update sw.yml
  > * Fail on curl download errors
  > * Add new parameter curl_cookiefile for curl_easy_setopt
  > * ci: Fix clang build for Ubuntu 22.04
  > * ci: Allow manual trigger of unittest
  > * Move bail_out function before libtoolize check
  > * Merge pull request #4150 from tfmorris/4149-directory-to-stdout

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [d0d208c](https://github.com/bertsky/workflow-configuration/commits/d0d208c)..[cbc3234](https://github.com/bertsky/workflow-configuration/commits/cbc3234)

  > * add page-ensure-textequiv-conf.xsl
  > * add page-rename-id-clashes.xsl
  > * PAGE CLIs: allow combining --pretty and --diff
  > * new pair of XSLTs: un/flatten table cells
  > * require ocrd >= 2.58.1
  > * require ocrd >= 2.58
  > * ocrd-page-transform: support --mets-server-url


## [v2023-10-20](https://github.com/OCR-D/ocrd_all/releases/v2023-10-20)

### [core](https://github.com/OCR-D/core) [caa7ac3](https://github.com/OCR-D/core/commits/caa7ac3)..[d8c5813](https://github.com/OCR-D/core/commits/d8c5813)

> Release: [v2.58.1](https://github.com/OCR-D/core/releases/v2.58.1)

  > * :package: v2.58.1
  > * :memo: changelog
  > * bashlib: set empty string as default value for ocrd__argv[mets_server_url], OCR-D/olena#95
  > * :package: v2.58.0
  > * :memo: changelog
  > * Merge pull request #1127 from OCR-D/fix-bashlib-log3
  > * :memo: changelog
  > * ocrd workspace bulk-add now supports --mets-server-url
  > * bashlib: short option -U for --mets-server-url
  > * :memo: changelog
  > * Merge remote-tracking branch 'origin/fix-bashlib-log2'
  > * :memo: changelog
  > * Merge branch 'mets-server-reload'
  > * :memo: changelog
  > * Merge pull request #1121 from OCR-D/fix-bashlib-log

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [7364265](https://github.com/OCR-D/ocrd_fileformat/commits/7364265)..[c5f0c52](https://github.com/OCR-D/ocrd_fileformat/commits/c5f0c52)

> Release: [v0.9.1](https://github.com/OCR-D/ocrd_fileformat/releases/v0.9.1)

  > * update ocr-fileformat to include UB-Mannheim/ocr-fileformat#171
  > * :package: v0.9.1
  > * :memo: changelog
  > * require ocrd >= 2.58.1
  > * :package: v0.9.0
  > * :memo: changelog
  > * require ocrd >= 2.58
  > * Support --mets-server-url; get local_filename not url

### [ocrd_im6convert](https://github.com/OCR-D/ocrd_im6convert) [105697f](https://github.com/OCR-D/ocrd_im6convert/commits/105697f)..[db18917](https://github.com/OCR-D/ocrd_im6convert/commits/db18917)

> Release: [v0.1.1](https://github.com/OCR-D/ocrd_im6convert/releases/v0.1.1)

  > * :package: v0.1.1
  > * :memo: changelog
  > * require ocrd >= 2.58.1
  > * :package: v0.1.0
  > * :memo: changelog
  > * minversion must be MAJOR.MINOR.PATCH
  > * require ocrd >= 2.58
  > * add --mets-server-url support

### [ocrd_olena](https://github.com/OCR-D/ocrd_olena) [a2e2520](https://github.com/OCR-D/ocrd_olena/commits/a2e2520)..[c1f7cab](https://github.com/OCR-D/ocrd_olena/commits/c1f7cab)

> Release: [v1.5.0](https://github.com/OCR-D/ocrd_olena/releases/v1.5.0)

  > * :package: v1.5.0
  > * :memo: changelog
  > * require ocrd >= 2.58.1
  > * debug
  > * minversion must be MAJOR.MINOR.PATCH
  > * require ocrd >= 2.58
  > * support --mets-server-url

### [ocrd_pagetopdf](https://github.com/UB-Mannheim/ocrd_pagetopdf) [4f4a330](https://github.com/UB-Mannheim/ocrd_pagetopdf/commits/4f4a330)..[7368f51](https://github.com/UB-Mannheim/ocrd_pagetopdf/commits/7368f51)

> Release: [v1.0.0](https://github.com/UB-Mannheim/ocrd_pagetopdf/releases/v1.0.0)

  > * require ocrd >= 2.58.1
  > * require ocrd >= 2.58
  > * Use local_filename, not url
  > * restore $zeros assignment
  > * Support --mets-server-url

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [f574f82](https://github.com/bertsky/workflow-configuration/commits/f574f82)..[d0d208c](https://github.com/bertsky/workflow-configuration/commits/d0d208c)

> Release: [0.1.3](https://github.com/bertsky/workflow-configuration/releases/0.1.3)

  > * require ocrd >= 2.58
  > * ocrd-page-transform: support --mets-server-url


## [v2023-10-18](https://github.com/OCR-D/ocrd_all/releases/v2023-10-18)

### [core](https://github.com/OCR-D/core) [3b0307a](https://github.com/OCR-D/core/commits/3b0307a)..[caa7ac3](https://github.com/OCR-D/core/commits/caa7ac3)

> Release: [v2.57.2](https://github.com/OCR-D/core/releases/v2.57.2)

  > * :package: v2.57.2
  > * :memo: changelog
  > * Merge pull request #1120 from OCR-D/fix-1119
  > * :package: v2.57.1
  > * ci: typo in circle config
  > * :package: v2.57.0
  > * :memo: changelog
  > * Merge pull request #1117 from OCR-D/logging-2023-10-18
  > * Merge pull request #1118 from OCR-D/circleci-tag-docker
  > * :memo: changelog
  > * Merge pull request #1116 from OCR-D/network-log-refactoring

### [opencv-python](https://github.com/skvark/opencv-python) [ca13925](https://github.com/skvark/opencv-python/commits/ca13925)..[7cfd1ee](https://github.com/skvark/opencv-python/commits/7cfd1ee)

> Release: [78](https://github.com/skvark/opencv-python/releases/78)

  > * Merge pull request #907 from dkurt:patch-1
  > * Merge pull request #905 from asmorkalov/as/docker_update_python3.12


## [v2023-10-17](https://github.com/OCR-D/ocrd_all/releases/v2023-10-17)

### [cor-asv-ann](https://github.com/ASVLeipzig/cor-asv-ann) [006a70e](https://github.com/ASVLeipzig/cor-asv-ann/commits/006a70e)..[4216c16](https://github.com/ASVLeipzig/cor-asv-ann/commits/4216c16)

> Release: [v0.1.14](https://github.com/ASVLeipzig/cor-asv-ann/releases/v0.1.14)

  > * adapt to Numpy deprecations
  > * CI: use ocrd/core-cuda as base image
  > * CI: dummy venv
  > * CI: use proper tab character
  > * CI: clone first
  > * CI: mkdir first
  > * CI: chdir to tmp location
  > * CI: use /tmp for aux clone of ocrd_all
  > * try getting tensorflow-gpu from Nvidia
  > * use proper URLs for submodules
  > * Merge pull request #6 from kba/init-report-dict
  > * evaluate: skip pages with no results

### [core](https://github.com/OCR-D/core) [de08453](https://github.com/OCR-D/core/commits/de08453)..[3b0307a](https://github.com/OCR-D/core/commits/3b0307a)

> Release: [v2.56.0](https://github.com/OCR-D/core/releases/v2.56.0)

  > * :package: v2.56.0
  > * :memo: changelog
  > * Merge branch 'network-log-refactoring'
  > * :package: v2.55.2
  > * :memo: changelog
  > * :bug: pydantic fields must not start with underscore
  > * :package: v2.55.1
  > * :memo: changelog
  > * Merge pull request #1113 from OCR-D/bulk-add-url-local-filename
  > * :package: v2.55.0
  > * :memo: changelog
  > * Merge branch 'workflow-endpoint'
  > * :memo: changelog
  > * generate_page_range: verify single-page range based on start
  > * generate_page_range: warn, not raise, if start==end, fix #1106
  > * :memo: changelog
  > * logging: remove custom logging in ocrd_network, use explicit logger name
  > * logging remove hard-coded setLevel in decorators/ocrd_network
  > * helpers.ruin_processor: setOverrideLogLevel if log_level is provided
  > * ocrd log: default to ocrd.log_cli logger name
  > * METS Server: add basic logging of operations
  > * logging: use ocrd.{utils,models,exif} not ocrd_{utils,models,exif}
  > * ocrd_utils.logging.getLogger: no more initLogging
  > * :memo: changelog
  > * Merge branch 'master' into mets-server-fixes-2023-09-15
  > * mets server: remove socket file on shutdown
  > * mets server: do the chmod before server start, not before connection
  > * :memo: changelog
  > * METS server: make socket world-readable/-writable
  > * :package: v2.54.0
  > * Merge pull request #1095 from OCR-D/run-cli-mets-server-url
  > * :memo: changelog
  > * Merge branch 'revise-logging'
  > * Merge pull request #1093 from OCR-D/create-default-queue
  > * Merge pull request #1080 from OCR-D/revise-logging
  > * bashlib: fix --help output
  > * :memo: changelog
  > * Merge branch 'keep-remote-links'
  > * :memo: changelog
  > * downgrade ValueError to log.warning about inconsistent pageId for processor calls
  > * Merge branch 'master' into warn-empty-page
  > * raise ValueError if --page-id is provided but leads to empty result
  > * :memo: changelog
  > * Merge pull request #1069 from OCR-D/processing_server_ext_1046
  > * Merge branch 'mets-server'
  > * :memo: changelog
  > * ci: localhost -> 127.0.0.1
  > * pin requests < 2.30, OCR-D/core#1082
  > * mets server: forbid local/remote workspace with different directories
  > * mets server: allow both local_filename and url to be None
  > * Merge branch 'master' into mets-server
  > * mets server: test both UDS and TCP variant
  > * ClientSideOcrdFile et al need url too
  > * pass mets_server_url from run_processor
  > * typo: -{,-}mets-server-url
  > * move ClientSideOcrd{Agent,File} to ocrd_models
  > * METS server: support -U for processor options
  > * workspace server start: pass workspace context
  > * mets server: single option --mets-server-url/-U
  > * mets server will never pass content to workspace.add_file
  > * mets server: no content will pass through it
  > * mets server: clean up is_remote muddle
  > * mets server: support unique_identifier
  > * mets server: __str__ handlers
  > * mets server: provide fallback for non-wrapped OcrdFile methods
  > * mets server: remove XXX HACK comments, they are not;
  > * mets server: improve docs
  > * mets server: add stop
  > * Update ocrd/ocrd/cli/workspace.py
  > * ocrd workspace CLI: reference METS server option
  > * METS server: consistently use local_filename
  > * Update ocrd/ocrd/cli/workspace.py
  > * METS Server: equivalent functionality to files for agents
  > * finish implementation / test mets server
  > * Merge remote-tracking branch 'origin/master' into mets-server
  > * workspace: save content to file only if not remote
  > * Merge branch 'mets-server' of https://github.com/kba/ocrd-core into mets-server
  > * mets_server: file search/adding on /file not /
  > * mets_server: missed mimetype kwarg
  > * mets_server: different loggers for socket/host-port
  > * Merge branch 'mets-server' of https://github.com/kba/ocrd-core into mets-server
  > * mets_server: replace Model constructor with static create calls
  > * --port must be int
  > * resolver: shorten mets_server_{host,port} check
  > * mets_server: only save_mets on PUT and DELETE
  > * OcrdWorkspace.is_remote should be a bool
  > * ClientSideOcrdMets: fix signature of self.file_groups
  > * mets-server: bashlib should take same args
  > * remove noise from makefile
  > * slowly but determinedly
  > * getting there
  > * .
  > * wip

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [0fd4ea1](https://github.com/qurator-spk/dinglehopper/commits/0fd4ea1)..[dbaccdd](https://github.com/qurator-spk/dinglehopper/commits/dbaccdd)

> Release: [v0.9.4](https://github.com/qurator-spk/dinglehopper/releases/v0.9.4)

  > * ✒ README: Minor whitespace cleanup
  > * ✒ README: Recommend installing via pip and from PyPI
  > * 📦 v0.9.4
  > * 🎨 editorconfig: *.json should have a final newline
  > * 🧹 pyproject: Remove extra *.json
  > * 🧹 Remove empty setup.cfg
  > * 📦 v0.9.3
  > * 🐛 Remove MANIFEST.in workaround, now that setuptools_ocrd is fixed
  > * 📦 v0.9.2
  > * 🧹 .gitignore dist/
  > * 🐛 Workaround sdist not containing top-level ocrd-tool.json
  > * ⚙ GitHub Actions: Call test workflow when (before) deploying
  > * 🎨 Release: Make installing setuptools-ocrd conditional on ocrd-tool.json
  > * 🐛 Release: Try fixing getting the version (install setuptools-ocrd)
  > * 📦 v0.9.1
  > * ✒ README: Update badges
  > * Revert "🚧 GitHub Actions: Try testing on Python 3.12"
  > * 🚧 GitHub Actions: Try testing on Python 3.12
  > * 🚧 GitHub Actions/CircleCI: Remove testing from CircleCI config
  > * 🚧 GitHub Actions: Do no try installing ruff on Python 3.6
  > * 🚧 GitHub Actions: Do no try installing pytest-ruff on Python 3.6
  > * 🚧 GitHub Actions: Avoid compiling OpenCV and NumPy on Python 3.6
  > * 🚧 GitHub Actions: Fix testing for Python 3.6
  > * 🚧 GitHub Actions: Disable matrix fail-fast
  > * 🚧 GitHub Actions: Test on multiple Python versions
  > * 🚧 GitHub Actions: Test report
  > * 🚧 GitHub Actions: Try shell for loop to install from all requirements*.txt
  > * 🚧 GitHub Actions: Rework test, run in src/
  > * 🚧 GitHub Actions: Allow running test manually
  > * 🚧 GitHub Actions: Rename test workflow, also run on schedule
  > * 🚧 GitHub Actions: Add test worklow
  > * 🚧 GitHub Actions: Add release workflow
  > * 🧹 Make dinglehopper.* exports explicit
  > * ⚙ ruff: Ignore F811 (no redefinitions) for now, as ruff considers the multimethods redefinitions
  > * 🎨 Reformat comments + strings manually (not auto-fixed by Black)
  > * ⬆ Use f-strings
  > * 🎨 Reformat using Black
  > * 🎨 Sort imports (auto-fixed by ruff)
  > * ⚙ Add pre-commit
  > * 🛠 Replace flake8 + pylint with ruff
  > * ⚙ Move mypy settings to pyproject.toml
  > * ⚙ pytest.ini → pyproject.toml
  > * 🐛 Detect encoding (incl BOM) when reading files
  > * 🐛 Move source into src/ to fix install
  > * ⚙ Migrate to pyproject.toml
  > * 🚧 CircleCI: Run black
  > * Merge pull request #83 from INL/feat/batch-processing
  > * Merge pull request #82 from CircleCI-config-suggestions-bot/StoreTestResults
  > * 🧹 .gitignore .python-version (for pyenv)
  > * 🧹 Remove qurator. namespace prefix
  > * 🐛 Fix installing by calling find_namespace_packages in setup.py
  > * 🕸Do not use deprecated ID, pageId options
  > * 🔧 Remove explicit namespace_packages
  > * ✔ CircleCI: Explicitly install binary opencv-python-headless (dep of OCR-D?) to avoid compilation
  > * 🐛 Remove deprecated declare_namespace call

### [nmalign](https://github.com/bertsky/nmalign) [cf7c60f](https://github.com/bertsky/nmalign/commits/cf7c60f)..[7832c90](https://github.com/bertsky/nmalign/commits/7832c90)

> Release: [v0.0.3](https://github.com/bertsky/nmalign/releases/v0.0.3)

  > * adapt to Numpy deprecations

### [ocrd_calamari](https://github.com/OCR-D/ocrd_calamari) [3a029ca](https://github.com/OCR-D/ocrd_calamari/commits/3a029ca)..[c0a4dfd](https://github.com/OCR-D/ocrd_calamari/commits/c0a4dfd)

> Release: [v1.0.6](https://github.com/OCR-D/ocrd_calamari/releases/v1.0.6)

  > * Merge pull request #90 from OCR-D/tf_disable_interactive_logs
  > * ✒ README: Use backtick syntax for code block
  > * ✔ CircleCI: Do not test on Python 3.6 anymore (EOL since 2021-12-23)
  > * v1.0.6
  > * 🐛 Fix installation by keeping protobuf < 4.0

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [43a356a](https://github.com/cisocrgroup/ocrd_cis/commits/43a356a)..[fcc02fd](https://github.com/cisocrgroup/ocrd_cis/commits/fcc02fd)

> Release: [v0.1.5](https://github.com/cisocrgroup/ocrd_cis/releases/v0.1.5)

  > * adapt to Numpy and Pillow deprecations
  > * segment: fix baseline extraction
  > * segment: adapt to OpenCV changes
  > * resegment (baseline/ccomps): improve handling of fg conflicts
  > * resegment: add param baseline_only
  > * check_page/region/line: skip assumptions on number of components
  > * adapt to Shapely 2.0 deprecations
  > * adapt to Numpy 1.24 dtypes
  > * resegment: list instead of generator
  > * re/segment: improve polygon simplification
  > * re/segment: join_baselines: skip lines outside of polygon
  > * re/segment: join_baselines: for complex subtypes, apply recursively
  > * re/segment: join_polygons: connect touching neighbours, too

### [ocrd_detectron2](https://github.com/bertsky/ocrd_detectron2) [04bf4c6](https://github.com/bertsky/ocrd_detectron2/commits/04bf4c6)..[a8402d8](https://github.com/bertsky/ocrd_detectron2/commits/a8402d8)

> Release: [v0.1.8](https://github.com/bertsky/ocrd_detectron2/releases/v0.1.8)

  > * Merge pull request #28 from bertsky/pillow-workaround
  > * allow running build
  > * :package: v0.1.8
  > * set page pcGtsId from file ID
  > * update model URLs to GH release archive
  > * requirements.txt: avoid pkg names in comments
  > * requirements.txt: add pycocotools as explicit dependency
  > * require wheel (since pip does not pull it anymore)
  > * deps: no build isolation so Detectron2 compilation can use Torch
  > * Docker: add badges and basic description
  > * Docker username: vars, not env
  > * Docker: use underscore in tagname, alright
  > * add Dockerfile and GH Action to publish at Dockerhub and GHCR

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [4e7e0de](https://github.com/OCR-D/ocrd_fileformat/commits/4e7e0de)..[cfb24ec](https://github.com/OCR-D/ocrd_fileformat/commits/cfb24ec)

> Release: [v0.8.0](https://github.com/OCR-D/ocrd_fileformat/releases/v0.8.0)

  > * :package: v0.8.0
  > * :memo: changelog
  > * Update ocr-fileformat
  > * :package: v0.7.0
  > * update ocr-fileformat

### [ocrd_keraslm](https://github.com/OCR-D/ocrd_keraslm) [9e3f5a0](https://github.com/OCR-D/ocrd_keraslm/commits/9e3f5a0)..[dd78976](https://github.com/OCR-D/ocrd_keraslm/commits/dd78976)

> Release: [v0.4.1](https://github.com/OCR-D/ocrd_keraslm/releases/v0.4.1)

  > * CI: download deu-frak tessdata via resmgr
  > * adapt to numpy deprecations

### [ocrd_kraken](https://github.com/OCR-D/ocrd_kraken) [1e71324](https://github.com/OCR-D/ocrd_kraken/commits/1e71324)..[bdbe6fc](https://github.com/OCR-D/ocrd_kraken/commits/bdbe6fc)

> Release: [v0.3.1](https://github.com/OCR-D/ocrd_kraken/releases/v0.3.1)

  > * Merge pull request #42 from OCR-D/fixing-tests
  > * CI: disable Python 3.10 and 3.11 tests
  > * CI: drop 3.6 and 3.7, try 3.10 and 3.11
  > * :package: 0.3.1
  > * Merge pull request #38 from bertsky/fix-recognize-coords

### [ocrd_olena](https://github.com/OCR-D/ocrd_olena) [dbef534](https://github.com/OCR-D/ocrd_olena/commits/dbef534)..[a2e2520](https://github.com/OCR-D/ocrd_olena/commits/a2e2520)

> Release: [v1.4.0](https://github.com/OCR-D/ocrd_olena/releases/v1.4.0)

  > * :package: v1.4.0
  > * require ocrd >= 2.55.2
  > * require ocrd >= 2.55.1
  > * update assets
  > * :memo: changelog
  > * require ocrd >= 2.55.0
  > * Merge branch 'url-to-local_filename'
  > * :memo: changelog
  > * Merge remote-tracking branch 'stweil/travis'
  > * :memo: changelog
  > * Update olena to include OCR-D/olena#8
  > * Merge pull request #90 from stweil/license

### [ocrd_pagetopdf](https://github.com/UB-Mannheim/ocrd_pagetopdf) [6155605](https://github.com/UB-Mannheim/ocrd_pagetopdf/commits/6155605)..[4f4a330](https://github.com/UB-Mannheim/ocrd_pagetopdf/commits/4f4a330)

> Release: [v1.0.0](https://github.com/UB-Mannheim/ocrd_pagetopdf/releases/v1.0.0)

  > * Merge pull request #22 from bertsky/fix-input-files

### [ocrd_repair_inconsistencies](https://github.com/qurator-spk/ocrd_repair_inconsistencies) [c898d6c](https://github.com/qurator-spk/ocrd_repair_inconsistencies/commits/c898d6c)..[cf879c1](https://github.com/qurator-spk/ocrd_repair_inconsistencies/commits/cf879c1)

  > * Merge pull request #13 from stweil/master

### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [3c63e21](https://github.com/OCR-D/ocrd_segment/commits/3c63e21)..[ebc7e1f](https://github.com/OCR-D/ocrd_segment/commits/ebc7e1f)

> Release: [v0.1.22](https://github.com/OCR-D/ocrd_segment/releases/v0.1.22)

  > * Merge pull request #65 from M3ssman/feat/extend-readme
  > * adapt to Numpy deprecations
  > * replace-text: fall back to file ID if no matches for page ID in glob results
  > * :package: 0.1.22
  > * set page pcGtsId from file ID

### [ocrd_tesserocr](https://github.com/OCR-D/ocrd_tesserocr) [09d1e13](https://github.com/OCR-D/ocrd_tesserocr/commits/09d1e13)..[f1036e3](https://github.com/OCR-D/ocrd_tesserocr/commits/f1036e3)

> Release: [v0.17.0](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.17.0)

  > * require OCR-D/core >= 2.53
  > * CI: allow triggering Docker deploy manually
  > * Dockerfile: just use module location from apt (but make writable)
  > * Dockerfile: mirror res data location to module location

### [ocrd_wrap](https://github.com/bertsky/ocrd_wrap) [63c04d5](https://github.com/bertsky/ocrd_wrap/commits/63c04d5)..[2cd800d](https://github.com/bertsky/ocrd_wrap/commits/2cd800d)

> Release: [v0.1.8](https://github.com/bertsky/ocrd_wrap/releases/v0.1.8)

  > * :package: 0.1.8
  > * Merge pull request #10 from bertsky/update-numpy

### [opencv-python](https://github.com/skvark/opencv-python) [6b73d90](https://github.com/skvark/opencv-python/commits/6b73d90)..[ca13925](https://github.com/skvark/opencv-python/commits/ca13925)

> Release: [78](https://github.com/skvark/opencv-python/releases/78)

  > * Update to OpenCV 4.8.1.
  > * Merge pull request #882 from engnadeau/docs/readme-toc
  > * Merge pull request #870 from asmorkalov/as/typing_runtime
  > * Merge pull request #865 from asmorkalov/as/3rdparty_license_update
  > * Merge pull request #866 from asmorkalov/as/dist_location
  > * Merge pull request #864 from asmorkalov/as/opencv_4.8.0
  > * Merge pull request #831 from henryiii/patch-1
  > * Merge pull request #862 from asmorkalov/as/deps_update
  > * Merge pull request #853 from asmorkalov/as/add_pyi_to_package
  > * Merge pull request #849 from asmorkalov/as/python3_for_build
  > * Fix: numpy version for python 3.11 (#839)
  > * Merge pull request #852 from asmorkalov:as/ci_check
  > * Merge pull request #837 from bertsky/fix-py38-build
  > * Merge pull request #838 from henryiii/patch-2

### [sbb_binarization](https://github.com/qurator-spk/sbb_binarization) [39ef3fd](https://github.com/qurator-spk/sbb_binarization/commits/39ef3fd)..[f3c6ac8](https://github.com/qurator-spk/sbb_binarization/commits/f3c6ac8)

> Release: [v0.1.0](https://github.com/qurator-spk/sbb_binarization/releases/v0.1.0)

  > * Update test.yml
  > * :package: v0.1.0
  > * Update README.md
  > * update CI badge
  > * Merge pull request #59 from bertsky/change-model-url
  > * Merge pull request #56 from bertsky/non-verbose

### [tesseract](https://github.com/tesseract-ocr/tesseract) [1569e50](https://github.com/tesseract-ocr/tesseract/commits/1569e50)..[dc228ed](https://github.com/tesseract-ocr/tesseract/commits/dc228ed)

> Release: [5.3.3](https://github.com/tesseract-ocr/tesseract/releases/5.3.3)

  > * Update cmake-win64.yml
  > * Create new release 5.3.3
  > * Fix loading of sublangs (regression)
  > * Update SVPopupMenu.java
  > * Update SVImageHandler.java
  > * Update SVEventHandler.java
  > * Update ScrollView.java
  > * Update test submodule
  > * Fix regression in layout detection since 5.0.0 (fixes issue #4014)
  > * Fix typo in stepblob.h
  > * initDSProfile: correct std::vector usage (#4124)
  > * sw.yml: Remove Ubuntu 20.04
  > * Update autotools.yml
  > * Update cmake.yml
  > * fix typos
  > * add missing commas
  > * fix citation links
  > * Merge pull request #4115 from stweil/citations
  > * Optimize function ImageFind::FindImages
  > * Fix comment for function UNICHARSET::set_black_and_whitelist
  > * Fix comment for function HOcrEscape
  > * Fix comment
  > * Provide more disk space for GitHub action unittest
  > * Update ScrollView.java
  > * cmake: check_leptonica_tiff_support() works with cmake>=3.25
  > * Remove whitespace at line endings
  > * Merge pull request #4097 from UB-Mannheim/main
  > * Merge pull request #4099 from pkubaj/patch-1
  > * Merge pull request #4098 from hesmar/main
  > * Create new release 5.3.2
  > * Fix typos
  > * Update issue-bug.yml
  > * Update .mailmap
  > * Create config.yml
  > * Remove old broken GitHub action vcpkg-4.1.1 (fixes issue #4078)
  > * cmake: check if leptonica was build with tiff support
  > * cmake: provide info about disabled LibArchive and CURL
  > * cmake: allow to disable tiff (-DDISABLE_TIFF=ON)
  > * Merge pull request #4073 from stweil/osd
  > * Merge pull request #4071 from stweil/clean
  > * Merge pull request #4066 from stweil/lstmtraining
  > * Merge pull request #4068 from stweil/sprintf
  > * Remove unused code in function fix_rep_char
  > * Merge pull request #4067 from stweil/misc
  > * Support for Sgaw and W Pwo Karen languages in the Myanmar validator. (#4065)
  > * issue-bug.yml:  Windows versions 7, 8, 8.1 are not supported anymore
  > * snap: Update from leptonica 1.74.2 to latest 1.83.1
  > * fix: Fix snap package building
  > * Create new release 5.3.1
  > * Remove whitespace at line endings
  > * Fix issue #4010 (#4041)
  > * cmake: add missing HAVE_NEON to config_auto.h
  > * Merge branch 'main' of https://github.com/tesseract-ocr/tesseract
  > * cmake: adjust build to autotool settings
  > * Merge branch 'main' of https://github.com/tesseract-ocr/tesseract
  > * cmake: improve NEON build

### [tesserocr](https://github.com/sirfz/tesserocr) [e184c62](https://github.com/sirfz/tesserocr/commits/e184c62)..[94c8b73](https://github.com/sirfz/tesserocr/commits/94c8b73)

> Release: [v2.6.2](https://github.com/sirfz/tesserocr/releases/v2.6.2)

  > * updated cython dependency + version bump
  > * add aarch64 wheels
  > * wheels: use tesseract 5.3.3
  > * Add Python 3.12 wheels
  > * Added github actions build badge
  > * upper limit on Cython < 3 (for the time being)
  > * add github-workflow building wheels

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [cb923f7](https://github.com/bertsky/workflow-configuration/commits/cb923f7)..[f574f82](https://github.com/bertsky/workflow-configuration/commits/f574f82)

> Release: [0.1.3](https://github.com/bertsky/workflow-configuration/releases/0.1.3)

  > * :package: 0.1.3
  > * ocrd-page-transform: add MetadataItem for tool params and version
  > * ocrd-page-transform: set pc:Page/@pcGtsId to output mets:file/@ID
  > * ocrd-import: add option --regex (positive path selector)
  > * ocrd-import: fix skipping in subshell
  > * add METS transforms to TOC
  > * generalise standalone CLI for both PAGE and METS XSL, update documentation
  > * mets-copy-agents.xsl: make path for other-mets relative to input mets (not stylesheet file)
  > * (ocrd-)page-transform: add pretty-printing option
  > * add page-ensure-readingorder.xsl
  > * add page-ensure-textequiv-index.xsl
  > * ocrd-import: also replace comma in IDs
  > * Merge remote-tracking branch 'origin/master'
  > * page-textequiv-*: ensure target TextEquiv exists


## [v2023-06-28](https://github.com/OCR-D/ocrd_all/releases/v2023-06-28)

Changed:

  * Bash prompt excludes user name undefined in docker container, #376, #366
  * Docker: `ocrd-all-tool.json` is built during container build, #379
  * Docker: `XDG_CONFIG_HOME` is set to `XDG_DATA_HOME/ocrd-resources`, so `resources.yml` is in usually-mounted location, #377, #252
  * Docker: `/data` is world-writeable now, so log files can be written there, #377, #252

### [core](https://github.com/OCR-D/core) [6708624](https://github.com/OCR-D/core/commits/6708624)..[552cfcd](https://github.com/OCR-D/core/commits/552cfcd)

> Release: [v2.52.0](https://github.com/OCR-D/core/releases/v2.52.0)

  > * Dockerfile: install wheel before make install
  > * :package: v2.52.0
  > * :memo: changelog
  > * ci: debug macos
  > * Makefile: PIP_INSTALL from environment via ?=
  > * ci: try fixing macos
  > * Merge branch 'master' into improve-packaging
  > * Makefile: trailing whitespace
  > * update gitignore
  > * add ocrd.processor.builtin.dummy pkg (needed for resource discovery)
  > * add requirements.txt to manifest (so it's available at build time)
  > * make pypi: use build module instead of setuptools CLI
  > * make uninstall: run in reverse BUILD_ORDER
  > * make install: run conjunctively in BUILD_ORDER

### [ocrd_calamari](https://github.com/OCR-D/ocrd_calamari) [3a029ca](https://github.com/OCR-D/ocrd_calamari/commits/3a029ca)..[ed7a926](https://github.com/OCR-D/ocrd_calamari/commits/ed7a926)

> Release: [v1.0.6](https://github.com/OCR-D/ocrd_calamari/releases/v1.0.6)

  > * v1.0.6
  > * 🐛 Fix installation by keeping protobuf < 4.0

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [a0ea0a2](https://github.com/cisocrgroup/ocrd_cis/commits/a0ea0a2)..[43a356a](https://github.com/cisocrgroup/ocrd_cis/commits/43a356a)

> Release: [v0.1.5](https://github.com/cisocrgroup/ocrd_cis/releases/v0.1.5)

  > * postcorrect: improve/update OCR-D wrapper…
  > * ocropy-train: improve/update OCR-D wrapper…
  > * ocrd-tool: rm old ocrd-cis-ocropy-rec (gone in 9e20991)
  > Merge branch 'kba:typo' #91 into fix-alpha-shape
  > Merge branch 'kba:double-page-max-size' #96 into fix-alpha-shape
  > Merge branch 'kba:resolve-resources' #83 into fix-alpha-shape

### [ocrd_detectron2](https://github.com/bertsky/ocrd_detectron2) [04bf4c6](https://github.com/bertsky/ocrd_detectron2/commits/04bf4c6)..[5f8bdcb](https://github.com/bertsky/ocrd_detectron2/commits/5f8bdcb)

> Release: [v0.1.7](https://github.com/bertsky/ocrd_detectron2/releases/v0.1.7)

  > * update model URLs to GH release archive
  > * requirements.txt: avoid pkg names in comments
  > * requirements.txt: add pycocotools as explicit dependency
  > * require wheel (since pip does not pull it anymore)
  > * deps: no build isolation so Detectron2 compilation can use Torch
  > * Docker: add badges and basic description
  > * Docker username: vars, not env
  > * Docker: use underscore in tagname, alright
  > * add Dockerfile and GH Action to publish at Dockerhub and GHCR

### [ocrd_kraken](https://github.com/OCR-D/ocrd_kraken) [b13dd8a](https://github.com/OCR-D/ocrd_kraken/commits/b13dd8a)..[1e71324](https://github.com/OCR-D/ocrd_kraken/commits/1e71324)

> Release: [v0.3.0](https://github.com/OCR-D/ocrd_kraken/releases/v0.3.0)

  > * recognize: ignore 'one_channel_mode' unless model has 1 input channel
  > * segment/recognize: warn if no GPU available

### [ocrd_repair_inconsistencies](https://github.com/qurator-spk/ocrd_repair_inconsistencies) [c898d6c](https://github.com/qurator-spk/ocrd_repair_inconsistencies/commits/c898d6c)..[cf879c1](https://github.com/qurator-spk/ocrd_repair_inconsistencies/commits/cf879c1)

  > * Merge pull request #13 from stweil/master

### [opencv-python](https://github.com/skvark/opencv-python) [474a1cc](https://github.com/skvark/opencv-python/commits/474a1cc)..[b534ea2](https://github.com/skvark/opencv-python/commits/b534ea2)

> Release: [72](https://github.com/skvark/opencv-python/releases/72)

  > * Merge pull request #853 from asmorkalov/as/add_pyi_to_package


### [sbb_binarization](https://github.com/qurator-spk/sbb_binarization) [010ec99](https://github.com/qurator-spk/sbb_binarization/commits/010ec99)..[f3c6ac8](https://github.com/qurator-spk/sbb_binarization/commits/f3c6ac8)

> Release: [v0.1.0](https://github.com/qurator-spk/sbb_binarization/releases/v0.1.0)

  > * Update test.yml

### [tesseract](https://github.com/tesseract-ocr/tesseract) [1569e50](https://github.com/tesseract-ocr/tesseract/commits/1569e50)..[bb8803a](https://github.com/tesseract-ocr/tesseract/commits/bb8803a)

> Release: [5.3.1](https://github.com/tesseract-ocr/tesseract/releases/5.3.1)

  > * Update .mailmap
  > * Create config.yml
  > * Remove old broken GitHub action vcpkg-4.1.1 (fixes issue #4078)
  > * cmake: check if leptonica was build with tiff support
  > * cmake: provide info about disabled LibArchive and CURL
  > * cmake: allow to disable tiff (-DDISABLE_TIFF=ON)
  > * Merge pull request #4073 from stweil/osd
  > * Merge pull request #4071 from stweil/clean
  > * Merge pull request #4066 from stweil/lstmtraining
  > * Merge pull request #4068 from stweil/sprintf
  > * Remove unused code in function fix_rep_char
  > * Merge pull request #4067 from stweil/misc
  > * Support for Sgaw and W Pwo Karen languages in the Myanmar validator. (#4065)
  > * issue-bug.yml:  Windows versions 7, 8, 8.1 are not supported anymore
  > * snap: Update from leptonica 1.74.2 to latest 1.83.1
  > * fix: Fix snap package building
  > * Create new release 5.3.1
  > * Remove whitespace at line endings
  > * Fix issue #4010 (#4041)
  > * cmake: add missing HAVE_NEON to config_auto.h
  > * Merge branch 'main' of https://github.com/tesseract-ocr/tesseract
  > * cmake: adjust build to autotool settings
  > * Merge branch 'main' of https://github.com/tesseract-ocr/tesseract
  > * cmake: improve NEON build

### [tesserocr](https://github.com/sirfz/tesserocr) [e184c62](https://github.com/sirfz/tesserocr/commits/e184c62)..[3c9519b](https://github.com/sirfz/tesserocr/commits/3c9519b)

> Release: [v2.6.0](https://github.com/sirfz/tesserocr/releases/v2.6.0)

  > * add github-workflow building wheels


## [v2023-06-14](https://github.com/OCR-D/ocrd_all/releases/v2023-06-12)

Changed:

  * All docker images now contain git checkouts and retain `/build`, i.e. behave like the `-git` variants
  * No more git updates within docker build, but fix git module dependency outside
  * Reduce docker image size (by reinstating all-in-one layer, removing cache, avoiding duplicate CUDA libraries...)
  * Use `git submodule update --single-branch` on CI to reduce docker image size

Added:

  * `make deps-cuda`: non-intrusively support CUDA system dependencies (in docker or native)
  * `make ocrd-all-tool.json`: Generate and upload a combination of all processors' `ocrd-tool.json`, #362
  * `make test-workflow`: Run a workflow with most processors as a general smoke test
  * `make test-cuda`: to test whether CUDA properly set up and has GPU available
  * `make test-core`: Run OCR-D/core unit tests

Fixed:

  * dependencies between modules, esp. with custom `OCRD_MODULES` selection
  * editable mode (`pip install -e`)
  * OpenCV build
  * get `tesserocr` from PyPI if disabled as a module
  * get `ocrd` from PyPI if core disabled as a module
  * consistent interoperable module versions (esp. Numpy/OpenCV/Shapely/Protobuf/Torch/TF Python dependencies)

### [cor-asv-ann](https://github.com/ASVLeipzig/cor-asv-ann) [006a70e](https://github.com/ASVLeipzig/cor-asv-ann/commits/006a70e)..[2c4b1ff](https://github.com/ASVLeipzig/cor-asv-ann/commits/2c4b1ff)

> Release: [v0.1.14](https://github.com/ASVLeipzig/cor-asv-ann/releases/v0.1.14)

  > * CI: use ocrd/core-cuda as base image
  > * CI: dummy venv
  > * CI: use proper tab character
  > * CI: clone first
  > * CI: mkdir first
  > * CI: chdir to tmp location
  > * CI: use /tmp for aux clone of ocrd_all
  > * try getting tensorflow-gpu from Nvidia
  > * use proper URLs for submodules
  > * Merge pull request #6 from kba/init-report-dict
  > * evaluate: skip pages with no results

### [core](https://github.com/OCR-D/core) [de08453](https://github.com/OCR-D/core/commits/de08453)..[6708624](https://github.com/OCR-D/core/commits/6708624)

> Release: [v2.51.0](https://github.com/OCR-D/core/releases/v2.51.0)

  > * Merge pull request #1055 from bertsky/deps-cuda
  > * ci: disable upterm for gh actions
  > * readme: remove dockerhub/travis badge, add GH actions badge
  > * debug gh actions
  > * test bashlib: /usr/bin/env bash instead of /bin/bash
  > * test_workspace_bagger: use ocr-d.de instead of google.com for testing
  > * disable logging tests until properly fixed
  > * docker-image: reuse local ghcr.io image instead of docker.io
  > * :package: v2.51.0
  > * :memo: changelog
  > * make help: improve description
  > * Revert "Merge remote-tracking branch 'hnesk/no-more-pkg_resources' into release-2.36.0"
  > * remove out-dated processor resources
  > * docker-cuda: improve (reduce size) again…
  > * docker-cuda: rewrite…
  > * core-cuda: use same CUDA libs as needed for Torch anyway
  > * Merge branch 'pr-1008' into reduce-cuda
  > * Merge branch 'master' of https://github.com/OCR-D/core into reduce-cuda
  > * make install on py36: revert to prefer-binary via install
  > * make install on py36: fix prefer-binary syntax
  > * make install on py36: prefer binary OpenCV/Numpy via pip config instead of preinstall
  > * core-cuda: install more CUDA libs via pip and ld.so.conf, simplify Dockerfile for that
  > * core-cuda: use CUDA 11.8, install cuDNN via pip and make available system-wide via ld.so.conf
  > * reinstate workaround for shapely, but more robust
  > * docker-cuda: change base image, no multi-CUDA runtimes
  > * keep gcc, no autoremove
  > * rehash after pip upgrade
  > * give up workaround for shapely-CUDA issue

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [0fd4ea1](https://github.com/qurator-spk/dinglehopper/commits/0fd4ea1)..[35be58c](https://github.com/qurator-spk/dinglehopper/commits/35be58c)

  > * Merge pull request #83 from INL/feat/batch-processing
  > * Merge pull request #82 from CircleCI-config-suggestions-bot/StoreTestResults
  > * 🧹 .gitignore .python-version (for pyenv)
  > * 🧹 Remove qurator. namespace prefix
  > * 🐛 Fix installing by calling find_namespace_packages in setup.py
  > * 🕸Do not use deprecated ID, pageId options
  > * 🔧 Remove explicit namespace_packages
  > * ✔ CircleCI: Explicitly install binary opencv-python-headless (dep of OCR-D?) to avoid compilation
  > * 🐛 Remove deprecated declare_namespace call

### [eynollah](https://github.com/qurator-spk/eynollah) [ea792d1](https://github.com/qurator-spk/eynollah/commits/ea792d1)..[706433c](https://github.com/qurator-spk/eynollah/commits/706433c)

> Release: [v0.2.0](https://github.com/qurator-spk/eynollah/releases/v0.2.0)

  > * Revert "Merge pull request #97 from qurator-spk/420-namespace-package"
  > * Merge pull request #100 from bertsky/patch-2
  > * Merge pull request #97 from qurator-spk/420-namespace-package

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [c90b29f](https://github.com/cisocrgroup/ocrd_cis/commits/c90b29f)..[a0ea0a2](https://github.com/cisocrgroup/ocrd_cis/commits/a0ea0a2)

> Release: [v0.1.5](https://github.com/cisocrgroup/ocrd_cis/releases/v0.1.5)

  > * Merge branch 'kba:typo' #91 into fix-alpha-shape
  > * Merge branch 'kba:double-page-max-size' #96 into fix-alpha-shape
  > * Merge branch 'kba:resolve-resources' #83 into fix-alpha-shape
  > * segment: adapt to OpenCV changes
  > * resegment (baseline/ccomps): improve handling of fg conflicts
  > * resegment: add param baseline_only
  > * check_page/region/line: skip assumptions on number of components
  > * adapt to Shapely 2.0 deprecations
  > * adapt to Numpy 1.24 dtypes
  > * resegment: list instead of generator
  > * re/segment: improve polygon simplification
  > * re/segment: join_baselines: skip lines outside of polygon
  > * re/segment: join_baselines: for complex subtypes, apply recursively
  > * re/segment: join_polygons: connect touching neighbours, too

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [dacfa50](https://github.com/OCR-D/ocrd_fileformat/commits/dacfa50)..[4e7e0de](https://github.com/OCR-D/ocrd_fileformat/commits/4e7e0de)

> Release: [v0.7.0](https://github.com/OCR-D/ocrd_fileformat/releases/v0.7.0)

  > * :package: v0.7.0
  > * update ocr-fileformat

### [ocrd_kraken](https://github.com/OCR-D/ocrd_kraken) [802c6b0](https://github.com/OCR-D/ocrd_kraken/commits/802c6b0)..[b13dd8a](https://github.com/OCR-D/ocrd_kraken/commits/b13dd8a)

> Release: [v0.3.0](https://github.com/OCR-D/ocrd_kraken/releases/v0.3.0)

  > * segment/recognize: default to device=cuda:0 (now backed by safe fall-back)
  > * segment/recognize: fall back to CPU if no CUDA device
  > * fix typo
  > * update changelog
  > * recognize: project text upwards in order by concatenation
  > * recognize: ensure baseline/boundary are consistent
  > * recognize: ignore invalid baselines
  > * setup metadata: update/improve
  > * deps-ubuntu: update
  > * improve/update readme
  > * Dockerfile: use CUDA base image, improve labels
  > * update changelog
  > * recognize: pass lines in baseline format if any baselines are annotated
  > * update blla.model URL (master→main)
  > * recognize: workaround for empty/failed line records
  > * recognize: workaround for better quality box cuts
  > * recognize: avoid invalid polygons on single-glyph words
  > * Revert "recognize: avoid invalid polygons on single-glyph words"
  > * segment: also show tags/type prediction
  > * recognize: avoid invalid polygons on single-glyph words
  > * recognize: use proper data structures of rpred

### [ocrd_pagetopdf](https://github.com/UB-Mannheim/ocrd_pagetopdf) [6155605](https://github.com/UB-Mannheim/ocrd_pagetopdf/commits/6155605)..[4f4a330](https://github.com/UB-Mannheim/ocrd_pagetopdf/commits/4f4a330)

> Release: [v1.0.0](https://github.com/UB-Mannheim/ocrd_pagetopdf/releases/v1.0.0)

  > * Merge pull request #22 from bertsky/fix-input-files

### [ocrd_wrap](https://github.com/bertsky/ocrd_wrap) [63c04d5](https://github.com/bertsky/ocrd_wrap/commits/63c04d5)..[2cd800d](https://github.com/bertsky/ocrd_wrap/commits/2cd800d)

> Release: [v0.1.8](https://github.com/bertsky/ocrd_wrap/releases/v0.1.8)

  > * :package: 0.1.8
  > * Merge pull request #10 from bertsky/update-numpy

### [opencv-python](https://github.com/skvark/opencv-python) [6b73d90](https://github.com/skvark/opencv-python/commits/6b73d90)..[474a1cc](https://github.com/skvark/opencv-python/commits/474a1cc)

> Release: [72](https://github.com/skvark/opencv-python/releases/72)

  > * Merge pull request #849 from asmorkalov/as/python3_for_build
  > * Fix: numpy version for python 3.11 (#839)
  > * Merge pull request #852 from asmorkalov:as/ci_check
  > * Merge pull request #837 from bertsky/fix-py38-build
  > * Merge pull request #838 from henryiii/patch-2

### [sbb_binarization](https://github.com/qurator-spk/sbb_binarization) [39ef3fd](https://github.com/qurator-spk/sbb_binarization/commits/39ef3fd)..[010ec99](https://github.com/qurator-spk/sbb_binarization/commits/010ec99)

> Release: [v0.1.0](https://github.com/qurator-spk/sbb_binarization/releases/v0.1.0)

  > * :package: v0.1.0
  > * Update README.md
  > * update CI badge
  > * Merge pull request #59 from bertsky/change-model-url
  > * Merge pull request #56 from bertsky/non-verbose

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [cb923f7](https://github.com/bertsky/workflow-configuration/commits/cb923f7)..[5aff777](https://github.com/bertsky/workflow-configuration/commits/5aff777)

  > * ocrd-import: add option --regex (positive path selector)
  > * ocrd-import: fix skipping in subshell
  > * add METS transforms to TOC
  > * generalise standalone CLI for both PAGE and METS XSL, update documentation
  > * mets-copy-agents.xsl: make path for other-mets relative to input mets (not stylesheet file)
  > * (ocrd-)page-transform: add pretty-printing option
  > * add page-ensure-readingorder.xsl
  > * add page-ensure-textequiv-index.xsl
  > * ocrd-import: also replace comma in IDs
  > * Merge remote-tracking branch 'origin/master'
  > * page-textequiv-*: ensure target TextEquiv exists


## [v2023-03-24](https://github.com/OCR-D/ocrd_all/releases/v2023-03-24)

Fixed:

  * Run `make check` only once per virtual environment,  #20

### [core](https://github.com/OCR-D/core) [cbe83ab](https://github.com/OCR-D/core/commits/cbe83ab)..[de08453](https://github.com/OCR-D/core/commits/de08453)

> Release: [v2.49.0](https://github.com/OCR-D/core/releases/v2.49.0)

  > * :package v2.49.0
  > * :memo: changelog
  > * drop eynollah model from resource list, provided by eynollah itself
  > * :memo: changelog
  > * rename Docker image (to make work with GHCR)
  > * :package: v2.48.1
  > * :memo: changelog
  > * core-cuda: CUDA 11.3 instead of 11.2
  > * ocrd_tool_validator: fix link in comment, fix #1019
  > * :package: v2.48.0
  > * :memo: changelog
  > * Merge remote-tracking branch 'origin/build36-speedup-without-update'
  > * :memo: changelog
  > * Merge branch 'master' into fix-972
  > * Set ws outside the constructor
  > * chdir to ws in the beginning
  > * Undo the revert of getcwd()
  > * Revert getcwd() location - failing tests
  > * Raise the error instead of returning it
  > * Change getcwd() call location
  > * Chdir before processor.process() calls
  > * Fix the instance caching
  > * :package: v2.47.4
  > * :memo: changelog
  > * Merge pull request #1011 from OCR-D/drop-fontgroup-resources
  > * :package: v2.47.3
  > * :memo: changelog
  > * Dockerfile: reintroduce python3-pip so "pip install -U pip" succeeds again
  > * :package: v2.47.2
  > * :memo: changelog
  > * Merge branch 'pr/986'
  > * :package: v2.47.1
  > * :memo: changelog
  > * Merge pull request #1004 from stweil/fix-dockerfile
  > * Merge pull request #1003 from OCR-D/fix-docker-venv
  > * :package: v2.47.0
  > * require importlib_resources for python <= 3.8, #996
  > * :memo: changelog
  > * resmgr: drop anybaseocr models from resource list
  > * :memo: changelog
  > * Merge branch 'pr/999'
  > * :memo: changelog
  > * ocrd_utils: adapt to newer importlib.resources API
  > * Merge pull request #994 from OCR-D/fix-scrutinizer
  > * :memo: changelog
  > * Merge pull request #977 from OCR-D/fix-add-agent
  > * :memo: changelog
  > * Merge branch 'pr/993'
  > * :memo: changelog
  > * Merge pull request #991 from bertsky/fix-resmgr-download-mimetype
  > * :memo: changelog
  > * Merge pull request #985 from OCR-D/fix-917
  > * :package: v2.46.0
  > * :memo: changelog
  > * Merge branch 'drop-3.6'
  > * :memo: changelog
  > * Merge branch 'drop-mime-magic'
  > * :memo: changelog
  > * Merge branch 'pr/980'
  > * :memo: changelog
  > * Merge branch 'pr/981'
  > * :memo: changelog
  > * Merge pull request #972 from OCR-D/ref-processor-helper
  > * :memo: changelog
  > * Merge pull request #979 from OCR-D/workspace-validator-empty-pageid
  > * :memo: changelog
  > * Merge pull request #978 from OCR-D/bashlib-inputfiles

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [c4ab7c9](https://github.com/qurator-spk/dinglehopper/commits/c4ab7c9)..[0fd4ea1 (rewind)](https://github.com/qurator-spk/dinglehopper/commits/0fd4ea1 (rewind))

  > * ✔ Add @cneud's former 40 GB problem files to the test suite
  > * 🎨 Reformat using Black
  > * ✔ CircleCI: Test on Python 3.11

### [eynollah](https://github.com/qurator-spk/eynollah) [13bc237](https://github.com/qurator-spk/eynollah/commits/13bc237)..[ea792d1](https://github.com/qurator-spk/eynollah/commits/ea792d1)

> Release: [v0.2.0](https://github.com/qurator-spk/eynollah/releases/v0.2.0)

  > * :package: v0.2.0
  > * :memo: changelog
  > * Merge remote-tracking branch 'bertsky/savedmodel-format'
  > * :package: v0.1.0
  > * :memo: changelog
  > * Update config.yml (#90)
  > * Merge pull request #88 from emresvd/patch-1
  > * Update config.yml (#89)

### [ocrd_anybaseocr](https://github.com/OCR-D/ocrd_anybaseocr) [94e5037](https://github.com/OCR-D/ocrd_anybaseocr/commits/94e5037)..[5978a1f](https://github.com/OCR-D/ocrd_anybaseocr/commits/5978a1f)

> Release: [v1.9.0](https://github.com/OCR-D/ocrd_anybaseocr/releases/v1.9.0)

  > * Merge pull request #97 from stweil/master
  > * :package: v1.9.0
  > * :memo: changelog
  > * move remaining resources to GWDG S3
  > * block-segmentation: parameter "th" should be number
  > * add resources to ocrd-tool.json, #98

### [ocrd_calamari](https://github.com/OCR-D/ocrd_calamari) [c7ad6eb](https://github.com/OCR-D/ocrd_calamari/commits/c7ad6eb)..[3a029ca](https://github.com/OCR-D/ocrd_calamari/commits/3a029ca)

> Release: [v1.0.5](https://github.com/OCR-D/ocrd_calamari/releases/v1.0.5)

  > * ✔ Do not test on Python 3.11 for now (unsupported)
  > * ✔ CircleCI: Install TF by explicitly invoking pip on Py 3.11
  > * ✔ Do not delete test workspace when DEBUG env variable is set
  > * ✔ CircleCI: Test on Python 3.11, too
  > * ✔ CircleCI: Install binary OpenCV for Python 3.6
  > * Revert "✔ CircleCI: Do not test on Python 3.6 anymore"
  > * ✔ CircleCI: Do not test on Python 3.6 anymore
  > * ✔ Fix tests to use the new filenames
  > * 🐛 Fix NumPy dependency (hopefully...)
  > * 🐛 Fix syntax error in setup.py
  > * 🐛  Require NumPy < 1.24 due to np.str deprecation/error

### [ocrd_detectron2](https://github.com/bertsky/ocrd_detectron2) [e005d3c](https://github.com/bertsky/ocrd_detectron2/commits/e005d3c)..[04bf4c6](https://github.com/bertsky/ocrd_detectron2/commits/04bf4c6)

> Release: [v0.1.7](https://github.com/bertsky/ocrd_detectron2/releases/v0.1.7)

  > * publish: commit images, too
  > * CI: publish test results to gh-pages
  > * add link for test results
  > * Delete jekyll-gh-pages.yml
  > * try to fix gh-pages
  > * add GH pages
  > * doc: add CI badge
  > * CI: use cache instead of artifacts for models
  > * CI: try to get the damn conditional to work
  > * CI: use stupid GHA negation syntax
  > * CI: fix action URL
  > * CI: fix negation
  > * CI: cache detectron models via artifacts
  > * Merge branch 'master' of ssh://github.com/bertsky/ocrd_detectron2
  > * some workarounds for broken model configs
  > * :package: 0.1.7
  > * add CLI test
  > * add models for magazine layout by Jambo-sudo (PubLayNet+custom GT) and LayoutParser (PRImA Layout GT)
  > * adapt to numpy v1.24
  > * :package: 0.1.6
  > * add fixture for badly written config files (base path)
  > * add models for table detection with Psarpei/Multi-Type-TD-TSR
  > * ocrd-tool resources: update/fix
  > * make deps: add torch deps explicitly
  > * avoid colon in generated region IDs

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [5022408](https://github.com/OCR-D/ocrd_fileformat/commits/5022408)..[dacfa50](https://github.com/OCR-D/ocrd_fileformat/commits/dacfa50)

> Release: [v0.6.2](https://github.com/OCR-D/ocrd_fileformat/releases/v0.6.2)

  > * :package: v0.6.2
  > * :memo: changelog
  > * Merge pull request #44 from bertsky/patch-3

### [ocrd_keraslm](https://github.com/OCR-D/ocrd_keraslm) [787341d](https://github.com/OCR-D/ocrd_keraslm/commits/787341d)..[9c50478](https://github.com/OCR-D/ocrd_keraslm/commits/9c50478)

> Release: [v0.4.1](https://github.com/OCR-D/ocrd_keraslm/releases/v0.4.1)

  > * deps: hold numpy and h5py

### [ocrd_tesserocr](https://github.com/OCR-D/ocrd_tesserocr) [515be8d](https://github.com/OCR-D/ocrd_tesserocr/commits/515be8d)..[09d1e13](https://github.com/OCR-D/ocrd_tesserocr/commits/09d1e13)

> Release: [v0.17.0](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.17.0)

  > * try with lowercase image tag
  > * rename Docker image
  > * Update docker-image.yml
  > * Create docker-image.yml
  > * :package: 0.17.0
  > * Merge pull request #191 from bertsky/override-insteadof-wrap
  > * deps-ubuntu: allow PPA to fail (on newer distributions)
  > * CI: chmod PPA Tesseract tessdata g+w
  > * deps-ubuntu: allow PPA to fail (on newer distributions)
  > * CI: fix conditional step syntax
  > * CI: seems to require sudo
  > * CI: speedup Py36 deps
  > * CI: update+simplify (on cimg/python:* instead of ocrd/core)

### [ocrd_typegroups_classifier](https://github.com/OCR-D/ocrd_typegroups_classifier) [ffa40fc](https://github.com/OCR-D/ocrd_typegroups_classifier/commits/ffa40fc)..[a78a85f](https://github.com/OCR-D/ocrd_typegroups_classifier/commits/a78a85f)

> Release: [v0.5.0](https://github.com/OCR-D/ocrd_typegroups_classifier/releases/v0.5.0)

  > * :package: v0.5.0
  > * :memo: changelog
  > * Merge pull request #15 from OCR-D/ocrd-tool-resources
  > * :memo: changelog
  > * Merge pull request #14 from OCR-D/textline-level

### [opencv-python](https://github.com/skvark/opencv-python) [736b905](https://github.com/skvark/opencv-python/commits/736b905)..[6b73d90](https://github.com/skvark/opencv-python/commits/6b73d90)

> Release: [72](https://github.com/skvark/opencv-python/releases/72)

  > * Merge pull request #820 from asmorkalov/as/config_py_path
  > * Merge pull request #803 from asmorkalov/as/license
  > * Merge pull request #790 from asmorkalov/as/docs_update
  > * Merge pull request #787 from asmorkalov/as/migrate_mac_m1
  > * Merge pull request #744 from peter-kovacs-aimotive/add-vulkan-license
  > * Merge pull request #768 from AlexeySalmin/patch-1
  > * Merge pull request #776 from TheCleric/fix/numpy_version_mac

### [sbb_binarization](https://github.com/qurator-spk/sbb_binarization) [aeb6804](https://github.com/qurator-spk/sbb_binarization/commits/aeb6804)..[39ef3fd](https://github.com/qurator-spk/sbb_binarization/commits/39ef3fd)

> Release: [v0.0.11](https://github.com/qurator-spk/sbb_binarization/releases/v0.0.11)

  > * Merge pull request #54 from qurator-spk/circleci-python37_38

### [tesseract](https://github.com/tesseract-ocr/tesseract) [a6e0aa7](https://github.com/tesseract-ocr/tesseract/commits/a6e0aa7)..[1569e50](https://github.com/tesseract-ocr/tesseract/commits/1569e50)

> Release: [5.3.0](https://github.com/tesseract-ocr/tesseract/releases/5.3.0)

  > * textord: Catch empty rows in block iterator (fixes #4039)
  > * cmake: sync with autotools (OPENMP_SIMD, fast-math)
  > * cmake: improve style
  > * cmake: disable "-march=native" by default
  > * Update issue-bug.yml
  > * autotools.yml: Update compilers
  > * Update cmake.yml
  > * cmake.yml: Update compilers
  > * Improve the DebugDump output by slightly adjusting the format. (#4022)
  > * Link to list of supported languages in docs (#4027)
  > * Update autotools.yml
  > * Update cmake.yml
  > * Merge branch 'main' of https://github.com/tesseract-ocr/tesseract
  > * cmake: fix gcc-7 fatal error: filesystem: No such file or directory
  > * Fix some typos in comments (found by codespell)
  > * Merge pull request #4015 from stweil/spelling
  > * Update cmake-win64.yml
  > * Merge pull request #4013 from ferdnyc/patch-1
  > * msvc debug: fix wrong lib name in generated pkgconfig file (#4008)
  > * Merge pull request #4009 from kraj/gcc13
  > * Merge pull request #4006 from autoantwort/fix-linkage
  > * Fix FP division by zero in LanguageModel::ExtractFeaturesFromPath (issue #3995)
  > * Remove unneeded type cast in LanguageModel::ExtractFeaturesFromPath

### [tesserocr](https://github.com/sirfz/tesserocr) [3bfa7d9](https://github.com/sirfz/tesserocr/commits/3bfa7d9)..[e184c62](https://github.com/sirfz/tesserocr/commits/e184c62)

> Release: [v2.6.0](https://github.com/sirfz/tesserocr/releases/v2.6.0)

  > * version bump
  > * added 3.10,3.11 classifiers

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [49c743d](https://github.com/bertsky/workflow-configuration/commits/49c743d)..[cb923f7](https://github.com/bertsky/workflow-configuration/commits/cb923f7)

  > * add mets-copy-agents.xsl
  > * ocrd-import: avoid removing non-empty directories on rollback (conversion results / preexisting images)


## [v2023-02-06](https://github.com/OCR-D/ocrd_all/releases/v2023-02-06)

Fixed:

  * No need to set `TESSDATA_PREFIX` anymore, #353

### [core](https://github.com/OCR-D/core) [6331433](https://github.com/OCR-D/core/commits/6331433)..[ee92cfc](https://github.com/OCR-D/core/commits/ee92cfc)

> Release: [2.45.1](https://github.com/OCR-D/core/releases/2.45.1)

  > * :package: v2.45.1
  > * :memo: changelog
  > * resmgr: insert from tool instead of append

### [ocrd_detectron2](https://github.com/bertsky/ocrd_detectron2) [fde2f3c](https://github.com/bertsky/ocrd_detectron2/commits/fde2f3c)..[f3342a4](https://github.com/bertsky/ocrd_detectron2/commits/f3342a4)

> Release: [0.1.5](https://github.com/bertsky/ocrd_detectron2/releases/0.1.5)

  > * :package: 0.1.5
  > * fix debug_img indentation (only once per page/table)
  > * ocrd-tool.json: fix PubLayNet/jpleorx model specs

### [ocrd_olahd_client](https://github.com/OCR-D/ocrd_olahd_client) [10d70a9](https://github.com/OCR-D/ocrd_olahd_client/commits/10d70a9)..[6bcbb4b](https://github.com/OCR-D/ocrd_olahd_client/commits/6bcbb4b)

> Release: [v0.0.2](https://github.com/OCR-D/ocrd_olahd_client/releases/v0.0.2)

  > * :package: v0.0.2
  > * :memo: changelog
  > * Merge branch 'manipulate-mets-agent'

### [opencv-python](https://github.com/skvark/opencv-python) [ede2269](https://github.com/skvark/opencv-python/commits/ede2269)..[736b905](https://github.com/skvark/opencv-python/commits/736b905)

> Release: [68](https://github.com/skvark/opencv-python/releases/68)

  > * OpenCV package does not distribute zlib (#780)
  > * OpenCV 4.7.0 release preparation
  > * Merge pull request #756 from asmorkalov:as/pipelines_update_4.7

### [tesseract](https://github.com/tesseract-ocr/tesseract) [6a21a74](https://github.com/tesseract-ocr/tesseract/commits/6a21a74)..[4142b32](https://github.com/tesseract-ocr/tesseract/commits/4142b32)

> Release: [5.3.0](https://github.com/tesseract-ocr/tesseract/releases/5.3.0)

  > * Fix some whitespace issues in source code and text files
  > * Merge pull request #3992 from seupedro/patch-1
  > * fix "cannot pass non-trivial object of type 'std::string'"
  > * show out filename on successful created of traineddata (combine_lang_model)
  > * fix "cannot pass non-trivial object of type 'std::string'"
  > * unicharset_extractor: - run ReadMemBoxes only for box files - do not write unicharset in case of broken box file
  > * Update issue-bug.yml
  > * Create an issue template for a feature request
  > * Create a new issue template
  > * Create new release 5.3.0
  > * Update README.md
  > * cmake - msvc/openmp: clean&document configuration
  > * cmake - mscvc: silent warning C4068: unknown pragma 'GCC'
  > * Create new release 5.3.0-rc1
  > * Replace MacOS -> macOS


## [v2022-12-14](https://github.com/OCR-D/ocrd_all/releases/v2022-12-14)

### [core](https://github.com/OCR-D/core) [881fd5f](https://github.com/OCR-D/core/commits/881fd5f)..[6331433](https://github.com/OCR-D/core/commits/6331433)

> Release: [v2.45.0](https://github.com/OCR-D/core/releases/v2.45.0)

  > * :package: v2.45.0
  > * :memo: changelog
  > * test ocrd-dummy copy_files=false behavior
  > * ocrd-dummy: make copying of image files (only) optional
  > * merge master
  > * ocrd-dummy: make copying optional and disable by default, #803
  > * :memo: changelog
  > * fix regression from 2fb4bbabd
  > * test resgmgr download --overwrite for directory
  > * tests: adapt to resmgr --overwrite change, speed up
  > * resmgr: simplify --overwrite logic
  > * Merge branch 'master' into resmgr-overwrite
  > * resmgr: support zip archives and non-folder archive contents

### [ocrd_detectron2](https://github.com/bertsky/ocrd_detectron2) [eb7ae2d](https://github.com/bertsky/ocrd_detectron2/commits/979816f)..[fde2f3c](https://github.com/bertsky/ocrd_detectron2/commits/eb7ae2d)

  > * img_debug: use region_id, not region.id


### [opencv-python](https://github.com/skvark/opencv-python) [8efd7aa](https://github.com/skvark/opencv-python/commits/8efd7aa)..[ede2269](https://github.com/skvark/opencv-python/commits/ede2269)

> Release: [66](https://github.com/skvark/opencv-python/releases/66)

  > * Merge pull request #759 from asenyaev:asen/pypi_fix

### [tesseract](https://github.com/tesseract-ocr/tesseract) [b7319c2](https://github.com/tesseract-ocr/tesseract/commits/b7319c2)..[6a21a74](https://github.com/tesseract-ocr/tesseract/commits/6a21a74)

> Release: [5.2.0](https://github.com/tesseract-ocr/tesseract/releases/5.2.0)

  > * Suppress compiler warning caused by very long string
  > * Replace at accessor by [] operator in function Classify::CreateIntTemplates
  > * Fix function ReadTrainingSamples (issue #3925)
  > * Fix function Classify::WriteIntTemplates (issue #3925)
  > * Fix function tesseract::write_set (issue #3925)
  > * Fix function UnicityTable::push_back (issue #3925)
  > * Fix function ComputeChiSquared (issue #3925)
  > * Remove assertion in function NewSimpleProto (issue #3925)
  > * Fix function Classify::CreateIntTemplates (issue #3925)
  > * Add missing serialization to FILE for vector of pointers (issue #3925)
  > * Replace void_proc by kdwald_proc with correct arguments
  > * clang-format: use default value for line width (80)
  > * Merge pull request #3978 from stweil/sanfix
  > * Revert "fix: index variable in OpenMP 'for' statement must have signed integral type"
  > * reformat code (files with tabs)
  > * report missing or empty box file
  > * GA: use png 1.6.39 from cmake-win64


## [v2022-12-09](https://github.com/OCR-D/ocrd_all/releases/v2022-12-09)

### [core](https://github.com/OCR-D/core) [8406621](https://github.com/OCR-D/core/commits/8406621)..[881fd5f](https://github.com/OCR-D/core/commits/881fd5f)

> Release: [v2.44.0](https://github.com/OCR-D/core/releases/v2.44.0)

  > * :package: v2.44.0
  > * :memo: changelog
  > * Merge remote-tracking branch 'joschrew/remove-inplace'
  > * :memo: changelog
  > * Merge remote-tracking branch 'joschrew/recreate-checksums'

### [ocrd_detectron2](https://github.com/bertsky/ocrd_detectron2) [979816f](https://github.com/bertsky/ocrd_detectron2/commits/979816f)..[eb7ae2d](https://github.com/bertsky/ocrd_detectron2/commits/eb7ae2d)

> Release: [v0.1.4](https://github.com/bertsky/ocrd_detectron2/releases/v0.1.4)

  > * img_debug: use region_id, not region.id
  > * region_id mustn't contain colon
  > * ocrd-tool.json: fix resource specs
  > * add new params postprocessing and debug_img …
  > * add an alternative preset file for DocBank
  > * Update README.md

### [ocrd_olahd_client](https://github.com/OCR-D/ocrd_olahd_client) [947724f](https://github.com/OCR-D/ocrd_olahd_client/commits/947724f)..[10d70a9](https://github.com/OCR-D/ocrd_olahd_client/commits/10d70a9)

  > * log received pid after uploading workspace
  > * add param pid-previous-version
  > * workaround/reset default input-file-group
  > * Merge pull request #3 from OCR-D/logging

### [opencv-python](https://github.com/skvark/opencv-python) [3725898](https://github.com/skvark/opencv-python/commits/3725898)..[8efd7aa](https://github.com/skvark/opencv-python/commits/8efd7aa)

> Release: [66](https://github.com/skvark/opencv-python/releases/66)

  > * Merge pull request #754 from asmorkalov/as/cmake_3.25_regression_win
  > * Merge pull request #751 from asmorkalov/as/dependencies_update

### [tesseract](https://github.com/tesseract-ocr/tesseract) [c1a1d7e](https://github.com/tesseract-ocr/tesseract/commits/c1a1d7e)..[b7319c2](https://github.com/tesseract-ocr/tesseract/commits/b7319c2)

> Release: [5.2.0](https://github.com/tesseract-ocr/tesseract/releases/5.2.0)

  > * Merge branch 'main' of https://github.com/tesseract-ocr/tesseract
  > * fix: index variable in OpenMP 'for' statement must have signed integral type
  > * fix typo (missing space)


## [v2022-12-01](https://github.com/OCR-D/ocrd_all/releases/v2022-12-01)

### [core](https://github.com/OCR-D/core) [c992296](https://github.com/OCR-D/core/commits/c992296)..[8406621](https://github.com/OCR-D/core/commits/8406621)

> Release: [v2.43.0](https://github.com/OCR-D/core/releases/v2.43.0)

  > * :package: v2.43.0
  > * :memo: changelog
  > * Add refresh_caches method
  > * :package: v2.42.1
  > * update spec to v3.21.0
  > * :memo: changelog
  > * Merge branch 'missing-import'
  > * :memo: changelog
  > * OcrdMets: fix (return) types when caching is on, #957
  > * OcrdMets.remove_file_group with caching: shallow copy DictValues

### [docstruct](https://github.com/bertsky/docstruct) [19f6d60](https://github.com/bertsky/docstruct/commits/19f6d60)..[a7ffdda](https://github.com/bertsky/docstruct/commits/a7ffdda)

  > * Merge pull request #1 from stweil/master

### [ocrd_detectron2](https://github.com/bertsky/ocrd_detectron2) [7596962](https://github.com/bertsky/ocrd_detectron2/commits/7596962)..[979816f](https://github.com/bertsky/ocrd_detectron2/commits/979816f)

> Release: [v0.1.3](https://github.com/bertsky/ocrd_detectron2/releases/v0.1.3)

  > * deps: drop trying detectron2 wheels

### [tesseract](https://github.com/tesseract-ocr/tesseract) [5f297dc](https://github.com/tesseract-ocr/tesseract/commits/5f297dc)..[c1a1d7e](https://github.com/tesseract-ocr/tesseract/commits/c1a1d7e)

> Release: [5.2.0](https://github.com/tesseract-ocr/tesseract/releases/5.2.0)

  > * Update cmake-win64.yml
  > * GA cmake-win64: uninstall strawberryperl to fix libtiff build
  > * GA cmake-win64: fix getting version info
  > * Fix training tools for legacy engine (issue #3925) (#3970)
  > * stop cron cmake-win64 build
  > * Update cmake-win64.yml
  > * [sw] Remove VS2019 builds.
  > * Update cmake-win64.yml


## [v2022-11-24](https://github.com/OCR-D/ocrd_all/releases/v2022-11-24)

Added:

  * New processor [`ocrd-nmalign-merge`](https://github.com/bertsky/nmalign)

### [core](https://github.com/OCR-D/core) [e841ce8](https://github.com/OCR-D/core/commits/e841ce8)..[c75e219](https://github.com/OCR-D/core/commits/c75e219)

> Release: [v2.42.0](https://github.com/OCR-D/core/releases/v2.42.0)

  > * :package: v2.42.0
  > * :memo: changelog
  > * Merge branch 'mexthecat-802'
  > * Merge branch 'profile-mem'
  > * :memo: changelog
  > * Merge pull request #875 from OCR-D/cache_functionality

### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [4c74cda](https://github.com/OCR-D/ocrd_segment/commits/4c74cda)..[3c63e21](https://github.com/OCR-D/ocrd_segment/commits/3c63e21)

> Release: [v0.1.21](https://github.com/OCR-D/ocrd_segment/releases/v0.1.21)

  > * repair/project: always use make_valid on input side
  > * repair/project: handle parent without Coords
  > * extract_lines: add param 'textequiv-index'

### [tesseract](https://github.com/tesseract-ocr/tesseract) [78bcc0d](https://github.com/tesseract-ocr/tesseract/commits/78bcc0d)..[5f297dc](https://github.com/tesseract-ocr/tesseract/commits/5f297dc)

> Release: [5.2.0](https://github.com/tesseract-ocr/tesseract/releases/5.2.0)

  > * Merge pull request #3967 from stweil/coverity
  > * [sw] Do a lightweight build during PRs.
  > * Fix AMD64 detection with autobuild on FreeBSD (#3964)
  > * lstm.train: allow .box from .raw.png too

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [2dd00a1](https://github.com/bertsky/workflow-configuration/commits/2dd00a1)..[49c743d](https://github.com/bertsky/workflow-configuration/commits/49c743d)

  > * 2 more XSLTs
  > * ocrd-import: set detected ALTO MIME type correctly

## [v2022-11-10](https://github.com/OCR-D/ocrd_all/releases/v2022-11-10)

Added:

  * [`ocrd-docstruct`](https://github.com/bertsky/docstruct): Document structure detection from PAGE-XML to METS-XML, #338
  * [`ocrd-neat-export`/`ocrd-neat-import`](https://github.com/qurator-spk/page2tsv): Convert between PAGE and [neat](https://github.com/qurator-spk/neat) TSV, #339

### [core](https://github.com/OCR-D/core) [bae7ac2](https://github.com/OCR-D/core/commits/bae7ac2)..[e841ce8](https://github.com/OCR-D/core/commits/e841ce8)

> Release: [v2.41.0](https://github.com/OCR-D/core/releases/v2.41.0)

  > * Update README.md
  > * improve/complete bashlib description, add APIdoc refs
  > * :package: v2.41.0
  > * :memo: changelog
  > * Merge branch 'resmgr-id-fallback'
  > * :memo: changelog
  > * make deps-ubuntu: drop python3-venv, run apt update in CI
  > * ci: make deps-ubuntu/install geos via brew
  > * make deps-ubuntu: For workaround shapely/shapely#1598, we need libgeos-dev
  > * make install: workaround for broken shapely wheels
  > * :memo: changelog
  > * Merge remote-tracking branch 'origin/resmgr-content-length'
  > * :memo: changelog
  > * resmgr: avoid adding fake user db entries for module resources

### [ocrd_detectron2](https://github.com/bertsky/ocrd_detectron2) [833319a](https://github.com/bertsky/ocrd_detectron2/commits/833319a)..[7596962](https://github.com/bertsky/ocrd_detectron2/commits/7596962)

> Release: [v0.1.3](https://github.com/bertsky/ocrd_detectron2/releases/v0.1.3)

  > * :package: 0.1.3
  > * setup: use detectron2.config.CfgNode.freeze to be on the safe side
  > * deps: fallback to src build of detectron2
  > * fix resource URLs
  > * deps: prevent pulling torch from PyPI
  > * added resources and presets
  > * :package: 0.1.2
  > * Merge pull request #11 from bertsky/fallback-on-detectron2-sdist

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [c3dddfc](https://github.com/OCR-D/ocrd_fileformat/commits/c3dddfc)..[5022408](https://github.com/OCR-D/ocrd_fileformat/commits/5022408)

> Release: [v0.6.1](https://github.com/OCR-D/ocrd_fileformat/releases/v0.6.1)

  > * :package: v0.6.1
  > * :memo: changelog
  > * Merge pull request #41 from bertsky/patch-2
  > * :package: v0.6.0
  > * update ocr-fileformat to v0.5.0

### [tesseract](https://github.com/tesseract-ocr/tesseract) [e3c06d1](https://github.com/tesseract-ocr/tesseract/commits/e3c06d1)..[78bcc0d](https://github.com/tesseract-ocr/tesseract/commits/78bcc0d)

> Release: [5.2.0](https://github.com/tesseract-ocr/tesseract/releases/5.2.0)

  > * Update cmake.yml
  > * Merge pull request #3959 from amitdo/amitdo-pdf-Ignore-non-text-blocks
  > * Remove remaining references to deprecated LGTM (fix for #3958)
  > * github action/cmake: fix macos icu linking
  > * cmake: fix linux&mac build
  > * fix typo in variable
  > * README.md: Show CodeQL alerts
  > * README.md: Make CodeQL badge clickable
  > * README.md: Add CodeQL badge
  > * show dropped unrendable words
  > * cmake: install common_training and  unicharset_training libs
  > * cmake: we can build training tools without PkgConfig
  > * Merge pull request #3951 from doraeric/patch-1
  > * Merge pull request #3950 from Saibamen/patch-1

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [904ce8c](https://github.com/bertsky/workflow-configuration/commits/904ce8c)..[2dd00a1](https://github.com/bertsky/workflow-configuration/commits/2dd00a1)

  > * ocrd-make: add MKL control variable


## [v2022-10-25](https://github.com/OCR-D/ocrd_all/releases/v2022-10-25)

### [cor-asv-ann](https://github.com/ASVLeipzig/cor-asv-ann) [1058657](https://github.com/ASVLeipzig/cor-asv-ann/commits/1058657)..[006a70e](https://github.com/ASVLeipzig/cor-asv-ann/commits/006a70e)

> Release: [v0.1.14](https://github.com/ASVLeipzig/cor-asv-ann/releases/v0.1.14)

  > * Merge pull request #11 from ASVLeipzig/textline-textequiv-join-processor

### [core](https://github.com/OCR-D/core) [0713e0e](https://github.com/OCR-D/core/commits/0713e0e)..[bae7ac2](https://github.com/OCR-D/core/commits/bae7ac2)

> Release: [v2.40.0](https://github.com/OCR-D/core/releases/v2.40.0)

  > * :package: v2.40.0
  > * :memo: changelog
  > * Merge pull request #929 from OCR-D/bashlib-add-moduledir
  > * :memo: changelog
  > * Merge pull request #932 from OCR-D/add-missing-resloc-module
  > * :memo: changelog
  > * Merge pull request #933 from OCR-D/resmgr-msg-debug
  > * :memo: changelog
  > * resmgr download: module location must not use exe subdir
  > * :package: v2.39.0
  > * update spec
  > * ocrd/ocrd/cli/validate: typo Ba{a,s}ename
  > * :memo: changelog
  > * Merge branch 'bashlib-validate-mets-basename'
  > * :memo: changelog
  > * test_merge_force: adapt to stricter ID clash check in add_file after #861
  > * fix kwarg conflict inm merge
  > * Merge branch 'master' into workspace_merge_fix
  > * ocrd workspace merge: support both --force and --overwrite, test
  > * Use the cli overwrite
  > * Keep consistency
  > * Accept overwrite parameter instead of passing just True
  > * Pass the force parameter when merging
  > * update spec
  > * :memo: changelog
  > * Merge remote-tracking branch 'bertsky/patch-14' into resmgr-moduledir
  > * resmgr.download: use data structures correctly, test --overwrite
  > * strip newline from --dump-module-dir
  > * resmgr: list_available with the same features as removed find_resources
  > * wip: resource manager respecting processor's moduledir

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [1febea8](https://github.com/qurator-spk/dinglehopper/commits/1febea8)..[dcc10c5](https://github.com/qurator-spk/dinglehopper/commits/dcc10c5)

  > * ✔️ Skip test_lines_similar() for now
  > * 📝 Note that old terminals might not render the Unicode characters correctly
  > * 🐛 Update editops() and seq_align() due to RapidFuzz API changes
  > * Revert "Revert "Merge pull request #67 from maxbachmann/rapidfuzz""
  > * Revert "💩 Stick with rapidfuzz < 2.1.0 for now"
  > * 💩 Stick with rapidfuzz < 2.1.0 for now
  > * Revert "Merge pull request #67 from maxbachmann/rapidfuzz"
  > * Merge pull request #67 from maxbachmann/rapidfuzz

### [ocrd_calamari](https://github.com/OCR-D/ocrd_calamari) [395e43c](https://github.com/OCR-D/ocrd_calamari/commits/395e43c)..[c7ad6eb](https://github.com/OCR-D/ocrd_calamari/commits/c7ad6eb)

> Release: [v1.0.5](https://github.com/OCR-D/ocrd_calamari/releases/v1.0.5)

  > * 📦 v1.0.5
  > * Merge pull request #76 from bertsky/skip-empty
  > * Merge pull request #80 from mikegerber/fix/readme-no-checkpoint
  > * 📝 README-DEV: Update wrt ocrd-tool.json and CI
  > * 📦 v1.0.4
  > * 🔐 Use a safe temporary directory for the test workspace

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [38f4edf](https://github.com/OCR-D/ocrd_fileformat/commits/38f4edf)..[c3dddfc](https://github.com/OCR-D/ocrd_fileformat/commits/c3dddfc)

> Release: [v0.5.0](https://github.com/OCR-D/ocrd_fileformat/releases/v0.5.0)

  > * :memo: changelog
  > * update ocr-fileformat to include merge
  > * update ocr-fileformat

### [ocrd_kraken](https://github.com/OCR-D/ocrd_kraken) [f8235c4](https://github.com/OCR-D/ocrd_kraken/commits/f8235c4)..[802c6b0](https://github.com/OCR-D/ocrd_kraken/commits/802c6b0)

> Release: [v0.3.0](https://github.com/OCR-D/ocrd_kraken/releases/v0.3.0)

  > * :package: v0.3.0
  > * :memo: changelog
  > * Merge pull request #33 from OCR-D/resources

### [ocrd_olahd_client](https://github.com/OCR-D/ocrd_olahd_client) [9809d0c](https://github.com/OCR-D/ocrd_olahd_client/commits/9809d0c)..[947724f](https://github.com/OCR-D/ocrd_olahd_client/commits/947724f)

  > * Merge pull request #5 from stweil/master

### [ocrd_tesserocr](https://github.com/OCR-D/ocrd_tesserocr) [7459a41](https://github.com/OCR-D/ocrd_tesserocr/commits/7459a41)..[c10f94d](https://github.com/OCR-D/ocrd_tesserocr/commits/c10f94d)

> Release: [v0.16.0](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.16.0)

  > * :package: v0.16.0
  > * :memo: changelog
  > * require core >= 2.40.0
  > * makefile: resmgr location now module, no need for envvar
  > * readme: update explanation of resource location
  > * :package: v0.15.0
  > * :memo: changelog
  > * Merge remote-tracking branch 'origin/resmgr-moduledir'
  > * :memo: changelog
  > * fix user_defined_dpi (reset for each page)
  > * fix json typo
  > * binarize: add tiseg parameter (for optional sepmask clipping)
  > * fix user_defined_dpi (reset for each page)
  > * fix pageId for AlternativeImage
  > * Update requirements.txt
  > * update+improve polygon handling

### [ocrd_typegroups_classifier](https://github.com/OCR-D/ocrd_typegroups_classifier) [1ed0cb1](https://github.com/OCR-D/ocrd_typegroups_classifier/commits/1ed0cb1)..[ffa40fc](https://github.com/OCR-D/ocrd_typegroups_classifier/commits/ffa40fc)

> Release: [v0.4.0](https://github.com/OCR-D/ocrd_typegroups_classifier/releases/v0.4.0)

  > * :package: v0.4.0
  > * :memo: changelog
  > * Merge remote-tracking branch 'bertsky/add-oplevel-region'
  > * :memo: changelog
  > * Merge pull request #11 from OCR-D/fix-simple-cli

### [opencv-python](https://github.com/skvark/opencv-python) [60630d1](https://github.com/skvark/opencv-python/commits/60630d1)..[3725898](https://github.com/skvark/opencv-python/commits/3725898)

> Release: [66](https://github.com/skvark/opencv-python/releases/66)

  > * Bump numpy version to 1.21.4 for macOS builds (#720)
  > * Build x64 macOS wheels for 10.13 build target (#716)
  > * Build zlib from the source on Linux with the latest version (#715)
  > * Remove source packages for rolling packages (#711)
  > * Adapted rolling releases to workflow_dispatch event (#708)

### [sbb_binarization](https://github.com/qurator-spk/sbb_binarization) [c99be55](https://github.com/qurator-spk/sbb_binarization/commits/c99be55)..[aeb6804](https://github.com/qurator-spk/sbb_binarization/commits/aeb6804)

> Release: [v0.0.11](https://github.com/qurator-spk/sbb_binarization/releases/v0.0.11)

  > * :package: v0.0.11
  > * :memo: changelog
  > * Merge pull request #53 from bertsky/patch-3
  > * Update README.md
  > * issue #45 the patches option is omitted and it means that documents will be processed in patches while no patches is not desired by the tool
  > * Merge pull request #52 from bertsky/img-allow-alpha
  > * Update README
  > * #42 is resolved
  > * Merge pull request #43 from apacha/fix_no_models_available

### [tesseract](https://github.com/tesseract-ocr/tesseract) [0daf18c](https://github.com/tesseract-ocr/tesseract/commits/0daf18c)..[e3c06d1](https://github.com/tesseract-ocr/tesseract/commits/e3c06d1)

> Release: [5.2.0](https://github.com/tesseract-ocr/tesseract/releases/5.2.0)

  > * Update codeql-analysis.yml
  > * Update sw.yml
  > * Update codeql-analysis.yml
  > * Fix regression (broken unit tests)
  > * Restore comment
  > * Fix memory leaks in ImageThresholder::ThresholdToPix
  > * remove src.destroy();
  > * Update autotools-macos.yml
  > * Merge pull request #3948 from rettinghaus/update-action
  > * Merge pull request #3949 from rettinghaus/update-upload
  > * Merge pull request #3942 from zdenop/main
  > * Update autotools-macos.yml
  > * Update autotools.yml
  > * Update unittest.yml
  > * Update autotools-openmp.yml
  > * Update cmake-win64.yml
  > * Merge pull request #3938 from Gitoffthelawn/patch-1
  > * Merge pull request #3935 from nicholasz2510/main
  > * Merge pull request #3930 from jeroen/patch-1
  > * Update .mailmap
  > * Create .mailmap (#3910)
  > * Update README.md
  > * Update appveyor.yml
  > * appveyor.yml: Add files filter
  > * Add missing .exe for training tools to fix build with msys2
  > * Update codeql-analysis.yml
  > * Update codeql-analysis.yml [skip ci]
  > * Update README.md
  > * Merge pull request #3908 from tesseract-ocr/amitdo-sw-paths
  > * Merge pull request #3907 from ffontaine/main
  > * Update msys2.yml [skip ci]
  > * CI: Remove Ubuntu 18.04 (#3902)
  > * unittest-macos.yml: Use macOS 12 instead.of  10.15
  > * autotools-macos.yml: Remove macOS 10.15

### [tesserocr](https://github.com/sirfz/tesserocr) [e0da9df](https://github.com/sirfz/tesserocr/commits/e0da9df)..[3bfa7d9](https://github.com/sirfz/tesserocr/commits/3bfa7d9)

> Release: [v2.5.2](https://github.com/sirfz/tesserocr/releases/v2.5.2)

  > * provide pointsize
  > * Add support for upcoming Leptonica 1.83.0
  > * Fix typo (found by codespell)

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [bb2a4e2](https://github.com/bertsky/workflow-configuration/commits/bb2a4e2)..[904ce8c](https://github.com/bertsky/workflow-configuration/commits/904ce8c)

  > * page-fix-coords: fix Baseline in addition to Coords
  > * try to fix markdown
  > * update documentation
  > * page-sort-textequiv-index: new (sort TextEquiv by its @index)
  > * page-extract-text: variant with level param (defaults to highest)
  > * update documentation
  > * page-remove-alternativeimages: new XSLT with comprehensive params
  > * Merge branch 'master' of ssh://github.com/bertsky/workflow-configuration
  > * page-extract-lines: allow respecting (recursive) reading order


## [v2022-08-15](https://github.com/OCR-D/ocrd_all/releases/v2022-08-15)

### [core](https://github.com/OCR-D/core) [0c62081](https://github.com/OCR-D/core/commits/0c62081)..[4148a88](https://github.com/OCR-D/core/commits/4148a88)

> Release: [v2.38.0](https://github.com/OCR-D/core/releases/v2.38.0)

  > * :package: v2.30.0
  > * update spec to v3.20.0
  > * :memo: changelog
  > * ocrd zip: remove Ocrd-Manifestation-Depth
  > * :memo: changelog
  > * Merge branch 'resmgr-dynamic-download'
  > * :memo: changelog
  > * Merge branch 'add-processor-profiling'
  > * :memo: changelog
  > * Merge branch 'merge-fix'
  > * :memo: changelog
  > * bagger: fix for working with different mets name
  > * :package: v2.37.0
  > * :memo: changelog
  > * Merge remote-tracking branch 'origin/master' into resmgr-dynamic-discovery
  > * resmgr: drop ocrd-tesserocr from resource_list.yml
  > * ocrd resmgr migrate to update existing configurations
  > * resmgr: catch OSError for non-exec ocrd processors in $PATH
  > * move JSONDecodeError catch back to get_ocrd_tool
  > * os.list_all_resources: ignore more core-builtin resources
  > * get_processor_resource_types: handle non-existing "paramters"
  > * Merge branch 'master' into resmgr-dynamic-discovery
  > * resource_list.yml: tarball -> archive
  > * Merge branch 'master' into resmgr-dynamic-discovery
  > * OcrdResourceManager.list_available: handle JSONDecodeError with a log msg
  > * ocrd resmgr list-available: -e should be glob with trailing asterisk
  > * ocrd resmgr list-available: fix kwargs
  > * resmgr: invert `--dynamic` option and drop positive variant
  > * OcrdResourceManager.list_available: treat executable consistently as a glob
  > * catch case that processor not installed but listed in resource_list
  > * test_task_sequence: invalidate ocrd-tool cache on tearDown
  > * resource_manager: ocrd-tool-derived resources should take precedence
  > * disable caching of get_ocrd_tool_json, causes non-sequitur errors in testing
  > * fix import error in resource_manager.py
  > * Merge remote-tracking branch 'bertsky/patch-4' into resmgr-dynamic-discovery
  > * Merge branch 'resmgr-folder' into resmgr-dynamic-discovery
  > * Merge branch 'assets-change' into resmgr-dynamic-discovery
  > * Merge remote-tracking branch 'bertsky/patch-3' into resmgr-dynamic-discovery
  > * wip
  > * replace module-level cache with functools.lru_cache
  > * taks_sequence: use ocrd_utils.get_ocrd_tool
  > * wip: merge discover and list_available
  > * replace resmgr schema with ocrd-tool schema fragment
  > * resource_list: tarball -> archive
  > * resmgr: take processor's resource_locations into account
  > * ocrd_utils.get_ocrd_tool_json
  > * ocrd resmgr discover
  > * update spec to 3.17.0

### [eynollah](https://github.com/qurator-spk/eynollah) [00be99d](https://github.com/qurator-spk/eynollah/commits/00be99d)..[8d5079c](https://github.com/qurator-spk/eynollah/commits/8d5079c)

> Release: [v0.0.11](https://github.com/qurator-spk/eynollah/releases/v0.0.11)

  > * issue #77 is resolved on main branch

### [ocrd_kraken](https://github.com/OCR-D/ocrd_kraken) [cb719e7](https://github.com/OCR-D/ocrd_kraken/commits/cb719e7)..[f8235c4](https://github.com/OCR-D/ocrd_kraken/commits/f8235c4)

> Release: [v0.2.0](https://github.com/OCR-D/ocrd_kraken/releases/v0.2.0)

  > * :package: v0.2.0
  > * ci: download model first
  > * fix test_binarize
  > * fix typos
  > * Revert "Revert "segment: use binarized input only if use_legacy""
  > * Revert "segment: use binarized input only if use_legacy"
  > * recognize: use proper relative coordinate system for words and glyphs
  > * recognize: move model init to setup fn
  > * recognize: use binarized image only if model expects it
  > * segment: move model init to setup fn
  > * segment: decode arbitrary region types, add param blla_classes
  > * segment: use binarized input only if use_legacy
  > * recognize: fix decoding in case word is empty

### [ocrd_tesserocr](https://github.com/OCR-D/ocrd_tesserocr) [4d2593d](https://github.com/OCR-D/ocrd_tesserocr/commits/4d2593d)..[0427f6f](https://github.com/OCR-D/ocrd_tesserocr/commits/0427f6f)

> Release: [v0.14.0](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.14.0)

  > * :package: v0.14.0
  > * :memo: changelog
  > * Merge branch 'resmgr-ocrd-tool'

### [opencv-python](https://github.com/skvark/opencv-python) [4638ce5](https://github.com/skvark/opencv-python/commits/4638ce5)..[60630d1](https://github.com/skvark/opencv-python/commits/60630d1)

> Release: [66](https://github.com/skvark/opencv-python/releases/66)

  > * macOS x86_64 runner change to macos-11 (#701)
  > * Scheduled rolling workflows (#699)
  > * Run pipelines on 4.x and 5.x branches (#697)

### [sbb_binarization](https://github.com/qurator-spk/sbb_binarization) [e4c1eb2](https://github.com/qurator-spk/sbb_binarization/commits/e4c1eb2)..[c99be55](https://github.com/qurator-spk/sbb_binarization/commits/c99be55)

> Release: [v0.0.10](https://github.com/qurator-spk/sbb_binarization/releases/v0.0.10)

  > * :package: v0.0.10
  > * :memo: changelog
  > * Merge pull request #40 from maxnth/fix/cli

### [tesseract](https://github.com/tesseract-ocr/tesseract) [87dd04f](https://github.com/tesseract-ocr/tesseract/commits/87dd04f)..[0daf18c](https://github.com/tesseract-ocr/tesseract/commits/0daf18c)

> Release: [5.2.0](https://github.com/tesseract-ocr/tesseract/releases/5.2.0)

  > * Detect availability of AVX512-VNNI
  > * GA cmake-win64: use webp v1.2.3 as new code requires libsharpyuv
  > * cmake.yml: Remove macOS 10
  > * Merge pull request #3888 from arseniy-sonar/patch-1
  > * Update sw.cpp
  > * [sw] Do not link pthread on android.
  > * [sw] Add svpaint.
  > * [sw] Add missing file for arm64. Change branch name.
  > * Merge pull request #3878 from stweil/exit
  > * Fix double free in function vigorous_noise_removal (fixes issue #3876)
  > * Create to_win if needed in Textord::make_spline_rows (fixes issue #3875)
  > * autotools: Add rule for svpaint executable (#3873)
  > * Merge pull request #3872 from p12tic/fix-scrollview-double-free (fixes issue #3869)
  > * Catch potential nullptr in SVNetwork::SVNetwork


## [v2022-07-18](https://github.com/OCR-D/ocrd_all/releases/v2022-07-18)

### [core](https://github.com/OCR-D/core) [a78d4c5](https://github.com/OCR-D/core/commits/a78d4c5)..[0c62081](https://github.com/OCR-D/core/commits/0c62081)

> Release: [v2.36.0](https://github.com/OCR-D/core/releases/v2.36.0)

  > * :package: v2.36.0
  > * Merge branch 'release-2.36.0'
  > * Merge pull request #890 from stweil/typos
  > * Merge pull request #891 from stweil/lgtm
  > * Merge branch 'improve-workspace-merge'
  > * Merge branch 'ocrd-tool-new-constructs'
  > * Merge branch 'workspace-pageId-to-page_id'
  > * Merge remote-tracking branch 'joschrew/ocrd_mets-find_files-split'
  > * Merge pull request #879 from bertsky/allow-fill-none
  > * Merge pull request #868 from bertsky/patch-13

### [eynollah](https://github.com/qurator-spk/eynollah) [34a0617](https://github.com/qurator-spk/eynollah/commits/34a0617)..[00be99d](https://github.com/qurator-spk/eynollah/commits/00be99d)

> Release: [v0.0.11](https://github.com/qurator-spk/eynollah/releases/v0.0.11)

  > * add short section on supported Python, TF and CUDA versions

### [ocrd_calamari](https://github.com/OCR-D/ocrd_calamari) [ecb0d67](https://github.com/OCR-D/ocrd_calamari/commits/ecb0d67)..[395e43c](https://github.com/OCR-D/ocrd_calamari/commits/395e43c)

> Release: [v1.0.3](https://github.com/OCR-D/ocrd_calamari/releases/v1.0.3)

  > * Merge pull request #75 from bertsky/recurse-regions

### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [309b7f9](https://github.com/OCR-D/ocrd_segment/commits/309b7f9)..[4c74cda](https://github.com/OCR-D/ocrd_segment/commits/4c74cda)

> Release: [v0.1.21](https://github.com/OCR-D/ocrd_segment/releases/v0.1.21)

  > * repair/project: add touching polygons to MST
  > * repair/plausibilize: prefer delete/merge over split, not vice versa

### [opencv-python](https://github.com/skvark/opencv-python) [f2f924c](https://github.com/skvark/opencv-python/commits/f2f924c)..[4638ce5](https://github.com/skvark/opencv-python/commits/4638ce5)

> Release: [66](https://github.com/skvark/opencv-python/releases/66)

  > * Changed labeles for macOS ARM64 and Linux ARM64 builds (#681)
  > * Merge pull request #684 from radarhere/multibuild
  > * Merge pull request #672 from asenyaev/asen/change_format_for_source_package_4.x
  > * Merge pull request #668 from asenyaev/asen/check_latest_commits_4.x

### [tesseract](https://github.com/tesseract-ocr/tesseract) [c2a3efe](https://github.com/tesseract-ocr/tesseract/commits/c2a3efe)..[87dd04f](https://github.com/tesseract-ocr/tesseract/commits/87dd04f)

> Release: [5.2.0](https://github.com/tesseract-ocr/tesseract/releases/5.2.0)

  > * [ci][sw] Disable nightly macos tests.
  > * Update cmake.yml
  > * Update sw.yml
  > * Create new release 5.2.0
  > * Mark parameter 'tessedit_do_invert' as deprecated
  > * Add new parameter for invert_threshold (#3852)
  > * capi: Fix calling delete[] for memory allocated by malloc
  > * Merge pull request #3775 from Shreeshrii/disableopenmp
  > * Merge pull request #3682 from leleliu008/improve-build-for-android-integrate-with-cpu_features-library
  > * fix issue #3092 - skip removing colormap
  > * Update code to support Leptonica 1.83.0 and newer
  > * Use Leptonica API to access internals of Pix
  > * C API: Add a function to init tesseract with traineddata from memory (#3780)
  > * Update README.md [skip ci]
  > * README: Add link to tessdoc/InputFormats
  > * Replace BOX -> Box
  > * Update README.md
  > * Update cmake-win64.yml (D8016: '/Qpar' and '/openmp:llvm' command-line options are incompatible )
  > * Update cmake-win64.yml
  > * GA: improve cmake-win64: use variable for location, add libarchive build, disabple not need functions
  > * do not use '\0' in std::string => fixes issue #3837 (loading uzn file)
  > * cmake: fix Build with clang-cl on Windows; fixes #3683
  > * Merge pull request #3835 from Yulv-git/typos1
  > * [sw] Fix macos aarch64 build.
  > * Update cmake-win64.yml
  > * Update sw.yml
  > * [ci][sw] Add vs2019 and ubuntu22.04.
  > * Remove Travis from README.md
  > * Remove trailing blanks
  > * Fix NEON detection on FreeBSD (#3782)
  > * Replace std::regex by std::string functions (fixes issue #3830)
  > * Replace direct access to Leptonica internal data structures by function calls
  > * Use unsigned offsets for PDF
  > * Pdf offset fix (#3808)
  > * Delete .travis.yml
  > * cmake: report build arch
  > * cmake:fix typo
  > * Fix sw build for AVX512
  > * Merge pull request #3792 from stweil/avx512f
  > * Add missing `apt-get update` in CI actions
  > * Merge pull request #3789 from sunoru/patch-appendstring
  > * Set /Os for some 32 bit MS compilers (fixes #3769)
  > * scrollview: Fix two comments
  > * Add CI for openmp performance comparison (#3774)
  > * Merge pull request #3773 from Gitoffthelawn/patch-1
  > * fix OpenCL with Nvidia drivers
  > * cmake: fix OpenCL build
  > * Update cmake.yml
  > * Update ccutil.cpp (#3768)
  > * Update CMakeLists.txt
  > * Update cmake.yml
  > * cmake: turn off LTO
  > * cmake: enable link-time optimization by default
  > * Merge pull request #3765 from zdenop/cmake_unused
  > * autoconf: Use more robust code to get git tag
  > * Use static linker flags for OSS-Fuzz build
  > * Update linker flags for OSS-Fuzz build

### [tesserocr](https://github.com/sirfz/tesserocr) [310ae9a](https://github.com/sirfz/tesserocr/commits/310ae9a)..[e0da9df](https://github.com/sirfz/tesserocr/commits/e0da9df)

> Release: [v2.5.2](https://github.com/sirfz/tesserocr/releases/v2.5.2)

  > * docs: fix simple typo, instalation -> installation


## [v2022-06-03](https://github.com/OCR-D/ocrd_all/releases/v2022-06-03)

Fixed:

  * Work around issues with git's new `safe.directory` setting interfering with `sudo git`, #321, #323, #324

Changed:

  * Disable `cor-asv-ann` and `ocrd_keraslm` which require old tensorflow-gpu unless it is available, #325
  * Dockerfile: use `$VIRTUAL_ENV` instead of hard-coded paths or `$PREFIX`

Added:

  * Start building on Ubuntu 22.04 in addition to 20.04 and 18.04, #318

### [core](https://github.com/OCR-D/core) [ecdb840](https://github.com/OCR-D/core/commits/ecdb840)..[60697e4](https://github.com/OCR-D/core/commits/60697e4)

> Release: [v2.35.0](https://github.com/OCR-D/core/releases/v2.35.0)

  > * :package: v2.35.0
  > * :memo: changelog
  > * update bagit-profile and ocrd_tool.schema.yml from spec
  > * update spec
  > * :package: v2.34.0
  > * :memo: changelog
  > * Merge remote-tracking branch 'bertsky/patch-12'
  > * :memo: changelog
  > * Merge branch 'resmgr-do-not-parse-dates'
  > * :memo: changelog
  > * Merge branch 'ocrd-log-stdin'
  > * :memo: changelog
  > * cleanup
  > * change tests according to previous commit
  > * change return type to list of tuples
  > * remove printing error message
  > * remove single newline from last commit
  > * resource_manager list_available: fix #854
  > * test_ocrd_mets: test new pageId regex
  > * Merge branch 'add-pageid-regex' of https://github.com/bertsky/core into add-pageid-regex
  > * :memo: changelog
  > * Merge branch 'add-pageid-regex'
  > * :memo: changelog
  > * adapt safe_filename without dots
  > * safe_filename: allow underscore, avoid dot
  > * Merge pull request #849 from tdoan2010/master

### [ocrd_detectron2](https://github.com/bertsky/ocrd_detectron2) [855fc3b](https://github.com/bertsky/ocrd_detectron2/commits/855fc3b)..[833319a](https://github.com/bertsky/ocrd_detectron2/commits/833319a)

> Release: [v0.1.1](https://github.com/bertsky/ocrd_detectron2/releases/v0.1.1)

  > * table mode: relax image requirements
  > * fix typo
  > * add param operation_level, add level table

### [ocrd_keraslm](https://github.com/OCR-D/ocrd_keraslm) [2101c8f](https://github.com/OCR-D/ocrd_keraslm/commits/2101c8f)..[787341d](https://github.com/OCR-D/ocrd_keraslm/commits/787341d)

> Release: [v0.4.1](https://github.com/OCR-D/ocrd_keraslm/releases/v0.4.1)

  > * Update test-python3 to large resource class in config.yml

### [ocrd_olena](https://github.com/OCR-D/ocrd_olena) [fce9933](https://github.com/OCR-D/ocrd_olena/commits/fce9933)..[dbef534](https://github.com/OCR-D/ocrd_olena/commits/dbef534)

> Release: [v1.3.0](https://github.com/OCR-D/ocrd_olena/releases/v1.3.0)

  > * :package: v1.3.0
  > * install libtool in Docker
  > * Merge branch 'circleci-update-resource-class' into fix-default-winsize
  > * re-use METS basename for output
  > * use bulk-add for METS results
  > * use 1/6th DPI for non-Sauvola win-size default

### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [e9acc81](https://github.com/OCR-D/ocrd_segment/commits/e9acc81)..[309b7f9](https://github.com/OCR-D/ocrd_segment/commits/309b7f9)

> Release: [v0.1.21](https://github.com/OCR-D/ocrd_segment/releases/v0.1.21)

  > * forgot src file
  > * new processor replace-text
  > * repair/project: fix MST bridge polygons
  > * repair/project: use minimum spanning tree for shortest path search when joining polygons
  > * :package: 0.1.21
  > * Merge remote-tracking branch 'bertsky/extract-regions-coco'
  > * repair/project: join polygons directly instead of alphashape
  > * fixed parameter in save_image_file(), updated classes-parameter to type array
  > * Update ocrd_segment/ocrd-tool.json
  > * Update ocrd_segment/extract_regions.py
  > * added classes parameter to extract-region-processor; enables extraction of specific regions e.g. TableRegion
  > * tool.json: restrict numerical ranges
  > * extract-lines: reduce default min-* values

### [opencv-python](https://github.com/skvark/opencv-python) [5de8d66](https://github.com/skvark/opencv-python/commits/5de8d66)..[f2f924c](https://github.com/skvark/opencv-python/commits/f2f924c)

> Release: [64](https://github.com/skvark/opencv-python/releases/64)

  > * Merge pull request #666 from asenyaev/asen/update_all_dependencies

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [e50dee4](https://github.com/bertsky/workflow-configuration/commits/e50dee4)..[bb2a4e2](https://github.com/bertsky/workflow-configuration/commits/bb2a4e2)

  > * ocrd-import: fix mkdir context
  > * ocrd-import: avoid . in IDs
  > * ocrd-import: ensure grayscale after PDF import
  > * ocrd-import: forgot to set errexit in subshell too


## [v2022-05-04](https://github.com/OCR-D/ocrd_all/releases/v2022-05-04)

Changed:

  * `make clean`: remove sub-venvs and all semaphores, #315

Removed:

  * `ocrd_pc_segmentation` has been disabled since it's not used and not supported upstream, #317

### [core](https://github.com/OCR-D/core) [f9c2b6c](https://github.com/OCR-D/core/commits/f9c2b6c)..[ecdb840](https://github.com/OCR-D/core/commits/ecdb840)

> Release: [v2.33.0](https://github.com/OCR-D/core/releases/v2.33.0)

  > * :package: v2.33.0
  > * :memo: changelog
  > * Merge remote-tracking branch 'stweil/master'
  > * :memo: changelog
  > * Merge remote-tracking branch 'mexthecat/issues_838'
  > * :memo: changelog
  > * Merge remote-tracking branch 'origin/remove-assets-server'
  > * :memo: changelog
  > * Merge remote-tracking branch 'bertsky/workspace-altimg-retrieve-existing'
  > * :memo: changelog
  > * workspace bulk_add: fix automatic file_id
  > * Simplify Makefile
  > * Remove version restrictions for pip (no longer needed)
  > * Always use apt --no-install-recommend
  > * Merge branch 'master' of https://github.com/OCR-D/core
  > * :memo: changelog
  > * workspace.remove_file_group: pass recursive

### [eynollah](https://github.com/qurator-spk/eynollah) [ae1990a](https://github.com/qurator-spk/eynollah/commits/ae1990a)..[34a0617](https://github.com/qurator-spk/eynollah/commits/34a0617)

> Release: [v0.0.11](https://github.com/qurator-spk/eynollah/releases/v0.0.11)

  > * depend on tensorflow instead of tensorflow-gpu (#76)
  > * Merge pull request #74 from cneud/main
  > * require model command line option (fix #59) (#73)
  > * Update README.md
  > * Merge pull request #71 from mikegerber/fix/downgrade-patch-dim-log
  > * issue #55 resolved
  > * updating model directory
  > * Merge pull request #70 from qurator-spk/cneud-readme

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [ca15800](https://github.com/cisocrgroup/ocrd_cis/commits/ca15800)..[c90b29f](https://github.com/cisocrgroup/ocrd_cis/commits/c90b29f)

> Release: [v0.1.5](https://github.com/cisocrgroup/ocrd_cis/releases/v0.1.5)

  > * re/segment: join_polygons: fix b490d3f8 imports
  > * sepline detection polygonization: cut inner holes open
  > * ocrolib.morph.all_neighbors: no diagonals
  > * ocropy.lines2region: improve splitting by separators (fix 6d8c0d36)
  > * sepline detection masking: spread against bg and non-separator fg
  > * sepline detection linking: filter results entirely composed by tiny components
  > * sepline detection linking: partition by finding largest cliques
  > * baseline extraction: partition by finding largest cliques
  > * re/segment: sort text lines in reading order
  > * re/segment: join_polygons directly instead of alphashape
  > join_polygons (alpha shape): make more robust
  > remove Calamari dependency (not used, only CLI callout)
  > segment: for more robust bg separator detection, combine criteria of gradient maximum and percentile
  > segment: rewrite separator detection…
  > resegment: if method=lineest, then annotate baselines, too
  > resegment (ccomps/baseline): propagate/spread twice to catch diacritics/punctuation, too
  > re/segment: alpha shape: smaller α to avoid holes
  > segment: fix lines2regions non-continguous partitions
  > segment: annotate baselines, too

### [ocrd_detectron2](https://github.com/bertsky/ocrd_detectron2) [5bb90b1](https://github.com/bertsky/ocrd_detectron2/commits/5bb90b1)..[855fc3b](https://github.com/bertsky/ocrd_detectron2/commits/855fc3b)

> Release: [v0.1.1](https://github.com/bertsky/ocrd_detectron2/releases/v0.1.1)

  > * update requirements
  > * Fix sed command for MacOS
  > * make deps: ignore CUDA 11.2

### [ocrd_doxa](https://github.com/bertsky/ocrd_doxa) [351eb0c](https://github.com/bertsky/ocrd_doxa/commits/351eb0c)..[a95f8e7](https://github.com/bertsky/ocrd_doxa/commits/a95f8e7)

> Release: [v0.0.2](https://github.com/bertsky/ocrd_doxa/releases/v0.0.2)

  > * :package: v0.0.2
  > * add missing param 'dpi'

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [9451a99](https://github.com/OCR-D/ocrd_fileformat/commits/9451a99)..[38f4edf](https://github.com/OCR-D/ocrd_fileformat/commits/38f4edf)

> Release: [v0.5.0](https://github.com/OCR-D/ocrd_fileformat/releases/v0.5.0)

  > * :package: v0.5.0
  > * update README
  > * run pages in parallel (2 concurrent jobs)
  > * make install: differentiate between install-tools (script+json) and deps (just OCRD)
  > * use bulk-add and update to core 2.30
  > * simplify and update to core 2.29
  > * update ocr-fileformat
  > * allow all supported transforms for from-to

### [ocrd_keraslm](https://github.com/OCR-D/ocrd_keraslm) [b11b51d](https://github.com/OCR-D/ocrd_keraslm/commits/b11b51d)..[2101c8f](https://github.com/OCR-D/ocrd_keraslm/commits/2101c8f)

> Release: [v0.4.1](https://github.com/OCR-D/ocrd_keraslm/releases/v0.4.1)

  > * Merge pull request #18 from OCR-D/update-ws-cli
  > * Merge pull request #20 from stweil/update

### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [f6c7f1c](https://github.com/OCR-D/ocrd_segment/commits/f6c7f1c)..[e9acc81](https://github.com/OCR-D/ocrd_segment/commits/e9acc81)

> Release: [v0.1.20](https://github.com/OCR-D/ocrd_segment/releases/v0.1.20)

  > * :package: 0.1.20
  > * extract_pages: fix interference between plotting and JSON extraction in b024b80aa
  > * alpha shape: make even more robust yet
  > * alpha shape: make more robust
  > * :package: 0.1.19
  > * repair (`sanitize`): rewrite…
  > * repair (`plausibilize`): use true alpha shape instead of convex hull
  > * project: reduce default alpha for alphashape
  > * project: add level-of-operation=table
  > * repair: add option 'simplify', generalize 'ensure_consistent'
  > * Shapely 1.8 compatibility
  > * :package: 0.1.18
  > * extract-lines: fix regression in 8bfeb9f9bf

### [opencv-python](https://github.com/skvark/opencv-python) [0eb6c12](https://github.com/skvark/opencv-python/commits/0eb6c12)..[5de8d66](https://github.com/skvark/opencv-python/commits/5de8d66)

> Release: [64](https://github.com/skvark/opencv-python/releases/64)

  > * Merge pull request #644 from nsait-linaro/windows-arm64
  > * Merge pull request #652 from asenyaev/asen/pinned_dependencies
  > * Merge pull request #637 from orbisvicis/master

### [sbb_binarization](https://github.com/qurator-spk/sbb_binarization) [0877199](https://github.com/qurator-spk/sbb_binarization/commits/0877199)..[e4c1eb2](https://github.com/qurator-spk/sbb_binarization/commits/e4c1eb2)

> Release: [v0.0.9](https://github.com/qurator-spk/sbb_binarization/releases/v0.0.9)

  > * Merge pull request #37 from bertsky/patch-2
  > * importing types from click is enough
  > * Update cli.py
  > * fixing #30. Directory of model(s) is needed not  model file name.
  > * Merge pull request #36 from qurator-spk/0.0.9
  > * improve usage instructions
  > * Merge pull request #35 from cneud/upgrade_to_tf2_with_tf1.compat_session
  > * Revert "Merge pull request #34 from qurator-spk/upgrade_to_tf2_with_compat_mode"
  > * Merge pull request #34 from qurator-spk/upgrade_to_tf2_with_compat_mode
  > * Merge pull request #31 from bertsky/factor-setup

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [bef631c](https://github.com/bertsky/workflow-configuration/commits/bef631c)..[e50dee4](https://github.com/bertsky/workflow-configuration/commits/e50dee4)

  > * Modifiy cp statement (fix build on MacOS)
  > * ocrd-import: allow running in parallel
  > * ocrd-import: use bulk-add for speedup

## [v2022-03-30](https://github.com/OCR-D/ocrd_all/releases/v2022-03-30)

### [core](https://github.com/OCR-D/core) [6d359e7](https://github.com/OCR-D/core/commits/6d359e7)..[f9c2b6c](https://github.com/OCR-D/core/commits/f9c2b6c)

> Release: [v2.32.0](https://github.com/OCR-D/core/releases/v2.32.0)

  > * :package: v2.32.0
  > * Merge remote-tracking branch 'bertsky/fix-recropped' into test-2.32
  > * Merge remote-tracking branch 'origin/identify-pil-fallback'
  > * ocrd zip bag: in-place _not_ required

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [edc24cd](https://github.com/qurator-spk/dinglehopper/commits/edc24cd)..[1febea8](https://github.com/qurator-spk/dinglehopper/commits/1febea8)

  > * Merge pull request #66 from stweil/master

### [ocrd_anybaseocr](https://github.com/OCR-D/ocrd_anybaseocr) [5bc6de9](https://github.com/OCR-D/ocrd_anybaseocr/commits/5bc6de9)..[94e5037](https://github.com/OCR-D/ocrd_anybaseocr/commits/94e5037)

> Release: [v1.8.2](https://github.com/OCR-D/ocrd_anybaseocr/releases/v1.8.2)

  > * :package: v1.8.2
  > * circleci: update before apt-get install
  > * Merge remote-tracking branch 'bertsky/patch-2'
  > * :package: v1.8.1
  > * Merge pull request #93 from bertsky/patch-1
  > * Merge pull request #92 from stweil/fix

### [ocrd_detectron2](https://github.com/bertsky/ocrd_detectron2) [6daa4f6](https://github.com/bertsky/ocrd_detectron2/commits/6daa4f6)..[5bb90b1](https://github.com/bertsky/ocrd_detectron2/commits/5bb90b1)

> Release: [v0.1.1](https://github.com/bertsky/ocrd_detectron2/releases/v0.1.1)

  > * make deps: ignore CUDA 10.0 and 11.0

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [fbd0457](https://github.com/OCR-D/ocrd_fileformat/commits/fbd0457)..[9451a99](https://github.com/OCR-D/ocrd_fileformat/commits/9451a99)

> Release: [v0.4.1](https://github.com/OCR-D/ocrd_fileformat/releases/v0.4.1)

  > * :package: v0.4.1
  > * :memo: changelog
  > * Merge pull request #38 from bertsky/patch-1

### [ocrd_pagetopdf](https://github.com/UB-Mannheim/ocrd_pagetopdf) [7eb2e4e](https://github.com/UB-Mannheim/ocrd_pagetopdf/commits/7eb2e4e)..[6155605](https://github.com/UB-Mannheim/ocrd_pagetopdf/commits/6155605)

> Release: [v1.0.0](https://github.com/UB-Mannheim/ocrd_pagetopdf/releases/v1.0.0)

  > * Merge pull request #19 from bertsky/fix-imagegrp

### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [00f80bd](https://github.com/OCR-D/ocrd_segment/commits/00f80bd)..[f6c7f1c](https://github.com/OCR-D/ocrd_segment/commits/f6c7f1c)

> Release: [v0.1.17](https://github.com/OCR-D/ocrd_segment/releases/v0.1.17)

  > * extract-lines: fix typo
  > * fix regression in 7e1f189c..d41993df
  > * ocrd_tool.resources: better descriptions
  > * ocrd-tool: list known resources
  > * recognize: improve messages

### [opencv-python](https://github.com/skvark/opencv-python) [65f12d9](https://github.com/skvark/opencv-python/commits/65f12d9)..[0eb6c12](https://github.com/skvark/opencv-python/commits/0eb6c12)

> Release: [64](https://github.com/skvark/opencv-python/releases/64)

  > * Merge pull request #642 from asenyaev/asen/skip_gapi
  > * Merge pull request #641 from asenyaev/asen/revert_pre_downloaded_files

## [v2022-03-25](https://github.com/OCR-D/ocrd_all/releases/v2022-03-25)

### [cor-asv-ann](https://github.com/ASVLeipzig/cor-asv-ann) [bea828a](https://github.com/ASVLeipzig/cor-asv-ann/commits/bea828a)..[1058657](https://github.com/ASVLeipzig/cor-asv-ann/commits/1058657)

> Release: [v0.1.12](https://github.com/ASVLeipzig/cor-asv-ann/releases/v0.1.12)

  > * Ignore Python build artifacts

### [ocrd_anybaseocr](https://github.com/OCR-D/ocrd_anybaseocr) [1a6734a](https://github.com/OCR-D/ocrd_anybaseocr/commits/1a6734a)..[736e302](https://github.com/OCR-D/ocrd_anybaseocr/commits/736e302)

> Release: [v1.8.0](https://github.com/OCR-D/ocrd_anybaseocr/releases/v1.8.0)

  > * :package: v1.8.0
  > * Merge pull request #91 from bertsky/pix2pixhd-as-pkg
  > * Merge pull request #90 from OCR-D/core-2.31

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [b856f5b](https://github.com/cisocrgroup/ocrd_cis/commits/b856f5b)..[2cdfa79](https://github.com/cisocrgroup/ocrd_cis/commits/2cdfa79)

> Release: [v0.1.5](https://github.com/cisocrgroup/ocrd_cis/releases/v0.1.5)

  > * revert e673544 (crashes OpenCV)
  > * fix Workspace.save_image_file args
  > * update to shapely 1.8

### [ocrd_olahd_client](https://github.com/OCR-D/ocrd_olahd_client) [128c3b8](https://github.com/OCR-D/ocrd_olahd_client/commits/128c3b8)..[9809d0c](https://github.com/OCR-D/ocrd_olahd_client/commits/9809d0c)

  > * Merge pull request #4 from stweil/master

### [opencv-python](https://github.com/skvark/opencv-python) [8880543](https://github.com/skvark/opencv-python/commits/8880543)..[65f12d9](https://github.com/skvark/opencv-python/commits/65f12d9)

> Release: [64](https://github.com/skvark/opencv-python/releases/64)

  > * Merge pull request #639 from asenyaev/asen/pre_downloaded_files
  > * Merge pull request #638 from asenyaev/asen/pylint_test

### [sbb_textline_detector](https://github.com/qurator-spk/sbb_textline_detector) [325389a](https://github.com/qurator-spk/sbb_textline_detector/commits/325389a)..[a78f40a](https://github.com/qurator-spk/sbb_textline_detector/commits/a78f40a)

  > * Merge pull request #58 from bertsky/patch-1
  > * Merge pull request #59 from stweil/master

### [ocrd_tesserocr](https://github.com/OCR-D/ocrd_tesserocr) [bfe71b7](https://github.com/OCR-D/ocrd_tesserocr/commits/bfe71b7)..[4876c84](https://github.com/OCR-D/ocrd_tesserocr/commits/4876c84)

> Release: [v0.13.6](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.13.6)

  > * ocrd_tool.resources: better descriptions

## [v2022-03-20](https://github.com/OCR-D/ocrd_all/releases/v2022-03-20)

* Update kraken to include the work-in-progress segmentation, #288
* GitHub actions for `make all`

### [cor-asv-ann](https://github.com/ASVLeipzig/cor-asv-ann) [f19a9b3](https://github.com/ASVLeipzig/cor-asv-ann/commits/f19a9b3)..[bea828a](https://github.com/ASVLeipzig/cor-asv-ann/commits/bea828a)

> Release: [v0.1.12](https://github.com/ASVLeipzig/cor-asv-ann/releases/v0.1.12)

  > * show warning if metric=Levenshtein-fast and confusion>0

### [core](https://github.com/OCR-D/core) [1a7b81c](https://github.com/OCR-D/core/commits/1a7b81c)..[6d359e7](https://github.com/OCR-D/core/commits/6d359e7)

> Release: [v2.31.0](https://github.com/OCR-D/core/releases/v2.31.0)

  > * :package: v2.31.0
  > * Merge remote-tracking branch 'origin/anybaseocr-layout-analysis'
  > * Merge remote-tracking branch 'origin/wsval-missing-args'
  > * Merge remote-tracking branch 'bertsky/patch-5'
  > * OcrdMets.add_file: fix fileGrp regex exception msg
  > * Merge pull request #808 from ulb-sachsen-anhalt/doc/upd/install-deps
  > * Merge pull request #779 from ulb-sachsen-anhalt/feat/rfct/pytest4

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [195354c](https://github.com/qurator-spk/dinglehopper/commits/195354c)..[edc24cd](https://github.com/qurator-spk/dinglehopper/commits/edc24cd)

  > * ✔️ DroneCI: Build on Python 3.6 → 3.10
  > * 👷🏾‍♂️ Remove str() on Path objects
  > * ✔️ CircleCI: Stop testing using Python 3.5
  > * 🐛 Bump rapidfuzz dep to >= 2.0.5 (Fixes gh-65)

### [eynollah](https://github.com/qurator-spk/eynollah) [f0ac0bb](https://github.com/qurator-spk/eynollah/commits/f0ac0bb)..[10f1ace](https://github.com/qurator-spk/eynollah/commits/10f1ace)

> Release: [v0.0.11](https://github.com/qurator-spk/eynollah/releases/v0.0.11)

  > * Merge pull request #65 from mikegerber/fix/enhanced-message
  > * Merge pull request #64 from mikegerber/feat/better-time-msgs
  > * Merge pull request #68 from mikegerber/fix/remove-spurious-textequivs

### [ocrd_anybaseocr](https://github.com/OCR-D/ocrd_anybaseocr) [e930c93](https://github.com/OCR-D/ocrd_anybaseocr/commits/e930c93)..[1a6734a](https://github.com/OCR-D/ocrd_anybaseocr/commits/1a6734a)

> Release: [v1.7.0](https://github.com/OCR-D/ocrd_anybaseocr/releases/v1.7.0)

  > * :package: v1.7.0
  > * README: explain resmgr download and pip install
  > * layout-analysis: fix parent fornew chapter/section
  > * update CHANGELOG
  > * fix/update README
  > * :package: 1.7.0
  > * test_dewarp: also when on CPU, use CROP as input
  > * dewarping: improve model loading and rename params…
  > * dewarping: fix image post-processing…
  > * dewarping: fix prepare_data…
  > * test_dewarp: mets.find_files is a generator now
  > * tests: fix initLogging
  > * tests: fix relative import
  > * add test for dewarping
  > * update requirements
  > * ocrd-tool (tiseg/layout-analysis): use SavedFormat instead of HDF5 by default
  > * layout-analysis: improve…
  > * Makefile: fix test dependencies; update to resmgr cwd semantics

### [tesseract](https://github.com/tesseract-ocr/tesseract) [8b5571f8](https://github.com/tesseract-ocr/tesseract/commits/8b5571f8)..[c2a3efe2](https://github.com/tesseract-ocr/tesseract/commits/c2a3efe2)

> Release: [5.1.0](https://github.com/tesseract-ocr/tesseract/releases/5.1.0)

  > * Create new release 5.1.0
  > * Remove unneeded include statements
  > * Fix typo in descriptions of thresholding parameters
  > * Fix linker flags for MSYS2 clang64 builds
  > * [cmake] Indent.
  > * Merge pull request #3752 from OgreTransporter/fix-issue-3751
  > * README: ALTO is supported since version 4.1.0
  > * Handle image and line regions in output formats ALTO, hOCR and text
  > * Merge pull request #3753 from stweil/clang-warnings
  > * Update codeql-analysis.yml
  > * Update Makefile.am
  > * Remove unused code.
  > * Simplify. Move related function from separate file.
  > * Merge pull request #3745 from egorpugin/main
  > * Fix warnings.
  > * Remove unused fwd.
  > * Remove unused ctors in macros.
  > * Fix list type.
  > * Remove in-class TESS_API.
  > * Ignore more build files.
  > * Fix build.
  > * Fix warnings.
  > * Remove unneeded dtor.
  > * Fix warnings.
  > * Shorten macros.
  > * Remove a local function from class TableRecognizer
  > * Remove some local functions from class ImageFind
  > * Remove unused functions ImageFind::ComposeRGB and ImageFind::ClipToByte
  > * Remove unused function ImageFind::ComputeRectangleColors
  > * Remove unused resolution parameters
  > * Remove some local functions from class LineFinder
  > * Fix comment

### [ocrd_calamari](https://github.com/OCR-D/ocrd_calamari) [76b34c5](https://github.com/OCR-D/ocrd_calamari/commits/76b34c5)..[ecb0d67](https://github.com/OCR-D/ocrd_calamari/commits/ecb0d67)

> Release: [v1.0.3](https://github.com/OCR-D/ocrd_calamari/releases/v1.0.3)

  > * ✔️ Handle PAGE XML namespace dynamically and without hardcoding
  > * ✔️ CircleCI: Use a test matrix to test on different Python versions
  > * ✔️ Move installing deps to Makefile
  > * ✔️ CircleCI: Test using the python:3.6.12 image
  > * Merge pull request #74 from bertsky/fix-tests-again
  > * git push
  > * Merge pull request #70 from bertsky/patch-2

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [529f7f5](https://github.com/cisocrgroup/ocrd_cis/commits/529f7f5)..[b856f5b](https://github.com/cisocrgroup/ocrd_cis/commits/b856f5b)

> Release: [v0.1.5](https://github.com/cisocrgroup/ocrd_cis/releases/v0.1.5)

  > * resegment: join_polygons: make equidistant points relative to estimated scale
  > * resegment: join_polygons: allow non-contiguous input, too
  > * resegment: fix method=baseline
  > * Merge pull request #77 from bertsky/fix-resegment

### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [ff1f477](https://github.com/OCR-D/ocrd_segment/commits/ff1f477)..[00f80bd](https://github.com/OCR-D/ocrd_segment/commits/00f80bd)

> Release: [v0.1.17](https://github.com/OCR-D/ocrd_segment/releases/v0.1.17)

  > * :package: 0.1.17
  > * project: use alpha-shape instead of convex hull
  > * forgot actual source file (86e9474edd)
  > * update README
  > * :package: v0.1.16
  > * project: new processor
  > * repair/plausibilize: fix scope of result list (avoids deleting multiple times)
  > * :package: v0.1.15
  > * Merge branch 'excel_gt_writer'
  > * plausibilize: both analyse & apply iff enabled
  > * :package: v0.1.14
  > * repair: fix line split rule
  > * Merge branch 'master' of ssh://github.com/OCR-D/ocrd_segment
  > * repair: generalize plausibilization…

### [ocrd_tesserocr](https://github.com/OCR-D/ocrd_tesserocr) [ac27465](https://github.com/OCR-D/ocrd_tesserocr/commits/ac27465)..[bfe71b7](https://github.com/OCR-D/ocrd_tesserocr/commits/bfe71b7)

> Release: [v0.13.6](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.13.6)

  > * ocrd-tool: list known resources

### [opencv-python](https://github.com/skvark/opencv-python) [209d32e](https://github.com/skvark/opencv-python/commits/209d32e)..[8880543](https://github.com/skvark/opencv-python/commits/8880543)

> Release: [64](https://github.com/skvark/opencv-python/releases/64)

  > * Merge pull request #632 from asenyaev/asen/fix_current_builds

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [f5faf29](https://github.com/bertsky/workflow-configuration/commits/f5faf29)..[bef631c](https://github.com/bertsky/workflow-configuration/commits/bef631c)

  > * ocrd-import: delegate to ocrd logging
  > * ocrd-import: fix numerical retval
  > * ocrd-import: fix backing out of errors (again)
  > * ocrd-import: show error if not directory
  > * ocrd-import: fix histexpand
  > * ocrd-page-transform: rely on recent bashlib resource changes


## [v2022-02-03](https://github.com/OCR-D/ocrd_all/releases/v2022-02-03)

New projects:

* [ocrd_doxa](https://github.com/bertsky/ocrd_doxa)
* [ocrd_detectron2](https://github.com/bertsky/ocrd_detectron2)


### [core](https://github.com/OCR-D/core) [66cd13f9](https://github.com/OCR-D/core/commits/66cd13f9)..[836eb05e](https://github.com/OCR-D/core/commits/836eb05e)

> Release: [v2.30.0](https://github.com/OCR-D/core/releases/v2.30.0)

  > * :package: v2.30.0
  > * :memo: changelog
  > * Merge branch 'show-resource-subdir'
  > * :memo: changelog
  > * Merge branch 'bulk-add-from-stdin'
  > * :memo: changelog
  > * Merge branch 'simplify-bashlib'
  > * :memo: changelog
  > * Merge remote-tracking branch 'bertsky/patch-2'
  > * Merge remote-tracking branch 'bertsky/patch-1'
  > * :memo: changelog
  > * Merge branch 'master' into decorator-working-dir
  > * Merge remote-tracking branch 'origin/master' into decorator-working-dir
  > * Resolve.resolve_mets_arguments: simplify resolution logic, test all cases
  > * ocrd workspace CLI: Rely on the --mets*/--directory logic in Resolver
  > * make resolve_mets_arguments a method of Resolver, reintroduce --mets-basename DeprecactionWarning
  > * Merge branch 'master' into decorator-working-dir
  > * use resolve_mets_arguments in processor decorator, fix #693
  > * resolve_mets_arguments: handle --mets == mets.xml, use pathlib
  > * resolve_mets_arguments: handle mets&directory&!mets_basename
  > * extract --mets/--mets-basenme/--directory logic to utils.resolve_mets_arguments

### [tesseract](https://github.com/tesseract-ocr/tesseract) [5d5cd77e](https://github.com/tesseract-ocr/tesseract/commits/5d5cd77e)..[8b5571f8](https://github.com/tesseract-ocr/tesseract/commits/8b5571f8)

> Release: [5.0.1](https://github.com/tesseract-ocr/tesseract/releases/5.0.1)

  > * Merge pull request #3742 from stweil/robustness
  > * Fix old TODO (STATS::rangemax_)
  > * Additional fix for CI action autotools-macos for MacPorts
  > * Fix CI action autotools-macos for MacPorts
  > * Require cmake 3.10 or newer (#3724)
  > * Add new parameter curl_timeout for curl_easy_setop
  > * Add missing include file for std::max, std::min
  > * ci: Setting PKG_CONFIG_PATH is no longer needed for autoconf builds on MacOS
  > * autoconf: Set PKG_CONFIG_PATH required for Homebrew (macOS)
  > * Merge pull request #3716 from ffontaine/main
  > * Create new release 5.0.1
  > * Update documentation for release 5.0.1
  > * Merge pull request #3712 from stweil/cmake
  > * Fix build on non-x86 non-ARM with clang
  > * Merge pull request #3705 from stweil/cmake
  > * Update required packages for CI
  > * Merge pull request #3704 from stweil/cmake-fixes
  > * Use cmake policy CMP0074 only with version 3.12 or newer
  > * Update submodule googletest to release v1.11.0
  > * Remove unused include statement
  > * Add function ERRCODE::error with only 2 parameters
  > * Fix some compiler warnings (implicit float to double conversion)
  > * Remove unused forward declaration
  > * Merge pull request #3699 from stweil/bugfix
  > * Merge pull request #3697 from stweil/opt
  > * Catch nullptr in STATS::pile_count (fix isse #3694)
  > * Update generator for lookup tables to use TFloat instead of double
  > * Fix some clang compiler warnings
  > * Merge pull request #3690 from stweil/SPDX
  > * Add SPDX-License-Identifier to public include files
  > * Fix compiler warning [-Wsign-compare]
  > * Allow printing of bitfield with variadic templates
  > * Fix compiler warnings caused by empty statements
  > * Replace tprintf comment in API header
  > * Cmake install (#3685)
  > * clean up condition to detect MSCV
  > * fix lstm.cpp build with clang
  > * cmake: fix bcf7bbb6e23fcd7c081
  > * cmake: do not try to even configure training tools if pkg-config is not present.
  > * cmake: reformat with cmake-format and check with cmake-lint
  > * cmake: do not try to configure training tools without PkgConfig
  > * cmake: remove unused code
  > * CMake: Also check x86_64 and i686
  > * cmake: fix fb74c7eac1292fca6221d66ed4428d3a031e99dd
  > * Merge pull request #3681 from stweil/curl
  > * Update README.md
  > * Update unittest-disablelegacy.yml
  > * Update vcpkg-4.1.1.yml
  > * Fix broken msys2 build with gcc 11
  > * Update unittest-disablelegacy.yml
  > * Merge pull request #3669 from pkubaj/patch-1
  > * README: Latest stable version is 5.0.0

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [6f8a612](https://github.com/cisocrgroup/ocrd_cis/commits/6f8a612)..[529f7f5](https://github.com/cisocrgroup/ocrd_cis/commits/529f7f5)

> Release: [v0.1.5](https://github.com/cisocrgroup/ocrd_cis/releases/v0.1.5)

  > * compute_hlines/compute_separators_morph: early length filt by opening must be softer than final criterion
  > * compute_hlines: fix h/v kernel size
  > * ocropy.lines2regions: fall back to topological partitioning
  > * ocropy.lines2regions: improve splitting by separators
  > * ocropy.segment: improve within-region hmerge rule
  > * ocropy.lines2regions: fix textline assignment around existing regions
  > * ocrolib.morph: opt out of np.unique counts

### [cor-asv-ann](https://github.com/ASVLeipzig/cor-asv-ann) [55e58f0](https://github.com/ASVLeipzig/cor-asv-ann/commits/55e58f0)..[f19a9b3](https://github.com/ASVLeipzig/cor-asv-ann/commits/f19a9b3)

> Release: [v0.1.12](https://github.com/ASVLeipzig/cor-asv-ann/releases/v0.1.12)

  > * align: fix 'alignment' if only 1 seq survived
  > * align: fix conf for too long/short subseqs
  > * align: fix conf avg for all-empty lines
  > * update subrepos
  > * add processor align (purely rule-based line-level n-ary multi-OCR voting)
  > * add standalone CLI proc, update documentation
  > * {gen,vectorize}_lines: track filenames and add unsupervised (no GT)
  > * {seq2seq,scripts}.evaluate: add charmap option as well
  > * lib.alignment: fix static confusion count
  > * Merge remote-tracking branch 'origin/master' into HEAD
  > * scripts.compare: show confusion as well
  > * scripts.compare: ensure report contains line content (even for file lists)

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [2497876](https://github.com/qurator-spk/dinglehopper/commits/2497876)..[195354c](https://github.com/qurator-spk/dinglehopper/commits/195354c)

  > * Merge branch 'feat/compare-line-texts'
  > * ⬆️ dinglehopper: Require rapidfuzz >= 1.9.1
  > * 💩 ocrd-galley: Work around OCR-D/core#730
  > * Merge branch 'fix/ci-py310'
  > * Revert "⬆️ CircleCI: Add Python 3.10"
  > * ⬆️ CircleCI: Add Python 3.10
  > * ⬆️ CircleCI: Switch to the new cimg/python image
  > * Merge branch 'rapidfuzz'

### [eynollah](https://github.com/qurator-spk/eynollah) [e769f62](https://github.com/qurator-spk/eynollah/commits/e769f62)..[f0ac0bb](https://github.com/qurator-spk/eynollah/commits/f0ac0bb)

> Release: [v0.0.11](https://github.com/qurator-spk/eynollah/releases/v0.0.11)

  > * :package: v0.0.11
  > * Merge pull request #61 from qurator-spk/resource-directory

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [72139bc](https://github.com/OCR-D/ocrd_fileformat/commits/72139bc)..[fbd0457](https://github.com/OCR-D/ocrd_fileformat/commits/fbd0457)

> Release: [v0.4.0](https://github.com/OCR-D/ocrd_fileformat/releases/v0.4.0)

  > * :package: v0.4.0
  > * Merge pull request #31 from OCR-D/make-pip
  > * Merge pull request #36 from bertsky/fix-page-to-alto

### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [8f180b6](https://github.com/OCR-D/ocrd_segment/commits/8f180b6)..[ff1f477](https://github.com/OCR-D/ocrd_segment/commits/ff1f477)

> Release: [v0.1.13](https://github.com/OCR-D/ocrd_segment/releases/v0.1.13)

  > * evaluate: aggregate per-page metrics
  > * evaluate: avoid clipped image and transparency
  > * evaluate: if detection not found, use gt for logging pageID

### [opencv-python](https://github.com/skvark/opencv-python) [f07201c](https://github.com/skvark/opencv-python/commits/f07201c)..[209d32e](https://github.com/skvark/opencv-python/commits/209d32e)

> Release: [62](https://github.com/skvark/opencv-python/releases/62)

  > * Merge pull request #617 from asenyaev/asen/update_dockerfile
  > * Merge pull request #598 from asenyaev/asen/4.5.5_release
  > * Merge pull request #596 from asenyaev/asen/config_version
  > * Merge pull request #595 from asenyaev/asen/python_limited_api
  > * Merge pull request #590 from cclauss/patch-4
  > * Merge pull request #580 from jreese/patch-1
  > * Merge pull request #579 from asenyaev/asen/fix_pylin_and_pycharm
  > * Merge pull request #577 from asenyaev/asen/fix_build_from_source
  > * Merge pull request #581 from asenyaev/asen/upgrade_auditwheel
  > * Merge pull request #582 from kianmeng/fix-typos
  > * Merge pull request #578 from asenyaev/asen/update_submodules_for_release
  > * Merge pull request #561 from andruekonst/patch-1
  > * Merge pull request #565 from cclauss/patch-2
  > * Merge pull request #563 from asenyaev/asen/python_loader_support
  > * Merge pull request #558 from cclauss/patch-2
  > * Merge pull request #556 from asenyaev/asen/upgrade_to_python_3_10
  > * Merge pull request #547 from asenyaev/asen/lapack_issue
  > * Merge pull request #555 from asenyaev/asen/fix_macos_m1

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [9296644](https://github.com/bertsky/workflow-configuration/commits/9296644)..[f5faf29](https://github.com/bertsky/workflow-configuration/commits/f5faf29)

  > * ocrd-page-transform: add param mimetype (default to PAGE-XML)
  > * ocrd-page-transform: add option to pass xslt-params
  > * add more PAGE XSLT, add option for param mechanism
  > * add 2 more PAGE XSLs
  > * add ocrd-page-transform as processor
  > * ocrd-import: detect+allow ALTO-XML
  > * ocrd-import: fix filenames with white-space
  > * ocrd-import: add --skip option
  > * fix regression in 88f5ca42
  > * redirect stderr to stdout/logfile in parallel case, too
  > * show success/failure of all workspaces
  > * separate install-time and run-time, separate recursive `ocrd-make` and local `make`

## [v2021-12-13](https://github.com/OCR-D/ocrd_all/releases/v2021-12-13)

### [core](https://github.com/OCR-D/core) [c4ca4fab](https://github.com/OCR-D/core/commits/c4ca4fab)..[66cd13f9](https://github.com/OCR-D/core/commits/66cd13f9)

> Release: [v2.29.0](https://github.com/OCR-D/core/releases/v2.29.0)

  > * test_exif: remove platform-dependent skipif mark
  > * Merge remote-tracking branch 'upstream/master' into feat/rfct/pytest
  > * [test][rfct] switch to pytest style
  > * [app][dep] add uniform formatter
  > * [test][rfct] ocrd-exif param + skipif
  > * [app][dep] rather opencv-headless
  > * [test][rfct] exchange unittest with pytest
  > * :package: v2.29.0
  > * Update CHANGELOG.md
  > * Merge branch 'restrict-fileGrp-USE' into release-2.29.0
  > * :memo: changelog
  > * Merge branch 'pr/744'
  > * Merge branch 'pr/753'
  > * Merge pull request #755 from ulb-sachsen-anhalt/feat/rfct/review-dep-opencv

### [ocrd_olena](https://github.com/OCR-D/ocrd_olena) [faf3170](https://github.com/OCR-D/ocrd_olena/commits/faf3170)..[fce9933](https://github.com/OCR-D/ocrd_olena/commits/fce9933)

> Release: [v1.2.6](https://github.com/OCR-D/ocrd_olena/releases/v1.2.6)

  > * :package: 1.2.6
  > * Merge pull request #82 from bertsky/use-bashlib-input-files
  > * be robust if file has no pageId
  > * fix typo in CircleCI
  > * Merge pull request #80 from bertsky/master

### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [bdc6771](https://github.com/OCR-D/ocrd_segment/commits/bdc6771)..[8f180b6](https://github.com/OCR-D/ocrd_segment/commits/8f180b6)

> Release: [v0.1.13](https://github.com/OCR-D/ocrd_segment/releases/v0.1.13)

  > * :package: 0.1.13
  > * evaluate: fix multi-matching and over/undersegmentation metrics, add pixel scores
  > * evaluate: add pixel-wise measures IoU / IoGT / IoDT…
  > * evaluate: also get over/undersegmentation and false DT/GT…
  > * evaluate: refactor and expose standalone CLI
  > * change pycocotools dependency to fork
  > * :package: 0.1.12
  > * evaluate: cleanup unrestricted maxDets
  > * evaluate: fix pycocotools match pair extraction, work around annotation id > 0 assumption


## [v2021-11-30](https://github.com/OCR-D/ocrd_all/releases/v2021-11-30)

Changed:

  * Re-enable `TESSDATA_PREFIX`, #261

### [core](https://github.com/OCR-D/core) [9069a658](https://github.com/OCR-D/core/commits/9069a658)..[c4ca4fab](https://github.com/OCR-D/core/commits/c4ca4fab)

> Release: [v2.28.0](https://github.com/OCR-D/core/releases/v2.28.0)

  > * :package: v2.28.0
  > * Merge branch 'pr/748'
  > * Merge branch 'pr/739'
  > * Merge branch 'pr/743'
  > * Merge remote-tracking branch 'bertsky/workspace-download-wait' > * :memo: changelog
  > * metsHdr/agent/note: add only necessary namespace
  > * run_processor: add mets:notes with in/output fileGrp and params via mets:agent
  > * allow adding mets:note to mets:agent
  > * Merge pull request #737 from OCR-D/update-readme-docs
  > * :package: v2.27.0
  > * Merge remote-tracking branch 'bertsky/workspace-remove-allow-empty-regex'
  > * Merge branch 'resmgr-undefined-resdict'
  > * Merge branch 'fix-workspace-remove-group-fnfe'
  > * Merge branch 'rename-group-id'
  > * remove undeclared requirement on six, fix #726
  > * bump spec to 3.14.0
  > * :package: v2.26.1
  > * Fixed tesseract resource URL for resource 'configs'

### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [34c72c0](https://github.com/OCR-D/ocrd_segment/commits/34c72c0)..[bdc6771](https://github.com/OCR-D/ocrd_segment/commits/bdc6771)

> Release: [v0.1.11](https://github.com/OCR-D/ocrd_segment/releases/v0.1.11)

  > * evaluate: basic mAP/AR functionality (based on pycocotools)

### [tesseract](https://github.com/tesseract-ocr/tesseract) [3313bb79](https://github.com/tesseract-ocr/tesseract/commits/3313bb79)..[924b746e](https://github.com/tesseract-ocr/tesseract/commits/924b746e)

> Release: [5.0.0](https://github.com/tesseract-ocr/tesseract/releases/5.0.0)

  > * Create new release 5.0.0
  > * Merge pull request #3664 from stweil/classify
  > * Merge pull request #3663 from stweil/clang7
  > * autobuild: Fix autogen.sh (reduce build time)
  > * Remove unused GenericVector::contains_index, UnicityTable::contains_id
  > * Remove member function GenericVector<T>::contains
  > * Remove member function UnicityTable<T>::contains

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [8d3dc73](https://github.com/bertsky/workflow-configuration/commits/8d3dc73)..[af76e39](https://github.com/bertsky/workflow-configuration/commits/af76e39)

  > * PAGE transformation scripts: improve error handling vs options
  > * PAGE transformation scripts: cancel if input is not PAGE
  > * add PAGE transformation script for namespace update
  > * add PAGE transformation scripts for text projection
  > * in multi-input case, allow repeating the same input fileGrps
  > * update README
  > * ocrd-import: avoid additional . in file IDs/names
  > * add PAGE transformation script, add comments
  > * remove old repair/view rules
  > * add+wrap various PAGE transformation scripts
  > * ocrd-import: fix backing out of errors
  > * ocrd-import: allow upper case suffixes


## [v2021-10-12](https://github.com/OCR-D/ocrd_all/releases/v2021-10-12)

### [cor-asv-ann](https://github.com/ASVLeipzig/cor-asv-ann) [1b8c120](https://github.com/ASVLeipzig/cor-asv-ann/commits/1b8c120)..[55e58f0](https://github.com/ASVLeipzig/cor-asv-ann/commits/55e58f0)

> Release: [v0.1.12](https://github.com/ASVLeipzig/cor-asv-ann/releases/v0.1.12)

  > * lib.keras_train: adapt to Keras 2.3.*

### [core](https://github.com/OCR-D/core) [271dcdf](https://github.com/OCR-D/core/commits/271dcdf)..[9069a65](https://github.com/OCR-D/core/commits/9069a65)

> Release: [v2.26.0](https://github.com/OCR-D/core/releases/v2.26.0)

  > * :memo: changelog, describe --no-copy-files fix of #713 properly
  > * :package: v2.26.0
  > * :memo: changelog
  > * Merge branch 'resmgr-tesseract-main'
  > * :memo: changelog
  > * Merge branch 'log-to-stderr'
  > * :memo: changelog
  > * Merge remote-tracking branch 'bertsky/ocrd-utils-scale'
  > * :memo: changelog
  > * Merge remote-tracking branch 'bertsky/fix-workspace-merge-filegrp'
  > * :memo: changelog
  > * makefile: reintroduce tests -> assets dependency
  > * Adapt tests to not use OcrdFile directly anymore
  > * Workspace.remove_file: Will always be a single file (because ID is unique)
  > * OcrdFile.__str__: don't raise if not connected to OcrdMets
  > * workspace: raise FNFE in download_file, remove mets:file only after recursion
  > * Workspace.download_url: Use a dummy METS instead of direct OcrdFile instantiation
  > * utils.get_local_filename: handle Kitodo/Goobi file URLs gracefully
  > * workspace validator: catch unresolveable files when doing multipage validation
  > * OcrdFile should never be instantiated w/o reference to METS
  > * eliminate OcrdFile() from OcrdWorkspace, #324
  > * tests/data/sample-features: PNG urls missed .png suffix in mets.xml
  > * tests/data/sample-features: missed foo0.png reference in mets.xml
  > * Merge pull request #706 from OCR-D/more-apidoc-fixes
  > * Merge pull request #705 from OCR-D/fix-exif-test

### [eynollah](https://github.com/qurator-spk/eynollah) [d784202](https://github.com/qurator-spk/eynollah/commits/d784202)..[e769f62](https://github.com/qurator-spk/eynollah/commits/e769f62)

> Release: [v0.0.10](https://github.com/qurator-spk/eynollah/releases/v0.0.10)

  > * :package: v0.0.10
  > * Merge remote-tracking branch 'vahidrezanezhad/main' into main
  > * :package: v0.0.9
  > * Merge remote-tracking branch 'vahidrezanezhad/main' into main
  > * :package: v0.0.8
  > * set pcGtsId before adding file to mets

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [86763d1](https://github.com/OCR-D/ocrd_fileformat/commits/86763d1)..[72139bc](https://github.com/OCR-D/ocrd_fileformat/commits/72139bc)

> Release: [v0.3.0](https://github.com/OCR-D/ocrd_fileformat/releases/v0.3.0)

  > * update ocr-fileformat
  > * :package: v0.3.0

### [ocrd_olena](https://github.com/OCR-D/ocrd_olena) [9db846c](https://github.com/OCR-D/ocrd_olena/commits/9db846c)..[faf3170](https://github.com/OCR-D/ocrd_olena/commits/faf3170)

> Release: [v1.2.4](https://github.com/OCR-D/ocrd_olena/releases/v1.2.4)

  > * Update CHANGELOG.md
  > * Dockerfile: skip apt autoremove
  > * auto-push to Dockerhub

### [ocrd_tesserocr](https://github.com/OCR-D/ocrd_tesserocr) [c0e1440](https://github.com/OCR-D/ocrd_tesserocr/commits/c0e1440)..[b37a710](https://github.com/OCR-D/ocrd_tesserocr/commits/b37a710)

> Release: [v0.13.6](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.13.6)

  > * :package: 0.13.6
  > * Merge pull request #180 from bertsky/no-music-by-default 
  > * segment/recognize: add param find_staves (for pageseg_apply_music_mask) 
  > * segment/recognize: do not find tables when already looking for cells 
  > * :package: 0.13.5


### [opencv-python](https://github.com/skvark/opencv-python) [86c3d2a](https://github.com/skvark/opencv-python/commits/86c3d2a)..[f07201c](https://github.com/skvark/opencv-python/commits/f07201c)

> Release: [56](https://github.com/skvark/opencv-python/releases/56)

  > * Merge pull request #545 from Skylion007/patch-1
  > * Merge pull request #515 from asmorkalov/as/docs_update_actions

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [f1a858a](https://github.com/bertsky/workflow-configuration/commits/f1a858a)..[8d3dc73](https://github.com/bertsky/workflow-configuration/commits/8d3dc73)

  > * skip workspace backups when searching for METS files

## [v2021-07-22](https://github.com/OCR-D/ocrd_all/releases/v2021-07-22)

### [tesseract](https://github.com/tesseract-ocr/tesseract) [c676d5bc](https://github.com/tesseract-ocr/tesseract/commits/c676d5bc)..[88d4028a](https://github.com/tesseract-ocr/tesseract/commits/88d4028a)

> Release: [5.0.0-alpha-20210401](https://github.com/tesseract-ocr/tesseract/releases/5.0.0-alpha-20210401)

  > * Enable pragma for SIMD also when _OPENMP is defined
  > * Use SIMD instructions for DotProductNative
  > * Fix deadlock in lstmtraing. (#3488)
  > * Fix LSTMTrainerTest.BidiTest
  > * Fix IntSimdMatrixTest.AVX2
  > * Fix check for NEON on 32 bit ARM
  > * Catch another FP division by 0 (fixes issue #3483)
  > * Use CMAKE_SYSTEM_PROCESSOR to check for SIMD support options (#3484)
  > * Catch FP division by 0 (fixes issue #3483)
  > * Fix CMake Linux build (#3478)
  > * Bugfix OpenMP with Visual Studio (#3475)
  > * Fix vector resize with init for all elements (issue #3473) (#3474)
  > * Add --reset_learning_rate option to lstmtraining (#3470)
  > * Fix missing reset of best_error_history_ in LSTMTrainer::InitIterations() (#3469)
  > * CI: Replace g++-8 by g++-11 for MacOS
  > * Show layer specified learning rates with combine_tessdata -l (#3468)
  > * Fix permanently disabled optimizations in CMake (#3467)
  > * Null check for GetSourceYResolution (#3457)
  > * Merge pull request #3439 from amitdo/remove-var
  > * Merge pull request #3438 from amitdo/pango
  > * Merge pull request #3437 from amitdo/sauvola
  > * Remove scripts for training
  > * Fix some typos (found by codespell)
  > * Refactor ObjectCache::DeleteUnusedObjects with reverse iterator
  > * Add test for TessBaseAPI::ClearPersistentCache to unit tests
  > * Merge pull request #3431 from nagadomi/fix_segv
  > * travis: Use libleptonica-dev from Ubuntu focal instead of local build
  > * Simplify list of required packages for CI builds
  > * Fix comment in code
  > * Remove unneeded dependency autoconf-archive from CI builds
  > * Update submodule abseil to tagged release 20210324.1
  > * Update README.md
  > * Remove an arbitrary limit for the image size
  > * Fix compiler warning in binarization code (uninitialized local variable)
  > * Optimize code for binarization
  > * Fix compiler warning
  > * Fix autoconf build for latest MacOS (Intel and M1)
  > * Add conditional compilation with GRAPHICS_DISABLED
  > * Fix warning from autoconf
  > * Merge pull request #3422 from nickjwhite/lstmevalmoreinfo
  > * Postfix for #3418.
  > * Merge pull request #3418 from amitdo/thresholder
  > * Allow explicit casts of Image to Pix**.
  > * [misc] Fix variable type. Fixes warning.
  > * Remove unneeded header.
  > * Revert d6cdc52. Fixes #3412.
  > * Merge pull request #3410 from ulb-sachsen-anhalt/fix/fix-typo-icu
  > * Merge pull request #3408 from GerHobbelt/patch-2
  > * Merge pull request #3406 from Lucas-C/add-print-fonts-table-arg
  > * Update cmake-win64.yml
  > * Improved fix for issue #3405
  > * Revert "Fix double free. Closes #3405."
  > * Misc.
  > * Fix double free. Closes #3405.
  > * Remove unneeded ctor.
  > * Make FontSet just a vector.
  > * Properly init font set.
  > * Replace FontSet struct with vector. It may be improved further (remove pointer?).
  > * Remove unused headers.
  > * Fix issue #3404 (empty page regression)
  > * Remove two assertions which are triggered by fuzzing
  > * Fix some compiler warnings with GRAPHICS_DISABLED
  > * Fix memory leak (OSS-Fuzz issue 33220)
  > * Merge pull request #3401 from adaptech-cz/fix-wrong-param
  > * Fix old TODO for struct EDGEPT
  > * Add SVSemaphore destructor to avoid system objects leaks
  > * Replace pointer by value for ScrollView mutex
  > * Fix NULL pointer access (issue #3394)
  > * Merge pull request #3396 from zdenop/v5.clang.cmake.win
  > * Fix OSS-Fuzz issue 32142 (container-overflow write)
  > * Clean, format and optimize code in edgblob.cpp / edgblob.h
  > * Fix headers.
  > * Remove unneeded header.
  > * [edgblob] Replace unique ptr with vector. Fix possible index issues.
  > * Fix another use-after-free (issue #3394)
  > * Merge pull request #3395 from amitdo/amitdo-patch-1
  > * Fix use-after-free (issue #3394)
  > * Merge pull request #3393 from eighttails/fix_zero_division
  > * Fix some typos (most found by codespell)
  > * automake: Add build rule for fuzzer-api-512x256
  > * Update URLs for Google groups
  > * Fix memory leak (OSS-Fuzz issue #32246)
  > * Fix broken build for fuzzer
  > * Merge pull request #3389 from amitdo/authors
  > * lstmrecognizer.cpp: Call OutputStats() only when 'invert' is true (#3387)
  > * Change message from 'Found SSE' to 'Found SSE4.1'
  > * Add const attribute to some functions (API change)
  > * Simplify class REJ by replacing two std::bitset<16> by one std::bitset<32>
  > * Make more functions in class REJ inline
  > * Remove bits16.h and BITS16 data type
  > * Format public API files with modified rules for clang-format
  > * clang-format: Clean formatting rules
  > * Modernize and optimize list_rec a little bit
  > * Modernize code
  > * Remove mfdefs.cpp from CMakeLists.txt and Makefile.am
  > * Refactor microfeatures a bit.
  > * Replace microfeatures from oldlist to std::forward_list.
  > * Correct template args.
  > * Fix new / delete class mismatch
  > * Add missing TESS_API.
  > * Reorder list templates.
  > * Misc.
  > * [elist2] Convert macros to template. Remove source file macro ELIST2IZE.
  > * [elist] Rework macro into template and small macro. Move common iterator template into 'list_iterator.h'.
  > * Misc.
  > * Remove unused methods.
  > * [elist] Remove unused macros QUOTE_IT.
  > * [clist] Remove unused methods.
  > * Rework big clist macro into template and small macro. Remove unused macros QUOTE_IT and CLISTIZE (source file macro).
  > * Merge pull request #3382 from Shreeshrii/windows
  > * RAII: TessBaseAPI::GetIterator()
  > * RAII: TessBaseAPI::AnalyseLayout()
  > * Clean code for hOCR renderer
  > * Merge pull request #3380 from stweil/gridsearch
  > * Remove unnecessary pointer hasher for uset.
  > * Fix CI and update package list before installation
  > * Merge pull request #3376 from stweil/master
  > * Merge pull request #3375 from amitdo/viewer
  > * Create new pre-release 5.0.0-alpha-20210401
  > * Add Image::operator&=().
  > * Add Image::operator|=().
  > * Remove arg from Image::copy().
  > * Init variable.
  > * Add Image::isZero().
  > * Add Image::clone().
  > * Add Image::copy().
  > * Add new files ccstruct/image.cpp and ccstruct/image.h to Makefile
  > * Fix name conflict between class and function named Image
  > * [misc] Update header guard.
  > * Revert 4fa05b9147b957344bf94df1e0fb781acc2c84a6. Make a note.
  > * Basic usage of new Image class. Only pixDestroy is wrapped at the moment.
  > * Initial tesseract Image wrapper.
  > * Remove unused ifdef.
  > * Partially fix issue #3374
  > * Fix some compiler warnings
  > * Improve some structs further (fixes several CID issues)
  > * lstm: Include missing header
  > * Fix compilation for Tensorflow code
  > * Fix some compiler warnings
  > * Merge pull request #3368 from stweil/master
  > * Merge pull request #3367 from stweil/master
  > * Merge pull request #3366 from stweil/master
  > * Add more list tests
  > * Misc.
  > * Remove default locale setting in debug config. Any locale errors must be fixed separately (if any).
  > * Merge pull request #3365 from Shreeshrii/fix
  > * Replace some snprintf by std::to_string and modernize more code
  > * Merge pull request #3364 from stweil/master
  > * Merge pull request #3363 from Shreeshrii/split
  > * Don't convert for loop after '#pragma omp parallel' with clang-tidy
  > * Remove TessBaseAPI::SetThresholder (API change)
  > * Modernize code for OTSU and reduce public API further
  > * Merge pull request #3358 from stweil/master
  > * Merge pull request #3356 from Shreeshrii/ciupdate
  > * Merge pull request #3355 from eighttails/output_training_command_line
  > * Update submodule abseil to tagged release 20200923.3
  > * Fix some compiler warnings
  > * Merge pull request #3354 from stweil/master
  > * Merge pull request #3351 from stweil/master
  > * Use more smart pointers.
  > * Merge pull request #3350 from stweil/master
  > * Merge pull request #3349 from stweil/master
  > * Remove unused function UnicharIdArrayUtils::find_in
  > * Disable unused WriteMemoryCallback if libcurl is not used
  > * Use smart pointers.
  > * Misc.
  > * Fix double free caused by commit f33e80e (fixes issue #3348)
  > * Rename GenericVector::get
  > * Rename UnicityTable::get, UnicityTable::get_mutable
  > * Replace std::array by std::vector to avoid stack overflow
  > * Merge pull request #3345 from stweil/vector
  > * Merge pull request #3344 from stweil/vector
  > * Merge pull request #3342 from stweil/master
  > * Fix new alert reported by LGTM
  > * Merge pull request #3341 from stweil/vector
  > * Merge pull request #3340 from stweil/vector
  > * Partially revert "Replace more GenericVector by std::vector for src/ccutil"
  > * Partially revert "Replace remaining GenericVector by std::vector for src/training"
  > * Merge pull request #3338 from stweil/vector
  > * Merge pull request #3337 from stweil/vector
  > * Fix new alerts reported by LGTM
  > * Add missing reference & for loop iterator
  > * Make only locally used functions row_y_order and row_spacing_order static
  > * Merge pull request #3336 from stweil/vector
  > * Merge pull request #3335 from stweil/genericvector
  > * Merge pull request #3330 from Sintun/master
  > * Fix build system macro. Fixes #3334.
  > * Fix alerts reported by LGTM
  > * Fix removal of duplicates in StructuredTable::FindLinedStructure
  > * Merge pull request #3332 from stweil/vector

## [v2021-07-21](https://github.com/OCR-D/ocrd_all/releases/v2021-07-21)

### [cor-asv-ann](https://github.com/ASVLeipzig/cor-asv-ann) [e919020](https://github.com/ASVLeipzig/cor-asv-ann/commits/e919020)..[1b8c120](https://github.com/ASVLeipzig/cor-asv-ann/commits/1b8c120)

> Release: [v0.1.12](https://github.com/ASVLeipzig/cor-asv-ann/releases/v0.1.12)

  > * :package: 0.1.12
  > * wrapper.evaluate: allow aggregating histograms, add parameter
  > * scripts.compare: allow aggregating histograms
  > * lib.seq2seq / scripts.eval: allow aggregating histograms
  > * lib.alignment: allow aggregating histograms
  > * wrapper.evaluate: rename reported metrics and measure WER, too; expose gt_level parameter
  > * scripts.compare: rename reported metrics and measure WER, too
  > * lib.alignment: apply equivalences when aggregating confusion, too
  > * lib.alignment: more level 1/2 equivalences/normalizations
  > * lib.alignment: remove commented experimental code for other aligners
  > * :package: 0.1.11
  > * update README
  > * lib.alignment: no gaps for confusion counts

### [core](https://github.com/OCR-D/core) [d2c6216f](https://github.com/OCR-D/core/commits/d2c6216f)..[271dcdf6](https://github.com/OCR-D/core/commits/271dcdf6)

> Release: [v2.25.1](https://github.com/OCR-D/core/releases/v2.25.1)

  > * Merge pull request #701 from OCR-D/apidocs-standalone
  > * :package: v2.25.1
  > * Merge remote-tracking branch 'origin/gds-id'
  > * :package: v2.25.0
  > * :memo: changelog
  > * Merge remote-tracking branch 'bertsky/ocrd_page_etree'
  > * :memo: changelog
  > * Merge remote-tracking branch 'bertsky/fix-recrop'
  > * :memo: changelog
  > * Merge branch 'gds-id'
  > * :memo: changelog
  > * fix METS schemaLocation, fix #694
  > * :package: v2.24.0
  > * :memo: changelog
  > * test for #686
  > * image_from_*: yield matching AlternativeImage with richest features, not last
  > * crop_image/image_from_polygon: use mask for background estimation, too

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [0b9af3a](https://github.com/qurator-spk/dinglehopper/commits/0b9af3a)..[2497876](https://github.com/qurator-spk/dinglehopper/commits/2497876)

  > * Merge branch 'master' of github.com:qurator-spk/dinglehopper
  > * 🐛 dinglehopper: Call initLogging before logging

### [eynollah](https://github.com/qurator-spk/eynollah) [80795c9](https://github.com/qurator-spk/eynollah/commits/80795c9)..[d784202](https://github.com/qurator-spk/eynollah/commits/d784202)

> Release: [v0.0.7](https://github.com/qurator-spk/eynollah/releases/v0.0.7)

  > * :package: v0.0.7
  > * Merge remote-tracking branch 'vahidrezanezhad/main' into main
  > * :package: v0.0.6
  > * trivial
  > * #43 empty textlines caused by newer python-opencv, is resolved
  > * #43 resolved

### [ocrd_calamari](https://github.com/OCR-D/ocrd_calamari) [da98713](https://github.com/OCR-D/ocrd_calamari/commits/da98713)..[34013dd](https://github.com/OCR-D/ocrd_calamari/commits/34013dd)

> Release: [v1.0.3](https://github.com/OCR-D/ocrd_calamari/releases/v1.0.3)

  > * 📦 v1.0.3
  > * 🐛 Fix TensorFlow (and h3py) dependency
  > * 📝 Reduce process() docstring again
  > * Merge pull request #65 from bertsky/setup-init
  > * Merge pull request #64 from bertsky/patch-1

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [426a33d](https://github.com/cisocrgroup/ocrd_cis/commits/426a33d)..[6f8a612](https://github.com/cisocrgroup/ocrd_cis/commits/6f8a612)

> Release: [v0.1.5](https://github.com/cisocrgroup/ocrd_cis/releases/v0.1.5)

  > * ocrolib.morph: fix select_regions dtype for just 1 label
  > * segment/polygon_for_parent: skip segment if polygon cannot be made valid

### [ocrd_pc_segmentation](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation) [413f5d3](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/commits/413f5d3)..[ff7c007](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/commits/ff7c007)

> Release: [v0.1.3](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/releases/v0.1.3)

  > * rename ocrd-{pixelclasifier,pc} in code
  > * Remove extras_require from setup.py, no longer needed
  > * Remove extra flags for GPU use (see ocr-d-modul-2-segmentierung/page-segmentation#4)
  > * ocrd-tool.json: ocrd-{pixelclassifier,pc}-segmentation

### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [5fd7254](https://github.com/OCR-D/ocrd_segment/commits/5fd7254)..[34c72c0](https://github.com/OCR-D/ocrd_segment/commits/34c72c0)

> Release: [v0.1.11](https://github.com/OCR-D/ocrd_segment/releases/v0.1.11)

  > * :package: 0.1.11
  > * extract_pages: fix 5c548b1a (BorderType has no id)

### [ocrd_tesserocr](https://github.com/OCR-D/ocrd_tesserocr) [b755b26](https://github.com/OCR-D/ocrd_tesserocr/commits/b755b26)..[c9a27bd](https://github.com/OCR-D/ocrd_tesserocr/commits/c9a27bd)

> Release: [v0.13.4](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.13.4)

  > * :package: 0.13.4
  > * Merge pull request #179 from bertsky/improve-tessapi-reset
  > * recognize: fix 318cefd5 (inverted ChoiceIterator conf threshold)
  > * recognize: improve Tesseract API state wrapper:
  > * typo
  > * :package: 0.13.3
  > * recognize: on glyph level, fall back to RIL.SYMBOL of ChoiceIterator is empty
  > * :package: 0.13.2
  > * forgot requirements
  > * Merge pull request #175 from bertsky/osd-line-recognize-load-script-lang
  > * :package: 0.13.0
  > * Merge pull request #177 from bertsky/clipped-page-image

### [opencv-python](https://github.com/skvark/opencv-python) [fd4e604](https://github.com/skvark/opencv-python/commits/fd4e604)..[86c3d2a](https://github.com/skvark/opencv-python/commits/86c3d2a)

> Release: [56](https://github.com/skvark/opencv-python/releases/56)

  > * Merge pull request #500 from williamjacksn/upload-sdist-to-pypi
  > * Merge pull request #510 from asenyaev/asen/master_update
  > * Merge pull request #507 from asenyaev/asen/macos_m1
  > * Merge pull request #483 from asenyaev/asen/arm_build
  > * Merge pull request #479 from asmorkalov/as/docs_update
  > * Fixed if condition for release job (#478)
  > * make it possible to compile from sources against numpy on macOS aarch64 (#475)
  > * Update opencv to 4.5.2
  > * Add GitHub actions setup for CI instead of Travis & Appveyour (where possible) (#470)

### [sbb_textline_detector](https://github.com/qurator-spk/sbb_textline_detector) [f1d2777](https://github.com/qurator-spk/sbb_textline_detector/commits/f1d2777)..[325389a](https://github.com/qurator-spk/sbb_textline_detector/commits/325389a)

  > * Update README.md


### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [cf51eb1](https://github.com/bertsky/workflow-configuration/commits/cf51eb1)..[f1a858a](https://github.com/bertsky/workflow-configuration/commits/f1a858a)

  > * make server: adapt to new multiprocessing options (num workers, per-page timeout)
  > * detect existing workspaces with arbitrary recursive depth and behind symlinks
  > * include local.mk to allow easy persistent dynamic customization

## [v2021-05-21](https://github.com/OCR-D/ocrd_all/releases/v2021-05-21)

Hotfix (v2021-05-20 was an incomplete merge)

## [v2021-05-20](https://github.com/OCR-D/ocrd_all/releases/v2021-05-20)

### [ocrd_anybaseocr](https://github.com/OCR-D/ocrd_anybaseocr) [6fe756a](https://github.com/OCR-D/ocrd_anybaseocr/commits/6fe756a)..[e930c93](https://github.com/OCR-D/ocrd_anybaseocr/commits/e930c93)

> Release: [v1.6.0](https://github.com/OCR-D/ocrd_anybaseocr/releases/v1.6.0)

  > * :package: v1.6.0
  > * ragequit debugging block-segmentation, disable it
  > * replace keras.saving with the up-to-date location
  > * logging doesn't like standalone % signs
  > * keras.engine.Layer is now tensorflow.keras.layers.Layer
  > * fix keras imports
  > * :package: v1.5.0
  > * Merge branch 'fix-tiseg'
  > * :package: v1.4.1
  > * hotfix: re-introduce ocrd-fork-ocropy requirement
  > * :package: v1.4.0
  > * cropping: edge detection: make position priority peak at 30% of margin and decrease slower inwards
  > * cropping: allow steeper angles for badly skewed/keystoned images
  > * cropping: apply detected ruler to edge detector result, too
  > * cropping: fix for grayscale input
  > * cropping: improve bombast/outdated comment header
  > * cropping: reduce default left/right margin zones
  > * cropping: use more adequate LSD parameters to make line reconstruction via line segment clustering easier
  > * cropping: crop in last derived image (including binarized) and use transparency and bg-filling
  > * cropping: add docstring
  > * cropping: allow plotting debug images to files
  > * cropping: fix 0e00b3e7 (absolute vs relative position)
  > * cropping: edge detection: include wider range of line segments
  > * cropping: edge detection: make position priority peak at 10% of margin
  > * cropping: fix 370005b3 (polygon ordering)
  > * cropping: make everything DPI-relative (assuming 300 DPI as natural scale)
  > * cropping: use intersections from edge detection as polygon instead of bbox, and pad it inwardly
  > * cropping: ignore margin-only columns before merging
  > * cropping: edge detection: make consistency criterion more robust
  > * cropping: edge detection: increase length priority over position
  > * cropping: edge detection: fix gap criterion
  > * cropping: prefer line-based detector if successful on all 4 sides
  > * cropping: more logging
  > * cropping: lower fg density text boxes, merge nearby columns before removing small ones
  > * cropping: ruler detection does not binarization (but mask instead of clip it)
  > * :package: 1.4.0
  > * cropping: ignore margin-only text areas
  > * cropping: rewrite edge detection based algorithm…
  > * cropping: rename and describe parameters in a sane way
  > * cropping: use existing parameters for same things everywhere
  > * cropping: for detection based on textbox estimation, use all contours recursively (not just outer) and use exact contour area (without drawing to intermediate image)
  > * cropping: paste improved pil2array, remove legacy ocrolib dependency
  > * cropping: PIL/ocrolib uses RGB (not BGR) channels
  > * cropping: algorithm needs raw (not binarized) images

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [bd32433](https://github.com/qurator-spk/dinglehopper/commits/bd32433)..[0b9af3a](https://github.com/qurator-spk/dinglehopper/commits/0b9af3a)

  > * Merge pull request #58 from kba/unorderedgroupindexed
  > * 🚧 dinglehopper: Read PAGE UnorderedGroup in XML order

### [eynollah](https://github.com/qurator-spk/eynollah) [26283c6](https://github.com/qurator-spk/eynollah/commits/26283c6)..[80795c9](https://github.com/qurator-spk/eynollah/commits/80795c9)

> Release: [v0.0.5](https://github.com/qurator-spk/eynollah/releases/v0.0.5)

  > * :package: v0.0.5
  > * Merge pull request #42 from qurator-spk/ocrd-noae
  > * :package: v0.0.4
  > * fixed #40 and separators are also written in xml
  > * :package: v0.0.3
  > * Merge branch 'main' of https://github.com/qurator-spk/eynollah into main
  > * fixed #38

### [cor-asv-ann](https://github.com/ASVLeipzig/cor-asv-ann) [6c831fa](https://github.com/ASVLeipzig/cor-asv-ann/commits/6c831fa)..[e919020](https://github.com/ASVLeipzig/cor-asv-ann/commits/e919020)

> Release: [v0.1.10](https://github.com/ASVLeipzig/cor-asv-ann/releases/v0.1.10)

  > * :package: 0.1.10
  > * forgot compare script

### [sbb_binarization](https://github.com/qurator-spk/sbb_binarization) [4a5544d](https://github.com/qurator-spk/sbb_binarization/commits/4a5544d)..[8dd0506](https://github.com/qurator-spk/sbb_binarization/commits/8dd0506)

> Release: [v0.0.8](https://github.com/qurator-spk/sbb_binarization/releases/v0.0.8)

  > * :package: v0.0.8
  > * resolving error for inputs whcih have smaller scale than model patch
  > * Merge pull request #28 from qurator-spk/fix-unbound-var

## [v2021-05-04](https://github.com/OCR-D/ocrd_all/releases/v2021-05-04)

### [eynollah](https://github.com/qurator-spk/eynollah) [12f5b29](https://github.com/qurator-spk/eynollah/commits/12f5b29)..[26283c6](https://github.com/qurator-spk/eynollah/commits/26283c6)

> Release: [v0.0.2](https://github.com/qurator-spk/eynollah/releases/v0.0.2)

  > * :package: v0.0.2
  > * resolving issue https://github.com/qurator-spk/eynollah/issues/38
  > * adding the binarization model and option to binarize input document for the cases like dark, stronly bright and other ones
  > * strong erosion, more modification
  > * Merge pull request #36 from mikegerber/fix/ocrd-core-req
  > * Update eynollah.py
  > * Merge branch 'main' of https://github.com/qurator-spk/eynollah into main
  > * fixing again the error raised because of erosion

### [sbb_textline_detector](https://github.com/qurator-spk/sbb_textline_detector) [95d8f70](https://github.com/qurator-spk/sbb_textline_detector/commits/95d8f70)..[f1d2777](https://github.com/qurator-spk/sbb_textline_detector/commits/f1d2777)

  > * Merge pull request #57 from mikegerber/fix/setup-namespace


## [v2021-04-25](https://github.com/OCR-D/ocrd_all/releases/v2021-04-25)

* Added https://github.com/qurator-spk/eynollah

## [v2021-03-15](https://github.com/OCR-D/ocrd_all/releases/v2021-03-15)

### [core](https://github.com/OCR-D/core) [1df3f45](https://github.com/OCR-D/core/commits/1df3f45)..[1aabf82](https://github.com/OCR-D/core/commits/1aabf82)

> Release: [v2.23.2](https://github.com/OCR-D/core/releases/v2.23.2)

  > * :package: v2.23.2
  > * add updated sbb_binarization models, ht @vahidrezanezhad

### [tesseract](https://github.com/tesseract-ocr/tesseract) [fe614c60](https://github.com/tesseract-ocr/tesseract/commits/fe614c60)..[c676d5bc](https://github.com/tesseract-ocr/tesseract/commits/c676d5bc)

> Release: [5.0.0-alpha-20201231](https://github.com/tesseract-ocr/tesseract/releases/5.0.0-alpha-20201231)

  > * STRING is no longer required for Visual Studio
  > * Remove last usage of STRING
  > * Remove unused parts of class STRING
  > * Replace remaining STRING by std::string in unittest
  > * Replace remaining STRING by std::string in src/training
  > * Replace all but one remaining STRING by std::string in src/ccstruct
  > * Replace remaining STRING by std::string in src/dict
  > * Replace remaining STRING by std::string in src/viewer and src/wordrec
  > * Replace remaining STRING by std::string in src/classify
  > * Replace remaining STRING by std::string in src/ccmain
  > * Remove unused file.
  > * Replace typedef structs with structs.
  > * snprintf will add '\0' at the end itself.
  > * [training] Modernize.
  > * [unittest] Use more smart ptrs, more std::make_unique instead of .reset(new T()).
  > * Merge pull request #3327 from Shreeshrii/patch-1
  > * [capi] Restore some of wrongly removed apis.
  > * Misc.
  > * Merge pull request #3325 from stweil/string
  > * Merge pull request #3324 from stweil/nt_symclip
  > * Remove unused include statements for strngs.h
  > * [readme] Require C++17 for building.
  > * Add missing export header.
  > * [clang-format] Format generated protobuf source.
  > * [clang-format] Format unit tests.
  > * Include missing config_auto.h
  > * Add missing forward decl.
  > * [clang-format] Execute clang format on include and src dirs.
  > * [clang-format] Update config.
  > * Revert "Format public API files with 'clang-format-11 -i include/tesseract/*.h'"
  > * Format public API files with 'clang-format-11 -i include/tesseract/*.h'
  > * Fix tatweel_test for C++-20
  > * Replace GenericVector by std::vector in class ImageData
  > * Merge pull request #3323 from Shreeshrii/ci
  > * autobuild: Require C++17
  > * Fix build (#3322)
  > * Fix linux build.
  > * Pass empty strings into Tesseract::init_tesseract().
  > * Pass init strings as std::string instead of const char * internally. This does not affect public APIs.
  > * Remove STRING::size() method.
  > * Remove unused STRING::strdup().
  > * Remove unused STRING::unsigned_size().
  > * Replace STRING::truncate_at() with resize().
  > * More std::string replacements.
  > * [cmake] Require C++17.
  > * Clean implementation for (de-)serialization of a vector
  > * Update .travis.yml
  > * Fix serialization for vector of RecodedCharID
  > * Travis: build linux matrix (#3320)
  > * Merge pull request #3318 from Shreeshrii/travis
  > * Add heuristic to fix swap (partially fixes issue #2586)
  > * Replace GenericVector<TBOX> by std::vector<TBOX>
  > * Fix two compiler warnings for serialis.h


## [v2021-03-08](https://github.com/OCR-D/ocrd_all/releases/v2021-03-08)

* Do not set `VOLUME` in Dockerfile, #239
* Do not bake in `tessdata` path for tesseract, #240

### [core](https://github.com/OCR-D/core) [0ca5aab](https://github.com/OCR-D/core/commits/0ca5aab)..[a32857d](https://github.com/OCR-D/core/commits/a32857d)

> Release: [v2.23.1](https://github.com/OCR-D/core/releases/v2.23.1)

  > * :package: v2.23.1
  > * Merge pull request #679 from OCR-D/logging-test-fix
  > * Merge pull request #680 from OCR-D/resmgr-tess-config
  > * Merge pull request #677 from OCR-D/python-versions

### [ocrd_tesserocr](https://github.com/OCR-D/ocrd_tesserocr) [fd17386](https://github.com/OCR-D/ocrd_tesserocr/commits/fd17386)..[b755b26](https://github.com/OCR-D/ocrd_tesserocr/commits/b755b26)

> Release: [v0.12.0](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.12.0)

  > * :package: v0.12.0
  > * :memo: changelog
  > * Merge pull request #172 from OCR-D/logging-function
  > * Merge pull request #170 from bertsky/overwrite_text_skip

### [ocrd_pc_segmentation](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation) [7298475](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/commits/7298475)..[413f5d3](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/commits/413f5d3)

> Release: [v0.1.3](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/releases/v0.1.3)

  > * pip install -U pip-tools for compat with pip 20.3+, fix #18

### [ocrd_wrap](https://github.com/bertsky/ocrd_wrap) [9dfbdb3](https://github.com/bertsky/ocrd_wrap/commits/9dfbdb3)..[5a501df](https://github.com/bertsky/ocrd_wrap/commits/5a501df)

> Release: [v0.1.7](https://github.com/bertsky/ocrd_wrap/releases/v0.1.7)

  > * :package: 0.1.7
  > * skimage-denoise: change option `protect` from bool to pt
  > * :package: 0.1.6
  > * skimage_denoise: make maxsize in pt instead of pt²
  > * skimage_denoise: add option `protect`
  > * :package: 0.1.5
  > * skimage.remove_small_objects expects boolean array
  > * update link labels

### [tesseract](https://github.com/tesseract-ocr/tesseract) [51a214a](https://github.com/tesseract-ocr/tesseract/commits/51a214a)..[fe614c6](https://github.com/tesseract-ocr/tesseract/commits/fe614c6)

> Release: [5.0.0-alpha-20201231](https://github.com/tesseract-ocr/tesseract/releases/5.0.0-alpha-20201231)

  > * Enable less FP exceptions for clang compiler when running tesseract
  > * GenericVector -> std::vector.
  > * Allow to serialize std vectors with classes from TFile. Implementation from GenericVector.
  > * Fix memory leak in DocumentCache
  > * Avoid fp division by 0 (fix issue #3314)
  > * Merge pull request #3313 from stweil/learning_rate

## [v2021-02-27](https://github.com/OCR-D/ocrd_all/releases/v2021-02-27)

### [core](https://github.com/OCR-D/core) [fe119e4](https://github.com/OCR-D/core/commits/fe119e4)..[0ca5aab](https://github.com/OCR-D/core/commits/0ca5aab)

> Release: [v2.23.0](https://github.com/OCR-D/core/releases/v2.23.0)

  > * :package: v2.23.0
  > * :memo: changelog
  > * Merge branch 'calamari-models'
  > * :memo: changelog
  > * Merge branch 'merge-mets'
  > * generate_page: raise ValueError if no numeric part in start/end
  > * document .. range operator
  > * fix ocrdmets test
  > * generate_range: include end
  > * implement value range with .. operator for pageId
  > * :package: v2.22.4
  > * :memo: changelog
  > * Merge pull request #671 from OCR-D/resmgr-cwd-again
  > * :memo: changelog
  > * Merge pull request #665 from OCR-D/gds-suppress-stdout
  > * Merge pull request #664 from OCR-D/fix-docstrings
  > * Merge pull request #666 from OCR-D/validator-log-debug
  > * Merge pull request #669 from OCR-D/fix-indentation

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [8cd8314](https://github.com/qurator-spk/dinglehopper/commits/8cd8314)..[bd32433](https://github.com/qurator-spk/dinglehopper/commits/bd32433)

  > * 🚧 dinglehopper: Try out Drone CI
  > * 🚧 Replace Travis with CircleCI
  > * Merge pull request #50 from b2m/fix-table-extraction

### [ocrd_calamari](https://github.com/OCR-D/ocrd_calamari) [f00df75](https://github.com/OCR-D/ocrd_calamari/commits/f00df75)..[da98713](https://github.com/OCR-D/ocrd_calamari/commits/da98713)

> Release: [v1.0.2](https://github.com/OCR-D/ocrd_calamari/releases/v1.0.2)

  > * 📦 v1.0.2
  > * 🐛 Fix word and glyph coordinates
  > * ✔️ Explicitly check for None
  > * Merge pull request #10 from bertsky/image-features

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [1abf38b](https://github.com/cisocrgroup/ocrd_cis/commits/1abf38b)..[426a33d](https://github.com/cisocrgroup/ocrd_cis/commits/426a33d)

> Release: [v0.1.5](https://github.com/cisocrgroup/ocrd_cis/releases/v0.1.5)

  > * segment: avoid adding existing regions to RO group if they are not immediate children

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [df95fd7](https://github.com/OCR-D/ocrd_fileformat/commits/df95fd7)..[86763d1](https://github.com/OCR-D/ocrd_fileformat/commits/86763d1)

> Release: [v0.2.1](https://github.com/OCR-D/ocrd_fileformat/releases/v0.2.1)

  > * :package: v0.2.1
  > * Merge pull request #28 from OCR-D/fix-page-schema

### [ocrd_pagetopdf](https://github.com/UB-Mannheim/ocrd_pagetopdf) [6047bd4](https://github.com/UB-Mannheim/ocrd_pagetopdf/commits/6047bd4)..[7eb2e4e](https://github.com/UB-Mannheim/ocrd_pagetopdf/commits/7eb2e4e)

> Release: [v1.0.0](https://github.com/UB-Mannheim/ocrd_pagetopdf/releases/v1.0.0)

  > * Install default-jre-headless instead of openjdk-8-jre-headless

### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [744261f](https://github.com/OCR-D/ocrd_segment/commits/744261f)..[8214d35](https://github.com/OCR-D/ocrd_segment/commits/8214d35)

> Release: [v0.1.10](https://github.com/OCR-D/ocrd_segment/releases/v0.1.10)

  > * :package: 0.1.10
  > * extract_page: draw reading-order arrows
  > * extract-pages: add 'feature_filter' param
  > * extract-regions: apply 'feature_filter'
  > * :package: 0.1.9 (extract*: expose param `feature_filter`)
  > * raise pylint karma
  > * :package: 0.1.8
  > * replace-page: fix getLogger context
  > * extract-pages: multi-level mask output via `plot_segmasks`, optional alpha compositing via `plot_overlay`
  > * from-masks: pick default colordict from parameter, omit initial # sign from colorspecs
  > * extract-pages: expose colordict as parameter (with PageViewer scheme as default)
  > * extract_words, extract_glyphs: new

### [opencv-python](https://github.com/skvark/opencv-python) [bbaa777](https://github.com/skvark/opencv-python/commits/bbaa777)..[fd4e604](https://github.com/skvark/opencv-python/commits/fd4e604)

> Release: [48](https://github.com/skvark/opencv-python/releases/48)

  > * disable Qt on macOS for now due to multiple issues
  > * OpenCV 4.5.1
  > * fix paths
  > * Merge branch 'master' of https://github.com/skvark/opencv-python
  > * merge 3.4 changes

### [tesseract](https://github.com/tesseract-ocr/tesseract) [5ca4e006](https://github.com/tesseract-ocr/tesseract/commits/5ca4e006)..[1ab6b0fb](https://github.com/tesseract-ocr/tesseract/commits/1ab6b0fb)

> Release: [5.0.0-alpha-20201231](https://github.com/tesseract-ocr/tesseract/releases/5.0.0-alpha-20201231)

  > * Merge pull request #3311 from stweil/master
  > * Don't compile OpenCL code when OpenCL is disabled
  > * Format code
  > * Remove blanks at line endings
  > * Replace GenericVector by std::vector in class WERD_CHOICE
  > * Update configure.ac
  > * Merge pull request #3309 from stweil/std
  > * Merge pull request #3162 from xloem/android
  > * Merge pull request #3305 from Shreeshrii/vcpkg-cmake-win
  > * Merge pull request #3302 from Shreeshrii/PR1
  > * Merge pull request #3300 from Shreeshrii/autocmake
  > * Handle file list without terminating LF (fix issue #3298)
  > * Update test submodule
  > * Update include statements for external header file allheaders.h
  > * Fix default value for --enable-doc
  > * Merge pull request #3297 from Shreeshrii/autotools
  > * Fix default value for --with-archive and --with-curl
  > * Merge pull request #3292 from stweil/master
  > * Remove Python training scripts which were moved to tesstrain
  > * Change LATIN_FONTS to use replacement fonts from TeX Gyre collection
  > * Merge pull request #3276 from Shreeshrii/travis
  > * Merge pull request #3279 from Shreeshrii/master
  > * Merge pull request #3275 from Shreeshrii/ci
  > * cmake: Use pkg_config to find required libraries
  > * cmake: Don't try to set compile flags for NEON support for ARM64
  > * cmake: Activate NEON support for ARM64
  > * Merge pull request #3270 from Shatur95/fix-set-and-check
  > * Merge pull request #3268 from Shreeshrii/ci
  > * Fix path for test-suite.log with flat unittest build in GitHub actions
  > * Fix build for flat unittest (CPPFLAGS for abseil and gtest)
  > * Merge pull request #3265 from Shreeshrii/master
  > * Merge pull request #3264 from stweil/unittest
  > * Replace GenericVector<float> by std::vector<float> for class SimpleStats
  > * Fix Memory leak in ligature_table_test
  > * Merge pull request #3259 from Shreeshrii/ci
  > * Merge pull request #3257 from tesseract-ocr/ci
  > * Replace STRING by std::string for function read_unlv_file
  > * Remove unneeded include statement for genericvector.h
  > * Remove unneeded include statement for strngs.h
  > * Wordrec: Modernize code
  > * Merge pull request #3256 from stweil/mastertrainer_test
  > * lstmtrainer: Modernize code
  > * lstmtrainer: Remove unused local variable
  > * Replace GenericVector by std::vector in LoadFileLinesToStrings
  > * Reduce number of INFO messages from lstm_test (#3250)
  > * Merge pull request #3252 from Shreeshrii/legacy
  > * Remove unused conditional OSX
  > * Merge pull request #3251 from stweil/master
  > * Merge pull request #3249 from Shreeshrii/ciupdate
  > * Merge pull request #3247 from Shreeshrii/ci
  > * Merge pull request #3244 from Shreeshrii/ci
  > * Update dailycmake.yml
  > * Merge pull request #3243 from Shreeshrii/ci
  > * Merge pull request #3242 from Shreeshrii/ci
  > * Merge pull request #3241 from Shreeshrii/ci
  > * Merge pull request #3239 from Shreeshrii/legacy
  > * Add more information shown by combine_tessdata -l
  > * Add new option -l for combine_tessdata to list the network string
  > * Replace STRING by std::string for LSTMRecognizer::network_str_
  > * Replace STRING by char* in LSTMRecognizer
  > * Merge pull request #3236 from stweil/max_iterations
  > * Merge pull request #3235 from Shreeshrii/ci
  > * Add TESS_API to instantiation of template functions
  > * Use explicit int32_t for serialized data type
  > * Replace GenericVector<BlobData> by std::vector<BlobData>
  > * Remove unnecessary subtest with missing input image
  > * Remove ANDROID_BUILD macro
  > * Fix memory allocation in TFile::DeSerialize(std::vector<T>& data)
  > * Merge pull request #3231 from Shreeshrii/ci
  > * automake: Fix flat build for doc
  > * Don't use local CP_RESULT_STRUCT variable to initialize elements of std::vector
  > * Fix serialization of std::vector (fix issue #3220)
  > * Replace resize(0) by clear() for std::vector
  > * Remove --psm 6 for lstm.train in tesstrain.py
  > * No --psm 6 for lstm.train
  > * automake: Flat build for doc
  > * Fix NEON also tesseractmain.cpp
  > * Fix use of NEON on ARMv8
  > * Revert "Try to fix aarch64 build on macos."
  > * Try to fix cmake build.
  > * Try to fix aarch64 build on macos.
  > * Fix stringrenderer_test
  > * Fix ligature_table_test
  > * Fix pango_font_info_test
  > * Add assertion for IntCastRounded
  > * Update sw.yml
  > * Delete TESSDATA_BEST_DIR macro
  > * Replace snprintf by strncpy (fix compiler warning)
  > * Fix some format strings
  > * Add include path for leptonica for fuzzer build
  > * Merge pull request #3217 from 1480c1/unicode
  > * More std::vector.
  > * Misc.
  > * Move unicodes into files where they are used.
  > * Misc.
  > * Use std::bitset<16> instead of custom BITS16.
  > * More std::vector.
  > * Update sw.yml
  > * Update sw.yml
  > * Update sw.yml
  > * Fix brew check for GitHub actions
  > * Update sw.yml
  > * Update sw.yml
  > * Update sw.yml
  > * Remove remaining parts of emalloc (fix autotools build)
  > * Fix include statement for allheaders.h
  > * Sort entries in Makefile.am
  > * Remove remaining parts of tessopt (fix autotools build)
  > * [test] Init FC early.
  > * Remove emalloc. Replace it with malloc. To be replaced with new later.
  > * Update sw.yml
  > * Update sw.yml
  > * [ci] Copy fonts to testdir.
  > * [test] Init fontconfig early.
  > * [sw] Add pthread to tests.
  > * [sw] Add pthread dependency.
  > * Alloc on stack.
  > * Rmove unused members.
  > * Remove unused var.
  > * More std::vector.
  > * Misc.
  > * [training] More unique ptrs.
  > * Remove tessopt. This fixes mastertrainer test in shared build.
  > * Reorder headers.
  > * Remove unused header.
  > * Remove unused var.
  > * Misc.
  > * Use unique_ptr.
  > * More std::vector.
  > * More std::vector. Simplify.
  > * [test] Return early on error.
  > * Merge branch 'master' of github.com-egorpugin:tesseract-ocr/tesseract
  > * More std::vector.
  > * A better fix to read unichars. Imbue C locale always since on different systems, default locale will give different results.
  > * Correctly read cutoff classes.
  > * Do not swap endian elements with size == 1.
  > * Use templates for serialize/deserialize.
  > * Use std::vector.
  > * Reorder includes.
  > * Remove noisy message.
  > * Remove functions which are only used locally from scanedg.h
  > * Update sw.yml
  > * Update sw.yml
  > * Update sw.yml
  > * Update sw.yml
  > * Update sw.yml
  > * [sw] Add list test.
  > * Add some basic tests for ELIST
  > * Add Leptonica library for ligature_table_test
  > * Remove functions which are only used locally from fpchop.h
  > * Fix autotoools build with --disable-legacy
  > * [ci][github] Split build and test jobs.
  > * Add missing OpenMP flags for fuzzer-api
  > * Update sw.yml
  > * Update sw.yml
  > * Update sw.yml
  > * Update sw.yml
  > * Update sw.yml
  > * Update appveyor.yml
  > * Update sw.yml
  > * Update sw.yml
  > * Update appveyor.yml
  > * Update sw.yml
  > * Update sw.yml
  > * Update appveyor.yml
  > * Update appveyor.yml
  > * Update appveyor.yml
  > * Update sw.yml
  > * [ci][github] Run tests on linux and macos.
  > * [ci][appveyor] Gather tests.
  > * [sw] Better skip tests.
  > * Update appveyor.yml
  > * [ci][appveyor] Initial tests.
  > * [gitignore] Ignore some local dirs.
  > * [sw] Allow to skip tests.
  > * Improve C API. Add tests.
  > * [capi] Reorder headers in capi.h. Put our header before standard ones.
  > * [capi] Remove unused functions.
  > * Restore building of C API. Simplify.
  > * Update .travis.yml
  > * [ci] Try (c)make install to check for possible errors during installation process.
  > * Rename platform.h -> export.h in more places.
  > * Rename platform.h to export.h.
  > * [ci][appveyor] Revert debug builds.
  > * Create new pre-release 5.0.0-alpha-20201231
  > * [ci][appveyor] Also build debug config.
  > * [cmake] Make pango include dirs public.
  > * Merge branch 'master' of github.com-egorpugin:tesseract-ocr/tesseract
  > * [cmake] Make pango deps public.
  > * Remove deleted util.h header.
  > * [cmake] Fix build.
  > * Fix broken autotools build for unittest
  > * Fix broken autotools build
  > * Merge branch 'master' of github.com-egorpugin:tesseract-ocr/tesseract
  > * [cmake] Implement shared builds.
  > * [sw] Remove deleted file.
  > * Move training lib sources into their own dirs.
  > * [cmake] tessopt is a static library.
  > * [cmake] Set hidden visibility by default.
  > * Add missing includes.
  > * Fix linux build.
  > * Merge branch 'master' of github.com-egorpugin:tesseract-ocr/tesseract
  > * Remove GenericVector::compare_callback. This fixes several tests after previous commit.
  > * Use TESS_API for every public symbol. Public symbol is exported from the library. This also applies to unit test and training symbols. Users will be limited to public api, but set of exported symbols will be wider still. Remove TESS_LOCAL. Fix several symbol issues that made visible with these changes.
  > * Remove custom string hasher.
  > * Misc.
  > * Remove GOOGLE_TESSERACT ifdefs.
  > * Misc.
  > * Use template instead of overloads.
  > * Make automake builds less noisy by default
  > * Replace more GenericVector by std::vector
  > * Remove helpers.h from public API
  > * [test] Fix intsimdmatrix test. Update result value based on updated TRand engine.
  > * Export all simd matrices.
  > * Fix linux build.
  > * Correctly use DEBUG macro. C++ compilers do not define it. Instead they define NDEBUG in optimized compilations.
  > * Removed unused fwd decl.
  > * Remove unused fwd decls.
  > * Remove unused typedefs.
  > * Remove unused fwd decl.
  > * Remove comment.
  > * Move MAX_PATH def out from public header.
  > * Use linear congruential random number generator from C++11.
  > * Use std::swap instead of manual function.
  > * Remove empty DLLSYM macro.
  > * Remove public empty header.
  > * [sw] Add new unit tests.
  > * Merge pull request #3208 from stweil/unittest
  > * Fix TFile::DeSerialize, TFile::Serialize for empty vectors
  > * Add missing dependencies for dawg_test
  > * Merge pull request #3206 from stweil/api
  > * Merge pull request #3205 from stweil/api
  > * [test] Create tmp dir in more tests.
  > * Merge branch 'master' of github.com-egorpugin:tesseract-ocr/tesseract
  > * [test] Remove set locale as it causes errors on some systems. It includes grouping for numbers, then pid and some other numbers in gtest are formatted incorrectly.
  > * Fix more lstm tests. 6 failing tests left.
  > * [test] Fix params model test.
  > * Merge branch 'master' of github.com-egorpugin:tesseract-ocr/tesseract
  > * [test] Fix shapetable test.
  > * [test] Disable loading equ.traineddata in equationsdetect test until IdentifySpecialText is turned back on.
  > * [test] Reorder includes.
  > * Fix declaration for C_BLOB
  > * avx2: Remove unused local variables
  > * Fix dependency for fuzzer-api
  > * Remove unused function CompareSTRING
  > * Merge pull request #3203 from stweil/std-vector
  > * Merge pull request #3202 from stweil/fix2
  > * [test] Fix bitvector test by creating tmp dir. 15 failing tests left.
  > * [test] Reorder includes.
  > * [test] Fix mkdir on unix in dawg test.
  > * [sw] Test updates. 18->17 failed tests left.
  > * [test] Fix dawg.
  > * Fix trie's word sort comparator.
  > * [test] Fix unicharset. 21->18 failed tests remaining.
  > * [sw] Build targets with utf-8 flag on msvc.
  > * Fix baseapi test. Use C++ regex instead of gtest ones.
  > * Update appveyor.yml
  > * Merge pull request #3199 from stweil/serialis
  > * Remove unused DocumentData::SaveToBuffer
  > * Merge pull request #3198 from stweil/new-api
  > * Merge branch 'master' of github.com-egorpugin:tesseract-ocr/tesseract
  > * [ci] Build unit tests on github ci on linux/macos.
  > * [sw] Do not build unit tests by default.
  > * [test] Fix include order.
  > * Export symbol for unit test.
  > * Better symbol visibility fix for unit test.
  > * Move training tools into their own dir.
  > * Make symbol visible to fix unit test.
  > * [test] Correctly use assert instead of expect.
  > * [sw] Add unit tests.
  > * Move doubleptr.h to unittests as it is used only there.
  > * Revert kdpair, genericheap changes.
  > * Improve some unit tests.
  > * Allow to construct STRING from nullptr.
  > * Use resize() instead of reserve() in resize_no_init() to match std::vector behavior. Using memory after reserve() is UB.
  > * [sw] Misc.
  > * Fix some compiler errors for heap_test (more remaining)
  > * Add / fix namespace tesseract for unittest
  > * Fix gitignore pattern.
  > * Merge pull request #3195 from stweil/pdf
  > * More fixes for namespace tesseract
  > * Fix build with --disable-graphics
  > * Restore C++17.
  > * [cmake] Try to disable C++17.
  > * Merge pull request #3176 from softana/master
  > * Add missing merge_unicharsets training tool to cmake and sw build.
  > * Add missing namespace prefix for GlobalParams() (fix build for some unit tests)
  > * Update .travis.yml
  > * Add missing namespace prefix (fix build for merge_unicharsets)
  > * Another msvc/macos fix attempt.
  > * Fix macos build. Add missing header.
  > * Try to fix macos build.
  > * [travis] Update macos image.
  > * [cmake] Enable C++17 temporarily.
  > * [travis] Upgrade to Ubuntu 18.04.
  > * Fix some of vector<bool> cases for msvc.
  > * Fix linux build.
  > * [sw] Bump minimal C++ standard to C++17.
  > * Inherit STRING from std::string.
  > * Call base vector::insert() explicitly.
  > * Inherit GenericVector from std::vector. Inherit kdpairs from std::pair. Rewrite some move ctors to modern C++ style.
  > * Merge branch 'master' of github.com-egorpugin:tesseract-ocr/tesseract
  > * Move all tesseract symbols into tesseract namespace. Fix include order in many places.
  > * Delete .rc from tesseractmain.
  > * Reorder includes.
  > * [cmake] Move include dirs into target include dirs.
  > * Remove .rc files. No need to add them into dll/exe.
  > * [cmake] Use source groups for libtess sources.

## [v2021-02-03](https://github.com/OCR-D/ocrd_all/releases/v2021-02-03)

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [ae52a2e](https://github.com/OCR-D/ocrd_fileformat/commits/ae52a2e)..[df95fd7](https://github.com/OCR-D/ocrd_fileformat/commits/df95fd7)

> Release: [v0.2.0](https://github.com/OCR-D/ocrd_fileformat/releases/v0.2.0)

  > * changelog
  > * :package: v0.2.0
  > * Merge branch 'handle-false-positive-page-alto'
  > * update ocr-fileformat

### [sbb_binarization](https://github.com/qurator-spk/sbb_binarization) [ea69494](https://github.com/qurator-spk/sbb_binarization/commits/ea69494)..[4a5544d](https://github.com/qurator-spk/sbb_binarization/commits/4a5544d)

> Release: [v0.0.7](https://github.com/qurator-spk/sbb_binarization/releases/v0.0.7)

  > * :package: v0.0.7
  > * Merge pull request #25 from OCR-D/resolve-resources
  > * Merge pull request #23 from mikegerber/fix/readme-ocrd

### [sbb_textline_detector](https://github.com/qurator-spk/sbb_textline_detector) [4c498fc](https://github.com/qurator-spk/sbb_textline_detector/commits/4c498fc)..[95d8f70](https://github.com/qurator-spk/sbb_textline_detector/commits/95d8f70)

  > * Merge pull request #55 from qurator-spk/resolve-resources
  > * Merge pull request #54 from qurator-spk/tf-1.15
  > * Merge pull request #48 from bertsky/fix-coords

## [v2021-01-30](https://github.com/OCR-D/ocrd_all/releases/v2021-01-30)

* Use `ocrd resmgr` instead of wget for `make install-models*`

### [core](https://github.com/OCR-D/core) [135acb67](https://github.com/OCR-D/core/commits/135acb67)..[fe119e4d](https://github.com/OCR-D/core/commits/fe119e4d)

> Release: [v2.22.3](https://github.com/OCR-D/core/releases/v2.22.3)

  > * :package: v2.22.3
  > * :bug: resmgr: equivalent cwd bug for list_resource_candidated :/
  > * :bug: resmgr: --location cwd should still include "ocrd-resources"
  > * Processor.__init__: remember old cwd before chdir
  > * Proceessor.resolve_resource: log/exit 1 instead of raise
  > * Proceessor.resolve_resource: No more downloading on-demand
  > * update assets
  > * :package: v2.22.2
  > * resource list: disable < 1.0 calamari models, rename resource
  > * :package: v2.22.1
  > * :bug: mkdir -p $HOME/.config/ocrd
  > * :package: v2.22.0
  > * update specs
  > * Merge pull request #559 from OCR-D/resolve-files
  > * update assets and spec to 3.11.0
  > * :memo: changelog
  > * Merge branch 'warn-unless-pageid'
  > * Merge pull request #660 from OCR-D/add-guess-mimetype
  > * Merge pull request #655 from OCR-D/rename-group

### [ocrd_anybaseocr](https://github.com/OCR-D/ocrd_anybaseocr) [de27915](https://github.com/OCR-D/ocrd_anybaseocr/commits/de27915)..[e63f555](https://github.com/OCR-D/ocrd_anybaseocr/commits/e63f555)

> Release: [v1.3.0](https://github.com/OCR-D/ocrd_anybaseocr/releases/v1.3.0)

  > * :package: v1.3.0
  > * Merge pull request #78 from OCR-D/processor-resources
  > * :package: v1.2.0

### [ocrd_calamari](https://github.com/OCR-D/ocrd_calamari) [1c7fcda](https://github.com/OCR-D/ocrd_calamari/commits/1c7fcda)..[f00df75](https://github.com/OCR-D/ocrd_calamari/commits/f00df75)

> Release: [v1.0.1](https://github.com/OCR-D/ocrd_calamari/releases/v1.0.1)

  > * Merge pull request #55 from OCR-D/ocrd-tool-version
  > * 📦 v1.0.1
  > * Merge pull request #53 from OCR-D/resolve-resources
  > * 📝 README: Use new-style OCR-D parameter syntax and new-style mixed output file groups
  > * Merge pull request #49 from OCR-D/fix-48
  > * Merge pull request #52 from OCR-D/checkpoint_dir
  > * Merge pull request #50 from OCR-D/add-calamari-version

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [925d744](https://github.com/cisocrgroup/ocrd_cis/commits/925d744)..[1abf38b](https://github.com/cisocrgroup/ocrd_cis/commits/1abf38b)

> Release: [v0.1.5](https://github.com/cisocrgroup/ocrd_cis/releases/v0.1.5)

  > * re/segment: before spreading lines, assign diacritics to seeds below
  > * segment: ensure run-time hierarchy refs when modifying reading order elements
  > * segment: fix typo
  > * ocrd-cis-align: fix invalid TextEquiv/dataType use
  > * ocrd-cis-align: fix log level override
  > * ocrd-cis-align: fix getLogger context

### [ocrd_im6convert](https://github.com/OCR-D/ocrd_im6convert) [11bfea3](https://github.com/OCR-D/ocrd_im6convert/commits/11bfea3)..[105697f](https://github.com/OCR-D/ocrd_im6convert/commits/105697f)

> Release: [v0.0.5](https://github.com/OCR-D/ocrd_im6convert/releases/v0.0.5)

  > * :package: v0.0.5
  > * Merge pull request #16 from OCR-D/sharedir

### [ocrd_tesserocr](https://github.com/OCR-D/ocrd_tesserocr) [89b73ff](https://github.com/OCR-D/ocrd_tesserocr/commits/89b73ff)..[fd17386](https://github.com/OCR-D/ocrd_tesserocr/commits/fd17386)

> Release: [v0.11.0](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.11.0)

  > * :package: v0.11.0
  > * Merge pull request #166 from OCR-D/processor-resource

### [ocrd_typegroups_classifier](https://github.com/OCR-D/ocrd_typegroups_classifier) [54c8a78](https://github.com/OCR-D/ocrd_typegroups_classifier/commits/54c8a78)..[1ed0cb1](https://github.com/OCR-D/ocrd_typegroups_classifier/commits/1ed0cb1)

> Release: [v0.3.0](https://github.com/OCR-D/ocrd_typegroups_classifier/releases/v0.3.0)

  > * :package: v0.3.0
  > * Merge pull request #8 from OCR-D/resolve-resources

## [v2020-12-28](https://github.com/OCR-D/ocrd_all/releases/v2020-12-28)

* `make check` ensures executables are runnable and produce `--help` output

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [c4d0fae](https://github.com/cisocrgroup/ocrd_cis/commits/c4d0fae)..[925d744](https://github.com/cisocrgroup/ocrd_cis/commits/925d744)

> Release: [v0.1.5](https://github.com/cisocrgroup/ocrd_cis/releases/v0.1.5)

  > * traverse regions in reading-order (so derived images are, too)
  > * resegment: more robust concave hull (really)
  > * resegment: more robust concave hull
  > * segment: skip segments with zero height or width
  > * deskew/binarize/denoise: skip segments with zero height or width
  > * segment: don't hmerge across separators
  > * fix logging typo in 75f185bb1
  > * segment: improve over 62a96f91e by re-ordering, not only grouping ignored and new regions

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [04e4663](https://github.com/OCR-D/ocrd_fileformat/commits/04e4663)..[ae52a2e](https://github.com/OCR-D/ocrd_fileformat/commits/ae52a2e)

> Release: [v0.1.2](https://github.com/OCR-D/ocrd_fileformat/releases/v0.1.2)

  > * :package: v0.1.2
  > * Merge pull request #24 from OCR-D/exit-gracefully

### [ocrd_tesserocr](https://github.com/OCR-D/ocrd_tesserocr) [6ab6167](https://github.com/OCR-D/ocrd_tesserocr/commits/6ab6167)..[89b73ff](https://github.com/OCR-D/ocrd_tesserocr/commits/89b73ff)

> Release: [v0.10.1](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.10.1)

  > * Fix typos and improve log messages (#165)
  > * adjust output fileGrp name (#163)

### [ocrd_typegroups_classifier](https://github.com/OCR-D/ocrd_typegroups_classifier) [dc2f685](https://github.com/OCR-D/ocrd_typegroups_classifier/commits/dc2f685)..[54c8a78](https://github.com/OCR-D/ocrd_typegroups_classifier/commits/54c8a78)

> Release: [v0.2.0](https://github.com/OCR-D/ocrd_typegroups_classifier/releases/v0.2.0)

  > * :package: v0.2.0
  > * Merge pull request #7 from OCR-D/bundle_network
  > * :package: v0.1.4
  > * Merge pull request #6 from OCR-D/simple-cli-help
  > * Merge pull request #5 from bertsky/patch-2

### [opencv-python](https://github.com/skvark/opencv-python) [f33e65d](https://github.com/skvark/opencv-python/commits/f33e65d)..[bbaa777](https://github.com/skvark/opencv-python/commits/bbaa777)

> Release: [46](https://github.com/skvark/opencv-python/releases/46)

  > * Merge pull request #428 from ApproximateIdentity/debug-build-documentation

### [sbb_textline_detector](https://github.com/qurator-spk/sbb_textline_detector) [17069f7](https://github.com/qurator-spk/sbb_textline_detector/commits/17069f7)..[4c498fc](https://github.com/qurator-spk/sbb_textline_detector/commits/4c498fc)

  > * resolving issue https://github.com/qurator-spk/sbb_textline_detection/issues/53

### [tesseract](https://github.com/tesseract-ocr/tesseract) [66175f97](https://github.com/tesseract-ocr/tesseract/commits/66175f97)..[190be30a](https://github.com/tesseract-ocr/tesseract/commits/190be30a)

> Release: [5.0.0-alpha-20201224](https://github.com/tesseract-ocr/tesseract/releases/5.0.0-alpha-20201224)

  > * Create new pre-release 5.0.0-alpha-20201224
  > * Fix dependency on tmp directory for unittest programs
  > * Fix tar command for variants which require -j or -z
  > * Simplify code for equationdetect_test
  > * Simplify code for cleanapi_test
  > * Remove unwanted # at EOL
  > * Merge pull request #3191 from stweil/unittest
  > * Merge pull request #3190 from stweil/pango_font_info_test
  > * Merge pull request #3189 from stweil/pango_font_info_test
  > * Fix configure for flat training build without asciidoc
  > * Fix installation of training tools for flat training build
  > * Add XML_CATALOG_FILES for MacOS with Homebrew (#3188)
  > * Fix unittest for flag training build
  > * Merge branch 'master' of github.com-egorpugin:tesseract-ocr/tesseract
  > * Add include headers to cmake target.
  > * Fix git submodule 'test'
  > * Merge pull request #3179 from Shatur95/fix-cmake-issues
  > * Merge pull request #3181 from stweil/m1


## [v2020-12-10](https://github.com/OCR-D/ocrd_all/releases/v2020-12-10)

### [core](https://github.com/OCR-D/core) [2298662](https://github.com/OCR-D/core/commits/2298662)..[135acb6](https://github.com/OCR-D/core/commits/135acb6)

> Release: [v2.21.0](https://github.com/OCR-D/core/releases/v2.21.0)

  > * :memo: changelog
  > * Merge pull request #651 from OCR-D/bertsky-fix-task-sequence

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [36f4a95](https://github.com/cisocrgroup/ocrd_cis/commits/36f4a95)..[c4d0fae](https://github.com/cisocrgroup/ocrd_cis/commits/c4d0fae)

> Release: [v0.1.5](https://github.com/cisocrgroup/ocrd_cis/releases/v0.1.5)

  > * resegment: improve over new polygonal/global algorithm…
  > * resegment: complete rewrite (polygonal and global)…
  > * common: in hmerge_line_seeds, find and fill shortest gap…

### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [907ba7d](https://github.com/OCR-D/ocrd_segment/commits/907ba7d)..[a26a3c3](https://github.com/OCR-D/ocrd_segment/commits/a26a3c3)

> Release: [v0.1.6](https://github.com/OCR-D/ocrd_segment/releases/v0.1.6)

  > * repair: also ensure >2 points

### [ocrd_tesserocr](https://github.com/OCR-D/ocrd_tesserocr) [24b7ced](https://github.com/OCR-D/ocrd_tesserocr/commits/24b7ced)..[6ab6167](https://github.com/OCR-D/ocrd_tesserocr/commits/6ab6167)

> Release: [v0.10.1](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.10.1)

  > * :package: 0.10.1
  > * Merge pull request #162 from bertsky/polygonalize
  > * Merge pull request #158 from bertsky/add-word-font-attributes

### [ocrd_typegroups_classifier](https://github.com/OCR-D/ocrd_typegroups_classifier) [3d0004f](https://github.com/OCR-D/ocrd_typegroups_classifier/commits/3d0004f)..[dc2f685](https://github.com/OCR-D/ocrd_typegroups_classifier/commits/dc2f685)

> Release: [v0.1.3](https://github.com/OCR-D/ocrd_typegroups_classifier/releases/v0.1.3)

  > * :package: v0.1.3
  > * :memo: changelog
  > * ocrd-tool: add output_file_grp
  > * Merge branch 'pr/4'

### [opencv-python](https://github.com/skvark/opencv-python) [a5fc295](https://github.com/skvark/opencv-python/commits/a5fc295)..[f33e65d](https://github.com/skvark/opencv-python/commits/f33e65d)

> Release: [46](https://github.com/skvark/opencv-python/releases/46)

  > * OpenCV 4.5.0
  > * update OpenCV licensing

### [tesseract](https://github.com/tesseract-ocr/tesseract) [4c35f51](https://github.com/tesseract-ocr/tesseract/commits/4c35f51)..[66175f9](https://github.com/tesseract-ocr/tesseract/commits/66175f9)

> Release: [5.0.0-alpha](https://github.com/tesseract-ocr/tesseract/releases/5.0.0-alpha)

  > * Merge pull request #3172 from MerlijnWajer/master
  > * Merge pull request #3171 from stweil/lsan
  > * Fix build with enabled TensorFlow
  > * Fix regression in Network::Serialize (fix issue #3167)
  > * Merge pull request #3165 from MerlijnWajer/master
  > * Merge pull request #3128 from acoder77/patch-1
  > * Merge pull request #3160 from stweil/string2
  > * Merge pull request #3159 from stweil/pack

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [2336cbb](https://github.com/bertsky/workflow-configuration/commits/2336cbb)..[3909b7b](https://github.com/bertsky/workflow-configuration/commits/3909b7b)

  > * add `make server` bridge for `ocrd workflow server`
  > * make `make show` work independent of workspaces
  > * add show pseudo-target, improve documentation


## [v2020-11-27](https://github.com/OCR-D/ocrd_all/releases/v2020-11-27)

### [core](https://github.com/OCR-D/core) [079aace](https://github.com/OCR-D/core/commits/079aace)..[2298662](https://github.com/OCR-D/core/commits/2298662)

> Release: [v2.21.0](https://github.com/OCR-D/core/releases/v2.21.0)

  > * :package: v2.21.0
  > * :memo: changelog
  > * Merge branch 'profile-cpu-time'
  > * Merge branch 'numpy-any-version'
  > * :memo: changelog
  > * Merge remote-tracking branch 'origin/bertsky-patch-task-sequence'
  > * :memo: changelog
  > * regenerate PAGE API
  > * prune_ReadingOrder: also check empty groups
  > * :package: v2.20.2
  > * Merge pull request #645 from OCR-D/fix-644

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [389e253](https://github.com/qurator-spk/dinglehopper/commits/389e253)..[8cd8314](https://github.com/qurator-spk/dinglehopper/commits/8cd8314)

  > * 🐛 dinglehopper: Bump up ocrd req for zip_input_files
  > * Merge pull request #49 from kba/zip_input_files

### [ocrd_calamari](https://github.com/OCR-D/ocrd_calamari) [795826f](https://github.com/OCR-D/ocrd_calamari/commits/795826f)..[1c7fcda](https://github.com/OCR-D/ocrd_calamari/commits/1c7fcda)

> Release: [v1.0.0](https://github.com/OCR-D/ocrd_calamari/releases/v1.0.0)

  > * 📝 README: Link to model download
  > * 📦 v1.0.0
  > * 🐛 Pin h5py to < 3 because pip
  > * Merge branch 'feat/update-calamari1'

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [1c01978](https://github.com/cisocrgroup/ocrd_cis/commits/1c01978)..[36f4a95](https://github.com/cisocrgroup/ocrd_cis/commits/36f4a95)

> Release: [v0.1.5](https://github.com/cisocrgroup/ocrd_cis/releases/v0.1.5)

  > * segment (page/table level): fix significance criterion for partitions' line labels
  > * segment (page/table level): continue more gracefully when XY-cut fails
  > * segment: prevent empty ReadingOrder group
  > * ensure valid polygons for new coords
  > * polygon_for_parent: ensure path validity before checking consistency
  > * segment/common/ocrolib: use better reconstruction…
  > * segment: fix hmerge transitivity rules
  > * segment (page level): hmerge line labels (within each region) here, too
  > * :fire: morph.label: fix ncomps (+1)
  > * dewarp: expose smoothness parameter
  > * deskew: delegate to core for reflection and rotation
  > * segment: fix pageid
  > * segment: upgrade segmentation failures from warning to error
  > * segment (region level): fix and speed up horizontal merging
  > * segment (page/table level): improve incremental annotation…
  > * recognize: fix regression in 4f3947d28c
  > * clip: require independence instead of min_fraction threshold
  > * clip: avoid suppressing overlapping components from both sides
  > * segment (region level): annotate clipped region images, too
  > * segment (region level): do not ignore seps/neighbours after clipping
  > * resegment: fix against overflow in numpy slices due to rounding errors when cropping
  > * resegment: use set_points to ensure invalidating existing line images
  > * ocrolib.spread_labels: fix when no labels exist
  > * segment: do not suppress neighbours encompassing the full image

### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [8b6591e](https://github.com/OCR-D/ocrd_segment/commits/8b6591e)..[907ba7d](https://github.com/OCR-D/ocrd_segment/commits/907ba7d)

> Release: [v0.1.6](https://github.com/OCR-D/ocrd_segment/releases/v0.1.6)

  > * :package: 0.1.6
  > * replace-original: only ensure coord validity, not consistency
  > * replace-original: also replace @width/height for clarity
  > * replace-original: invalidate Border/orientation, add new original as derived image too
  > * update changelog
  > * repair: also fix negative coords, also on page level

### [sbb_binarization](https://github.com/qurator-spk/sbb_binarization) [30a3c98](https://github.com/qurator-spk/sbb_binarization/commits/30a3c98)..[ea69494](https://github.com/qurator-spk/sbb_binarization/commits/ea69494)

> Release: [v0.0.6](https://github.com/qurator-spk/sbb_binarization/releases/v0.0.6)

  > * :package: v0.0.6
  > * Merge pull request #20 from bertsky/patch-1
  > * Merge pull request #18 from qurator-spk/h5py3

### [sbb_textline_detector](https://github.com/qurator-spk/sbb_textline_detector) [5d7c090](https://github.com/qurator-spk/sbb_textline_detector/commits/5d7c090)..[17069f7](https://github.com/qurator-spk/sbb_textline_detector/commits/17069f7)

  > * Merge pull request #51 from qurator-spk/h5py3

### [tesseract](https://github.com/tesseract-ocr/tesseract) [e20ffdd](https://github.com/tesseract-ocr/tesseract/commits/e20ffdd)..[4c35f51](https://github.com/tesseract-ocr/tesseract/commits/4c35f51)

> Release: [5.0.0-alpha](https://github.com/tesseract-ocr/tesseract/releases/5.0.0-alpha)

  > * Merge pull request #3158 from Shreeshrii/master
  > * Merge pull request #3155 from Shatur95/fix-cmake-targets-path


### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [a9a797e](https://github.com/bertsky/workflow-configuration/commits/a9a797e)..[2336cbb](https://github.com/bertsky/workflow-configuration/commits/2336cbb)

  > * ocrd-import: fix mkdir in workspace dir
  > * when in a GPU semaphore, don't buffer (log) output
  > * ocrd-import: ensure OCR-D-IMG exists before convert
  > * ocrd-import: prefix PAGE-XML file ID by fileGrp in -P mode, too



## [v2020-11-18](https://github.com/OCR-D/ocrd_all/releases/v2020-11-18)

Fixed:

  * sub-venv rules: move core dependency to inner make exclusivel, #217


### [cor-asv-ann](https://github.com/ASVLeipzig/cor-asv-ann) [0ae6867](https://github.com/ASVLeipzig/cor-asv-ann/commits/0ae6867)..[be73c96](https://github.com/ASVLeipzig/cor-asv-ann/commits/be73c96)

> Release: [v0.1.6](https://github.com/ASVLeipzig/cor-asv-ann/releases/v0.1.6)

  > * evaluate: delegate to new zip_input_files in core

### [core](https://github.com/OCR-D/core) [6ca42f1](https://github.com/OCR-D/core/commits/6ca42f1)..[079aace](https://github.com/OCR-D/core/commits/079aace)

> Release: [v2.20.1](https://github.com/OCR-D/core/releases/v2.20.1)

  > * :package: v2.20.1
  > * :memo: changelog
  > * ocrd_mets.find: ignore mets:file without mets:FLocat
  > * workspace.image_from_{page,segment}: warn of duplicate features in AlternativeImages
  > * processor.base: improve debug log msg
  > * workspace.image_from_{page,segment}: no Region/@orientation means inherit…
  > * workspace.image_from_{page,segment}: re-crop after rotation…
  > * workspace.image_from_{page,segment}: refactor, less redundant warnings…
  > * :package: v2.20.0
  > * :memo: changelog
  > * Merge pull request #639 from bertsky/fix-page-invalidate-alternativeimages
  > * :memo: changelog
  > * Merge pull request #635 from bertsky/processor.zip_input_files
  > * :memo: changelog
  > * run_cli: do not capute STDOUT/STDERR
  > * :memo: changelog
  > * Merge pull request #637 from bertsky/add-metadata-version
  > * :memo: changelog
  > * Merge pull request #636 from b2m/fix-ocrd-utils-on-windows
  > * :package: v2.19.0
  > * :memo: changelog
  > * Merge pull request #627 from bertsky/fix-pillow-high-depth-images
  > * :memo: changelog
  > * Merge pull request #625 from OCR-D/reset-mets-permissions
  > * Merge pull request #633 from OCR-D/altimage-wo-comment
  > * :memo: changelog
  > * Merge pull request #629 from Witiko/master

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [6e47acd](https://github.com/qurator-spk/dinglehopper/commits/6e47acd)..[389e253](https://github.com/qurator-spk/dinglehopper/commits/389e253)

  > * 🐛 dinglehopper: Fix alto_extract_lines()'s type annotation
  > * 🐛 dinglehopper: Fix alto_extract()'s type annotation
  > * ✔️ dinglehopper: Add missing integration test markers
  > * 📝 dinglehopper: README-DEV: Massage markdown a bit
  > * Merge pull request #46 from b2m/tool-changes
  > * 🐛 dinglehopper: Normalize in plain_extract()
  > * 🎨 dinglehopper: Reformat using black
  > * 🎨 dinglehopper: s/LOG/log
  > * Merge pull request #43 from bertsky/patch-1
  > * Merge pull request #42 from b2m/test-python-cache-for-travis
  > * Merge pull request #37 from b2m/fix-sort-with-none
  > * Merge pull request #39 from b2m/test-python-3.9
  > * Merge pull request #38 from b2m/add-editorconfig

Submodule ocrd_anybaseocr cb82aad...de27915:
  > * :package: v1.1.0
  > * :memo: changelog
  > * Merge pull request #75 from bertsky/fix-padding
  > * :memo: fix broken links in models/README.md, fix #76
  < wip fix for #74

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [5ec0e34](https://github.com/cisocrgroup/ocrd_cis/commits/5ec0e34)..[1c01978](https://github.com/cisocrgroup/ocrd_cis/commits/1c01978)

> Release: [v0.1.5](https://github.com/cisocrgroup/ocrd_cis/releases/v0.1.5)

  > * Merge remote-tracking branch 'upstream/master' into fix-resegment
  > * segment (region level): ignore separators and other existing regions
  > * resegment: set correct pageId (not pcGtsId or input file ID)
  > * dewarp: skip zero size (avoid running into numpy conversion problems)
  > * segment: set pageId for derived images, too
  > * segment: fix reference before assignment when partitioning
  > * resegment: skip empty line polygons

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [ded152d](https://github.com/OCR-D/ocrd_fileformat/commits/ded152d)..[04e4663](https://github.com/OCR-D/ocrd_fileformat/commits/04e4663)

> Release: [v0.1.1](https://github.com/OCR-D/ocrd_fileformat/releases/v0.1.1)

  > * :memo: README: fix 2nd workflow-configuration example, fix #22

### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [aadbc7b](https://github.com/OCR-D/ocrd_segment/commits/aadbc7b)..[8b6591e](https://github.com/OCR-D/ocrd_segment/commits/8b6591e)

> Release: [v0.1.5](https://github.com/OCR-D/ocrd_segment/releases/v0.1.5)

  > * :package: 0.1.5
  > * evaluate: delegate to zip_input_files now in core
  > * replace_original: delegate to repair.ensure_consistent
  > * replace_page: delegate to zip_input_files now in core
  > * replace_page: delegate to repair.ensure_consistent
  > * replace_page: catch invalid coords and skip page
  > * replace_page: new OCR-D CLI (inverse of replace_original)
  > * :package: 0.1.4
  > * repair: fix coordinate consistency/validity errors if possible
  > * extract-regions: set pageId for derived images, too

### [ocrd_wrap](https://github.com/bertsky/ocrd_wrap) [1876b65](https://github.com/bertsky/ocrd_wrap/commits/1876b65)..[9dfbdb3](https://github.com/bertsky/ocrd_wrap/commits/9dfbdb3)

> Release: [v0.1.3](https://github.com/bertsky/ocrd_wrap/releases/v0.1.3)

  > * :package: 0.1.4
  > * skimage-normalize: fix typo in 0aca581e
  > * :package: 0.1.3
  > * all: fix pageId for sub-page derived images…

### [opencv-python](https://github.com/skvark/opencv-python) [2ce6d97](https://github.com/skvark/opencv-python/commits/2ce6d97)..[a5fc295](https://github.com/skvark/opencv-python/commits/a5fc295)

> Release: [46](https://github.com/skvark/opencv-python/releases/46)

  > * fix min supported numpy
  > * use numpy 1.19.3
  > * fix py version
  > * add arm64 matrix entries and update Dockerfile
  > * add test image
  > * test depends, more specific pyproject.toml
  > * add numpy version to setup.py
  > * add env markers for aarch64
  > * try with new images
  > * update README
  > * another fix for slashes
  > * fix slashes
  > * download Python 3.9 manually
  > * fix min numpy version
  > * fix py39 entry
  > * fix auditwheel patching
  > * fix line endings
  > * Merge branch 'feat/python39' of https://github.com/skvark/opencv-python into feat/python39
  > * fix pyproject.toml
  > * fix typo
  > * Python 3.9 preparations

### [sbb_binarization](https://github.com/qurator-spk/sbb_binarization) [f0e0a75](https://github.com/qurator-spk/sbb_binarization/commits/f0e0a75)..[30a3c98](https://github.com/qurator-spk/sbb_binarization/commits/30a3c98)

> Release: [v0.0.5](https://github.com/qurator-spk/sbb_binarization/releases/v0.0.5)

  > * require h5py < 3, qurator-spk/sbb_textline_detection#50, tensorflow/tensorflow#44467
  > * :package: v0.0.5
  > * Merge pull request #17 from sulzbals/ram-consumption
  > * Update README.md
  > * Update README.md
  > * Update README.md
  > * Update README.md
  > * Update README.md
  > * Update README.md

### [sbb_textline_detector](https://github.com/qurator-spk/sbb_textline_detector) [247d5f9](https://github.com/qurator-spk/sbb_textline_detector/commits/247d5f9)..[5d7c090](https://github.com/qurator-spk/sbb_textline_detector/commits/5d7c090)

  > * require h5py < 3, #50
  > * Merge pull request #49 from qurator-spk/readme-upd

### [tesseract](https://github.com/tesseract-ocr/tesseract) [5761880](https://github.com/tesseract-ocr/tesseract/commits/5761880)..[e20ffdd](https://github.com/tesseract-ocr/tesseract/commits/e20ffdd)

> Release: [5.0.0-alpha](https://github.com/tesseract-ocr/tesseract/releases/5.0.0-alpha)

  > * Merge pull request #3153 from stweil/scale

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [aa4fe96](https://github.com/bertsky/workflow-configuration/commits/aa4fe96)..[a9a797e](https://github.com/bertsky/workflow-configuration/commits/a9a797e)

  > * fix errexit in subshell
  > * add util fix-page-coords
  > * Merge branch 'master' of https://github.com/bertsky/workflow-configuration
  > * append to workspace.workflow log files (don't truncate)

## [v2020-10-29](https://github.com/OCR-D/ocrd_all/releases/v2020-10-29)

### [cor-asv-ann](https://github.com/ASVLeipzig/cor-asv-ann) [f48b0e2](https://github.com/ASVLeipzig/cor-asv-ann/commits/f48b0e2)..[0ae6867](https://github.com/ASVLeipzig/cor-asv-ann/commits/0ae6867)

> Release: [v0.1.6](https://github.com/ASVLeipzig/cor-asv-ann/releases/v0.1.6)

  > * evaluate: use output file group with JSON reports per page and totals
  > * lib.alignment: fix dist (use largest length as denominator)
  > * Merge branch 'fix-zip-input-files' into 'master'

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [f2367ac](https://github.com/qurator-spk/dinglehopper/commits/f2367ac)..[6e47acd](https://github.com/qurator-spk/dinglehopper/commits/6e47acd)

  > * 📝 dinglehopper: Move screenshot higher
  > * 🐛 dinglehopper: Skip pages if there is no GT nor OCR (Fixes GH-34)
  > * 🐛 dinglehopper: Do try to get text when no TextEquivs exist
  > * Merge branch 'feat/text-extraction-levels'

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [ed932e1](https://github.com/OCR-D/ocrd_fileformat/commits/ed932e1)..[ded152d](https://github.com/OCR-D/ocrd_fileformat/commits/ded152d)

> Release: [v0.1.1](https://github.com/OCR-D/ocrd_fileformat/releases/v0.1.1)

  > * :package: v0.1.1
  > * Merge pull request #20 from OCR-D/fix-overwrite

### [tesseract](https://github.com/tesseract-ocr/tesseract) [11297c9](https://github.com/tesseract-ocr/tesseract/commits/11297c9)..[5761880](https://github.com/tesseract-ocr/tesseract/commits/5761880)

> Release: [5.0.0-alpha](https://github.com/tesseract-ocr/tesseract/releases/5.0.0-alpha)

  > * Merge pull request #3141 from stweil/invert

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [1476350](https://github.com/bertsky/workflow-configuration/commits/1476350)..[aa4fe96](https://github.com/bertsky/workflow-configuration/commits/aa4fe96)

  > * prevent running pattern recipe without prereqs
  > * fix stop for implicit rule search for makefiles


## [v2020-10-22.1](https://github.com/OCR-D/ocrd_all/releases/v2020-10-22.1)

Added:

  * https://github.com/qurator-spk/sbb_binarization

## [v2020-10-22](https://github.com/OCR-D/ocrd_all/releases/v2020-10-22)

### [core](https://github.com/OCR-D/core) [ac86b8e](https://github.com/OCR-D/core/commits/ac86b8e)..[6ca42f1](https://github.com/OCR-D/core/commits/6ca42f1)

> Release: [v2.18.1](https://github.com/OCR-D/core/releases/v2.18.1)

  > * :package: v2.18.1
  > * :memo: changelog
  > * Merge pull request #631 from OCR-D/fix-logging-conf-override
  > * :memo: changelog
  > * [app][log] remove ocrd_workspace logger from default config
  > * [app][log] ocrd.workspace logger outcommented
  > * [app]log] all explicite configurations
  > * [app][doc] integrate loggers into default config
  > * [app][doc] cleared name
  > * :memo: changelog
  > * Merge pull request #628 from ulb-sachsen-anhalt/fix/cli-log-level
  > * :package: v2.18.0
  > * :memo: changelog
  > * update spec to 3.9.1
  > * :memo: changelog
  > * Merge pull request #623 from bertsky/add-processor-help-docstring
  > * :memo: changelog
  > * Merge pull request #614 from OCR-D/find-files-generator
  > * :package: v2.17.2
  > * :memo: changelog
  > * Merge remote-tracking branch 'stweil/numpy'
  > * :package: v2.17.1
  > * :memo: changelog
  > * Merge branch 'master' of https://github.com/OCR-D/core
  > * :memo: changelog
  > * Merge pull request #618 from stweil/master

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [d706ef4](https://github.com/qurator-spk/dinglehopper/commits/d706ef4)..[f2367ac](https://github.com/qurator-spk/dinglehopper/commits/f2367ac)

  > * 🐛 Fix OCR-D CLI for newest OCR-D
  > * ✨ dinglehopper: Show a progressbar on --progress
  > * 🧹 dinglehopper: Disable metrics in JSON report, too
  > * 📝 dinglehopper: Update README to use OCR-D's new and more readable -P option
  > * 🧹 dinglehopper: Move all normalization code to extracted_text.py
  > * Merge branch 'master' of https://github.com/qurator-spk/dinglehopper
  > * 📝 dinglehopper: Update screenshot to include a region id tooltip
  > * 📝 dinglehopper: Add detail about the text extraction and ExtractedText
  > * 📝 dinglehopper: Move developer info to README-DEV.md
  > * Merge branch 'feat/display-segment-id'

### [ocrd_anybaseocr](https://github.com/OCR-D/ocrd_anybaseocr) [a0999ec](https://github.com/OCR-D/ocrd_anybaseocr/commits/a0999ec)..[cb82aad](https://github.com/OCR-D/ocrd_anybaseocr/commits/cb82aad)

> Release: [v1.0.2](https://github.com/OCR-D/ocrd_anybaseocr/releases/v1.0.2)

  > * wip fix for #74

### [ocrd_calamari](https://github.com/OCR-D/ocrd_calamari) [04e950a](https://github.com/OCR-D/ocrd_calamari/commits/04e950a)..[795826f](https://github.com/OCR-D/ocrd_calamari/commits/795826f)

> Release: [v0.0.7](https://github.com/OCR-D/ocrd_calamari/releases/v0.0.7)

  > * Merge branch 'master' of https://github.com/OCR-D/ocrd_calamari
  > * 🧹 Do not install numpy, let the TF dependency do it

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [a6f90ab](https://github.com/cisocrgroup/ocrd_cis/commits/a6f90ab)..[5ec0e34](https://github.com/cisocrgroup/ocrd_cis/commits/5ec0e34)

> Release: [v0.1.5](https://github.com/cisocrgroup/ocrd_cis/releases/v0.1.5)

  > * Merge pull request #75 from bertsky/fix-clip-mode-with-alpha

### [ocrd_olena](https://github.com/OCR-D/ocrd_olena) [cd7a359](https://github.com/OCR-D/ocrd_olena/commits/cd7a359)..[9db846c](https://github.com/OCR-D/ocrd_olena/commits/9db846c)

> Release: [v1.2.3](https://github.com/OCR-D/ocrd_olena/releases/v1.2.3)

  > * Update CHANGELOG.md
  > * Merge pull request #74 from bertsky/fix-niblack-k
  > * Merge pull request #70 from bertsky/needs-im6
  > * Merge pull request #71 from OCR-D/update-ws-cli

### [ocrd_pc_segmentation](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation) [5e8950f](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/commits/5e8950f)..[7298475](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/commits/7298475)

> Release: [v0.1.3](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/releases/v0.1.3)

  > * Really force updating of dependency versions on `make deps`
  > * Force regeneration of requirements.txt on `make deps`
  > * Bump version: 0.2.2 → 0.2.3

### [ocrd_typegroups_classifier](https://github.com/OCR-D/ocrd_typegroups_classifier) [f9bc14e](https://github.com/OCR-D/ocrd_typegroups_classifier/commits/f9bc14e)..[3d0004f](https://github.com/OCR-D/ocrd_typegroups_classifier/commits/3d0004f)

> Release: [v0.1.2](https://github.com/OCR-D/ocrd_typegroups_classifier/releases/v0.1.2)

  > * :package: v0.1.2
  > * Merge pull request #3 from OCR-D/getlogger-in-process

### [ocrd_wrap](https://github.com/bertsky/ocrd_wrap) [a79cd7d](https://github.com/bertsky/ocrd_wrap/commits/a79cd7d)..[1876b65](https://github.com/bertsky/ocrd_wrap/commits/1876b65)

> Release: [v0.1.1](https://github.com/bertsky/ocrd_wrap/releases/v0.1.1)

  > * :package: 0.1.2
  > * Merge branch 'master' of ssh://github.com/bertsky/ocrd_wrap
  > * skimage-normalize: expose black-point/white-point params

### [opencv-python](https://github.com/skvark/opencv-python) [c001042](https://github.com/skvark/opencv-python/commits/c001042)..[2ce6d97](https://github.com/skvark/opencv-python/commits/2ce6d97)

> Release: [44](https://github.com/skvark/opencv-python/releases/44)

  > * Merge pull request #402 from stweil/gitignore

### [sbb_textline_detector](https://github.com/qurator-spk/sbb_textline_detector) [cbc9838](https://github.com/qurator-spk/sbb_textline_detector/commits/cbc9838)..[247d5f9](https://github.com/qurator-spk/sbb_textline_detector/commits/247d5f9)

  > * Merge pull request #45 from bertsky/readme-ocr-d-cli
  > * 🐛 sbb_textline_detector: Re-base Border coords too
  > * 🐛 sbb_textline_detector: Filter cropped images (OCR-D)
  > * Merge branch 'fix/image_from_page'
  > * 🐛 sbb_textline_detector: Work around incompatible numpy version installed by pip

### [tesseract](https://github.com/tesseract-ocr/tesseract) [b19e3ee](https://github.com/tesseract-ocr/tesseract/commits/b19e3ee)..[11297c9](https://github.com/tesseract-ocr/tesseract/commits/11297c9)

> Release: [5.0.0-alpha](https://github.com/tesseract-ocr/tesseract/releases/5.0.0-alpha)

  > * Merge pull request #3130 from robinwatts/pushback15
  > * Merge pull request #2994 from robinwatts/pushback11
  > * Merge pull request #3119 from Shatur95/modernize-cmake-config
  > * Merge pull request #3120 from amitdo/legacy
  > * Merge pull request #3116 from Shatur95/older-install-syntax
  > * Merge pull request #3114 from stweil/globaloc
  > * Merge pull request #3113 from stweil/pango
  > * Merge pull request #3112 from Shatur95/fix-cmake-install-configs


## [v2020-10-13](https://github.com/OCR-D/ocrd_all/releases/v2020-10-13)

### [core](https://github.com/OCR-D/core) [56c4aa6](https://github.com/OCR-D/core/commits/56c4aa6)..[ac86b8e (rewind)](https://github.com/OCR-D/core/commits/ac86b8e (rewind))

> Release: [v2.17.0](https://github.com/OCR-D/core/releases/v2.17.0)

  > :package: v2.18.0
  > :memo: changelog
  > update spec to 3.9.1
  > :memo: changelog
  > Merge pull request #623 from bertsky/add-processor-help-docstring
  > :memo: changelog
  > Merge pull request #614 from OCR-D/find-files-generator
  > :package: v2.17.2
  > :memo: changelog
  > Merge remote-tracking branch 'stweil/numpy'
  > :package: v2.17.1
  > :memo: changelog
  > Merge branch 'master' of https://github.com/OCR-D/core
  > :memo: changelog
  > Merge pull request #618 from stweil/master


### [ocrd_pc_segmentation](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation) [77aafcb](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/commits/77aafcb)..[5e8950f (rewind)](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/commits/5e8950f (rewind))

> Release: [v0.1.3](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/releases/v0.1.3)

  > Bump version: 0.2.2 → 0.2.3

### [opencv-python](https://github.com/skvark/opencv-python) [2ce6d97](https://github.com/skvark/opencv-python/commits/2ce6d97)..[c001042 (rewind)](https://github.com/skvark/opencv-python/commits/c001042 (rewind))

> Release: [44](https://github.com/skvark/opencv-python/releases/44)

  > Merge pull request #402 from stweil/gitignore

### [tesseract](https://github.com/tesseract-ocr/tesseract) [ec01b51](https://github.com/tesseract-ocr/tesseract/commits/ec01b51)..[b19e3ee (rewind)](https://github.com/tesseract-ocr/tesseract/commits/b19e3ee (rewind))

> Release: [5.0.0-alpha](https://github.com/tesseract-ocr/tesseract/releases/5.0.0-alpha)

  > Merge pull request #3119 from Shatur95/modernize-cmake-config
  > Merge pull request #3120 from amitdo/legacy
  > Merge pull request #3116 from Shatur95/older-install-syntax
  > Merge pull request #3114 from stweil/globaloc
  > Merge pull request #3113 from stweil/pango
  > Merge pull request #3112 from Shatur95/fix-cmake-install-configs


## [v2020-10-02](https://github.com/OCR-D/ocrd_all/releases/v2020-10-02)

* Fix "core not updated in sub venv" issue #195


### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [7085ee0](https://github.com/qurator-spk/dinglehopper/commits/7085ee0)..[d706ef4](https://github.com/qurator-spk/dinglehopper/commits/d706ef4)

  > * 📝 Document CER/WER and the format detection (Fixes GH-26)
  > * 💩 dinglehopper: Fix OCR-D CLI test by working around ocrd_cli_wrap_processor() check for arguments

### [ocrd_calamari](https://github.com/OCR-D/ocrd_calamari) [bb9b1ab](https://github.com/OCR-D/ocrd_calamari/commits/bb9b1ab)..[04e950a](https://github.com/OCR-D/ocrd_calamari/commits/04e950a)

> Release: [v0.0.7](https://github.com/OCR-D/ocrd_calamari/releases/v0.0.7)

  > * Merge pull request #45 from OCR-D/getlogger
  > * 🚧 README: Mention METS
  > * 📝 Let intro mention ocrd_calamari + PAGE XML, link to OCR-D

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [fb6cb47](https://github.com/cisocrgroup/ocrd_cis/commits/fb6cb47)..[a6f90ab](https://github.com/cisocrgroup/ocrd_cis/commits/a6f90ab)

> Release: [v0.1.4](https://github.com/cisocrgroup/ocrd_cis/releases/v0.1.4)

  > * Merge pull request #71 from bertsky/fix-getlogger-common

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [584240b](https://github.com/OCR-D/ocrd_fileformat/commits/584240b)..[ed932e1 (rewind)](https://github.com/OCR-D/ocrd_fileformat/commits/ed932e1 (rewind))

> Release: [v0.1.0](https://github.com/OCR-D/ocrd_fileformat/releases/v0.1.0)

  > respect --overwrite, fix #16

### [ocrd_ocropy](https://github.com/OCR-D/ocrd_ocropy) [573d521](https://github.com/OCR-D/ocrd_ocropy/commits/573d521)..[a6e556e](https://github.com/OCR-D/ocrd_ocropy/commits/a6e556e)

> Release: [v0.0.3](https://github.com/OCR-D/ocrd_ocropy/releases/v0.0.3)

  > * :memo: Stres in README that project is obsolete

### [ocrd_olena](https://github.com/OCR-D/ocrd_olena) [54792be](https://github.com/OCR-D/ocrd_olena/commits/54792be)..[cd7a359](https://github.com/OCR-D/ocrd_olena/commits/cd7a359)

> Release: [v1.2.2](https://github.com/OCR-D/ocrd_olena/releases/v1.2.2)

  > * Merge pull request #72 from bertsky/fix-typo-raise

### [ocrd_pagetopdf](https://github.com/UB-Mannheim/ocrd_pagetopdf) [58df37a](https://github.com/UB-Mannheim/ocrd_pagetopdf/commits/58df37a)..[6047bd4](https://github.com/UB-Mannheim/ocrd_pagetopdf/commits/6047bd4)

> Release: [v1.0.0](https://github.com/UB-Mannheim/ocrd_pagetopdf/releases/v1.0.0)

  > * Fix typos (one found by codespell)
  > * Merge pull request #16 from kba/overwrite-notset
  > * ADD Apache-2.0 License
  > * Merge pull request #15 from kba/overwrite-multipage

### [ocrd_pc_segmentation](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation) [3e69bff](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/commits/3e69bff)..[5e8950f](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/commits/5e8950f)

> Release: [v0.1.3](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/releases/v0.1.3)

  > * Update pixel classifier dependency
  > * .gitignore: Ignore generated requirements.txt

### [ocrd_repair_inconsistencies](https://github.com/qurator-spk/ocrd_repair_inconsistencies) [8182063](https://github.com/qurator-spk/ocrd_repair_inconsistencies/commits/8182063)..[c898d6c](https://github.com/qurator-spk/ocrd_repair_inconsistencies/commits/c898d6c)

  > * Merge pull request #11 from kba/getlo
  > * Merge pull request #12 from kba/ocrd-tool-root

### [ocrd_tesserocr](https://github.com/OCR-D/ocrd_tesserocr) [27fe2be](https://github.com/OCR-D/ocrd_tesserocr/commits/27fe2be)..[24b7ced](https://github.com/OCR-D/ocrd_tesserocr/commits/24b7ced)

> Release: [v0.9.5](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.9.5)

  > * Update CHANGELOG.md
  > * Merge pull request #156 from OCR-D/getlogger


## [v2020-09-25](https://github.com/OCR-D/ocrd_all/releases/v2020-09-25)

### [cor-asv-ann](https://github.com/ASVLeipzig/cor-asv-ann) [69bae66](https://github.com/ASVLeipzig/cor-asv-ann/commits/69bae66)..[f48b0e2](https://github.com/ASVLeipzig/cor-asv-ann/commits/f48b0e2)

> Release: [v0.1.3](https://github.com/ASVLeipzig/cor-asv-ann/releases/v0.1.3)

  > * Merge pull request #5 from kba/getlogger

### [cor-asv-fst](https://github.com/ASVLeipzig/cor-asv-fst) [2428cca](https://github.com/ASVLeipzig/cor-asv-fst/commits/2428cca)..[076e04e](https://github.com/ASVLeipzig/cor-asv-fst/commits/076e04e)

  > * Merge pull request #6 from kba/getlogger

### [core](https://github.com/OCR-D/core) [d9fb6e51](https://github.com/OCR-D/core/commits/d9fb6e51)..[cb0f94bc](https://github.com/OCR-D/core/commits/cb0f94bc)

> Release: [v2.17.0](https://github.com/OCR-D/core/releases/v2.17.0)

  > * :package: v2.17.0
  > * :memo: changelog
  > * Merge branch 'make-file-id-syntax'
  > * :memo: changelog
  > * Merge branch 'master' into fix-logging-yet-again
  > * logging disable: CRITICAL->ERROR
  > * logging config_file: info->debug, after loading, specific logger
  > * logging: drop "reinit" initLogging arg
  > * logging: multiple initLogging should log not raise
  > * logging: simplify log message if getLogger before initLogging
  > * logging: disableLogging should actually call logging.disable
  > * logging: builtin config: tensorflow ERROR
  > * logging: if logger is called before initLogging, issue a stern notice about it
  > * Merge branch 'master' into fix-logging-yet-again
  > * Merge branch 'master' into fix-logging-yet-again
  > * logging: fix tests
  > * logging: use method-specific loggers throughout
  > * logging: initLogging on non-module level for all CLI
  > * logging: do not set the root logger to NOTSET, fix #597
  > * logging: handle either config file or builtin config, not both
  > * logging: forbid getLogger before initLogging
  > * logging: forbid multiple non-forced initLogging calls
  > * [rfct] split decorators into topical modules

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [717801b](https://github.com/qurator-spk/dinglehopper/commits/717801b)..[7085ee0](https://github.com/qurator-spk/dinglehopper/commits/7085ee0)

  > * Merge pull request #29 from kba/getlogger
  > * 📝 dinglehopper: Document REPORT_PREFIX (Closes GH-27.)
  > * ⚙️ dinglehopper: Add PyCharm's vcs.xml to git

### [ocrd_anybaseocr](https://github.com/OCR-D/ocrd_anybaseocr) [85f2387](https://github.com/OCR-D/ocrd_anybaseocr/commits/85f2387)..[a0999ec](https://github.com/OCR-D/ocrd_anybaseocr/commits/a0999ec)

> Release: [v1.0.2](https://github.com/OCR-D/ocrd_anybaseocr/releases/v1.0.2)

  > * :package: v1.0.2
  > * Merge pull request #69 from OCR-D/getlogger

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [c361dbb](https://github.com/cisocrgroup/ocrd_cis/commits/c361dbb)..[fb6cb47](https://github.com/cisocrgroup/ocrd_cis/commits/fb6cb47)

> Release: [v0.1.3](https://github.com/cisocrgroup/ocrd_cis/releases/v0.1.3)

  > * Merge pull request #69 from kba/getlogger

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [f1fd61e](https://github.com/OCR-D/ocrd_fileformat/commits/f1fd61e)..[584240b](https://github.com/OCR-D/ocrd_fileformat/commits/584240b)

> Release: [v0.1.0](https://github.com/OCR-D/ocrd_fileformat/releases/v0.1.0)

  > * respect --overwrite, fix #16
  > * :package: v0.1.0
  > * Merge pull request #19 from OCR-D/smarter-ext
  > * :package: v0.0.7
  > * Merge pull request #18 from OCR-D/update-fileformat

### [ocrd_keraslm](https://github.com/OCR-D/ocrd_keraslm) [52cb4ce](https://github.com/OCR-D/ocrd_keraslm/commits/52cb4ce)..[b11b51d](https://github.com/OCR-D/ocrd_keraslm/commits/b11b51d)

> Release: [v0.4.1](https://github.com/OCR-D/ocrd_keraslm/releases/v0.4.1)

  > * :package: v0.4.1
  > * Update CHANGELOG.md
  > * getLogger per method

### [ocrd_kraken](https://github.com/OCR-D/ocrd_kraken) [cea90bd](https://github.com/OCR-D/ocrd_kraken/commits/cea90bd)..[0a839ad](https://github.com/OCR-D/ocrd_kraken/commits/0a839ad)

> Release: [v0.1.2](https://github.com/OCR-D/ocrd_kraken/releases/v0.1.2)

  > * :package: v0.1.2
  > * Merge pull request #32 from OCR-D/getlogger

### [ocrd_pagetopdf](https://github.com/UB-Mannheim/ocrd_pagetopdf) [88faa74](https://github.com/UB-Mannheim/ocrd_pagetopdf/commits/88faa74)..[58df37a](https://github.com/UB-Mannheim/ocrd_pagetopdf/commits/58df37a)

  > * respect --overwrite in multipagepdf.py

### [ocrd_pc_segmentation](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation) [80ede8f](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/commits/80ede8f)..[3e69bff](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/commits/3e69bff)

> Release: [v0.1.3](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/releases/v0.1.3)

  > * getLogger per method
  > * Bump version: 0.2.1 → 0.2.2
  > * Update setup.py to reflect requirements.txt changes
  > * Migrate to ocr4all-pixel-classifier 0.5.1

### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [a71cbaa](https://github.com/OCR-D/ocrd_segment/commits/a71cbaa)..[aadbc7b](https://github.com/OCR-D/ocrd_segment/commits/aadbc7b)

> Release: [v0.1.3](https://github.com/OCR-D/ocrd_segment/releases/v0.1.3)

  > * Update CHANGELOG.md
  > * Merge pull request #46 from OCR-D/getlogger

### [ocrd_tesserocr](https://github.com/OCR-D/ocrd_tesserocr) [b32ae0c](https://github.com/OCR-D/ocrd_tesserocr/commits/b32ae0c)..[27fe2be](https://github.com/OCR-D/ocrd_tesserocr/commits/27fe2be)

> Release: [v0.9.4](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.9.4)

  > * Update CHANGELOG.md
  > * :package: v0.9.4
  > * getLogger per method
  > * Merge pull request #154 from bertsky/fix-image-new

### [ocrd_wrap](https://github.com/bertsky/ocrd_wrap) [6d92c02](https://github.com/bertsky/ocrd_wrap/commits/6d92c02)..[a79cd7d](https://github.com/bertsky/ocrd_wrap/commits/a79cd7d)

> Release: [v0.1.1](https://github.com/bertsky/ocrd_wrap/releases/v0.1.1)

  > * Update CHANGELOG.md
  > * :package: 0.1.1
  > * Merge pull request #5 from kba/getlogger

### [opencv-python](https://github.com/skvark/opencv-python) [893430f](https://github.com/skvark/opencv-python/commits/893430f)..[c001042](https://github.com/skvark/opencv-python/commits/c001042)

> Release: [44](https://github.com/skvark/opencv-python/releases/44)

  > * update openssl, no-pinshared, see #381
  > * disable nodelete, see #381

### [sbb_textline_detector](https://github.com/qurator-spk/sbb_textline_detector) [0f09f4a](https://github.com/qurator-spk/sbb_textline_detector/commits/0f09f4a)..[cbc9838](https://github.com/qurator-spk/sbb_textline_detector/commits/cbc9838)

  > * Merge pull request #41 from kba/getlogger





## [v2020-09-08.1](https://github.com/OCR-D/ocrd_all/releases/v2020-09-08.1)

### [core](https://github.com/OCR-D/core) [3d4e7f2](https://github.com/OCR-D/core/commits/3d4e7f2)..[8dafbac](https://github.com/OCR-D/core/commits/938a907)

> Release: [v2.16.1](https://github.com/OCR-D/core/releases/v2.16.1)

  > * ` ocrd_utils.logging` on module-level, disable logging less than CRITICAL, call initLogging explicitly in CLI, #594

### [core](https://github.com/OCR-D/core) [8dafbac](https://github.com/OCR-D/core/commits/8dafbac)..[938a907](https://github.com/OCR-D/core/commits/938a907)

> Release: [v2.16.0](https://github.com/OCR-D/core/releases/v2.16.0)

  > * circle ci: typos
  > * :package: v2.16.0
  > * :memo: changelog
  > * Merge remote-tracking branch 'origin/docker-gpu'
  > * Merge remote-tracking branch 'ulb/bugfix/workspace-remove-groups'
  > * ocrd log info: Fix for non-patterned args
  > * :memo: changelog
  > * Merge remote-tracking branch 'origin/better-task-fail-output'
  > * :memo: changelog
  > * [app][doc] Document that ocrd workspace clone supports OAI-PMH GetRecord now
  > * [app][rfct] move OAI functions to ocrd_models.utils
  > * [test][rfct] move oai tests into a dedicated test_resolver_oai.py
  > * [app][fix] document OAI methods in resolver, exit early if METS
  > * [test][fix] python 3.5 compliance
  > * Merge branch 'master' into develop
  > * [app][fix] handle non-xml downloads
  > * [app][rfct] replace generic exception
  > * [app][test] introduce mock requests
  > * [app][feat] extract mets from oai response

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [7930ecd](https://github.com/qurator-spk/dinglehopper/commits/7930ecd)..[717801b](https://github.com/qurator-spk/dinglehopper/commits/717801b)

  > * Merge commit '7930ecd42868cb6785a58f8ee95b05882704621d'
  > * ✨ dinglehopper: Include number of characters and words in JSON report
  > * 🔧 dinglehopper: Add PyCharm config
  > * Revert "Merge branch 'master' of https://github.com/qurator-spk/sbb_textline_detector"

### [ocrd_calamari](https://github.com/OCR-D/ocrd_calamari) [210c126](https://github.com/OCR-D/ocrd_calamari/commits/210c126)..[bb9b1ab](https://github.com/OCR-D/ocrd_calamari/commits/bb9b1ab)

> Release: [v0.0.7](https://github.com/OCR-D/ocrd_calamari/releases/v0.0.7)

  > * 🐛 CircleCI: Ignore screenshots branch (second try)
  > * 🐛 CircleCI: Ignore screenshots branch
  > * 📝 README: Add a screenshot of example output

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [8fc5313](https://github.com/OCR-D/ocrd_fileformat/commits/8fc5313)..[4608377](https://github.com/OCR-D/ocrd_fileformat/commits/4608377)

> Release: [v0.0.5](https://github.com/OCR-D/ocrd_fileformat/releases/v0.0.5)

  > * :package: v0.0.5
  > * :memo: changelog
  > * Merge pull request #14 from OCR-D/better-error-reporting

### [ocrd_pc_segmentation](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation) [5e433e3](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/commits/5e433e3)..[80ede8f](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/commits/80ede8f)

> Release: [v0.1.3](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/releases/v0.1.3)

  > * Bump version: 0.2.0 → 0.2.1
  > * Fix bump2version replacing dependency versions
  > * Handle images with alpha channel
  > * Update ocr4all-pixel-classifier
  > * Remove obsolete model

### [ocrd_tesserocr](https://github.com/OCR-D/ocrd_tesserocr) [49e93b9](https://github.com/OCR-D/ocrd_tesserocr/commits/49e93b9)..[5761661](https://github.com/OCR-D/ocrd_tesserocr/commits/5761661)

> Release: [v0.9.2](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.9.2)

  > * :package: 0.9.2
  > * Merge pull request #148 from OCR-D/fix-deskew-image-file-id
  > * Merge pull request #145 from bertsky/segment-clip-border

### [opencv-python](https://github.com/skvark/opencv-python) [099ed15](https://github.com/skvark/opencv-python/commits/099ed15)..[893430f](https://github.com/skvark/opencv-python/commits/893430f)

> Release: [42](https://github.com/skvark/opencv-python/releases/42)

  > * add more guidance, fix typos, drop Python 3.5

### [tesseract](https://github.com/tesseract-ocr/tesseract) [d33edbc](https://github.com/tesseract-ocr/tesseract/commits/d33edbc)..[f5561c4](https://github.com/tesseract-ocr/tesseract/commits/f5561c4)

> Release: [5.0.0-alpha](https://github.com/tesseract-ocr/tesseract/releases/5.0.0-alpha)

  > * Merge pull request #3090 from nam-leduc/correct-debug-find-images
  > * Merge pull request #3082 from bertsky/fix-line-detector


## [v2020-08-28](https://github.com/OCR-D/ocrd_all/releases/v2020-08-28)

### [core](https://github.com/OCR-D/core) [e41ba75](https://github.com/OCR-D/core/commits/e41ba75)..[8dafbac](https://github.com/OCR-D/core/commits/8dafbac)

> Release: [v2.15.0](https://github.com/OCR-D/core/releases/v2.15.0)

  > * :package: v2.15.0
  > * :memo: changelog
  > * test: for command_with_replaced_help
  > * CLI: subclass command with regex replacements in help
  > * test_utils: tempdir-respecting pushd_popd test
  > * make test: enable logging tests with `HOME=$(CURDIR)`
  > * test: WorkspaceCtx mets/directory/mets_basename logic
  > * `ocrd_utils.pushd_popd`: support tempdir creation
  > * make test: skip logging test in main pytest run
  > * workspace CLI: drop mets_basename from WorkspaceCtx
  > * ocrd workspace CLI: Document --mets/--directory defaults
  > * ocrd workspace CLI: reintroduce and deprecate --mets-basename
  > * ocrd workspace CLI: handle inconsistent --mets/--directory
  > * ocrd workspace: remove --mets-basename option
  > * ocrd workspace validate: deprecate METS_URL for --directory/--mets-basename
  > * ocrd workspace clone/init: deprecate workspace dir argument, #517
  > * ocrd workspace clone: deprecate argument

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [5bb73c3](https://github.com/cisocrgroup/ocrd_cis/commits/5bb73c3)..[f09ae58](https://github.com/cisocrgroup/ocrd_cis/commits/f09ae58)

> Release: [v0.0.10](https://github.com/cisocrgroup/ocrd_cis/releases/v0.0.10)

  > * replace deprecated ocrd workspace CLI constructs

### [opencv-python](https://github.com/skvark/opencv-python) [e4893f2](https://github.com/skvark/opencv-python/commits/e4893f2)..[099ed15](https://github.com/skvark/opencv-python/commits/099ed15)

> Release: [42](https://github.com/skvark/opencv-python/releases/42)

  > * Make the README more clear

### [sbb_textline_detector](https://github.com/qurator-spk/sbb_textline_detector) [a7c92c9](https://github.com/qurator-spk/sbb_textline_detector/commits/a7c92c9)..[0f09f4a](https://github.com/qurator-spk/sbb_textline_detector/commits/0f09f4a)

  > * Update main.py

## [v2020-08-24](https://github.com/OCR-D/ocrd_all/releases/v2020-08-24)

Fixed:

  * Permission issue with `make modules`, #179, #180

### [cor-asv-ann](https://github.com/ASVLeipzig/cor-asv-ann) [479564a](https://github.com/ASVLeipzig/cor-asv-ann/commits/479564a)..[69bae66](https://github.com/ASVLeipzig/cor-asv-ann/commits/69bae66)

> Release: [v0.1.3](https://github.com/ASVLeipzig/cor-asv-ann/releases/v0.1.3)

  > * delegate adding MetadataItem to core
  > * fix get_AllRegions (PcGts→Page)
  > * Merge pull request #4 from kba/fileids-and-such

### [cor-asv-fst](https://github.com/ASVLeipzig/cor-asv-fst) [bc6d84c](https://github.com/ASVLeipzig/cor-asv-fst/commits/bc6d84c)..[2428cca](https://github.com/ASVLeipzig/cor-asv-fst/commits/2428cca)

  > * :package: 0.2.1
  > * Merge pull request #5 from kba/fileids-and-such

### [core](https://github.com/OCR-D/core) [dc3ffe4](https://github.com/OCR-D/core/commits/dc3ffe4)..[e41ba75](https://github.com/OCR-D/core/commits/e41ba75)

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

### [ocrd_anybaseocr](https://github.com/OCR-D/ocrd_anybaseocr) [9abe7bf](https://github.com/OCR-D/ocrd_anybaseocr/commits/9abe7bf)..[85f2387](https://github.com/OCR-D/ocrd_anybaseocr/commits/85f2387)

> Release: [v1.0.1](https://github.com/OCR-D/ocrd_anybaseocr/releases/v1.0.1)

  > * :package: v1.0.1
  > * :memo: changelog
  > * Merge pull request #67 from OCR-D/add-metadata


## [v2020-08-22](https://github.com/OCR-D/ocrd_all/releases/v2020-08-22)

Fixed:

  * Obsolete executable for ocrd_tesserocr caused unnecessary rebuilds, #177

## [v2020-08-21](https://github.com/OCR-D/ocrd_all/releases/v2020-08-21)

### [core](https://github.com/OCR-D/core) [a07568e](https://github.com/OCR-D/core/commits/a07568e)..[dc3ffe4](https://github.com/OCR-D/core/commits/dc3ffe4)

> Release: [v2.13.2](https://github.com/OCR-D/core/releases/v2.13.2)

  > * :package: v2.13.2
  > * workspace: ensure PIL.Image.open FD gets closed
  > * :package: v2.13.1
  > * assert_file_grp_cardinality: allow optional "msg" keyword param

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [c3709e2](https://github.com/qurator-spk/dinglehopper/commits/c3709e2)..[7930ecd](https://github.com/qurator-spk/dinglehopper/commits/7930ecd)

  > * 🔧 dinglehopper: Add PyCharm code style config

### [ocrd_anybaseocr](https://github.com/OCR-D/ocrd_anybaseocr) [962617d](https://github.com/OCR-D/ocrd_anybaseocr/commits/962617d)..[9abe7bf](https://github.com/OCR-D/ocrd_anybaseocr/commits/9abe7bf)

> Release: [v1.0.0](https://github.com/OCR-D/ocrd_anybaseocr/releases/v1.0.0)

  > * :package: v1.0.0
  > * Merge pull request #66 from OCR-D/file-ids-and-such

### [ocrd_calamari](https://github.com/OCR-D/ocrd_calamari) [027fcd7](https://github.com/OCR-D/ocrd_calamari/commits/027fcd7)..[210c126](https://github.com/OCR-D/ocrd_calamari/commits/210c126)

> Release: [v0.0.7](https://github.com/OCR-D/ocrd_calamari/releases/v0.0.7)

  > * Merge pull request #42 from OCR-D/file-ids-and-such
  > * 🗒️ README-DEV: Also release on GitHub
  > * 📦 v0.0.7
  > * Merge pull request #41 from OCR-D/fix/set-pcgtsid
  > * 🚧 Tests: Add some TODOs re data + namespace version changes

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [fdd7345](https://github.com/cisocrgroup/ocrd_cis/commits/fdd7345)..[5bb73c3](https://github.com/cisocrgroup/ocrd_cis/commits/5bb73c3)

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

### [ocrd_keraslm](https://github.com/OCR-D/ocrd_keraslm) [be69c97](https://github.com/OCR-D/ocrd_keraslm/commits/be69c97)..[52cb4ce](https://github.com/OCR-D/ocrd_keraslm/commits/52cb4ce)

> Release: [v0.4.0](https://github.com/OCR-D/ocrd_keraslm/releases/v0.4.0)

  > * :package: v0.4.0
  > * wrapper: set pcGtsId to METS file ID
  > * ocrd cli: use make_file_id and assert_file_grp_cardinality

### [ocrd_olena](https://github.com/OCR-D/ocrd_olena) [50ecb0b](https://github.com/OCR-D/ocrd_olena/commits/50ecb0b)..[54792be](https://github.com/OCR-D/ocrd_olena/commits/54792be)

> Release: [v1.2.1](https://github.com/OCR-D/ocrd_olena/releases/v1.2.1)

  > * :package: 1.2.1
  > * fix handling input fileGrps where PAGE is mixed with derived images: (#68)

### [ocrd_pc_segmentation](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation) [db0128f](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/commits/db0128f)..[5e433e3](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/commits/5e433e3)

> Release: [v0.1.3](https://github.com/ocr-d-modul-2-segmentierung/ocrd-pixelclassifier-segmentation/releases/v0.1.3)

  > * use make_file_id and assert_file_grp_cardinality

### [ocrd_repair_inconsistencies](https://github.com/qurator-spk/ocrd_repair_inconsistencies) [ba27aba](https://github.com/qurator-spk/ocrd_repair_inconsistencies/commits/ba27aba)..[8182063](https://github.com/qurator-spk/ocrd_repair_inconsistencies/commits/8182063)

  > * Merge pull request #10 from kba/file-ids-and-such

### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [06fb5ba](https://github.com/OCR-D/ocrd_segment/commits/06fb5ba)..[7596e9c](https://github.com/OCR-D/ocrd_segment/commits/7596e9c)

> Release: [v0.1.0](https://github.com/OCR-D/ocrd_segment/releases/v0.1.0)

  > * :package: v0.1.0
  > * Merge remote-tracking branch 'origin/typo_conent_content'
  > * replace_original: update docstring
  > * extract_pages: no pageId for COCO, input_file.pageId for json
  > * revert to old 3-output-file-grp logic in extract_pages.py
  > * extract_regions, extract_pages: pass pageId
  > * Use 'make_file_id' and 'assert_file_grp_cardinality' throughout

### [ocrd_tesserocr](https://github.com/OCR-D/ocrd_tesserocr) [1159fbf](https://github.com/OCR-D/ocrd_tesserocr/commits/1159fbf)..[49e93b9](https://github.com/OCR-D/ocrd_tesserocr/commits/49e93b9)

> Release: [v0.9.1](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.9.1)

  > * :package: v0.9.1
  > * changelog
  > * Merge pull request #143 from OCR-D/fix-142
  > * pip install -U pip before pip install (#138)
  > * Merge pull request #132 from bertsky/crop-relative
  > * :package: v0.9.0
  > * Merge pull request #133 from bertsky/alternativeimage-same-filegrp

### [ocrd_typegroups_classifier](https://github.com/OCR-D/ocrd_typegroups_classifier) [94a3630](https://github.com/OCR-D/ocrd_typegroups_classifier/commits/94a3630)..[3dddd94](https://github.com/OCR-D/ocrd_typegroups_classifier/commits/3dddd94)

> Release: [v0.1.1](https://github.com/OCR-D/ocrd_typegroups_classifier/releases/v0.1.1)

  > * :package: v0.1.0
  > * use make_file_id/assert_file_grp_cardinality
  > * fix test
  > * heatmap.py --help: grad_cam -> heatmap
  > * Merge remote-tracking branch 'seuretm/master' into HEAD

### [ocrd_wrap](https://github.com/bertsky/ocrd_wrap) [2cfffed](https://github.com/bertsky/ocrd_wrap/commits/2cfffed)..[6d92c02](https://github.com/bertsky/ocrd_wrap/commits/6d92c02)

> Release: [v0.1.0](https://github.com/bertsky/ocrd_wrap/releases/v0.1.0)

  > * ocrd-preprocess-image: avoid passing commas from parameter value to image file IDs
  > * fix spaces in makefile (ht @kba)
  > * set pcGtsId to METS file ID everywhere
  > * put derived images under output fileGrp…
  > * ensure mkstemp fd gets closed afterwards
  > * ensure PIL.Image gets closed afterwards

### [opencv-python](https://github.com/skvark/opencv-python) [83acfc9](https://github.com/skvark/opencv-python/commits/83acfc9)..[e4893f2](https://github.com/skvark/opencv-python/commits/e4893f2)

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

### [sbb_textline_detector](https://github.com/qurator-spk/sbb_textline_detector) [eba5f54](https://github.com/qurator-spk/sbb_textline_detector/commits/eba5f54)..[a7c92c9](https://github.com/qurator-spk/sbb_textline_detector/commits/a7c92c9)

  > * Merge pull request #38 from qurator-spk/printspace-vs-border
  > * Merge pull request #37 from qurator-spk/update-readme
  > * add travis CI badge
  > * Merge pull request #13 from stweil/travis
  > * Merge pull request #36 from kba/file-ids-and-such
  > * 🐛 sbb_textline_detection: Set pcGtsId

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [7edcb90](https://github.com/bertsky/workflow-configuration/commits/7edcb90)..[7c89037](https://github.com/bertsky/workflow-configuration/commits/7c89037)

  > * avoid citation notice for GNU parallel

## [v2020-08-04](https://github.com/OCR-D/ocrd_all/releases/v2020-08-04)

### [core](https://github.com/OCR-D/core) [320a2fd](https://github.com/OCR-D/core/commits/320a2fd)..[a07568e](https://github.com/OCR-D/core/commits/a07568e)

> Release: [v2.13.0](https://github.com/OCR-D/core/releases/v2.13.0)

  > * :package: v2.13.0
  > * fix test_exif
  > * update tests
  > * BaseProcessor.input_files: Implement logic for PAGEXML/image in same folder
  > * :package: v2.12.7
  > * Support -P in ocrd process, fix #551

### [ocrd_anybaseocr](https://github.com/OCR-D/ocrd_anybaseocr) [958a998](https://github.com/OCR-D/ocrd_anybaseocr/commits/958a998)..[962617d](https://github.com/OCR-D/ocrd_anybaseocr/commits/962617d)

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

### [ocrd_olena](https://github.com/OCR-D/ocrd_olena) [f9bd786](https://github.com/OCR-D/ocrd_olena/commits/f9bd786)..[ed7720d](https://github.com/OCR-D/ocrd_olena/commits/ed7720d)

> Release: [v1.2.0](https://github.com/OCR-D/ocrd_olena/releases/v1.2.0)

  > * Merge pull request #66 from mikegerber/fix/travis-install
  > * :package: v1.2.0
  > * make install: more robust check whether ocrd CLI installed, fix #61

### [opencv-python](https://github.com/skvark/opencv-python) [914404d](https://github.com/skvark/opencv-python/commits/914404d)..[83acfc9](https://github.com/skvark/opencv-python/commits/83acfc9)

> Release: [36](https://github.com/skvark/opencv-python/releases/36)

  > * Merge pull request #368 from tedski/master

### [sbb_textline_detector](https://github.com/qurator-spk/sbb_textline_detector) [4036e2a](https://github.com/qurator-spk/sbb_textline_detector/commits/4036e2a)..[eba5f54](https://github.com/qurator-spk/sbb_textline_detector/commits/eba5f54)

  > * Update README.md
  > * Update README.md
  > * Update README.md
  > * Update README.md
  > * Update README.md
  > * Update README.md


## [v2020-07-28](https://github.com/OCR-D/ocrd_all/releases/v2020-07-28)

### [core](https://github.com/OCR-D/core) [14e30a2](https://github.com/OCR-D/core/commits/14e30a2)..[320a2fd](https://github.com/OCR-D/core/commits/320a2fd)

> Release: [v2.12.6](https://github.com/OCR-D/core/releases/v2.12.6)

  > * :package: v2.12.6
  > * Merge pull request #550 from OCR-D/pillow-security-fixes
  > * Merge pull request #547 from OCR-D/refactor-dummy
  > * :package: v2.12.5
  > * Merge pull request #548 from OCR-D/fix-540-again
  > * Merge pull request #549 from OCR-D/maninfest-in

### [sbb_textline_detector](https://github.com/qurator-spk/sbb_textline_detector) [3593506](https://github.com/qurator-spk/sbb_textline_detector/commits/3593506)..[4036e2a](https://github.com/qurator-spk/sbb_textline_detector/commits/4036e2a)

  > * Merge pull request #34 from stweil/master

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [7f2766c](https://github.com/bertsky/workflow-configuration/commits/7f2766c)..[7edcb90](https://github.com/bertsky/workflow-configuration/commits/7edcb90)

  > * workflow examples: replace + with - in fileGrp names


## [v2020-07-24](https://github.com/OCR-D/ocrd_all/releases/v2020-07-24)

### [core](https://github.com/OCR-D/core) [044cdad2](https://github.com/OCR-D/core/commits/044cdad2)..[14e30a2e](https://github.com/OCR-D/core/commits/14e30a2e)

> Release: [v2.12.4](https://github.com/OCR-D/core/releases/v2.12.4)

  > * :package: v2.12.4
  > * Merge pull request #546 from OCR-D/logging-interference
  > * :package: v2.12.3
  > * Merge pull request #543 from OCR-D/workspace-validator-logspam


## [v2020-07-23](https://github.com/OCR-D/ocrd_all/releases/v2020-07-23)

### [core](https://github.com/OCR-D/core) [f708420d](https://github.com/OCR-D/core/commits/f708420d)..[044cdad2](https://github.com/OCR-D/core/commits/044cdad2)

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

### [ocrd_anybaseocr](https://github.com/OCR-D/ocrd_anybaseocr) [287adce](https://github.com/OCR-D/ocrd_anybaseocr/commits/287adce)..[958a998](https://github.com/OCR-D/ocrd_anybaseocr/commits/958a998)

> Release: [v0.0.4](https://github.com/OCR-D/ocrd_anybaseocr/releases/v0.0.4)

  > * :package: v0.0.4
  > * keras should be >= 2.3.0 but < 2.4.0

### [ocrd_calamari](https://github.com/OCR-D/ocrd_calamari) [c6ced9b](https://github.com/OCR-D/ocrd_calamari/commits/c6ced9b)..[027fcd7](https://github.com/OCR-D/ocrd_calamari/commits/027fcd7)

> Release: [v0.0.6](https://github.com/OCR-D/ocrd_calamari/releases/v0.0.6)

  > * 🐛 Fix test file path

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [06b27d4](https://github.com/OCR-D/ocrd_fileformat/commits/06b27d4)..[8fc5313](https://github.com/OCR-D/ocrd_fileformat/commits/8fc5313)

> Release: [v0.0.3](https://github.com/OCR-D/ocrd_fileformat/releases/v0.0.3)

  > * Merge pull request #9 from bertsky/page-id


### [ocrd_wrap](https://github.com/bertsky/ocrd_wrap) [f5347ff](https://github.com/bertsky/ocrd_wrap/commits/f5347ff)..[2cfffed](https://github.com/bertsky/ocrd_wrap/commits/2cfffed)

> Release: [v0.0.5](https://github.com/bertsky/ocrd_wrap/releases/v0.0.5)

  > * fix badge URL
  > * :package: 0.0.5
  > * update requirements
  > * all: fix region level, raise pylint happiness

Submodule opencv-python 11e478c...914404d (commits not present)

### [tesseract](https://github.com/tesseract-ocr/tesseract) [d01b2e43](https://github.com/tesseract-ocr/tesseract/commits/d01b2e43)..[d33edbc4](https://github.com/tesseract-ocr/tesseract/commits/d33edbc4)

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

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [8469b0a](https://github.com/bertsky/workflow-configuration/commits/8469b0a)..[7f2766c](https://github.com/bertsky/workflow-configuration/commits/7f2766c)

  > * ocrd-import: annotate correct DPI after downsampling PDFs
  > * Merge pull request #17 from stweil/master


## [v2020-07-07](https://github.com/OCR-D/ocrd_all/releases/v2020-07-07)

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [cdfd4d3](https://github.com/qurator-spk/dinglehopper/commits/cdfd4d3)..[c3709e2](https://github.com/qurator-spk/dinglehopper/commits/c3709e2)

  > * 🧹 dinglehopper: Remove .vimrc again (security)
  > * 💄 Set maximum line length to 90

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [fa40e7e](https://github.com/cisocrgroup/ocrd_cis/commits/fa40e7e)..[fdd7345](https://github.com/cisocrgroup/ocrd_cis/commits/fdd7345)

> Release: [v0.0.10](https://github.com/cisocrgroup/ocrd_cis/releases/v0.0.10)

  > * Remove old internal files
  > * README: add PyPI badge
  > * fix setup (needs json)
  > * add empty travis ci file

### [ocrd_keraslm](https://github.com/OCR-D/ocrd_keraslm) [7bfffef](https://github.com/OCR-D/ocrd_keraslm/commits/7bfffef)..[be69c97](https://github.com/OCR-D/ocrd_keraslm/commits/be69c97)

> Release: [0.3.1](https://github.com/OCR-D/ocrd_keraslm/releases/0.3.1)

  > * Update requirements.txt

### [ocrd_repair_inconsistencies](https://github.com/qurator-spk/ocrd_repair_inconsistencies) [6897996](https://github.com/qurator-spk/ocrd_repair_inconsistencies/commits/6897996)..[ba27aba](https://github.com/qurator-spk/ocrd_repair_inconsistencies/commits/ba27aba)

  > * 🧹 examples/fix-ocr-d-gt-page.sh: rmdir after ocrd workspace remove-group is not necessary anymore
  > * 🧹 examples/fix-ocr-d-gt-page.sh: rmdir after ocrd workspace remove-group is not necessary anymore
  > * ✨ Support TextRegions nested in Table/GraphicRegions

### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [f8a8daa](https://github.com/OCR-D/ocrd_segment/commits/f8a8daa)..[06fb5ba](https://github.com/OCR-D/ocrd_segment/commits/06fb5ba)

> Release: [v0.0.2](https://github.com/OCR-D/ocrd_segment/releases/v0.0.2)

  > * replace-original: use OCR-D-IMG-SUBST instead of -CROP
  > * replace-original: add parameters for image feature filtering…

### [ocrd_wrap](https://github.com/bertsky/ocrd_wrap) [7a0c136](https://github.com/bertsky/ocrd_wrap/commits/7a0c136)..[f5347ff](https://github.com/bertsky/ocrd_wrap/commits/f5347ff)

> Release: [v0.0.4](https://github.com/bertsky/ocrd_wrap/releases/v0.0.4)

  > * skimage-denoise-raw: skip images with too little noise
  > * skimage_\*: preserve depth

### [opencv-python](https://github.com/skvark/opencv-python) [3073e9e](https://github.com/skvark/opencv-python/commits/3073e9e)..[11e478c](https://github.com/skvark/opencv-python/commits/11e478c)

> Release: [36](https://github.com/skvark/opencv-python/releases/36)

  > * resolve merge conflicts
  > * merge manylinux2014 support

### [tesseract](https://github.com/tesseract-ocr/tesseract) [380466e0](https://github.com/tesseract-ocr/tesseract/commits/380466e0)..[d01b2e43](https://github.com/tesseract-ocr/tesseract/commits/d01b2e43)

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

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [33d8786](https://github.com/bertsky/workflow-configuration/commits/33d8786)..[8469b0a](https://github.com/bertsky/workflow-configuration/commits/8469b0a)

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

### [core](https://github.com/OCR-D/core) [574bbad](https://github.com/OCR-D/core/commits/574bbad)..[f708420](https://github.com/OCR-D/core/commits/f708420)

> Release: [v2.10.4](https://github.com/OCR-D/core/releases/v2.10.4)

  > * :package: v2.10.4
  > * bashlib: --overwrite, #476

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [f2b42d4](https://github.com/cisocrgroup/ocrd_cis/commits/f2b42d4)..[fa40e7e](https://github.com/cisocrgroup/ocrd_cis/commits/fa40e7e)


### [ocrd_im6convert](https://github.com/OCR-D/ocrd_im6convert) [31eb2ae](https://github.com/OCR-D/ocrd_im6convert/commits/31eb2ae)..[11bfea3](https://github.com/OCR-D/ocrd_im6convert/commits/11bfea3)

> Release: [v0.0.4](https://github.com/OCR-D/ocrd_im6convert/releases/v0.0.4)

  > * :package: v0.0.4

### [ocrd_olena](https://github.com/OCR-D/ocrd_olena) [6adee3d](https://github.com/OCR-D/ocrd_olena/commits/6adee3d)..[f9bd786](https://github.com/OCR-D/ocrd_olena/commits/f9bd786)

> Release: [v1.1.10](https://github.com/OCR-D/ocrd_olena/releases/v1.1.10)

  > * :package: v1.1.10

### [ocrd_pagetopdf](https://github.com/UB-Mannheim/ocrd_pagetopdf) [a606632](https://github.com/UB-Mannheim/ocrd_pagetopdf/commits/a606632)..[88faa74](https://github.com/UB-Mannheim/ocrd_pagetopdf/commits/88faa74)


### [ocrd_segment](https://github.com/OCR-D/ocrd_segment) [ee5f36d](https://github.com/OCR-D/ocrd_segment/commits/ee5f36d)..[f8a8daa](https://github.com/OCR-D/ocrd_segment/commits/f8a8daa)

> Release: [v0.0.2](https://github.com/OCR-D/ocrd_segment/releases/v0.0.2)

  > * replace-original: new...


## [v2020-06-17](https://github.com/OCR-D/ocrd_all/releases/v2020-06-17)

### [core](https://github.com/OCR-D/core) [2e4c16e](https://github.com/OCR-D/core/commits/2e4c16e)..[574bbad](https://github.com/OCR-D/core/commits/574bbad)

> Release: [v2.10.3](https://github.com/OCR-D/core/releases/v2.10.3)

  > * :package: v2.10.3
  > * workspace add: check whether filename is absolute
  > * workspace add: os.path.join behavior led to faulty existence check, fix #519
  > * :package: v2.10.2

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [7b8671c](https://github.com/OCR-D/ocrd_fileformat/commits/7b8671c)..[06b27d4](https://github.com/OCR-D/ocrd_fileformat/commits/06b27d4)

> Release: [v0.0.3](https://github.com/OCR-D/ocrd_fileformat/releases/v0.0.3)

  > * :package: v0.0.3
  > * require ocrd/core >= 2.10.2
  > * properly pass on script-args, #4

Submodule ocrd_wrap c47a9dd...7a0c136 (not checked out)

### [tesseract](https://github.com/tesseract-ocr/tesseract) [62eae84](https://github.com/tesseract-ocr/tesseract/commits/62eae84)..[380466e](https://github.com/tesseract-ocr/tesseract/commits/380466e)

> Release: [5.0.0-alpha](https://github.com/tesseract-ocr/tesseract/releases/5.0.0-alpha)

  > * Allow inlining of function TruncateParam
  > * Remove unused argument from function TruncateParam
  > * Remove assertion which is triggered by tests
  > * StrokeWidth: Remove unused local variable (fixes compiler warning)
  > * Remove old unused code from imagedata.h
  > * Fix crash caused by missing thread synchronization (issues #757, #1168 and #2191)


## [v2020-06-14](https://github.com/OCR-D/ocrd_all/releases/v2020-06-14)

### [core](https://github.com/OCR-D/core) [2e4c16e](https://github.com/OCR-D/core/commits/2e4c16e)..[86f788a](https://github.com/OCR-D/core/commits/86f788a)

> Release: [v2.10.2](https://github.com/OCR-D/core/releases/v2.10.2)

  > * :package: v2.10.2

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [7b8671c](https://github.com/OCR-D/ocrd_fileformat/commits/7b8671c)..[06b27d4](https://github.com/OCR-D/ocrd_fileformat/commits/06b27d4)

> Release: [v0.0.3](https://github.com/OCR-D/ocrd_fileformat/releases/v0.0.3)

  > * :package: v0.0.3
  > * require ocrd/core >= 2.10.2
  > * properly pass on script-args, #4

### [tesseract](https://github.com/tesseract-ocr/tesseract) [62eae84f](https://github.com/tesseract-ocr/tesseract/commits/62eae84f)..[6ee36989](https://github.com/tesseract-ocr/tesseract/commits/6ee36989)

> Release: [5.0.0-alpha](https://github.com/tesseract-ocr/tesseract/releases/5.0.0-alpha)

  > * Remove old unused code from imagedata.h
  > * Fix crash caused by missing thread synchronization (issues #757, #1168 and #2191)


## [v2020-06-13](https://github.com/OCR-D/ocrd_all/releases/v2020-06-13)

### [core](https://github.com/OCR-D/core) [cd7be4e8](https://github.com/OCR-D/core/commits/cd7be4e8)..[2e4c16e5](https://github.com/OCR-D/core/commits/2e4c16e5)

> Release: [v2.10.1](https://github.com/OCR-D/core/releases/v2.10.1)

  > * Makefile: Fix location of PAGE XSD
  > * :package: v2.10.1
  > * XSD: move schema files to package root
  > * bashlib: add an ocrd__minversion check to check core
  > * bashlib: input/output grp must be set, logging regression, fix #511

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [32848eb](https://github.com/qurator-spk/dinglehopper/commits/32848eb)..[cdfd4d3](https://github.com/qurator-spk/dinglehopper/commits/cdfd4d3)

  > * 🐛 dinglehopper: Add missing requirement MarkupSafe

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [5698cd7](https://github.com/OCR-D/ocrd_fileformat/commits/5698cd7)..[7b8671c](https://github.com/OCR-D/ocrd_fileformat/commits/7b8671c)

> Release: [v0.0.2](https://github.com/OCR-D/ocrd_fileformat/releases/v0.0.2)

  > * :package: v0.0.2
  > * Use ocrd/core 2.10.1+, logging


## [v2020-06-12](https://github.com/OCR-D/ocrd_all/releases/v2020-06-12)

### [core](https://github.com/OCR-D/core) [377ed159](https://github.com/OCR-D/core/commits/377ed159)..[cd7be4e8](https://github.com/OCR-D/core/commits/cd7be4e8)

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

### [dinglehopper](https://github.com/qurator-spk/dinglehopper) [745095e](https://github.com/qurator-spk/dinglehopper/commits/745095e)..[32848eb](https://github.com/qurator-spk/dinglehopper/commits/32848eb)

  > * 🎨 dinglehopper: Set code width for flake8
  > * 🗒️ dinglehopper: Remove superfluous `-m mets.xml` in the README OCR-D example
  > * ✨ dinglehopper: Support disabling metrics in the OCR-D interface
  > * 🐛 dinglehopper: Fix reading OCR-D workspace files when only URLs are provided
  > * 🧹 dinglehopper: .gitignore Python stuff
  > * 🐛 dinglehopper: Fix tests by making metrics a keyword argument
  > * 🗒️ dinglehopper: Describe what dinglehopper does in the README
  > * ✨ dinglehopper: Support disabling the metrics using CLI option --no-metrics

### [ocrd_calamari](https://github.com/OCR-D/ocrd_calamari) [fb53884](https://github.com/OCR-D/ocrd_calamari/commits/fb53884)..[c6ced9b](https://github.com/OCR-D/ocrd_calamari/commits/c6ced9b)

> Release: [v0.0.6](https://github.com/OCR-D/ocrd_calamari/releases/v0.0.6)


### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [a6a2ecd](https://github.com/cisocrgroup/ocrd_cis/commits/a6a2ecd)..[f2b42d4](https://github.com/cisocrgroup/ocrd_cis/commits/f2b42d4)

  > * Update to latest jar
  > * only override log level if it is actually set
  > * load gzipped models

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [de5b532](https://github.com/OCR-D/ocrd_fileformat/commits/de5b532)..[5698cd7](https://github.com/OCR-D/ocrd_fileformat/commits/5698cd7)

> Release: [v0.0.1](https://github.com/OCR-D/ocrd_fileformat/releases/v0.0.1)

  > * :package: v0.0.1
  > * readme: combine native CLI and workflow-configuration calls
  > * ocrd-tool: add steps/categories, #3

### [ocrd_olena](https://github.com/OCR-D/ocrd_olena) [e000f24](https://github.com/OCR-D/ocrd_olena/commits/e000f24)..[6adee3d](https://github.com/OCR-D/ocrd_olena/commits/6adee3d)

> Release: [v1.1.9](https://github.com/OCR-D/ocrd_olena/releases/v1.1.9)

  > * :package: v1.1.9
  > * :package: v1.1.8

### [ocrd_tesserocr](https://github.com/OCR-D/ocrd_tesserocr) [9d2253e](https://github.com/OCR-D/ocrd_tesserocr/commits/9d2253e)..[1159fbf](https://github.com/OCR-D/ocrd_tesserocr/commits/1159fbf)

> Release: [v0.8.5](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.8.5)

  > * :package: v0.8.5
  > * segment-region: clip polygons to parent...

Submodule ocrd_wrap 0000000...c47a9dd (new submodule)

### [opencv-python](https://github.com/skvark/opencv-python) [1ca69aa](https://github.com/skvark/opencv-python/commits/1ca69aa)..[3073e9e](https://github.com/skvark/opencv-python/commits/3073e9e)

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

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [403ef75](https://github.com/bertsky/workflow-configuration/commits/403ef75)..[33d8786](https://github.com/bertsky/workflow-configuration/commits/33d8786)

  > * ocrd-export-larex: support more OCR-D CLI options…
  > * adapt to --overwrite and --page-id support in core 2.10…
  > * alias 'clean' for 'cleanup', documentation
  > * ocrd-export-larex: replace original image in result...

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
