# sigora 3.3.18

- Implemented unit tests for all functions via [testthat](https://testthat.r-lib.org/index.html)

# sigora 3.3.12

- Tidied and improved documentation for functions and data objects
- Replaced `print()` or `cat()` statements with `message()` as appropriate

# sigora 3.2.0

- Code formatted with air, linted with lintr.
- Removed dead commented-out code.
- Added Makefile with check, lint, format targets.
- Added rmarkdown to Suggests.

# sigora 3.1.1

- Updated CITATION file to use `bibentry()` instead of deprecated `citEntry()`.
- Fixed NEWS.md format so R can parse news entries.
- Addressed R CMD check NOTEs for CRAN compliance.

# sigora 3.1.0

- Fork of archived CRAN package for Bioconductor submission.
- Fixed R CMD check ERRORs and WARNINGs.
- Replaced `data()` calls with explicit `load_data()` wrapper.
