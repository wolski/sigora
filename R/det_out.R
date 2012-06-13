det_out <-
function (filename) 
{
detailed_results<-get("detailed_results",envir=.GlobalEnv)
    a <- detailed_results[, 1]
    b <- detailed_results[, 2]
    c <- gene_names_comb[, 2][match(a, gene_names_comb[, 1])]
    d <- gene_names_comb[, 2][match(b, gene_names_comb[, 1])]
    assign("detail_output", (cbind(as.character(c),as.character( d), detailed_results)), 
        envir = .GlobalEnv)
detail_output<-get("detail_output",envir=.GlobalEnv)
    write.table(detail_output, file = filename, F, F, sep = "\t")
}

