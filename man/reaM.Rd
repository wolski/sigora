\name{reaM}
\alias{reaM}
\docType{data}
\title{
Pathway GPS data, extracted from Reactome repository (Mouse).
}
\description{
Reactome mouse pathway GPS data, extracted by \code{makeGPS}, default settings.
This data can be used by \code{sigora} to preform signature overrepresenation.
}
\usage{data("reaM")}
\seealso{
\code{\link{makeGPS}}, \code{\link{sigora}} , \code{\link{kegM}} 
}
\references{
Matthews, L., Gopinath, G., Gillespie, M., Caudy, M., Croft, D.,  et al. 2009.
\dQuote{Reactome knowledgebase of human biological pathways and processes.}
 \emph{Nucleic acids research} \bold{37}(Database issue).
}
\source{
<http://www.reactome.org/>
}
\examples{
data(reaM)
str(reaM) 
}
\keyword{datasets}
