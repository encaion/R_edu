library("ggmap")

kor = get_map("seoul", zoom = 11, maptype = "roadmap")
df = data.frame(lon = 0,
                lat = 0,
                location = c("신림역", "시청역"), 
                stringsAsFactors = FALSE)

for(n in 1:nrow(df)){
  # n = 2
  location_sub = geocode(enc2utf8(df[n, "location"]), source = "google", force = TRUE)
  df[n, 1:2] = location_sub
  Sys.sleep(1)
  print(geocodeQueryCheck())
}
df

# 서울시 맵에 geom_point추가
ggmap(kor) + 
  geom_point(data = df, 
             aes(x = lon, y = lat),
             size = 5,
             alpha = 0.7,
             color = "#FF0000") + 
  geom_text(data = df, 
            aes(x = lon,
                y = lat + 0.01, 
                label = location), 
            size = 3) + 
  labs(x = NULL, y = NULL)
