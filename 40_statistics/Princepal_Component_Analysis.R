df = data.frame(국어 = c(26, 46, 57, 36, 57, 26, 58, 37, 36, 56, 78, 95 ,88, 90, 52, 56),
                영어 = c(35, 74, 73, 73, 62, 22, 67, 34, 22, 42, 65, 88, 90, 85, 46, 66),
                수학 = c(35, 76, 38, 69, 25, 25, 87, 79, 36, 26, 22, 36, 58, 36, 25, 44),
                과학 = c(45, 89, 54, 55, 33, 45, 67, 89, 47, 36, 40, 56, 68, 45, 37, 56))
library("FactoMineR")
library("factoextra")

pca = PCA(df, scale.unit = TRUE, ncp = 4, graph = TRUE)
pca$eig

fviz_screeplot(pca, addlabels = TRUE, ylim = c(0, 52))

# follows ggplot2 
fviz_screeplot(pca, addlabels = TRUE) + 
 geom_line(aes(x = 1:4,
               y = pca$eig[, 3]))
