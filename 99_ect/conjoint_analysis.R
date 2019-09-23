#### Preparing ####
#### __ 1) package ####
# install.packages("conjoint")
library("conjoint")

#### __ 2) design ####
ex = expand.grid(price   = c("low", "medium", "high"),
                 variety = c("black", "green", "red"),
                 kind    = c("bags", "granulated", "leafy"),
                 aroma   = c("yes", "no"))
head(ex)

design = caFactorialDesign(data = ex, type = "orthogonal")
# type = c("full", "fractional", "ca", "aca", "orthogonal")
design
nrow(design)
class(design)

coded = caEncodedDesign(design)
coded

cor(coded) # orthogonal

data("tea", package = "conjoint")
head(tlevn)
head(tprof, 2)
head(tprefm, 2)

caUtilities(y = tpref, x = tprof, z = tlevn)

# tlevn = as.character(unique(unlist(ex)))
# tpref = c(matrix(t(tprefm), nrow = 1))

# conj = function(y, x, z){
#   # options(contrasts = c("contr.sum", "contr.poly"))
#   Utls = data.frame(name = c("intercept", as.matrix(z)),
#                     value = round(caUtilities(y, x, z), 4))
#   imp = round(caImportance(y, x), 2)
#   return(list(Utls, imp))
# }
# result = conj(tpref, tprof, tlevn)
# result

importance = caImportance(tpref, tprof)
names(importance) = colnames(tprof)
importance

#### User Segmentation ####
# use k-means clustering
seg = caSegmentation(tprefm, tprof, c = 5)
pp = caPartUtilities(tpref, tprof, tlevn)
pp = as.data.frame(pp)
head(pp, 2)

pp[, "cluster"] = seg$sclu
aggregate(data = pp, . ~ cluster, FUN = "mean")

#### Predict ####
# New Profiles(selections)
head(tsimp) 
caMaxUtility(tsimp, tpref, tprof)
