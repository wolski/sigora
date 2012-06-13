\name{entrez_converter}
\alias{entrez_converter}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Apply this to convert Entrez Gene IDs to SIGORA IDs
}
\description{
This function converts Entrez IDs to SIGORA IDs.
}
\usage{
entrez_converter(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
A vector containing the human or mouse Entrez Gene IDs.
}
}
\examples{
\dontrun{
tmp<-scan('test_entrez_data.txt', what='character')
mysample<-entrez_converter(tmp)
sigs(mysample,'k',1,level=2)
head(summary_results)
}
}