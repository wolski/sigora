getURL<-function(yy,i){
url<-''
repo<-ifelse(substr(x=yy$summary_results[i,1],start=1,2)=='R-','rea','keg')

if(repo=='rea'){
cat(paste("assuming this is a result from Reactome ...","\n"))
url<-paste("https://reactome.org/ContentService/exporter/diagram//",
yy$summary_results[i,1],".png?flg=",paste(getGenes(yy,i)[,4],sep='',
collapse=','),sep='')}

if(repo=='keg'){
cat(paste("assuming this is a result from KEGG ...","\n"))
url<-paste("https://www.genome.jp/kegg-bin/show_pathway?",
tolower(yy$summary_results[i,1]),
"+",paste(getGenes(yy,i)[,4],sep='',collapse='+'),sep='')}
url
}
