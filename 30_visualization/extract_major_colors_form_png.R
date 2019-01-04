# png 이미지를 다운받아 k-means 클러스터링 기법으로 원하는 개수 만큼의 주요 색상을 추출

# reading
url = "https://gephi.org/images/screenshots/layout2.png"
url_Content = RCurl::getURLContent(url)

png = png::readPNG(url_Content, native = FALSE)

for(col in 1:3){
  col_sub = png[, , col]
  col_sub = cbind(line = nrow(col_sub):1,
                  as.data.frame(col_sub))
  if(col == 1){
    col_melt = reshape2::melt(data = col_sub,
                              id.vars = "line")  
  } else {
    col_melt[, ncol(col_melt) + 1] = reshape2::melt(data = col_sub,
                                                    id.vars = "line")[, "value"]
  }
}
col_melt[, "variable"] = as.numeric(substr(col_melt[, "variable"], 2, 4))
colnames(col_melt)[3:5] = c("Red", "Green", "Blue")
col_melt[, "obs"] = 1:nrow(col_melt)
head(col_melt)


color_extractor = function(rgb_data, colors = 3){
  kmeans_result = kmeans(x = rgb_data, centers = colors)
  df = data.frame(x = 1,
                  y = 1:colors)
  df = cbind(df, kmeans_result$centers)
  df[, "Hex"] = rgb(red   = df[, 3],
                    green = df[, 4],
                    blue  = df[, 5])
  
  library("ggplot2")
  gg = ggplot(data = df,
              aes(x = x,
                  y = y)) + 
    geom_tile(aes(fill = Hex)) + 
    geom_text(aes(label = Hex), size = 10) + 
    scale_fill_identity() + 
    theme(legend.position = "none")
  return(gg)
}

color_extractor(rgb_data = col_melt[3:5], colors = 5)
