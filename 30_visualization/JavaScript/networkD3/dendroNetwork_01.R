library("networkD3")
hc = hclust(dist(USArrests), method = "ave")
dendroNetwork(hc, height = 600)
