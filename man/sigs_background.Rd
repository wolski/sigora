\name{sigs_background}
\alias{sigs_background}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
 sigs with background restriction 
}
\description{
This function behaves analogous to \code{sigs}, but operates on a restricted GPS-search space (the background). sigs_background's search space is limited to the list of GPS that could theoretically have been observed in an experimental setting (e.g. only the GPS whose both constituent genes are on a particular microarray).
}
\usage{
sigs_background(samplename, archive, markers, level = 1, bg_genes)
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
     Repository name : e.g. keg(or 'k') for KEGG, 'R' for REACTOME. Possible values are:'K'(KEGG),'B'(PID_BIOCARTA),'N'(PID_NCI), 'I'(INOH),'R'(REACTOME)
}
  \item{markers}{
Whether to take single genes that are uniquely associated with only one pathway into account (i.e. should pathway unique genes/PUGs be considered GPS?). Possible values are: 0 (FALSE) and 1 (TRUE). Recommended value: 1.
}
  \item{level}{
    In hierarchical repositories (e.g. REACTOME) number of levels to consider. Recommended value for KEGG: 2, for REACTOME: 4.
}
  \item{bg_genes}{
A vector containing the list of assayed genes as SIGORA IDs. For a convenient way of obtain such a vector from a Biomart mapping file, please see the instructions in create_bg. You can also use SIGORA's ens_converter to obtain such a vector from a list of ENSEMBL IDs. 
}
}
\seealso{
\code{\link{sigs}},
\code{\link{create_bg}},
\code{\link{ens_converter}} 
}
\examples{
\dontrun{
sigs_background(ecm_randall_cba,'k',1,level=2,mg_4302_bg)
head(summary_results)
##compare to the unrestricted version:
sigs(ecm_randall_cba,'k',1,level=2)
 head(summary_results)
}
}
