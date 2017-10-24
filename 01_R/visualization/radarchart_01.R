# install.packages("radarchart")
library("radarchart")

# Or using a list interface
labs = c("문서 작업", 
         "통계", 
         "머신러닝", 
         "딥러닝",  
         "규모", 
         "여유")

scores = list("Rich" = c(6, 3, 8, 6, 9, 1))

# Change title and remove legend
chartJSRadar(scores = scores,
             labs = labs,
             width  = 30, 
             height = 30,
             addDots = FALSE, 
             maxScale = 10,
             lineAlpha = 0,
             showLegend = FALSE)

