#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

file = args[1]
out = args[2]

dat <- read.table(file, skip = 1, sep = "\t")
names(dat) <- c("pos", "count", "fwd", "rev")


pdf(out)
plot(dat$pos, dat$count, xlab = "Kmer start position", ylab= "Kmer count", col = "blue", type = "l")
dev.off()
