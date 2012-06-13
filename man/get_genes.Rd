\name{get_genes}
\alias{get_genes}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
List genes involved in present GPS with weight above a specified threshold for
a specific pathway in the summary_results
}
\description{
This function lists genes involved in present GPS with weight above a specified threshold for a pathway of interest.
}
\usage{
get_genes(line_nr, thresh)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{line_nr}{
The rank position of the pathway of interest in summary_results.
}
  \item{thresh}{
numeric value between 0 and 1. Genes from query list involved in present GPS of weight > thresh will be returned.
}
}



\seealso{
\code{\link{related_genes}}
}
\examples{
\dontrun{
sigs(ecm_randall_b6,'k',1,2)
#lists genes involved in present GPS of weight 0.5 or better for the 2nd ranked pathway
get_genes(2,0.5)
}
}
