\name{idb_to_genename}
\alias{idb_to_genename}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Apply this to convert SIGORA IDs to gene names.
}
\description{
This function converts SIGORA IDs to HGNC / MGI IDs. 
}
\usage{
idb_to_genename(a)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{a}{
A vector containing some SIGORA IDs.
}
}
\examples{
\dontrun{
# Returns list of human PUGs/marker genes in KEGG as SIGORA IDs
tmp<-get_marker_genes(archive='keg')
# convert the above results to human readable gene names. 
idb_to_genename(tmp)
}        
}