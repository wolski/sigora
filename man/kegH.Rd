\name{kegH}
\alias{kegH}
\docType{data}
\title{
Pathway GPS data, extracted from KEGG repository (Human).
}
\description{
KEGG human pathway GPS data, extracted by \code{makeGPS}, default settings.
This data can be used by \code{sigora} to preform signature overrepresenation.
}
\usage{data("kegH")}
\seealso{
\code{\link{makeGPS}}, \code{\link{sigora}} , \code{\link{reaH}} 
}
\references{
Kanehisa, M., Goto, S., Sato, Y., Furumichi, M., & Tanabe, M. 2012.
\dQuote{KEGG for integration and interpretation of large-scale molecular data sets.}
\emph{Nucleic Acids Research} \bold{40}(D1).
}
\source{
<http://www.genome.jp/kegg/pathway.html>
}
\examples{
data(kegH)
str(kegH) 
}
\keyword{datasets}
