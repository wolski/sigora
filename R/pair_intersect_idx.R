pair_intersect_idx <-
function(y,x){union((match(((y[,2]*1000000)+y[,1]),((x[,1]*1000000)+x[,2]))),
           (match(((y[,2]*1000000)+y[,1]),((x[,2]*1000000)+x[,1]))))}

