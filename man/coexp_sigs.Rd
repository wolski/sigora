\name{coexp_sigs}
\alias{coexp_sigs}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
-- investigates whether GPS that are present in the query list might be due to highly correlated expression. --
}
\description{
This function highlights the relationship between co-expression and co-annotation in the user specified list. Using the 'human top three highest correlated genes' list from COXPRESdb (Obayashi et al 2011), this function identifies how many highly correlated pairs are contained in the sample and how many of those are among the present GPS. This might be helpful in identifying possible co-expression related biases. You need to run \code{sigs} and \code{det_out} before using this function.\cr 
}
\usage{
coexp_sigs(samplen)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{samplen}{
query list / list of genes of interest ("the sample").
}
}
\details{
Biases related to highly correlated expression behaviour of genes are considered to be 
a methodological problem of over-representation based methods. In particular, the 
'Independence Assumption' of IG-ORA is said to contradict biological reality.
Although tackling this problem is not a main goal of SIGORA, comparing the number of highly co-regulated gene pairs in the quer-list with the 
fraction of such genes that are among the present GPS suggests that signature over-representation
is less strongly affected by this issue.}
\examples{
\dontrun{
tmp<-scan('test_ensemble_data.txt', what='character')
mysample<-ens_converter(tmp)
sigs(mysample,'k',1,level=2)
head(summary_results)
det_out('evidence.txt')
coexp_sigs(mysample)
}
}
\keyword{ internal}