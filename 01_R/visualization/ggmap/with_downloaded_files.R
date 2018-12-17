library("ggplot2")
# install.packages("ggmap")
library("ggmap")

# kor = get_map("seoul", zoom = 11, 
#               maptype = "hybrid",
#               source = "google", api_key = "")
kor = readRDS("map_kor.rds")
# df = data.frame(lon = 0, lat = 0,
#                 location = c("신림역", "서울역"), 
#                 stringsAsFactors = FALSE)
# for(n in 1:nrow(df)){
#   location_sub = geocode(location = enc2utf8(df[n, "location"]), 
#                          messaging = FALSE, override_limit = TRUE,
#                          source = "google", force = TRUE)
#   df[n, 1:2] = location_sub
#   Sys.sleep(1)
# }

df = read.csv("map_location.csv", stringsAsFactors = FALSE)

ggmap(kor) + 
  geom_point(data = df, 
             aes(x = lon, y = lat),
             size = 5, alpha = 0.7,
             color = "#FF0000") + 
  geom_text(data = df, 
            aes(x = lon, y = lat + 0.01, 
                label = location), 
            size = 3) + 
  labs(x = NULL, y = NULL)
