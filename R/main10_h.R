main10_h <-
function(samp,keg,unique_gene,penalize,pid,nci,inoh,reactome,level=1, just_kidding=0 ){
ishuman=FALSE;
ismouse=FALSE;
if(length(intersect(samp,hmn_anntted_genes))>0 & length(intersect(samp,mouse_anntted_genes))==0){print("Looks like human data ....")
ishuman=TRUE;
}else if(length(intersect(samp,hmn_anntted_genes))==0 & length(intersect(samp,mouse_anntted_genes))>0){ print("Looks like mouse data ....")
ismouse=TRUE;
}

if(penalize==TRUE){
# penalties<-cbind(nr_of_pwy_particpants[,1],(1/log(nr_of_pwy_particpants[,2]+1))))}
penalties<-cbind(nr_of_pwy_particpants[,1],(1/log10(nr_of_pwy_particpants[,2]+1)))
 penalties<-as.matrix(penalties)
penalties[,2]<-penalties[,2]/max(penalties[,2])
assign("penalties",penalties,envir = .GlobalEnv)
}
apndx<-function(a,b){
append(a,b,length(a))
}
dpndx<-function(a,b){
a[1:(length(a)-length(b))]
}

if(reactome==TRUE){
if(level >1){
simp1_reactome<- apndx(simp1_reactome,simp1_level02_reactome)
simp2_reactome<- apndx(simp2_reactome,simp2_level02_reactome)
simpname2_reactome<-apndx(simpname2_reactome,simpname2_level02_reactome)
simp_prun_edge_weights_reactome<- apndx(simp_prun_edge_weights_reactome,simp_prun_edge_weights_level02_reactome)
}
if(level >2){
simp1_reactome<- apndx(simp1_reactome,simp1_level03_reactome)
simp2_reactome<- apndx(simp2_reactome,simp2_level03_reactome)
simpname2_reactome<-apndx(simpname2_reactome,simpname2_level03_reactome)
simp_prun_edge_weights_reactome<- apndx(simp_prun_edge_weights_reactome,simp_prun_edge_weights_level03_reactome)
}
if(level >3){
simp1_reactome<- apndx(simp1_reactome,simp1_level04_reactome)
simp2_reactome<- apndx(simp2_reactome,simp2_level04_reactome)
simpname2_reactome<-apndx(simpname2_reactome,simpname2_level04_reactome)
simp_prun_edge_weights_reactome<- apndx(simp_prun_edge_weights_reactome,simp_prun_edge_weights_level04_reactome)
}
if(level >4){
simp1_reactome<- apndx(simp1_reactome,simp1_level05_reactome)
simp2_reactome<- apndx(simp2_reactome,simp2_level05_reactome)
simpname2_reactome<-apndx(simpname2_reactome,simpname2_level05_reactome)
simp_prun_edge_weights_reactome<- apndx(simp_prun_edge_weights_reactome,simp_prun_edge_weights_level05_reactome)
}
}
if(keg==TRUE){
if(level >1){
simp1_keg<- apndx(simp1_keg,simp1_level02_keg)
simp2_keg<- apndx(simp2_keg,simp2_level02_keg)
simpname2_keg<-apndx(simpname2_keg,simpname2_level02_keg)
simp_prun_edge_weights_keg<- apndx(simp_prun_edge_weights_keg,simp_prun_edge_weights_level02_keg)
}
}

if(nci==TRUE){
if(level >1){
simp1_nci<- apndx(simp1_nci,simp1_level02_nci)
simp2_nci<- apndx(simp2_nci,simp2_level02_nci)
simpname2_nci<-apndx(simpname2_nci,simpname2_level02_nci)
simp_prun_edge_weights_nci<- apndx(simp_prun_edge_weights_nci,simp_prun_edge_weights_level02_nci)
}
}

if(inoh==TRUE){
if(level >1){
simp1_inoh<- apndx(simp1_inoh,simp1_level02_inoh)
simp2_inoh<- apndx(simp2_inoh,simp2_level02_inoh)
simpname2_inoh<-apndx(simpname2_inoh,simpname2_level02_inoh)
simp_prun_edge_weights_inoh<- apndx(simp_prun_edge_weights_inoh,simp_prun_edge_weights_level02_inoh)
}
if(level >2){
simp1_inoh<- apndx(simp1_inoh,simp1_level03_inoh)
simp2_inoh<- apndx(simp2_inoh,simp2_level03_inoh)
simpname2_inoh<-apndx(simpname2_inoh,simpname2_level03_inoh)
simp_prun_edge_weights_inoh<- apndx(simp_prun_edge_weights_inoh,simp_prun_edge_weights_level03_inoh)
}
if(level >3){
simp1_inoh<- apndx(simp1_inoh,simp1_level04_inoh)
simp2_inoh<- apndx(simp2_inoh,simp2_level04_inoh)
simpname2_inoh<-apndx(simpname2_inoh,simpname2_level04_inoh)
simp_prun_edge_weights_inoh<- apndx(simp_prun_edge_weights_inoh,simp_prun_edge_weights_level04_inoh)
}
if(level >4){
simp1_inoh<- apndx(simp1_inoh,simp1_level05_inoh)
simp2_inoh<- apndx(simp2_inoh,simp2_level05_inoh)
simpname2_inoh<-apndx(simpname2_inoh,simpname2_level05_inoh)
simp_prun_edge_weights_inoh<- apndx(simp_prun_edge_weights_inoh,simp_prun_edge_weights_level05_inoh)
}
}

if(unique_gene==TRUE){
#pushup_deg1/2/simpnames1/2
#if(keg==TRUE){
#simp1_keg<-apndx(simp1_keg,markers_marked_keg[,1])
#simp2_keg<-apndx(simp2_keg,markers_marked_keg[,1])
#simpname2_keg<-apndx(simpname2_keg,markers_marked_keg[,2])
#simp_prun_edge_weights_keg<-apndx(simp_prun_edge_weights_keg,rep.int(1,length(markers_marked_keg[,1])))
if(keg==TRUE){
simp1_keg<-apndx(simp1_keg,markers_marked_keg[,1])
simp2_keg<-apndx(simp2_keg,markers_marked_keg[,1])
simpname2_keg<-apndx(simpname2_keg,markers_marked_keg[,2])
simp_prun_edge_weights_keg<-apndx(simp_prun_edge_weights_keg,rep.int(1,length(markers_marked_keg[,1])))

if(level>1){
#print(paste('using ',level,' of hierarchy.')
simp1_keg<-apndx(simp1_keg,markers_marked_level02_keg[,1])
simp2_keg<-apndx(simp2_keg,markers_marked_level02_keg[,1])
simpname2_keg<-apndx(simpname2_keg,markers_marked_level02_keg[,2])
simp_prun_edge_weights_keg<-apndx(simp_prun_edge_weights_keg,rep.int(1,length(markers_marked_level02_keg[,1])))
}
}else if(pid==TRUE){
simp1_pid<-apndx(simp1_pid,markers_marked_pid[,1])
simp2_pid<-apndx(simp2_pid,markers_marked_pid[,1])
simpname2_pid<-apndx(simpname2_pid,markers_marked_pid[,2])
simp_prun_edge_weights_pid<-apndx(simp_prun_edge_weights_pid,rep.int(1,length(markers_marked_pid[,1])))

}else if(nci==TRUE){
simp1_nci<-apndx(simp1_nci,markers_marked_nci[,1])
simp2_nci<-apndx(simp2_nci,markers_marked_nci[,1])
simpname2_nci<-apndx(simpname2_nci,markers_marked_nci[,2])
simp_prun_edge_weights_nci<-apndx(simp_prun_edge_weights_nci,rep.int(1,length(markers_marked_nci[,1])))
if(level>1){
#print(level)
simp1_nci<-apndx(simp1_nci,markers_marked_level02_nci[,1])
simp2_nci<-apndx(simp2_nci,markers_marked_level02_nci[,1])
simpname2_nci<-apndx(simpname2_nci,markers_marked_level02_nci[,2])
simp_prun_edge_weights_nci<-apndx(simp_prun_edge_weights_nci,rep.int(1,length(markers_marked_level02_nci[,1])))}

}else if(inoh==TRUE){
simp1_inoh<-apndx(simp1_inoh,markers_marked_inoh[,1])
simp2_inoh<-apndx(simp2_inoh,markers_marked_inoh[,1])
simpname2_inoh<-apndx(simpname2_inoh,markers_marked_inoh[,2])
simp_prun_edge_weights_inoh<-apndx(simp_prun_edge_weights_inoh,rep.int(1,length(markers_marked_inoh[,1])))
if(level>1){
#print(level)
simp1_inoh<-apndx(simp1_inoh,markers_marked_level02_inoh[,1])
simp2_inoh<-apndx(simp2_inoh,markers_marked_level02_inoh[,1])
simpname2_inoh<-apndx(simpname2_inoh,markers_marked_level02_inoh[,2])
simp_prun_edge_weights_inoh<-apndx(simp_prun_edge_weights_inoh,rep.int(1,length(markers_marked_level02_inoh[,1])))
}

if(level>2){
#print(level)
simp1_inoh<-apndx(simp1_inoh,markers_marked_level03_inoh[,1])
simp2_inoh<-apndx(simp2_inoh,markers_marked_level03_inoh[,1])
simpname2_inoh<-apndx(simpname2_inoh,markers_marked_level03_inoh[,2])
simp_prun_edge_weights_inoh<-apndx(simp_prun_edge_weights_inoh,rep.int(1,length(markers_marked_level03_inoh[,1])))
}

if(level>3){
#print(level)
simp1_inoh<-apndx(simp1_inoh,markers_marked_level04_inoh[,1])
simp2_inoh<-apndx(simp2_inoh,markers_marked_level04_inoh[,1])
simpname2_inoh<-apndx(simpname2_inoh,markers_marked_level04_inoh[,2])
simp_prun_edge_weights_inoh<-apndx(simp_prun_edge_weights_inoh,rep.int(1,length(markers_marked_level04_inoh[,1])))
}
if(level>4){
#print(level)
simp1_inoh<-apndx(simp1_inoh,markers_marked_level05_inoh[,1])
simp2_inoh<-apndx(simp2_inoh,markers_marked_level05_inoh[,1])
simpname2_inoh<-apndx(simpname2_inoh,markers_marked_level05_inoh[,2])
simp_prun_edge_weights_inoh<-apndx(simp_prun_edge_weights_inoh,rep.int(1,length(markers_marked_level05_inoh[,1])))
}
}else if(reactome==TRUE){
simp1_reactome<-apndx(simp1_reactome,markers_marked_reactome[,1])
simp2_reactome<-apndx(simp2_reactome,markers_marked_reactome[,1])
simpname2_reactome<-apndx(simpname2_reactome,markers_marked_reactome[,2])
simp_prun_edge_weights_reactome<-apndx(simp_prun_edge_weights_reactome,rep.int(1,length(markers_marked_reactome[,1])))

if(level>1){
#print(level)
simp1_reactome<-apndx(simp1_reactome,markers_marked_level02_reactome[,1])
simp2_reactome<-apndx(simp2_reactome,markers_marked_level02_reactome[,1])
simpname2_reactome<-apndx(simpname2_reactome,markers_marked_level02_reactome[,2])
simp_prun_edge_weights_reactome<-apndx(simp_prun_edge_weights_reactome,rep.int(1,length(markers_marked_level02_reactome[,1])))
}

if(level>2){
#print(level)
simp1_reactome<-apndx(simp1_reactome,markers_marked_level03_reactome[,1])
simp2_reactome<-apndx(simp2_reactome,markers_marked_level03_reactome[,1])
simpname2_reactome<-apndx(simpname2_reactome,markers_marked_level03_reactome[,2])
simp_prun_edge_weights_reactome<-apndx(simp_prun_edge_weights_reactome,rep.int(1,length(markers_marked_level03_reactome[,1])))
}

if(level>3){
#print(level)
simp1_reactome<-apndx(simp1_reactome,markers_marked_level04_reactome[,1])
simp2_reactome<-apndx(simp2_reactome,markers_marked_level04_reactome[,1])
simpname2_reactome<-apndx(simpname2_reactome,markers_marked_level04_reactome[,2])
simp_prun_edge_weights_reactome<-apndx(simp_prun_edge_weights_reactome,rep.int(1,length(markers_marked_level04_reactome[,1])))
}
if(level>4){
#print(level)
simp1_reactome<-apndx(simp1_reactome,markers_marked_level05_reactome[,1])
simp2_reactome<-apndx(simp2_reactome,markers_marked_level05_reactome[,1])
simpname2_reactome<-apndx(simpname2_reactome,markers_marked_level05_reactome[,2])
simp_prun_edge_weights_reactome<-apndx(simp_prun_edge_weights_reactome,rep.int(1,length(markers_marked_level05_reactome[,1])))
}

}else {
#uniquege,no keg
markers_marked<-get("markers_marked",envir=.GlobalEnv)
simp1<-apndx(simp1,markers_marked[,1])
simp2<-apndx(simp2,markers_marked[,1])
simpname2<-apndx(simpname2,markers_marked[,2])
simp_prun_edge_weights<-apndx(simp_prun_edge_weights,rep.int(1,length(markers_marked[,1])))
}
} ## end unique-genes appendex

can_pwys<- function(d,e,f,g,w){
h<-cbind(k<-(match(d,f)+match(e,f)),d,e,g,w)
results<- subset(h,as.logical(h[,1]))[,2:5]
#determine pathways with lightning signatures
 #d,e<-simp1,simp2 gmarkers
 #f <- data from experiment pda
 #g <-simpnames2 xy_sig[,3]
#w<-pathway_weights
}

probt2<-function(jo){
padj_number<-get("padj_number",envir=.GlobalEnv)
jo<-as.numeric(jo)
hyp_m=round(tg[rownames(tg)== jo])
#hyp_x=round(tb[rownames(tb)== jo])[2]
if(penalize==TRUE){
hyp_x<- round((tb[!is.na(match(tb[,3],jo))][2])*penalties[!is.na(match (penalties[,1],(jo-1000000))),2])
#print ((tb[!is.na(match(rownames(tb),jo))][2]))
#print(penalties[match (penalties[,2], ,jo-1000000)][1])

} else {hyp_x=round(tb[!is.na(match(tb[,3],jo))][2])
}
hyp_n=hyp_mn-hyp_m
#print(c("m",hyp_m));print(c("k",hyp_k));print(c("x",hyp_x));
p_vals<-phyper(hyp_x, hyp_m, hyp_n, hyp_k,lower.tail = FALSE,log.p = FALSE)
 #colnames(out4)<-c("pwyid","pwyname","p_value","adj.p_value","#present_GPS","weight_of_present_GPS","rounded_weight","weight_of_associated_GPS","size_of_universe","sample_size")
##padj_number<- length(uniq(simpname2_))    
 tmkl<-cbind(p_vals,p.adjust(p_vals,n=padj_number),hyp_x, hyp_m, hyp_n,hyp_k)
# as.matrix(subset(tmkl,tmkl[,3]>0))
#assign("tmlk_unsorted",tmkl,envir = .GlobalEnv)
 as.matrix(tmkl)
}

if (keg==TRUE) {
res<-function(x){can_pwys(simp1_keg,simp2_keg,x,simpname2_keg,simp_prun_edge_weights_keg)}
}
else if (pid==TRUE) {
res<-function(x){can_pwys(simp1_pid,simp2_pid,x,simpname2_pid,simp_prun_edge_weights_pid)}
}else if (nci==TRUE) {
res<-function(x){can_pwys(simp1_nci,simp2_nci,x,simpname2_nci,simp_prun_edge_weights_nci)}
}else if (inoh==TRUE) {
res<-function(x){can_pwys(simp1_inoh,simp2_inoh,x,simpname2_inoh,simp_prun_edge_weights_inoh)}
}else if (reactome==TRUE) {
res<-function(x){can_pwys(simp1_reactome,simp2_reactome,x,simpname2_reactome,simp_prun_edge_weights_reactome)}
}else{
res<-function(x){can_pwys(simp1,simp2,x,simpname2,simp_prun_edge_weights)}
}
res2<-function(results){
ta<-table(factor(results[,3]))
ts<-tapply(results[,4],results[,3],sum)
if(sum(as.numeric(t(unlist(dimnames(ts))))-as.numeric(t(unlist(dimnames(ta)))))==0){
t<- cbind(ta,ts,as.numeric(t(unlist(dimnames(ts)))))}
}

results<-res(samp)
assign("detailed_results",results,envir = .GlobalEnv)
tb<-res2(results)
###################################
if(! just_kidding){
###########################
if(keg==TRUE) {
print('KEGG')
tg<-tapply(simp_prun_edge_weights_keg,simpname2_keg,sum)
if(ishuman){
assign("padj_number", length(unique(intersect(simpname2_keg,hman_pwys))),envir =.GlobalEnv)
hyp_mn_hmn<-round(sum(simp_prun_edge_weights_keg[!is.na(match(simpname2_keg,hman_pwys))]))}else if (ismouse){
assign("padj_number", length(unique(setdiff(simpname2_keg,hman_pwys))),envir =.GlobalEnv)
#print(padj_number)
hyp_mn_mouse<-round(sum(simp_prun_edge_weights_keg[is.na(match(simpname2_keg,hman_pwys))]))
}
}else if(pid==TRUE) {
print('Biocarta')
tg<-tapply(simp_prun_edge_weights_pid,simpname2_pid,sum)
if(ishuman){
assign("padj_number", length(unique(intersect(simpname2_pid,hman_pwys))),envir =.GlobalEnv)
hyp_mn_hmn<-round(sum(simp_prun_edge_weights_pid[!is.na(match(simpname2_pid,hman_pwys))]))}else if (ismouse){
assign("padj_number", length(unique(setdiff(simpname2_pid,hman_pwys))),envir =.GlobalEnv)
hyp_mn_mouse<-round(sum(simp_prun_edge_weights_pid[is.na(match(simpname2_pid,hman_pwys))]))
}

} else if(nci==TRUE) {
print('NCI')
tg<-tapply(simp_prun_edge_weights_nci,simpname2_nci,sum)
if(ishuman){
assign("padj_number", length(unique(intersect(simpname2_nci,hman_pwys))),envir =.GlobalEnv)
hyp_mn_hmn<-round(sum(simp_prun_edge_weights_nci[!is.na(match(simpname2_nci,hman_pwys))]))}else if (ismouse){
assign("padj_number", length(unique(setdiff(simpname2_nci,hman_pwys))),envir =.GlobalEnv)
hyp_mn_mouse<-round(sum(simp_prun_edge_weights_nci[is.na(match(simpname2_nci,hman_pwys))]))}

}else if(inoh==TRUE) {
print('INOH')
tg<-tapply(simp_prun_edge_weights_inoh,simpname2_inoh,sum)
if(ishuman){
assign("padj_number", length(unique(intersect(simpname2_inoh,hman_pwys))),envir =.GlobalEnv)
hyp_mn_hmn<-round(sum(simp_prun_edge_weights_inoh[!is.na(match(simpname2_inoh,hman_pwys))]))}else if (ismouse){
assign("padj_number", length(unique(setdiff(simpname2_inoh,hman_pwys))),envir =.GlobalEnv)
hyp_mn_mouse<-round(sum(simp_prun_edge_weights_inoh[is.na(match(simpname2_inoh,hman_pwys))]))}

}else if(reactome==TRUE) {
print('REACTOME')
tg<-tapply(simp_prun_edge_weights_reactome,simpname2_reactome,sum)
if(ishuman){
assign("padj_number", length(unique(intersect(simpname2_reactome,hman_pwys))),envir =.GlobalEnv)
hyp_mn_hmn<-round(sum(simp_prun_edge_weights_reactome[!is.na(match(simpname2_reactome,hman_pwys))]))}else if (ismouse){
assign("padj_number", length(unique(setdiff(simpname2_reactome,hman_pwys))),envir =.GlobalEnv)
hyp_mn_mouse<-round(sum(simp_prun_edge_weights_reactome[is.na(match(simpname2_reactome,hman_pwys))]))}

}else{
tg<-tapply(simp_prun_edge_weights,simpname2,sum)
if(ishuman){
hyp_mn_hmn<-round(sum(simp_prun_edge_weights[!is.na(match(simpname2,hman_pwys))]))}else if (ismouse){
hyp_mn_mouse<-round(sum(simp_prun_edge_weights[is.na(match(simpname2,hman_pwys))]))}
}
##########################################
}
###################################
out<-data.frame(tb[,1:2],pwy_lbls[(match(tb[,3]-1000000,pwy_lbls[,1])),])
################################################
if(! just_kidding){
################################################
# out[with(out, order(ta)), ]
 #out2<- out[with(out, order(ta)), ]

##if(length(intersect(samp,hmn_anntted_genes))>0 & length(intersect(samp,mouse_anntted_genes))==0){print("human")
##if( sum((row.names(out))%in%hman_pwys)==length(out[,1])){print("human... need to adjust hyp_mn")
if(ishuman){
hyp_mn<-hyp_mn_hmn
}else if(ismouse){
## if ( length(intersect(samp2,hmn_anntted_genes))==0 & length(intersect(samp2,mouse_anntted_genes))>0){print("mouse")
## if( sum(!(row.names(out))%in%hman_pwys)==length(out[,1])){print("mouse... need to adjust hyp_mn")
hyp_mn<-hyp_mn_mouse
}else{
hyp_mn=round(sum(tg))}

print(paste('Size of universe:',hyp_mn))
#hyp_mn=round(sum(tg))
hyp_k=round(sum(tb[,2]))

out3<-apply(t(t(rownames(out))),1,probt2)
 out4<-cbind(out,t(out3))
out4<-subset(out4,out4[,2]>0.49)
colnames(out4)<-c("count","weightsum","pwyid","pwyname","p_value","adj.p_value","round_sum","m","n","k")

#colnames(out4)<-c("pwyid","pwyname","p_value","adj.p_value","#present_GPS","weight_of_present_GPS","rounded_weight","weight_of_associated_GPS","size_of_universe","sample_size")
#assign("summary_unsorted",out4,envir = .GlobalEnv)
output<- out4[with(out4, order(p_value)), ]
 #write.table(outpt,file="sample_outpt_weighted2",col.names=T,row.names=F,quote=F,sep=';')
assign("summary_results",output,envir = .GlobalEnv)

} 
##########################################################
else{
#print('kidding')
assign("summary_results",out,envir = .GlobalEnv)
 }
##########################################################
}

