#' Identifier mappings for protein coding genes.
#'
#' A mapping table for ENSEMBL, ENTREZ and gene names (HGNC/MGI symbols) of
#' human and mouse protein coding gene.
#'
#'
#' @name idmap
#' @source www.ensembl.org/biomart/martview
#' @docType data
#' @keywords datasets
#' @examples
#'
#' data(idmap)
#' head(idmap)
#'
NULL

#' Pathway GPS data, extracted from KEGG repository (human).
#'
#' KEGG human pathway GPS data, extracted by \code{makeGPS}, default settings.
#' This data can be used by \code{sigora} to preform signature
#' over-representation.
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


#' Pathway GPS data, extracted from KEGG repository (mouse).
#'
#' KEGG mouse pathway GPS data, extracted by \code{makeGPS}, default settings.
#' This data can be used by \code{sigora} to preform signature
#' over-representation.
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
#' str(kegM)
#'
NULL


#' NCI human gene-pathway associations.
#'
#' PID-NCI human pathway repository, as a data frame with three columns
#' corresponding to : pathwayId , pathwayName, gene. This is an example of the
#' expected format for the input data to \code{makeGPS}.
#'
#' This dataset is provided to illustrate how to create your own GPS
#' repositories.\code{nciTable} is a dataframe with three columns corresponding
#' to pathwayId, pathwayName and gene. Each row describes the association
#' between an individual gene and a PID-NCI pathway. As you see in the
#' \code{examples}, section, one can convert this dataframe to a \code{GPS
#' repository} using \code{makeGPS}, and save the results for future reuse.
#' Using this created \code{GPS repository} one can preform Signature
#' Over-representation Analysis on lists of genes of interest.
#'
#' 
#' @name nciTable
#' @docType data
#' @source
#' <https://github.com/NCIP/pathway-interaction-database/tree/master/download>
#' @keywords datasets
#' @examples
#'
#' data(nciTable, idmap)
#' nciH <- makeGPS(pathwayTable = load_data("nciTable"))
#' ils <- grep("^IL", idmap[, "Symbol"], value = TRUE)
#' ilnci <- sigora(
#'   queryList = ils, GPSrepo = nciH, level = 3
#' )
#'
NULL


#' Pathway GPS data, extracted from the Reactome repository (human).
#'
#' Reactome human pathway GPS data, extracted by \code{makeGPS}, default
#' settings. This data can be used by \code{sigora} to preform signature
#' over-representation.
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
#' str(reaH)
#'
NULL


#' Pathway GPS data, extracted from Reactome repository (mouse).
#'
#' Reactome mouse pathway GPS data, extracted by \code{makeGPS}, default
#' settings. This data can be used by \code{sigora} to preform signature
#' over-representation.
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
