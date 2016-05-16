
library(reshape2)
library(ggplot2)
DF <- read.table("~/path/ChIPSeq/data/new_run_reads.txt",sep='\t',header=T)
DF1 <- melt(DF, id.var="sample")
ggplot(DF1, aes(x = sample, y = value, fill = variable)) + 
+   geom_bar(stat = "identity")
