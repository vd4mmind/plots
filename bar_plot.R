##Bar plot the gene counts
###Fade colors function for barplots
fadecolors <- function(colors, steps=4) {
    rr <- col2rgb(colors)
    unlist(Map(function(a) {
        rgb( seq(255, a[1],length.out=steps+1)[-1],
        seq(255,a[2],length.out=steps+1)[-1],
        seq(255,a[3],length.out=steps+1)[-1],
           maxColorValue=255)
    }, as.data.frame(rr)))
}

colors <- c("cornflowerblue","cornsilk4","red","orange")

data1= read.delim(file.choose(), row.names=1,header=T)
data2=as.matrix(data1)
b<-barplot(data2, beside= TRUE,las=2,cex.axis=0.7,cex.names=0.7,ylim=c(0,2500), col=fadecolors(colors))


## or alternatively
# b<-barplot(data2, beside= TRUE, col = Vectorize(adjustcolor)(rep(colors, each = 4), alpha.f = c(.3,.6,.8,.9)),ylim=c(0,2500))

tx2 <- data2
text(b,tx2+10, as.character(tx2),pos = 3, cex = 0.5, col = "darkgreen")
