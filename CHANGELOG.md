# Changelog

## Unreleased

## [v2021-07-19](https://github.com/OCR-D/ocrd_all/releases/v2021-07-19)

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

> Release: [v1.0.2](https://github.com/OCR-D/ocrd_calamari/releases/v1.0.2)

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

> Release: [v0.13.3](https://github.com/OCR-D/ocrd_tesserocr/releases/v0.13.3)

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

Submodule ocrd_anybaseocr contains untracked content
Submodule ocrd_anybaseocr contains modified content
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
