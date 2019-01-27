library("networkD3")
df = matrix(c(11975,  1951,  8010, 1013,
              5871, 10048, 16145,  990,
              8916,  2060,  8090,  940,
              2868,  6171,  8045, 6907),
            nrow = 4)

chordNetwork(Data = df, 
             width = 500, 
             height = 500,
             colourScale = c("#000000", 
                             "#FFDD89", 
                             "#957244", 
                             "#F26223"),
             labels = c("red", "brown", "blond", "gray"))
