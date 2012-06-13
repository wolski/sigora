\name{sigs}
\alias{sigs}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
SIGORA's most important function 
}
\description{
This function determines which Signatures (GPS) from SIGORA's collection of GPS data for the specified archive 
(pathway repository/database) are present in the specified list of genes of interest (samplename).
 It then uses the distribution function of hypergeometric probabilities to identify the pathways 
 whose GPS are over-represented among the present GPS.
}
\usage{
sigs(samplename, archive, markers, level = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{samplename}{
 A user specified list of genes of interest ('query list'), as a vector of
  SIGORA IDs. To obtain such a vector, import the list of
  ENSEMBL/Entrez IDs using \code{scan(..,what='character')} and apply the
  appropriate mapping_function (\code{entrez_converter} or \code{ens_converter}) to it.
}
  \item{archive}{
     Repository name : e.g. keg(or 'k') for KEGG, 'R' for REACTOME. Possible values are  'K'(KEGG),'B'(PID_BIOCARTA),'N'(PID_NCI), 'I'(INOH),'R'(REACTOME).
}
  \item{markers}{
Whether to take single genes that are uniquely associated with only one pathway into account (i.e. should pathway unique genes/PUGs be considered GPS?). Choose from 0 (FALSE) and 1 (TRUE). Recommended value: 1.
}
  \item{level}{
    In hierarchical repositories (e.g. REACTOME) number of levels to consider. Recommended value for KEGG: 2, for REACTOME: 4.
}
}
\value{
Upon completion, the user is presented with the list of pathways that \code{sigs} deems to be statistically significant for this dataset. Additionally, \code{sigs} returns:
  \item{detailed_results}{The full list of present Signatures.}
  \item{summary_results}{The full list of pathways for which a present Signature was identified along with the associated values of the parameters of the hypergeometric function.}
}
\seealso{
\code{\link{sigs_background}}, 
\code{\link{coexp_sigs}}
}
\examples{
\dontrun{ 
sigs(dengue_hoang,'k',1,level=2)   
}
}