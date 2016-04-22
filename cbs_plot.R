plot_segments = function(segments_file){
 
  seg = read.delim(segments_file, sep='\t)
  seg.spl = split(seg,as.factor(as.character(seg$Chromosome)))
 
  pdf(file=paste(segments_file,"pdf",sep="."),paper="special",width=12,onefile=T,pointsize=8)
 
  par(mfrow=c(4,1))
 
  for(i in 1:length(seg.spl)){
    
    x = seg.spl[[i]]
    
    plot(x$Start,x$Segment_Mean,xlim = c(x[1,3],x[nrow(x),4]),pch = "",ylim = c(-3,3),xlab = paste("chr",names(seg.spl[i]),sep='_'),ylab = 'log2 ratio')
    points(x$End,x$Segment_Mean,pch = '')
    
    segments(x0 = x$Start , y0 = x$Segment_Mean , x1 = x$End, y1 = x$Segment_Mean, lwd = 2, col = 'maroon')
    abline(h = 0, lty = 1,lwd = 0.5)    
  }
  dev.off()
}
