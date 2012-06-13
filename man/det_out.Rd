\name{det_out}
\alias{det_out}
\title{
Save a human readable list of present GPS into a file.
}
\description{
To be run after \code{sigs}. Saves all present GPS along with their weights and associated pathways into a tab delimited file. 
If you need to use \code{related_genes} or \code{coexp_sigs}, you have to run \code{det_out} first.
}
\usage{
det_out(filename)
}
\arguments{
  \item{filename}{
where to save the tab delimited table.
}
}
\examples{
\dontrun{
tmp<-scan('test_ensemble_data.txt', what='character')
mysample<-ens_converter(tmp)
sigs(mysample,'k',1,level=2)
head(summary_results)
det_out("detailed_evidence.txt")
}
}