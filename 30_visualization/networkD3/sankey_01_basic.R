library("networkD3")
df_node_link = data.frame(node = c("A", "B", "C", "D"),
                          source = c( 0,  0,  1,  2),
                          target = c( 1,  2,  3,  3),
                          value  = c(10, 20, 30, 40))

sankeyNetwork(Links = df_node_link, Nodes = df_node_link,
              Source = "source", Target = "target",
              Value = "value", NodeID = "node",
              fontSize= 12, nodeWidth = 30)
