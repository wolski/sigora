\name{related_genes}
\alias{related_genes}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
List genes involved in the present pathway signatures
}
\description{
 This function gives the list of genes involved in all present GPS per pathway. 
In SIGORA, all evidence is based on weighted gene pairs (see det_out). However, as such lists are at times very long, it might seem useful to ask which genes make up these pairs. \code{related_genes} returns exactly this.  
}
\usage{
related_genes()
}
\seealso{
\code{\link{get_genes}}
}
\examples{
\dontrun{
sigs(dengue_hoang,'k',1)
det_out('detailed_results_on_dengue_hoang.txt')
related_genes()
}
}