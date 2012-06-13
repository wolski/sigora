sigs <-
function(samplename,archive,markers,level=1){

 paramsigs<-vector(mode='numeric',length=9)
paramsigs[9]<-level
paramsigs[3]<- as.numeric(as.logical(as.numeric(markers)))
if(toupper(archive)=='KEGG' | toupper(archive)=='KEG'  |toupper(archive)=='K'){
paramsigs[2]=1
angsct=5660
} else if(toupper(archive)=='BIOCARTA' | toupper(archive)=='B'){
paramsigs[5]=1
angsct=1368
} else if(toupper(archive)=='NCI' | toupper(archive)=='N'){
paramsigs[6]=1
angsct=2374
} else if(toupper(archive)=='INOH' | toupper(archive)=='I'){
paramsigs[7]=1
angsct=1433
}else if(toupper(archive)=='REACTOME' | toupper(archive)=='R'){
paramsigs[8]=1
angsct=5046

paramsigs[9]<-level
if(level<2){print("using reactome level 1 only, rerun with level parameter 2-4 if this was not intentional")}
} else{
print("Using KEGG since the provided repository name was not recognized.
 If this is not intended,please rerun with an appropriate repository name,
 possible values are: 'K' (KEGG),'B' (PID_BIOCARTA),'N' (PID_NCI), 'I' (INOH),'R' (REACTOME)")
paramsigs[2]=1
angsct=5660
}
paramsigs<-paramsigs[2:9]
 runthis<-paste(paste(paste("main10_h(",(substitute(samplename))), paste(paramsigs,collapse=','),sep=','),')')
#print(runthis)
#parse(runthis)
myhjtime<-clockit(parse(text=runthis))
  conf<-function(sampln,cnt){
  summary_results<-get("summary_results",envir=.GlobalEnv)
  subset(summary_results, summary_results[,6]*phyper(1,2,cnt,length(sampln),lower.tail = FALSE,log.p = FALSE)/phyper(1,3,summary_results[,8]+summary_results[,9],summary_results[,10],lower.tail = FALSE,log.p = FALSE)<1*0.05)}
  
  conf3<- function(sampln,cnt){
  summary_results<-get("summary_results",envir=.GlobalEnv)
  1/(phyper(1,2,cnt,length(sampln),lower.tail = FALSE,log.p = FALSE)/phyper(1,3,summary_results[1,8]+summary_results[1,9],summary_results[1,10],lower.tail = FALSE,log.p = FALSE))}
sig_threshhold<-conf3(samplename,angsct)* 0.05
print('##################### Highlighted Pathways: ##################',quote=FALSE)
print(conf(samplename,angsct)[,4], max.levels=0)
print('##############################################################',quote=FALSE)
print("You might also want to take a look at summary_results to see all pathways for which a GPS was found, then run det_out(filename) and related_genes()",quote=FALSE)

print ("******** Please note that the recommended cut-off threshold for significance in this case is: ",quote=FALSE)
print( sig_threshhold,digits=3)
print('##############################################################',quote=FALSE)
print(myhjtime)
}

