\name{rcc_lenburg}
\alias{rcc_lenburg}
\docType{data}
\title{
Example validation dataset for SIGORA 
}
\description{
Differentially expressed genes in Renal Cell Carcinoma. 
}
\source{
Lenburg, M. E., Liou, L. S., Gerry, N. P., Frampton, G. M., Cohen, H. T., & Christ-man, M. F. (2003). Previously unidentified changes in renal cell carcinoma gene expression identified by parametric analysis of microarray data. BMC Cancer, 19, 1-19.
}
\examples{
\dontrun{
idb_converter(rcc_lenburg)
sigs(rcc_lenburg,'k',1,level=2)
head(summary_results)
}
}
\keyword{datasets}