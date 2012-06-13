\name{get_marker_genes}
\alias{get_marker_genes}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Pathway unique genes (PUGs)
}
\description{
This function returns the list of genes that are uniquely associated with a single pathway in the repository - we call these 'Pathway Unique Genes' (PUGs). Use idb_to_genename on the results of this function to see the actual gene names.
}
\usage{
get_marker_genes(is_human = TRUE, archive = "keg")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{is_human}{
leave this to its default value if interested in a list of human PUGs in the archive/repository. Setting this to FALSE returns PUGs where available. 
}
  \item{archive}{
    The repository: choose from 'keg'(default),'reactome','pid'(for BIOCARTA),'nci','inoh'.
}
}
\examples{
\dontrun{
# returns list of human marker genes in KEGG as SIGORA IDs
markergenes<-sigora:::get_marker_genes(archive='keg')
# convert the above results to human readable gene names.
idb_to_genename(tmp)
############## To do the same for BIOCARTA:
markergenes2 <-sigora:::get_marker_genes(archive='pid')
idb_converter(markergenes2) 
}
}