# install.packages("outreg")
library("outreg")
fitlist = list(lm(mpg ~ cyl, data = mtcars),
               lm(mpg ~ cyl + wt + hp , data = mtcars),
               lm(mpg ~ cyl + wt + hp + drat, data = mtcars))
outreg(fitlist)
