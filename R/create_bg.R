create_bg <-
function(filename){

ens_converter(sigora:::uniquely_mappeds(unique(read.table(filename,sep=',')))[,1])}
