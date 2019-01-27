library("networkD3")
nodes = read.csv("forceNetwork_nodes.csv", stringsAsFactors = FALSE)
links = read.csv("forceNetwork_links.csv", stringsAsFactors = FALSE)

forceNetwork(Links = links, Nodes = nodes, Source = "source",
             Target = "target", Value = "value", NodeID = "name",
             Group = "group", opacity = 0.8)
