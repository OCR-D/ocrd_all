# Changelog

## [v2020-06-14](https://github.com/OCR-D/ocrd_all/releases/v2020-06-14)

### [core](https://github.com/OCR-D/core) [2e4c16e](https://github.com/OCR-D/core/commits2e4c16e)..[86f788a](https://github.com/OCR-D/core/commits/86f788a)

> Release: [v2.10.2](https://github.com/OCR-D/core/releases/v2.10.2)

  > * :package: v2.10.2
  > * Merge pull request #516 from OCR-D/fix-515

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
  > * :memo: changelog
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
  > * Merge pull request #428 from kba/bulk-add
  > * :memo: changelog
  > * Merge pull request #1 from bertsky/pr-471
  > * Merge branch 'master' into fix-434
  > * Merge branch 'master' into fix-434
  > * Merge branch 'fix-434' of https://github.com/kba/ocrd-core into fix-434
  > * Implement --overwrite with "overwrite_mode" on workspace
  > * get_All{,Alternative}ImagePaths: only return Alternative Image paths
  > * Merge branch 'master' into fix-434
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
  > * :memo: changelog
  > * Workspace.remove_file: remove images linked in PAGE-XML if page_recursive==True
  > * generateDS PAGE API: `get_AllImagePaths` to list all images
  > * generateDS PAGE API: Move PAGE_REGION_TYPES to ocrd_models.constants
  > * Merge branch 'master' into fix-434
  > * Merge branch 'master' into fix-434
  > * Merge branch 'master' into fix-434
  > * Merge branch 'master' into fix-434
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

  > * Merge pull request #39 from OCR-D/dont-install-test

### [ocrd_cis](https://github.com/cisocrgroup/ocrd_cis) [a6a2ecd](https://github.com/cisocrgroup/ocrd_cis/commitsa6a2ecd)..[f2b42d4](https://github.com/cisocrgroup/ocrd_cis/commits/f2b42d4)

  > * Update to latest jar
  > * only override log level if it is actually set
  > * Merge pull request #52 from cisocrgroup/revert-49-load-gz
  > * load gzipped models

### [ocrd_fileformat](https://github.com/OCR-D/ocrd_fileformat) [de5b532](https://github.com/OCR-D/ocrd_fileformat/commitsde5b532)..[5698cd7](https://github.com/OCR-D/ocrd_fileformat/commits/5698cd7)

> Release: [v0.0.1](https://github.com/OCR-D/ocrd_fileformat/releases/v0.0.1)

  > * :package: v0.0.1
  > * readme: combine native CLI and workflow-configuration calls
  > * ocrd-tool: add steps/categories, #3
  > * Merge pull request #5 from OCR-D/script-args
  > * Merge pull request #6 from ulb-sachsen-anhalt/master

### [ocrd_olena](https://github.com/OCR-D/ocrd_olena) [e000f24](https://github.com/OCR-D/ocrd_olena/commitse000f24)..[6adee3d](https://github.com/OCR-D/ocrd_olena/commits/6adee3d)

> Release: [v1.1.9](https://github.com/OCR-D/ocrd_olena/releases/v1.1.9)

  > * :package: v1.1.9
  > * Merge pull request #53 from OCR-D/check-pkg-config
  > * :package: v1.1.8
  > * Merge pull request #57 from j23d/master

### [ocrd_tesserocr](https://github.com/OCR-D/ocrd_tesserocr) [9d2253e](https://github.com/OCR-D/ocrd_tesserocr/commits9d2253e)..[1159fbf](https://github.com/OCR-D/ocrd_tesserocr/commits/1159fbf)

> Release: [v0.8.5](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.8.5)

  > * :package: v0.8.5
  > * Merge branch 'master' into fix-polygon-for-parent
  > * segment-region: clip polygons to parent...

Submodule ocrd_wrap 0000000...c47a9dd (new submodule)

### [opencv-python](https://github.com/skvark/opencv-python) [1ca69aa](https://github.com/skvark/opencv-python/commits1ca69aa)..[3073e9e](https://github.com/skvark/opencv-python/commits/3073e9e)

> Release: [34](https://github.com/skvark/opencv-python/releases/34)

  > * Merge pull request #315 from uSpike/patch-1
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
  > * Merge pull request #293 from dlech/master
  > * fix variable name typo
  > * drop Python 2.7, experimental Azure Storage artifact upload support

### [workflow-configuration](https://github.com/bertsky/workflow-configuration) [403ef75](https://github.com/bertsky/workflow-configuration/commits403ef75)..[33d8786](https://github.com/bertsky/workflow-configuration/commits/33d8786)

  > * ocrd-export-larex: support more OCR-D CLI options…
  > * adapt to --overwrite and --page-id support in core 2.10…
  > * alias 'clean' for 'cleanup', documentation
  > * Merge pull request #15 from kba/loglevel
  > * Merge pull request #13 from kba/cleanup-cmd
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
