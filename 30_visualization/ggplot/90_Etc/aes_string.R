data("iris")
head(iris)

library("ggplot2")
for(n in 2:4){
  gg = ggplot(data = iris,
              aes_string(x = colnames(iris)[1],
                         y = colnames(iris)[n])) + 
    geom_point()
  print(gg)
  flush.console()
  Sys.sleep(2)
}
