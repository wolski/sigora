\name{nciTable}
\alias{nciTable}
\docType{data}
\title{
NCI human gene-pathway associations.
}
\description{
PID-NCI human pathway repository, as a data frame with three columns corresponding to :  pathwayId , pathwayName, gene. This is an example of the expected format for the input data to \code{makeGPS}.
}
\usage{data("nciTable")}
\details{
This dataset is provided to illustrate how to create your own GPS
repositories.\code{nciTable} is a dataframe with threecolumns corresponding to
pathwayId, pathwayName and gene.  Each row describes the association between an
individual gene and a PID-NCI pathway.  As you see in the
\code{examples}, section, one can convert this dataframe to a
\code{GPS repository} using \code{makeGPS}, and save the results for
future reuse. Using the thus created \code{GPS repository} one can preform
Signature Overrepresentation Analysis on lists of genes of interest.
}
\source{
<https://github.com/NCIP/pathway-interaction-database/tree/master/download>
}
\examples{
data(nciTable)
nciH<-makeGPS(pathwayTable=nciTable)
data(idmap)
ils<-grep("^IL",idmap[,"Symbol"],value=TRUE)
ilnci<-sigora(queryList=ils,GPSrepo=nciH,level=3)
}
\keyword{datasets}
