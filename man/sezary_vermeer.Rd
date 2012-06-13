\name{sezary_vermeer}
\alias{sezary_vermeer}
\docType{data}
\title{
Example validation dataset for SIGORA 
}
\description{
Genes displaying copy number alteration in Sezary syndrome.
}
\source{
Vermeer, M. H., Doorn, R. van, Dijkman, R., Mao, X., Whittaker, S., Voorst Vader, P. C. van, et al. (2008). Novel and highly recurrent chromosomal alterations in Sezary syndrome. Cancer Research, 68(8), 2689-98.
}
\examples{
\dontrun{
idb_converter(sezary_vermeer)
sigs(sezary_vermeer,'k',1,level=2)
}
}
\keyword{datasets}