 entrez_converter<-function (x)
{
    subset(entrez_idb_conv, entrez_idb_conv[,2]  %in% x)[, 1]}
