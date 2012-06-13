\name{idb_converter}
\alias{idb_converter}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Apply this to convert SIGORA IDs of human or mouse genes to ENSEMBL IDs and gene names.
}

\description{
This function converts SIGORA IDs of human or mouse genes to ENSEMBL IDs and genenames.
}
\usage{
idb_converter(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
A vector containing SIGORA IDs. 
}
}
\examples{
\dontrun{
## Returns the detailed list of DE genes in the the brain tissue of CBA mice subjected to 
# experimental cerebral malaria (extracted from Randall et al. 2008 GSE6019).
idb_converter(ecm_randall_cba)
}
}