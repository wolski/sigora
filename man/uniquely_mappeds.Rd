\name{uniquely_mappeds}
\alias{uniquely_mappeds}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
-- identify the unique mappings in a (Biomart-) mapping table -- 
}
\description{
In a two column mapping table (e.g. a ENSEMBL-Gene, Affymetrix-ID table from Biomart), this function identifies all elements in the second column that are only mapped to a single element in the first column (e.g. all Affymetrix-IDs that map to a single ENSEMBL-ID). 
}
\usage{
uniquely_mappeds(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
A two column mapping table
}
}
\keyword{ internal}
