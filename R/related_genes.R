related_genes <-
function(){
summary_results<-get("summary_results",envir=.GlobalEnv)
detail_output<-get("detail_output",envir=.GlobalEnv)
for (i in (summary_results[,3]+1000000)) print (c(i,(union(subset(detail_output[,1],detail_output[,5]==i),subset(detail_output[,2],detail_output[,5]==i)))))
}

