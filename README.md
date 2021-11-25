# About the project

This repository is a fork of cran/sigora repository 
https://github.com/cran/sigora

Package ‘sigora’ was removed from the CRAN repository.
It was archived on 2021-04-10 as check problems were not corrected in time.


The code changes made in the project aim at removing all ERROR's and WARNING's from the `R CMD check` and `BiocCheck`.

# Pathway-GPS and SIGORA: identifying relevant pathways based on the over-representation of their gene-pair signatures


Pathway Analysis is statistically linking observations on 
the molecular level to biological processes or pathways on 
the systems(i.e., organism, organ, tissue, cell) level.  
Traditionally, pathway analysis methods regard pathways 
as collections of single genes and treat all genes in a pathway
as equally informative. However, this can lead to identifying
spurious pathways as statistically significant since components
are often shared amongst pathways. SIGORA seeks to avoid this
pitfall by focusing on genes or gene pairs that are (as a combination)
specific to a single pathway.
In relying on such pathway gene-pair signatures (Pathway-GPS),
SIGORA inherently uses the status of other genes in the
experimental context to identify the most relevant pathways.
The current version allows for pathway analysis of human
and mouse datasets. In addition, it contains pre-computed
Pathway-GPS data for pathways in the KEGG and  Reactome
pathway repositories and mechanisms for extracting GPS
for user-supplied repositories.

Author: Amir B.K. Foroushani


# HowTO install the Sigora package

```{r}
remoteds::install_githug("wolski/sigora")
```

For more information about the Sigora package, see:
<a href="https://wolski.github.io/sigora/" target="_blank">wolski.github.io/sigora</a>


