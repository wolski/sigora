\name{getGenes}
\alias{getGenes}

\title{
List genes involved in present GPS for a specific pathway in the summary_results
}
\description{
This function lists the genes involved in the present GPS for a pathway of interest, odered by their contribution to the significance of the pathway.
}
\usage{
getGenes(yy, i, idmap=sigora::idmap)
}
\arguments{
  \item{yy}{
A sigora analysis result object (created by \code{sigora}).
}
  \item{i}{
The rank position of the pathway of interest in summary_results.
}
  \item{idmap}{
A dataframe for converting between different gene-identifier types (e.g. ENSEMBL, ENTREZ and HGNC-Symbols of genes). Most users do not need to set this argument, as there is a built-in conversion table.
}
}
\value{
A table (dataframe) with ids of the relevant genes, ranked by their contribution to
the statistical significance of the pathway.
}
\seealso{
\code{\link{sigora}}
}
\examples{
a1<-genesFromRandomPathways(seed=12345,kegH,3,50)
## originally selected pathways:\cr
a1[["selectedPathways"]]
## what are the genes
a1[["genes"]]
## sigora's results with this input:\cr
sigoraRes <- sigora(GPSrepo =kegH, queryList = a1[["genes"]],level = 2)
## Genes related to the second most significant result:
getGenes(sigoraRes,2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{functions}

