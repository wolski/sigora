#' Sigora's main function.
#'
#' This function determines which Signatures (GPS) from a collection of GPS
#' data (\code{GPSrepo} argument) for the specified pathway repository are
#' present in the specified list of genes of interest (\code{queryList}
#' argument)). It then uses the distribution function of hypergeometric
#' probabilities to identify the pathways whose GPS are over-represented among
#' the present GPS and saves the results to the file specified in the
#' \code{saveFile} argument.
#'
#' @export
#'
#' @param GPSrepo An object created by \code{makeGPS} or one of the precompiled
#' GPS data collections that are provided with this package (currently for KEGG
#' and Reactome). e.g. \code{reaH} for human Reactome GPS, \code{kegH} for
#' human KEGG GPS, and \code{reaM} and \code{kegM} for corresponding mouse GPS.
#' See the examples section for creating and using your own GPS.
#' @param level In hierarchical repositories (e.g. Reactome) number of levels
#' to consider. Recommended value for KEGG: 2, for Reactome: 4.
#' @param markers Whether to take single genes that are uniquely associated
#' with only one pathway into account (i.e. should pathway unique genes/PUGs be
#' considered GPS?). Recommended value: TRUE (1).
#' @param queryList A user specified list of genes of interest ('query list'),
#' as a vector of ENSEMBL/ ENTREZ IDs or gene symbols (HGNC/MGI).
#' @param saveFile If provided, the results are saved here as a tab delimited
#' File (including , for each pathway, a list of genes ordered by their
#' contribution to the statistical significance of the pathway).
#' @param weighting.method The weighting method or GPS. The default weighting
#' scheme for the GPS is the reciproc of the harmonic mean of the degrees of
#' the two component genes of a GPS. A wide range of alternative weighting
#' schemes are pre-implemented (see below). Additional user defined weighting
#' schemes are also supported. Currently, the following alternatives are
#' pre-implemented:\cr
#' 'noweights','cosine','topov','reciprod','jac','justPUGs'and'invhm'.\cr
#' Additional user defined weighting schemes are also supported (see section
#' examples).\cr 'noweights': assigns a constant of 1 to all GPS.\cr 'cosine':
#' all GPS are weighted by the cosine of the degrees of their consituent
#' genes.\cr 'topov': all GPS are weighted by topological overlap of their
#' consituent genes.\cr 'reciprod': all GPS are weighted by reciproc of product
#' of the number of pathway annotations of their consituent genes.\cr 'jac':all
#' GPS are weighted by the jaccard similarity of the pathway annotations
#' consituent genes.\cr 'justPUGs': Analysis is performed using PUGs only.\cr
#' 'invhm': all GPS are weighted by the reciproc of the harmonic mean of the
#' degrees of their consituent genes (default).\cr
#' @param idmap A dataframe for converting between different gene-identifier
#' types (e.g. ENSEMBL, ENTREZ and HGNC-Symbols of genes). Most users do not
#' need to set this argument, as there is a built-in conversion table.
#' @return \item{ summary_results}{A dataframe listing the analysis results.}
#' \item{detailed_results }{A dataframe describing the detailed evidence
#' (present Gene-Pair Signatures) for each pathway.}
#' @seealso \code{\link{sigora-package}} , \code{\link{makeGPS}}
#' @references Foroushani AB, Brinkman FS and Lynn DJ
#' (2013).\dQuote{Pathway-GPS and SIGORA: identifying relevant pathways based
#' on the over-representation of their gene-pair signatures.}\emph{PeerJ},
#' \bold{1}
#' @keywords functions
#' @examples
#'
#' \dontrun{
#' ##query list
#' ils<-grep("^IL",idmap[["Symbol"]],value=TRUE)
#' ## using precompiled GPS repositories:
#' sigRes.ilreact<-sigora(queryList=ils,GPSrepo=reaH,level=4)
#' sigRes.ilkeg<-sigora(queryList=ils,GPSrepo=kegH,level=2)
#' ## user created GPS repository:
#' nciH<-makeGPS(pathwayTable=nciTable)
#' sigRes.ilnci<-sigora(queryList=ils,GPSrepo=nciH,level=2)
#' ## user defined weighting schemes :
#' myfunc<-function(a,b){1/log(a+b)}
#' sigora(queryList=ils,GPSrepo=nciH,level=2, weighting.method ="myfunc")
#' }
#'
sigora <-
  function(GPSrepo,
           level,
           markers = FALSE,
           queryList = NULL,
           saveFile = NULL,
           weighting.method = "invhm",
           idmap = load_data('idmap')) {
    ##` GPSrepo:Output of makeGPS
    ##` queryList: query list
    ##`
    #get(data(idmap,envir=as.environment(parent.frame())))
    invhm <- function(a, b) {
      0.5 * ((1 / a) + (1 / b))
    }
    reciprod <- function(a, b) {
      1 / (a * b)
    }
    jac <- function(a, b) {
      1 / (a + b - 1)
    }
    topov <- function(a, b) {
      1 / (apply(as.matrix(cbind(a, b)), FUN = min, MARGIN = 1))
    }
    cosine <- function(a, b) {
      1 / (sqrt(a * b))
    }
    noweights <- function(a, b) {
      rep(1, length(a))
    }
    justPUGs <- function(a, b) {
      rep(0, length(a))
    }
    hh <- NULL
    jj <- grep("^L", names(GPSrepo), value = TRUE)
    weights <- 0
    ## mapping
    if (length(intersect(queryList, GPSrepo$origRepo[[2]])) == 0) {
      t1 <-
        which.max(sapply(idmap, function(x)
          length(intersect(
            x, GPSrepo$origRepo[[2]]
          ))))
      t2 <-
        which.max(sapply(idmap, function(x)
          length(intersect(x, queryList))))
      queryList <- idmap[which(idmap[, t2] %in% queryList), t1]
      print(paste(
        "Mapped identifiers from" ,
        colnames(idmap)[t2],
        " to ",
        colnames(idmap)[t1],
        "..."
      ))
    }
    for (ind in 1:level) {
      v1 <- GPSrepo[[paste("L", ind, sep = '')]]
      #v1<-GPSrepo[[eval(jj[ind])]]
      com1 <-
        paste(
          "weights<-",
          weighting.method,
          "(v1$degs[v1$gs[v1$GPS[,1]]],
v1$degs[v1$gs[v1$GPS[,2]]])"
        )
      eval(parse(text = com1))
      hh <- rbind(hh, cbind(v1$gs[v1$GPS[, 1]],
                            v1$gs[v1$GPS[, 2]],
                            v1$ps[v1$GPS[, 3]],
                            round(weights * 100) / 100))
      rm(v1)
    }
    colnames(hh) <- c("gene1", "gene2", "pathway", "weight")
    if (markers == TRUE) {
      for (ind in 1:level) {
        #v1<-GPSrepo[[eval(jj[ind])]]
        v1 <- GPSrepo[[paste("L", ind, sep = '')]]
        hh <- rbind(hh, cbind(v1$gs[v1$PU[, 1]],
                              v1$gs[v1$PUG[, 1]],
                              v1$ps[v1$PUG[, 2]],
                              1))
        rm(v1)
      }
    }
    if (is.null(queryList)) {
      ##TODO
    }
    hhd <-
      (hh[hh[, 1] %in% queryList & hh[, 2] %in% queryList, , drop = FALSE])
    k1 <-
      (aggregate(as.numeric(hhd[, 4]), by = list(hhd[, 3]), FUN = sum))
    kN <- (aggregate(as.numeric(hh[, 4]), by = list(hh[, 3]), FUN =
                       sum))
    sum(kN[, 2])
    sum(k1[, 2])
    ps <- phyper(k1[, 2] - 1, kN[match(k1[, 1], kN[, 1]), 2],
                 sum(kN[, 2]) - kN[match(k1[, 1], kN[, 1]), 2], sum(k1[, 2]), lower.tail =
                   F)
    ps <- signif(ps, digits = 4)
    Bonfer <-
      signif(p.adjust(ps, n = length(unique(hh[, 3])), method = 'bonfer'), digits = 4)
    sp1 <- GPSrepo$pathwaydescriptions
    summary_results <-
      data.frame(k1[, 1], sp1[match(k1[, 1], sp1[, 1]), 2], ps, Bonfer, k1[, 2],
                 kN[match(k1[, 1], kN[, 1]), 2], sum(kN[, 2]), sum(k1[, 2]))
    detailed_results <- hhd
    rownames(detailed_results) <- NULL
    colnames(summary_results) <-
      c(
        "pathwy.id",
        "description",
        "pvalues",
        "Bonferroni",
        "successes",
        "PathwaySize",
        "N",
        "sample.size"
      )
    summary_results <-
      summary_results[with(summary_results, order(pvalues)), ]
    rownames(summary_results) <- c(1:nrow(summary_results))
    print(summary_results[which(summary_results$Bonfer < 0.01), ])
    res <- list()
    res[["summary_results"]] <- summary_results
    res[["detailed_results"]] <- detailed_results
    if (!is.null(saveFile)) {
      Genes <- vector(mode = 'character', length = nrow(summary_results))
      for (i in 1:nrow(summary_results)) {
        v11 <- getGenes(res, i)
        if ("Symbol" %in% colnames(v11)) {
          Genes[i] <- paste(v11$Symbol, sep = "" , collapse = ";")
        } else{
          Genes[i] <- paste(v11[, 1], sep = "", collapse = ";")
        }
      }
      write.table(
        cbind(summary_results, Genes),
        file = saveFile,
        quote = F,
        row.names = F,
        sep = '\t'
      )
    }
    invisible(res)
    ##take a look at weget.cmbi.umcn.nl
  }
