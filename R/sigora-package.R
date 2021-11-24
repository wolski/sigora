#' @details
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
#' For more details see the package vignette.
#'
#' @name sigora-package
#' @aliases sigora-package
#' @docType package
#' @author Amir B.K. Foroushani, Fiona S.L. Brinkman, David J. Lynn
#'
#' Maintainer: Witold Wolski <wew@fgcz.ethz.ch>
#' @seealso \code{\link{sigora}}, \code{\link{makeGPS}}, \code{\link{ora}}
#' @references Foroushani AB, Brinkman FS and Lynn DJ
#' (2013).\dQuote{Pathway-GPS and SIGORA: identifying relevant pathways based
#' on the over-representation of their gene-pair signatures.}\emph{PeerJ},
#' \bold{1}
#' @keywords internal
"_PACKAGE"
