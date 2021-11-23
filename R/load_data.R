load_data <- function(datastr, package="sigora"){
  data(list = datastr, package = package)
  return(eval(parse(text = datastr)))
}
