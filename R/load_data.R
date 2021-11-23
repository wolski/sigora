#' load data when lazyLoad true.
#' @param datastr name of datasets
#' @param package default sigora
#' @export
load_data <- function(datastr, package = "sigora") {
  utils::data(list = datastr, package = package)
  return(eval(parse(text = datastr)))
}
