# install.packages("intergraph")
library("ggplot2")
library("igraph")
library("ggnetwork")

df = data.frame(from = c(1, 2, 3),
                to   = c(2, 3, 1))
edges = matrix(unlist(df), nrow = 2, byrow = TRUE)
edges = as.vector(edges)

sample_g = graph(edges = edges,
                 n = 3, directed = TRUE) 
sample_g
plot(sample_g)

sample_ggn = ggnetwork(sample_g)
ggplot(data = sample_ggn,
       aes(x = x, 
           y = y, 
           xend = xend, 
           yend = yend)) +
  geom_edges(arrow = arrow(length = unit(1, "lines"), type = "closed")) +
  geom_nodes(size = 7) + 
  geom_nodetext(aes(label = vertex.names), 
                color = "#FFFFFF",
                fontface = "bold") +
  theme_bw()
