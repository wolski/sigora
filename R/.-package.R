

#' Identifier mappings for protein coding genes.
#'
#' A mapping table for ENSEMBL, ENTREZ and gene names(HGNC/MGI symbols) of
#' Human and mouse protein coding gene.
#'
#'
#' @name idmap
#' @docType data
#' @source www.ensembl.org/biomart/martview
#' @keywords datasets
#' @examples
#'
#' data(idmap)
#' head(idmap)
#'
NULL





#' Pathway GPS data, extracted from KEGG repository (Human).
#'
#' KEGG human pathway GPS data, extracted by \code{makeGPS}, default settings.
#' This data can be used by \code{sigora} to preform signature
#' overrepresenation.
#'
#'
#' @name kegH
#' @docType data
#' @seealso \code{\link{makeGPS}}, \code{\link{sigora}} , \code{\link{reaH}}
#' @references Kanehisa, M., Goto, S., Sato, Y., Furumichi, M., & Tanabe, M.
#' 2012. \dQuote{KEGG for integration and interpretation of large-scale
#' molecular data sets.} \emph{Nucleic Acids Research} \bold{40}(D1).
#' @source <http://www.genome.jp/kegg/pathway.html>
#' @keywords datasets
#' @examples
#'
#' data(kegH)
#' str(kegH)
#'
NULL





#' Pathway GPS data, extracted from KEGG repository (Mouse).
#'
#' KEGG mouse pathway GPS data, extracted by \code{makeGPS}, default settings.
#' This data can be used by \code{sigora} to preform signature
#' overrepresenation.
#'
#'
#' @name kegM
#' @docType data
#' @references Kanehisa, M., Goto, S., Sato, Y., Furumichi, M., & Tanabe, M.
#' 2012. \dQuote{KEGG for integration and interpretation of large-scale
#' molecular data sets.} \emph{Nucleic Acids Research} \bold{40}(D1).
#' @source <http://www.genome.jp/kegg/pathway.html>
#' @keywords datasets
#' @examples
#'
#' data(kegM)
#' ## maybe str(kegM) ; plot(kegM) ...
#'
NULL





#' NCI human gene-pathway associations.
#'
#' PID-NCI human pathway repository, as a data frame with three columns
#' corresponding to : pathwayId , pathwayName, gene. This is an example of the
#' expected format for the input data to \code{makeGPS}.
#'
#' This dataset is provided to illustrate how to create your own GPS
#' repositories.\code{nciTable} is a dataframe with threecolumns corresponding
#' to pathwayId, pathwayName and gene.  Each row describes the association
#' between an individual gene and a PID-NCI pathway.  As you see in the
#' \code{examples}, section, one can convert this dataframe to a \code{GPS
#' repository} using \code{makeGPS}, and save the results for future reuse.
#' Using the thus created \code{GPS repository} one can preform Signature
#' Overrepresentation Analysis on lists of genes of interest.
#'
#' @name nciTable
#' @docType data
#' @source
#' <https://github.com/NCIP/pathway-interaction-database/tree/master/download>
#' @keywords datasets
#' @examples
#'
#' data(nciTable)
#' nciH<-makeGPS(pathwayTable=nciTable)
#' data(idmap)
#' ils<-grep("^IL",idmap[,"Symbol"],value=TRUE)
#' ilnci<-sigora(queryList=ils,GPSrepo=nciH,level=3)
#'
NULL





#' Pathway GPS data, extracted from the Reactome repository (Human).
#'
#' Reactome human pathway GPS data, extracted by \code{makeGPS}, default
#' settings. This data can be used by \code{sigora} to preform signature
#' overrepresenation.
#'
#'
#' @name reaH
#' @docType data
#' @references Matthews, L., Gopinath, G., Gillespie, M., Caudy, M., Croft, D.,
#' et al. 2009. \dQuote{Reactome knowledgebase of human biological pathways and
#' processes.} \emph{Nucleic acids research} \bold{37}(Database issue).
#' @source <http://www.reactome.org/>
#' @keywords datasets
#' @examples
#'
#' data(reaH)
#' ## maybe str(reaH) ;  ...
#'
NULL





#' Pathway GPS data, extracted from Reactome repository (Mouse).
#'
#' Reactome mouse pathway GPS data, extracted by \code{makeGPS}, default
#' settings. This data can be used by \code{sigora} to preform signature
#' overrepresenation.
#'
#'
#' @name reaM
#' @docType data
#' @seealso \code{\link{makeGPS}}, \code{\link{sigora}} , \code{\link{kegM}}
#' @references Matthews, L., Gopinath, G., Gillespie, M., Caudy, M., Croft, D.,
#' et al. 2009. \dQuote{Reactome knowledgebase of human biological pathways and
#' processes.} \emph{Nucleic acids research} \bold{37}(Database issue).
#' @source <http://www.reactome.org/>
#' @keywords datasets
#' @examples
#'
#' data(reaM)
#' str(reaM)
#'
NULL





#' Signature Overrepresentation Analysis
#'
#' This package implements the pathway analysis method SIGORA. For an in depth
#' description of the method, please see our manuscript in PeerJ.  In short: a
#' \emph{GPS} (gene pair signature) is a (weighted) pair of genes that \emph{as
#' a combination} occurs only in a single pathway within a pathway repository.
#' A query list is a vector containing a gene list of interest (e.g. genes that
#' are differentially expressed in a particular condition).  A \emph{present}
#' GPS is a GPS for which both components are in the query list.  SIGORA
#' identifies relevant pathways based on the over-representation analysis of
#' their (present) GPS.
#'
#'
#' \subsection{Getting started
#'
#' To install from CRAN:\cr \code{install.packages('sigora')}\cr As an
#' alternative, you can download the tarball and install from the local file:
#' \cr \code{install.packages("sigora_3.0.tar.gz",type="source",repos = NULL)}
#' \cr To load the library:\cr \code{library("sigora")} }
#'
#' \subsection{Motivation --A thought experiment Imagine you randomly selected
#' 3 KEGG pathways, and then randomly selected a total of 50 genes from all
#' genes that that are associated with any of these pathways. Using traditional
#' methods (hypergeometric test using individual genes), how many pathways
#' would you estimate to show up as statistically overrepresented in this
#' "query list" of 50 genes?  Let us do this experiment!  Everything related to
#' human KEGG Pathways can be found in \code{kegH}.  A function to randomly
#' select n genes from m reandomly selected pathways is
#' \code{genesFromRandomPathways}.  The traditional Overrepresentation Analysis
#' (which is the basis for many popular tools) is available through \code{ora}.
#' Putting these together:\cr
#'
#' \code{data(kegH)}\cr
#' \code{a1<-genesFromRandomPathways(seed=12345,kegH,3,50)}\cr ## originally
#' selected pathways:\cr \code{a1[["selectedPathways"]]}\cr ## what are the
#' genes \code{a1[["genes"]]}\cr ## Traditional ora identifies dozens of
#' statistically significant pathways!\cr \code{ora(a1[["genes"]],kegH)}\cr ##
#' Now let us try sigora with the same input:\cr \code{sigoraRes <-
#' sigora(GPSrepo =kegH, queryList = a1[["genes"]],level = 4)}\cr ## Again, the
#' three originally selected pathways were:\cr
#' \code{a1[["selectedPathways"]]}\cr
#'
#' You might want to rerun the above few lines of code with different values
#' for \code{seed} and convince yourself that there indeed is a need for a new
#' way of pathway analysis. }
#'
#' \subsection{Available Pathway-GPS repositories in SIGORA
#'
#' The current version of the package comes with precomputed GPS-repositories
#' for \emph{KEGG} human and mouse (kegH and kegM respectively), as well as for
#' \emph{Reactome} human and mouse (reaH and reaM respectively).  The package
#' provides a function for creating GPS-repositories from user's own
#' gene-function repository of choice (example \emph{Gene Ontology Biological
#' Processes}).  The following section describes this process of creating one's
#' own GPS-repositories using the \emph{PCI-NCI} pathways from National Cancer
#' Institute as an example. }
#'
#' \subsection{Creating a GPS repository You can create your own GPS
#' repositories using the \code{makeGPS()} function. There are no particular
#' requirements on the format of your source repository, except: it should be
#' provided either a tab delimited file or a dataframe with \bold{three columns
#' in the following order: \cr PathwayID, PathwayName, Gene.}\cr
#'
#' \code{ data(nciTable)} \cr ## what does the input look like? \cr \code{
#' head(nciTable)} \cr ## create a SigObject. use the saveFile parameter for
#' future reuse. \cr \code{nciH<-makeGPS(pathwayTable=nciTable,
#' saveFile='nciH.rda')} \cr
#' \code{ils<-grep("^IL",idmap[,"Symbol"],value=TRUE)}\cr
#' \code{ilnci<-sigora(queryList=ils,GPSrepo=nciH,level=3)}\cr }
#'
#' \subsection{Analysing your data To preform Signature Overrepresentation
#' Analysis, use the function \code{sigora}.  For traditional
#' Overrepresentation Analysis, use the function \code{ora}. }
#'
#' \subsection{Exporting the results Simply provide a file name to the
#' \code{saveFile} parameter of \code{sigora}, i.e. (for the above
#' experiment):\cr \code{sigRes<- sigora(kegH,queryList= a1$genes,level= 2,
#' saveFile="myResultsKEGG.csv")}\cr You will notice that the file also
#' contains the list of the relevant genes from the query list in each pathway.
#' The genes are listed as human readable gene symbols and sorted by their
#' contribution to the statistical significance of the pathway.  }
#'
#' \subsection{Gene identifier mapping Mappings between
#' \emph{ENSEMBL}-IDS,\emph{ENTREZ}-IDS and Gene-Symbols are performed
#' automatically. You can, for instance, create a \emph{GPS}-repository using
#' \emph{ENSEMBL}-IDs and perform \emph{Signature Overrepresentation Analysis}
#' using this repository on a list of \emph{ENTREZ}-IDs.  }
#'
#' @name sigora-package
#' @docType package
#' @author Amir B.K. Foroushani, Fiona S.L. Brinkman, David J. Lynn
#'
#' Maintainer: Witold Wolski <wew@fgcz.ethz.ch>
#' @seealso \code{\link{sigora}}, \code{\link{makeGPS}}, \code{\link{ora}}
#' @references Foroushani AB, Brinkman FS and Lynn DJ
#' (2013).\dQuote{Pathway-GPS and SIGORA: identifying relevant pathways based
#' on the over-representation of their gene-pair signatures.}\emph{PeerJ},
#' \bold{1}
#' @keywords package
#' @examples
#'
#' data('kegH')
#' barplot(table(kegH$L1$degs),col="red",
#' main="distribution of number of functions per gene in KEGG human pathways.",
#' ylab="frequency",xlab="number of functions per gene")
#' ## creating your own GPS repository
#' nciH<-makeGPS(pathwayTable=nciTable)
#' ils<-grep("^IL",idmap[,"Symbol"],value=TRUE)
#' ## signature overrepresentation analysis:
#' sigRes.ilnci<-sigora(queryList=ils,GPSrepo=nciH,level=3)
#'
NULL



