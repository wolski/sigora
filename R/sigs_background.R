sigs_background <-
function(samplename, archive, markers, level = 1,bg_genes){
bg=parse(text=substitute (bg_genes))
samplename=parse(text=substitute (samplename))
assign('smpnm1',eval(samplename),.GlobalEnv)
archive=eval(archive) 
markers=eval(markers)
level=eval( level)
assign('bg1',eval(bg),.GlobalEnv)
print('Adjusting the background ...')
bg1<-get("bg1",envir=.GlobalEnv)
sigs_k(bg1, archive, markers,level,kidding=1)
detailed_results<-get("detailed_results",envir=.GlobalEnv)
if(toupper(archive)=='KEGG' | toupper(archive)=='KEG'  |toupper(archive)=='K'){
assign('simp1_keg',detailed_results[,1],.GlobalEnv)
assign('simp2_keg',detailed_results[,2],.GlobalEnv)
assign('simpname2_keg',detailed_results[,3],.GlobalEnv)
assign('simp_prun_edge_weights_keg',detailed_results[,4],.GlobalEnv)
atch<-'_keg'
} else if(toupper(archive)=='BIOCARTA' | toupper(archive)=='B'){
assign('simp1_pid',detailed_results[,1],.GlobalEnv)
assign('simp2_pid',detailed_results[,2],.GlobalEnv)
assign('simpname2_pid',detailed_results[,3],.GlobalEnv)
assign('simp_prun_edge_weights_pid',detailed_results[,4],.GlobalEnv)
atch<-'_pid'
} else if(toupper(archive)=='NCI' | toupper(archive)=='N'){
assign('simp1_nci',detailed_results[,1],.GlobalEnv)
assign('simp2_nci',detailed_results[,2],.GlobalEnv)
assign('simpname2_nci',detailed_results[,3],.GlobalEnv)
assign('simp_prun_edge_weights_nci',detailed_results[,4],.GlobalEnv)
atch<-'_nci'
} else if(toupper(archive)=='INOH' | toupper(archive)=='I'){
assign('simp1_inoh',detailed_results[,1],.GlobalEnv)
assign('simp2_inoh',detailed_results[,2],.GlobalEnv)
assign('simpname2_inoh',detailed_results[,3],.GlobalEnv)
assign('simp_prun_edge_weights_inoh',detailed_results[,4],.GlobalEnv)
atch<-'_inoh'
}else if(toupper(archive)=='REACTOME' | toupper(archive)=='R'){
assign('simp1_reactome',detailed_results[,1],.GlobalEnv)
assign('simp2_reactome',detailed_results[,2],.GlobalEnv)
assign('simpname2_reactome',detailed_results[,3],.GlobalEnv)
assign('simp_prun_edge_weights_reactome',detailed_results[,4],.GlobalEnv)
atch<-'_reactome'
}
# rm(summary_results,envir =.GlobalEnv)
smpnm1<-get("smpnm1",envir=.GlobalEnv)
sigs(smpnm1, archive, 0, 1)
simp1_name<-paste('simp1',atch,sep='')
simp2_name<-paste('simp2',atch,sep='')
simpname2_name<-paste('simpname2',atch,sep='')
simp_prun_edge_weights_name<-paste('simp_prun_edge_weights',atch,sep='')
rem_list<-c(simp1_name,simp2_name,simpname2_name,simp_prun_edge_weights_name)
 rm(list=eval(rem_list), envir = .GlobalEnv)
rm(bg1,smpnm1,envir =.GlobalEnv)
}
