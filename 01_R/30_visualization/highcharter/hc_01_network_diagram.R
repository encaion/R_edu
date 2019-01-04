library("highcharter")
library("igraph")
N = 40

net = sample_gnp(N, p = 2/N)
wc = cluster_walktrap(net)

V(net)$label = seq(N)
V(net)$name = paste("I'm #", seq(N))
V(net)$page_rank = round(page.rank(net)$vector, 2)
V(net)$betweenness = round(betweenness(net), 2)
V(net)$degree = degree(net)
V(net)$size = V(net)$degree
V(net)$comm = membership(wc)
V(net)$color = colorize(membership(wc))

hchart(net, layout = layout_with_fr)
