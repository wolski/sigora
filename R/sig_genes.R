sig_genes <-
function(i){
detail_output<-get("detail_output",envir=.GlobalEnv)
c(union(subset(detail_output[,1],detail_output[,5]==i),subset(detail_output[,2],detail_output[,5]==i)))}

