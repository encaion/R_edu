# install.packages("GGally")
library("GGally")
data(tips, package = "reshape")

ggpairs(data = tips, 
        columns = 1:3, 
        title = "tips data", 
        aes(color = sex))

ggpairs(data = tips,
        columns = 1:3, 
        upper = list(continuous = "density"),
        lower = list(combo = "facetdensity"),
        title = "tips data",
        aes(color = sex))
