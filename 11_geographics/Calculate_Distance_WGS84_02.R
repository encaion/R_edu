# install.packages("geosphere")
library("geosphere")

df = data.frame(obs = 1:1000,
                lati = sample(seq(127, 128, by = 0.0001), size = 1000),
                long = sample(seq( 37,  38, by = 0.0001), size = 1000))
df[, "dist"] = apply(df[, 2:3], 
                     MARGIN = 1, 
                     FUN = "distGeo", 
                     p2 = c(127.5, 37.5))
head(df)
