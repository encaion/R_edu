graph = make_full_citation_graph(20, directed = FALSE)
plot.igraph(graph)

any_multiple(graph)
count_multiple(graph)
graph_simple = simplify(graph = graph, 
                        remove.multiple = TRUE, 
                        remove.loops = TRUE,
                        edge.attr.comb = igraph_opt("edge.attr.comb")) # dosen't work
E(graph_simple)$width = sqrt(1:28)
E(graph_simple)$alpha = 0.4
plot.igraph(graph_simple, 
            edge.curved = 0.2,
            edge.color = "#000000")
