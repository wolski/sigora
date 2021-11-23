#' List genes involved in present GPS for a specific pathway in the
#' summary_results
#'
#' This function lists the genes involved in the present GPS for a pathway of
#' interest, odered by their contribution to the significance of the pathway.
#'
#' @export
#' @param yy A sigora analysis result object (created by \code{sigora}).
#' @param i The rank position of the pathway of interest in summary_results.
#' @param idmap A dataframe for converting between different gene-identifier
#' types (e.g. ENSEMBL, ENTREZ and HGNC-Symbols of genes). Most users do not
#' need to set this argument, as there is a built-in conversion table.
#' @return A table (dataframe) with ids of the relevant genes, ranked by their
#' contribution to the statistical significance of the pathway.
#' @seealso \code{\link{sigora}}
#' @keywords functions
#' @examples
#'
#' data('kegH')
#' a1<-genesFromRandomPathways(seed=12345,kegH,3,50)
#' ## originally selected pathways:\cr
#' a1[["selectedPathways"]]
#' ## what are the genes
#' a1[["genes"]]
#' ## sigora's results with this input:\cr
#' sigoraRes <- sigora(GPSrepo =kegH, queryList = a1[["genes"]],level = 2)
#' ## Genes related to the second most significant result:
#' getGenes(sigoraRes,2)
#'
getGenes <- function(yy, i, idmap = load_data('idmap')) {
  #idmap<-get(data(idmap,envir=as.environment(parent.frame())))
  yy1 <-
    yy$detailed_results[which(yy$detailed_results[, 'pathway'] == yy$summary_results[i, 1]), , drop =
                          FALSE]
  ## pgs<-unique(as.character(as.vector(yy1[yy1[,4]==1,1:2])))
  ## print(pgs)
  r1 <- aggregate(as.numeric(yy1[, 4]), by = list(yy1[, 1]), FUN = sum)
  r2 <- aggregate(as.numeric(yy1[, 4]), by = list(yy1[, 2]), FUN = sum)
  r3 <- aggregate(rbind(r1, r2)[, 2], by = list(rbind(r1, r2)[, 1]), FUN =
                    sum)
  r4 <- as.data.frame(r3[order(-r3[, 2]), ])
  r4[, 2] <- 0.5 * r4[, 2]
  colnames(r4) <- c("gene", "contribution")
  v1 <- (sapply(idmap, function(x)
    length(intersect(x, r4[, 1]))))
  if (max(v1) > 0) {
    t1 <- which.max(v1)
    r4 <- cbind(r4, idmap[match(r4[, 1], idmap[, t1]), -t1])
  }
  rownames(r4) <- NULL
  r4
}
