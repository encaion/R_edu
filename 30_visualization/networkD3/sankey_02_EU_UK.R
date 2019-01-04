library("dplyr")
library("tidyr")
library("networkD3")

df = read.csv("sankey_diagram_EU_UK.csv")
head(df)

df %>% 
  group_by(Region) %>% 
  summarise(Remain = sum(Remain), Leave = sum(Leave)) -> results
head(results)

results = gather(data = results, 
                 key = result, 
                 value = vote,
                 -Region)
head(results)

regions = unique(as.character(results$Region))
nodes = data.frame(node = c(0:13), 
                   name = c(regions, "Leave", "Remain"),
                   stringsAsFactors = FALSE)

results = left_join(x = results, y = nodes, 
                    by = c("Region" = "name"))
results = left_join(x = results, y = nodes, 
                    by = c("result" = "name"))
links = results[ , c("node.x", "node.y", "vote")]
colnames(links) = c("source", "target", "value")

sankeyNetwork(Links = links, Nodes = nodes, 
              Source = "source", 
              Target = "target", 
              Value = "value", 
              NodeID = "name",
              units = "votes")
