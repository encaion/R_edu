library("fpp2") # for visnights dataset
library("hts") # Hierarchical Time Series
tourism.hts = hts(visnights, characters = c(3, 5)) 

str(tourism.hts)
tourism.hts$labels
# $`Level 0`
# [1] "Total"
# 
# $`Level 1`
# [1] "NSW" "OTH" "QLD" "SAU" "VIC" "WAU"
# 
# $`Level 2`
# [1] "NSWMetro" "NSWNthCo" "NSWNthIn" "NSWSthCo" "NSWSthIn" "OTHMetro"
# [7] "OTHNoMet" "QLDCntrl" "QLDMetro" "QLDNthCo" "SAUCoast" "SAUInner"
# [13] "SAUMetro" "VICEstCo" "VICInner" "VICMetro" "VICWstCo" "WAUCoast"
# [19] "WAUInner" "WAUMetro"

tourism.hts %>% 
  aggts(levels = 0:1) %>%
  autoplot(facet = TRUE) +
  labs(x = "연도", y = "백만", title = "숙박일수")
