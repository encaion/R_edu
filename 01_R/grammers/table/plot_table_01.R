# table with PerformanceAnalytics

library("PerformanceAnalytics")

data("managers")
table.Correlation(managers[,1:6],managers[,7:8])
result=table.Correlation(managers[,1:6],managers[,8])
rownames(result)=colnames(managers[,1:6])
require("Hmisc")
textplot(format.df(result, na.blank=TRUE, numeric.dollar=FALSE,
                   cdec=rep(3,dim(result)[2])), rmar = 0.8, cmar = 1.5,
         max.cex=.9, halign = "center", valign = "top", row.valign="center"
         , wrap.rownames=20, wrap.colnames=10, mar = c(0,0,3,0)+0.1)
