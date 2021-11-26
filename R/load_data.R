#' load and return data when lazyLoad false insted of using data(datastr)
#' @param datastr name of datasets
#' @param package default sigora
#' @return returns the data
#' @export
#' @examples
#' idmap <- load_data("idmap")
#'
load_data <- function(datastr, package = "sigora") {
  utils::data(list = datastr, package = package)
  return(eval(parse(text = datastr)))
}
