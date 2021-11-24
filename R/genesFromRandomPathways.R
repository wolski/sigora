#' Function to randomly select genes associated with randomly pathways.
#'
#' This function first randomly selects a number (np) of pathways, then
#' randomly selects a number (ng) of genes that are associated with at least
#' one of the selected pathways.  The function can be used to compare Sigora's
#' performance to traditional overrepresentation tests.
#'
#' @export
#' @param GPSrepo A signature repository (created by ..) or one of the
#' precompiled options.
#' @param np How many pathways to select.
#' @param ng Number of genes to be selected.
#' @return \item{selectedPathways}{A vector containing the "np" originally
#' selected pathways.} \item{genes}{ A vector containing the "ng" selected
#' genes from selectedPathways.}
#' @seealso \code{\link{sigora-package}}
#' @references Foroushani AB, Brinkman FS and Lynn DJ
#' (2013).\dQuote{Pathway-GPS and SIGORA: identifying relevant pathways based
#' on the over-representation of their gene-pair signatures.}\emph{PeerJ},
#' \bold{1}
#' @keywords functions
#' @examples
#'
#' data('kegH')
#' ## select 50 genes from 3 human KEGG pathways
#' seed=1234
#' set.seed(seed)
#' a1<-genesFromRandomPathways(kegH,3,50)
#' ## originally selected pathways:
#' a1[["selectedPathways"]]
#' ## what are the genes
#' a1[["genes"]]
#' ## sigora's results
#' sigoraRes <- sigora(GPSrepo =kegH, queryList = a1[["genes"]],
#'         level = 4)
#' ## compare to traditional methods results:
#' oraRes <- ora(a1[["genes"]],kegH)
#' dim(oraRes)
#' oraRes
#'
genesFromRandomPathways <- function(GPSrepo, np, ng) {
  fr <- GPSrepo$origRepo[[3]]
  p1 <- sample(unique(fr[, 1]), np)
  cat("### randomly selected pathways are: \n")
  cat(paste(as.character(GPSrepo$origRepo[[1]])[p1], "\n"))
  g1 <- sample(unique(fr[fr[, 1] %in% p1, 2]), ng)
  queryList <- as.character(GPSrepo$origRepo[[2]])[g1]
  ## cat("### Sigora returns: \n")
  ## sigoraRes<-sigora(GPSrepo=GPSrepo,queryList=as.character(queryList),level=4)
  ## cat("### traditional Overrepresntation Analysis would return: \n")
  ##oraRes<-ora(queryList,GPSrepo)
  ## print(oraRes)
  res <- list()
  res[['genes']] <- queryList
  res[['selectedPathways']] <- as.character(GPSrepo$origRepo[[1]])[p1]
  ##res[['Sigora.Results']]<-sigoraRes
  ##res[['ORA.Results']]<-oraRes
  invisible(res)
}
