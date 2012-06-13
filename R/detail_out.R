detail_out <-
function(filenme){
detailed_results<-get("detailed_results",envir=.GlobalEnv)
a<-detailed_results[,1]
b<-detailed_results[,2]
 c<-gene_names_comb[,2][match(a,gene_names_comb[,1])]
 d<-gene_names_comb[,2][match(b,gene_names_comb[,1])]
 detail_output<-(cbind(c,d,detailed_results))
write.table(detail_output,file=filenme,F,F,sep='\t')
}

