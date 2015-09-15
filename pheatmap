library(pheatmap)
data<-read.table("~/file.txt",sep="\t")
data2<-as.matrix(data[,2:13]) ## depends upon the column to be selected
data3<-data2[-1,]
samples<-data2[1,]
genes<-data[2:length(data2[,1]),1]
vett<-as.numeric(data3)
data4<-matrix(vett,length(genes),length(samples), dimnames=list(paste(genes),paste(samples)))
head(data4)

col1 = colorRampPalette(c("blue", 'lightblue'))(15)
col2 <- rep("yellow", 2)
col3 = colorRampPalette(c("orange", "red"))(15)
colors2 <- c(col1, col2, col3)

pheatmap(log2(as.matrix(data4)),col= colors2, scale="row", key=T, keysize=1.5,density.info="none", trace="none",cexCol=0.6, fontsize_row = 3,clustering_distance_cols="correlation",fontsize_col = 5,cluster_cols=T)
