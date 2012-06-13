samp_mark_count <-
function(sampln,archive,human=TRUE){length(intersect(sampln,get_marker_genes(archive=archive,is_human=human)))}

