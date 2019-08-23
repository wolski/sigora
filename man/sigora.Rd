\name{sigora}
\alias{sigora}
\title{
Sigora's main function.
}
\description{
This function determines which Signatures (GPS) from a collection of GPS data
(\code{GPSrepo} argument) for the specified pathway repository are present in the
 specified list of genes of interest (\code{queryList} argument)). It then uses the
 distribution function of hypergeometric probabilities to identify the pathways
 whose GPS are over-represented among the present GPS and saves the results to
 the file specified in the \code{saveFile} argument.
}
\usage{
sigora(GPSrepo, level, markers = FALSE,
 queryList = NULL, saveFile=NULL, weighting.method = "invhm", idmap=sigora::idmap)
}
\arguments{
  \item{GPSrepo}{ An object created by \code{makeGPS} or one of the precompiled GPS data collections that are provided with this package (currently for KEGG and Reactome). e.g. \code{reaH} for human Reactome GPS, \code{kegH} for human KEGG GPS, and \code{reaM} and \code{kegM} for corresponding mouse GPS.
   See the examples section for creating and using your own GPS.

}
  \item{level}{
In hierarchical repositories (e.g. Reactome) number of levels to consider. Recommended value for KEGG: 2, for Reactome: 4.
}
  \item{markers}{
  Whether to take single genes that are uniquely associated with only one pathway into account
  (i.e. should pathway unique genes/PUGs be considered GPS?). Recommended value: TRUE (1).
}
  \item{queryList}{
  A user specified list of genes of interest ('query list'), as a vector of ENSEMBL/ ENTREZ IDs or gene symbols (HGNC/MGI).
}
 \item{saveFile}{
If provided, the results are saved here as a tab delimited File
(including , for each pathway, a list of genes ordered by their
contribution to the statistical significance of the pathway).
}

  \item{weighting.method}{
  The weighting method or GPS. The default weighting scheme for the GPS is the reciproc of the harmonic mean of
 the degrees of the two component genes of a GPS. A wide range of alternative
 weighting schemes are pre-implemented (see below). Additional user defined
 weighting schemes are also supported. Currently, the following alternatives are pre-implemented:\cr
  'noweights','cosine','topov','reciprod','jac','justPUGs'and'invhm'.\cr
Additional user defined weighting schemes are also supported (see section examples).\cr
'noweights': assigns a constant of 1 to all GPS.\cr
'cosine': all GPS are weighted by the cosine of the degrees of their consituent genes.\cr
'topov': all GPS are weighted by topological overlap of their consituent genes.\cr
'reciprod': all GPS are weighted by reciproc of product of the number of pathway annotations of their consituent genes.\cr
'jac':all GPS are weighted by the jaccard similarity of the pathway annotations consituent genes.\cr
'justPUGs': Analysis is performed using PUGs only.\cr
'invhm': all GPS are weighted by the reciproc of the harmonic mean of the degrees of their consituent genes (default).\cr
}
  \item{idmap}{
A dataframe for converting between different gene-identifier types (e.g. ENSEMBL, ENTREZ and HGNC-Symbols of genes). Most users do not need to set this argument, as there is a built-in conversion table.
}
}
\value{
\item{ summary_results}{A dataframe listing the analysis results.}
\item{detailed_results }{A dataframe describing the detailed evidence (present Gene-Pair Signatures) for each pathway.}
}
\references{
Foroushani AB, Brinkman FS and Lynn DJ (2013).\dQuote{Pathway-GPS and SIGORA: identifying relevant pathways based on the over-representation of their gene-pair signatures.}\emph{PeerJ}, \bold{1}
}
\seealso{
\code{\link{sigora-package}} , \code{\link{makeGPS}}
}
\examples{
\dontrun{
##query list
ils<-grep("^IL",idmap[["Symbol"]],value=TRUE)
## using precompiled GPS repositories:
sigRes.ilreact<-sigora(queryList=ils,GPSrepo=reaH,level=4) 
sigRes.ilkeg<-sigora(queryList=ils,GPSrepo=kegH,level=2)
## user created GPS repository:
nciH<-makeGPS(pathwayTable=nciTable)
sigRes.ilnci<-sigora(queryList=ils,GPSrepo=nciH,level=2)
## user defined weighting schemes :
myfunc<-function(a,b){1/log(a+b)}
sigora(queryList=ils,GPSrepo=nciH,level=2, weighting.method ="myfunc")
}
}
\keyword{functions}
