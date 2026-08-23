# Pathway GPS and SIGORA

**Identifying relevant pathways based on the over-representation of gene-pair signatures**

Pathway analysis is a method to statistically linking observations 
on the molecular level to biological processes or pathways on
the systems (i.e. organism, organ, tissue, cell) level.
Traditionally, pathway analysis methods regard pathways
as collections of single genes, and treat all genes in a pathway
as equally informative. However, this can lead to identifying
spurious pathways as statistically significant since components
are often shared amongst pathways. SIGORA seeks to avoid this
pitfall by focusing on genes or gene pairs that are (as a combination)
specific to a single pathway.

In relying on such pathway gene-pair signatures (pathway GPS),
SIGORA inherently uses the status of other genes in the
experimental context to identify the most relevant pathways.
The current version allows for pathway analysis of human
and mouse datasets. In addition, it contains pre-computed
pathway GPS data for pathways in the KEGG and  Reactome
pathway repositories and mechanisms for extracting GPS
from user-supplied repositories.

## Author

Amir B.K. Foroushani

## About the project

This repository is a fork of cran/sigora repository
https://github.com/cran/sigora

Package **SIGORA** was removed from the CRAN repository and
archived on 2021-04-10 as check problems were not corrected in time.
It has since been updated and is now available from CRAN once more.

The code changes made in the project aim at removing all errors and
warnings from `R CMD check` and `BiocCheck`.

## How to install SIGORA

From CRAN:
```r
install.packages("sigora")
```

From Github:
```r
remotes::install_github("wolski/sigora")
```

## Getting help

For more information about the Sigora package, see:
<a href="https://wolski.github.io/sigora/" target="_blank">wolski.github.io/sigora</a>

## CRAN submission

1. Ensure a clean check with no errors, warnings, or notes:

```bash
make check
```

2. Run CRAN-specific incoming checks:

```r
devtools::check(remote = TRUE, manual = TRUE)
```

3. Submit to CRAN via `devtools::release()` (interactive, recommended):

```r
devtools::release()
```

Or manually build the tarball with `R CMD build .` and upload it to: <https://cran.r-project.org/submit.html>.

The manual form asks for the tarball, your name, email (must match
the maintainer in DESCRIPTION), and an optional comment to CRAN
reviewers. You will receive a confirmation email; the submission is
not complete until you click the link in that email.
