get_marker_genes <-
function(is_human=TRUE, archive='keg'){ 
mjk<-paste('markers_marked',archive,sep='_')
if(is_human==TRUE) {mak<-'hmn_anntted_genes' } else {
mak<-'mouse_anntted_genes'}
print(mjk)
print(mak)
intersect(get(mak),get(mjk)[,1]) }

