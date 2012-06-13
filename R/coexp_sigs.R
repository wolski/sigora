coexp_sigs <-
function(samplen){
#print("following gene pairs in the sample are known to be highly coexpressed:")
samp_coexps<-subset(coexp_idb,coexp_idb[,1]%in%samplen&coexp_idb[,2]%in%samplen)

y<-length(subset(coexp_idb,coexp_idb[,1]%in%samplen&coexp_idb[,2]%in%samplen)[,1])
print(paste("The sample contains ",y," pairs from COXPRESSDB's list of highly coexpressed gene pairs",sep='')) 
print("following signatures might be due to coexpression:")

detail_output<-get("detail_output",envir=.GlobalEnv)
detailed_results<-get("detailed_results",envir=.GlobalEnv)
print(detail_output[setdiff(union((match(((coexp_idb[,2]*1000000)+coexp_idb[,1]),((detailed_results[,1]*1000000)+detailed_results[,2]),nomatch=-1)),
           (match(((coexp_idb[,2]*1000000)+coexp_idb[,1]),((detailed_results[,2]*1000000)+detailed_results[,1]),nomatch =-1 ))),-1),])
}

