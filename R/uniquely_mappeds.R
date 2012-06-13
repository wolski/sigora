uniquely_mappeds<-function(x){ y <- subset(cbind(t(t(table(x[, 2]))), rownames(t(t(table(x[,
        2]))))), t(t(table(x[, 2]))) == 1)
    subset(x,x[,2] %in% y[, 2])
}