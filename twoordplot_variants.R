####making a two y axis plots for showing importance of genes having number of variants and associated pathogenicity scores
library(twoord.plot)
a=c(2,2,2,2,3,3,5,5) ##number of variants found in each genes
b=c(0.960,0.988,0.936,0.871,0.928,0.965,0.814,0.871) ## pathogenicity scores
genes=c("MYD88","JAK2","TNFAIP3","ATRX","PHF6","NF1","MED12","SF3B1") ##gene names
genesnum<-1:8 ##gene numbers
twoord.plot(genesnum,a, genesnum,b,type=c("bar","l"),ylab="Number of Variants",rylab="Pathogenicity scores",xlab="Mutant Genes",lcol=8,rcol=4,do.first="plot_bg()", xticklab= genes,lpch=1,halfwidth=0.2,axislab.cex=0.8)
