#' Function to randomly select genes associated with random pathways.
#'
#' This function first randomly selects a number (np) of pathways, then
#' randomly selects a number (ng) of genes that are associated with at least
#' one of the selected pathways. The function can be used to compare Sigora's
#' performance to traditional over-representation tests.
#'
#' @export
#' 
#' @param GPSrepo A signature repository (created by 
#' \code{makeGPS()}) or one of the precompiled options.
#' @param np How many pathways to select
#' @param ng Number of genes to select
#' @return \item{selectedPathways}{A vector containing the "np"
#' originally selected pathways.}
#' \item{genes}{A vector containing the "ng" selected
#' genes from selectedPathways.}
#' @seealso \code{\link{sigora-package}}
#' @references Foroushani AB, Brinkman FS, and Lynn DJ
#' (2013).\dQuote{Pathway-GPS and SIGORA: identifying relevant
#' pathways based on the over-representation of their gene-pair
#' signatures.}\emph{PeerJ}, \bold{1}
#' @keywords functions
#' @examples
#'
#' data("kegH")
#' ## Select 50 genes from 3 human KEGG pathways
#' set.seed(1234)
#' a1 <- genesFromRandomPathways(kegH, 3, 50)
#' 
#' ## Originally selected pathways
#' a1[["selectedPathways"]]
#' 
#' ## What are the genes?
#' a1[["genes"]]
#' 
#' ## Sigora's results
#' sigoraRes <- sigora(
#'   queryList = a1[["genes"]],
#'   GPSrepo = kegH,
#'   level = 4
#' )
#' dim(sigoraRes)
#' sigoraRes
#' 
#' ## Compare to traditional methods results
#' oraRes <- ora(
#'   geneList = a1[["genes"]],
#'   GPSrepo = kegH
#' )
#' dim(oraRes)
#' oraRes
#'
genesFromRandomPathways <- function(GPSrepo, np, ng) {
  fr <- GPSrepo$origRepo[[3]]
  p1 <- sample(unique(fr[, 1]), np)

  message(
    "Randomly selected pathways are:\n",
    paste(as.character(GPSrepo$origRepo[[1]])[p1], "\n")
  )
  
  g1 <- sample(unique(fr[fr[, 1] %in% p1, 2]), ng)
  queryList <- as.character(GPSrepo$origRepo[[2]])[g1]
  res <- list()
  res[["genes"]] <- queryList
  res[["selectedPathways"]] <- as.character(GPSrepo$origRepo[[1]])[p1]
  invisible(res)
}
