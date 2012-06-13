\name{ens_converter}
\alias{ens_converter}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Apply this to convert ENSEMBL IDs to SIGORA IDs
}
\description{
This function converts ENSEMBL IDs to SIGORA IDs.
}
\usage{
ens_converter(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
A vector containing the human or mouse ENSEMBL IDs of genes of interest.
}
}
\examples{
\dontrun{
tmp<-scan('test_ensemble_data.txt', what='character')
mysample<-ens_converter(tmp)
sigs(mysample,'k',1,level=2)
head(summary_results)
}
}