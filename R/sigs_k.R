sigs_k <-
function(samplename,archive,markers,level=1,kidding=0){

 paramsigs<-vector(mode='numeric',length=10)
paramsigs[10]<-kidding
paramsigs[9]<-level
paramsigs[3]<- as.numeric(as.logical(as.numeric(markers)))
if(toupper(archive)=='KEGG' | toupper(archive)=='KEG'  |toupper(archive)=='K'){
paramsigs[2]=1
} else if(toupper(archive)=='BIOCARTA' | toupper(archive)=='B'){
paramsigs[5]=1
} else if(toupper(archive)=='NCI' | toupper(archive)=='N'){
paramsigs[6]=1
} else if(toupper(archive)=='INOH' | toupper(archive)=='I'){
paramsigs[7]=1
}else if(toupper(archive)=='REACTOME' | toupper(archive)=='R'){
paramsigs[8]=1
paramsigs[9]<-level
if(level<2){print("using reactome level 1 only, rerun with level parameter 2-4 if this was not intentional")}
} else{
print("Using 'KEGG' since the provided archive name was not recognized. If this is not intended,please rerun with an appropriate archive name, possible values are 'A'(ALL), 'K' (KEGG),'B' (PID_BIOCARTA),'N' (PID_NCI), 'I' (INOH),'R' (REACTOME)")
paramsigs[2]=1
}
paramsigs<-paramsigs[2:10]
 runthis<-paste(paste(paste("main10_h(",(substitute(samplename))), paste(paramsigs,collapse=','),sep=','),')')
#print(runthis)
#parse(runthis)
clockit(parse(text=runthis))
if(kidding >0){
print("Take a look at summary_results, then run det_out(filename) and related_genes()")}
}

