library("fpp2") # for visnights dataset
library("hts") # Hierarchical Time Series
tourism.hts = hts(visnights, characters = c(3, 5)) 
tourism.hts %>% 
  aggts(levels = 0:1) %>%
  autoplot(facet = TRUE) +
  labs(x = "연도", y = "백만", title = "숙박일수")
