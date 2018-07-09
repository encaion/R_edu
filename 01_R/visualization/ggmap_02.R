library("ggmap")
kor = get_map(location = c(126.984265,
                           37.566530), 
              zoom = 15, 
              maptype = "roadmap")
ggmap(ggmap = kor)
