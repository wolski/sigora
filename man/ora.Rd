\name{ora}
\alias{ora}

\title{
Traditional Overrepresentation Analysis.
}
\description{
Traditional Overrepresentation Analysis by hypergeometric test: pathways
are treated as collections of individual genes and all genes are treated
as equally informative. This function is provided for comparison of the
results of traditional methods to Sigora.  
}
\usage{
ora(geneList, GPSrepo)
}
\arguments{
  \item{geneList}{
A vector containing the list of genes of interest (e.g. differentially
expressed genes). Following Identifier types are supported: Gene Symbols, ENTREZ-IDs or ENSEMBL-IDs.
}
  \item{GPSrepo}{
A GPS-repository (either one of the provided precomputed GPS
repositories) or one created by \code{makeGPS}.
}
}
\details{
The primary purpose of \code{makeGPS} is to create a GPS repository. It
does, however, retain the original "single gene"-"pathway" associations for the
purpose of followup analyses, such as comparison of sigora-results to
traditional methods. \code{ora} is an implementation of the traditional
(individual gene) Overrepresentation Analysis. 
}
\value{
A dataframe with individual gene ORA results.
}

\seealso{
\code{\link{sigora-package}} 
}
\examples{
data(kegM)
## select 50 genes from 3 mouse pathways
a1<-genesFromRandomPathways(seed=345,kegM,3,50)
## originally selected pathways:
a1[["selectedPathways"]]
## compare to traditional methods results:
oraRes <- ora(a1[["genes"]],kegM)
dim(oraRes)
oraRes
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{functions}

