# origin: http://timelyportfolio.blogspot.kr/2012/08/horizon-on-ggplot2.html

# install.packages("reshape2")
# install.packages("quantmod")
# install.packages("PerformanceAnalytics")

library("ggplot2")
library("reshape2")
library("quantmod")
library("PerformanceAnalytics")

data(edhec)
origin = 0
horizonscale = 0.1
roc = as.xts(apply(cumprod(edhec+1),MARGIN=2,ROC,n=12,type="discrete"),order.by=index(edhec))

roc.df = as.data.frame(cbind(index(roc), coredata(roc)))
roc.melt = melt(roc.df, id.vars = 1)
roc.melt[, 1] = as.Date(roc.melt[, 1])


horizon.panel.ggplot = function(df, title) {
  colnames(df) = c("date","grouping","y")

  col.brew = RColorBrewer::brewer.pal(name="RdBu",n=10)
  
  nbands = 3
  
  for(i in 1:nbands){
    #do positive
    df[, paste("ypos", i, sep = "")] = ifelse(df$y > origin,
                                              ifelse(abs(df$y) > horizonscale * i,
                                                     horizonscale,
                                                     ifelse(abs(df$y) - (horizonscale * (i - 1) - origin) > origin, abs(df$y) - (horizonscale * (i - 1) - origin), origin)),
                                              origin)
    #do negative
    df[, paste("yneg", i, sep = "")] = ifelse(df$y < origin,
                                              ifelse(abs(df$y) > horizonscale * i,
                                                     horizonscale,
                                                     ifelse(abs(df$y) - (horizonscale * (i - 1) - origin) > origin, abs(df$y) - (horizonscale * (i - 1) - origin), origin)),
                                              origin)
  }
  
  df.melt = melt(df[ ,c(1:2, 4:9)], id.vars = 1:2)    
  
  colnames(df.melt) = c("date", "grouping", "band", "value")
  
  p = ggplot(data = df.melt) +
    geom_area(aes(x = date, y = value, fill=band),
              # alpha = 0.25,
              position = "identity") +
    scale_fill_manual(values=c("ypos1" = col.brew[7],
                               "ypos2" = col.brew[8],
                               "ypos3" = col.brew[9],
                               "yneg1" = col.brew[4],
                               "yneg2" = col.brew[3],
                               "yneg3" = col.brew[2])) +
    ylim(origin, horizonscale) +
    facet_grid(grouping ~ .) +
    theme_bw() + 
    labs(title = title) +
    theme(plot.title = element_text(size=16, face="bold", hjust=0),
          legend.position = "none",
          axis.text.y = element_blank(),
          axis.ticks  = element_blank(), 
          axis.title  = element_blank(), 
          strip.text.y = element_text(angle = 0))
  
  return(p)
}


horizon.panel.ggplot(roc.melt, "EDHEC Indexes Return (Rolling 1 Year)")
