get_genes <-
function(line_nr,thresh){
summary_results<-get("summary_results",envir=.GlobalEnv)
detailed_results<-get("detailed_results",envir=.GlobalEnv)
idb_converter(union((subset(detailed_results,detailed_results[,3]==as.numeric(rownames(summary_results[line_nr,]))
 & detailed_results[,4]>thresh-0.01))[,1],(subset(detailed_results,detailed_results[,3]==as.numeric(rownames(summary_results[line_nr,])) 
 & detailed_results[,4]>thresh-0.01))[,2]))}

