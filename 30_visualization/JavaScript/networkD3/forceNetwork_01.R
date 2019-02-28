library("networkD3")
nodes = read.csv("forceNetwork_nodes.csv", stringsAsFactors = FALSE)
links = read.csv("forceNetwork_links.csv", stringsAsFactors = FALSE)

forceNetwork(Links = links, Nodes = nodes, Source = "source",
             Target = "target", Value = "value", NodeID = "name",
             Group = "group", opacity = 0.8)

# custom
forceNetwork(Links = df_links_sub, Nodes = df_nodes_sub, 
             Source = "from", Target = "to", 
             Value = "count", NodeID = "name",
             Group = "group", 
             opacity = 0.8, Nodesize = "size", fontSize = 15,
             colourScale = JS("d3.scaleOrdinal(['#69C242', '#64BBE3']);"),
             radiusCalculation = JS("d.nodesize"))
