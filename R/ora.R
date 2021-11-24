#' Traditional Overrepresentation Analysis.
#'
#' Traditional Overrepresentation Analysis by hypergeometric test: pathways are
#' treated as collections of individual genes and all genes are treated as
#' equally informative. This function is provided for comparison of the results
#' of traditional methods to Sigora.
#'
#' The primary purpose of \code{makeGPS} is to create a GPS repository. It
#' does, however, retain the original "single gene"-"pathway" associations for
#' the purpose of followup analyses, such as comparison of sigora-results to
#' traditional methods. \code{ora} is an implementation of the traditional
#' (individual gene) Overrepresentation Analysis.
#'
#' @export
#' @param geneList A vector containing the list of genes of interest (e.g.
#' differentially expressed genes). Following Identifier types are supported:
#' Gene Symbols, ENTREZ-IDs or ENSEMBL-IDs.
#' @param GPSrepo A GPS-repository (either one of the provided precomputed GPS
#' repositories) or one created by \code{makeGPS}.
#' @param idmap A dataframe for converting between different gene-identifier
#' types (e.g. ENSEMBL, ENTREZ and HGNC-Symbols of genes). Most users do not
#' need to set this argument, as there is a built-in conversion table.
#' @return A dataframe with individual gene ORA results.
#' @seealso \code{\link{sigora-package}}
#' @keywords functions
#' @examples
#'
#' data(kegM)
#' ## select 50 genes from 3 mouse pathways
#' a1<-genesFromRandomPathways(seed=345,kegM,3,50)
#' ## originally selected pathways:
#' a1[["selectedPathways"]]
#' ## compare to traditional methods results:
#' oraRes <- ora(a1[["genes"]],kegM)
#' dim(oraRes)
#' oraRes
#'
ora <- function(geneList, GPSrepo, idmap = load_data('idmap')) {
  # idmap<-get(data(idmap,envir=as.environment(parent.frame())))
  fr <- GPSrepo$origRepo[[3]]
  sp1 <- GPSrepo$pathwaydescriptions
  if (length(intersect(geneList, GPSrepo$origRepo[[2]])) == 0) {
    t1 <-
      which.max(sapply(idmap, function(x)
        length(intersect(
          x, GPSrepo$origRepo[[2]]
        ))))
    t2 <-
      which.max(sapply(idmap, function(x)
        length(intersect(x, geneList))))
    geneList <- idmap[which(idmap[, t2] %in% geneList), t1]
    print(paste(
      "Mapped identifiers from" ,
      colnames(idmap)[t2],
      " to ",
      colnames(idmap)[t1],
      "..."
    ))
  }
  g1m <- match(geneList, GPSrepo$origRepo[[2]])
  frO <- fr[fr[, 2] %in% g1m, ]
  npwys <- table(as.character(GPSrepo$origRepo[[1]][(frO[, 1])]))
  nn <-
    cbind(sp1[match(names(npwys), sp1[, 1]), ], as.numeric(as.vector(npwys)))
  PPwys <- table(as.character(GPSrepo$origRepo[[1]][(fr[, 1])]))
  ps <- stats::phyper(
    npwys - 1,
    PPwys[match(names(npwys), names(PPwys))],
    length(GPSrepo$origRepo[[2]]) - PPwys[match(names(npwys), names(PPwys))],
    length(intersect(geneList, GPSrepo$origRepo[[2]])),
    lower.tail = FALSE
  )
  ps <- signif(ps, digits = 4)
  res <-
    data.frame(nn, PPwys[match(names(npwys), names(PPwys))], as.numeric(ps), as.numeric(stats::p.adjust(ps, method =
                                                                                                   'bonfer')))[, -4]
  colnames(res) <-
    c("pathwyid",
      "description",
      "success",
      "pathwaySize",
      "pvalues",
      "Bonfer")
  res <- res[with(res, order(pvalues)), ]
  rownames(res) <- c(1:nrow(res))
  return(res[which(as.numeric(res[, ncol(res)]) < 0.05), ])
}
