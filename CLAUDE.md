# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Context

**sigora** is an R package for Signature Overrepresentation Analysis — a pathway analysis method that uses Gene Pair Signatures (GPS) instead of individual genes to avoid spurious pathway identification caused by shared pathway components. Originally a CRAN package (archived 2021-04-10), this fork fixes R CMD check and BiocCheck errors/warnings for Bioconductor submission.

Supports human and mouse datasets with pre-computed GPS for KEGG and Reactome repositories.

## Build & Check Commands

```bash
R CMD build .
R CMD check sigora_*.tar.gz
R CMD BiocCheck sigora_*.tar.gz    # Bioconductor-specific checks
```

In R:
```r
devtools::document()   # Regenerate NAMESPACE and man pages (roxygen2)
devtools::check()      # Full R CMD check
devtools::install()    # Install locally
devtools::load_all()   # Load for interactive development
```

There are **no tests** (`tests/` directory does not exist). Package functionality is demonstrated via examples in roxygen docs and the vignette (`vignettes/Sigora.Rmd`).

## Key Architecture

### Core Functions (R/)

- **`sigora()`** (`sigora.R`) — Main analysis function. Takes a gene list and GPS repository, identifies overrepresented pathway signatures. Uses weighted GPS with multiple weighting schemes (inverse harmonic mean, reciprocal product, Jaccard, cosine, etc.) defined in `.getWeightfunc()`.
- **`makeGPS()`** (`makeGPS.R`) — Creates GPS repositories from user-supplied gene-pathway association tables. Uses `slam` sparse matrices for efficiency.
- **`ora()`** (`ora.R`) — Traditional single-gene overrepresentation analysis (hypergeometric test) for comparison with sigora results.
- **`load_data()`** (`load_data.R`) — Explicit data loading wrapper (replaces lazy loading).
- **`genesFromRandomPathways()`** — Utility to sample genes from random pathways for testing/simulation.

### Pre-computed Data (data/)

- `kegH.rda` / `kegM.rda` — KEGG GPS (human/mouse)
- `reaH.rda` / `reaM.rda` — Reactome GPS (human/mouse)
- `idmap.rda` — Gene identifier mapping (ENSEMBL, ENTREZ, Symbol)
- `nciTable.rda` — NCI pathway table (example input for `makeGPS`)

### GPS Repository Structure

A GPS repository object (created by `makeGPS`) contains:
- `$pathwaydescriptions` — pathway ID to name mapping
- `$origRepo` — original single-gene pathway associations (list of 3: pathway IDs, gene IDs, sparse matrix)
- GPS weights and pair data used by `sigora()`

## Dependencies

Runtime: `stats`, `slam` (sparse matrices). Suggests: `knitr` (vignettes).

## Important Notes

- **NAMESPACE is roxygen2-generated** — do not edit directly; modify roxygen `@export` tags and run `devtools::document()`.
- The package targets Bioconductor submission — changes should pass both `R CMD check` and `BiocCheck`.
- Gene identifiers are auto-mapped between types (Symbol, ENTREZ, ENSEMBL) via `idmap`.
