#' Highlight the relevant genes for a specific pathway in its diagram
#'
#' This function highlights the genes involved in the present GPS for a pathway
#' of interest in its diagram. Please note that this functionality is only
#' implemented for results of Reactome- or KEGG-based analyses.
#'
#' @export
#' 
#' @param yy A sigora analysis result object (created by \code{sigora}).
#' @param i The rank position of the pathway of interest in summary_results.
#' @return The URL of the pathway diagram, where the relevant genes from your
#' original query list are highlighted.
#' @seealso \code{\link{sigora}}
#' @keywords functions
#' @examples
#'
#' data("kegH")
#' set.seed(12345)
#' 
#' a1 <- genesFromRandomPathways(kegH, 3, 50)
#' 
#' ## Originally selected pathways
#' a1[["selectedPathways"]]
#' 
#' ## What are the genes?
#' a1[["genes"]]
#' 
#' ## Sigora's results with this input
#' sigoraRes <- sigora(
#'   GPSrepo = kegH,
#'   queryList = a1[["genes"]],
#'   level = 2
#' )
#' 
#' ## Diagram for the most significant result;
#' ## genes from our list are highlighted in red
#' getURL(sigoraRes, 1)
#'
getURL <- function(yy, i) {
  url <- ""

  repo <-
    ifelse(
      substr(x = yy$summary_results[i, 1], start = 1, 2) == "R-",
      "rea",
      "keg"
    )

  if (repo == "rea") {
    message("Assuming this is a result from Reactome...\n")
    url <-
      paste(
        "https://reactome.org/ContentService/exporter/diagram//",
        yy$summary_results[i, 1],
        ".png?flg=",
        paste(getGenes(yy, i)[, 4], sep = "", collapse = ","),
        sep = ""
      )
  }

  if (repo == "keg") {
    message("Assuming this is a result from KEGG...\n")
    url <- paste(
      "https://www.genome.jp/kegg-bin/show_pathway?",
      tolower(yy$summary_results[i, 1]),
      "+",
      paste(getGenes(yy, i)[, 4], sep = "", collapse = "+"),
      sep = ""
    )
  }

  return(url)
}
