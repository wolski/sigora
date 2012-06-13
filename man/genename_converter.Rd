\name{genename_converter}
\alias{genename_converter}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
 Map gene names to SIGORA IDs 
}
\description{
This function maps HGNC or MGI style gene names to SIGORA IDs.
}
\usage{
genename_converter(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
A vector containing the names of genes of interest.
}
}
\examples{
\dontrun{
tmp<-scan('test_genename_data.txt', what='character')
mysample<-genename_converter(tmp)
sigs(mysample,'k',1,level=2)
head(summary_results)
}
}
