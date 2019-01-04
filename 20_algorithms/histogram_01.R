h = sample(1:10, replace = TRUE)

hist_plot = function(data, area, point_l, point_r){
  h_df = data.frame(obs = 1:length(data),
                    h = data)
  
  h_df2 = data.frame(obs = point_l:point_r,
                     height = area/(point_r - point_l + 1))
  
  library("ggplot2")
  
  aa = ggplot() +
    geom_bar(data = h_df,
             aes(x = as.factor(obs),
                 y = h),
             stat = "identity") + 
    geom_bar(data = h_df2,
             aes(x = as.factor(obs),
                 y = height),
             fill = "#FF0000",
             alpha = 0.5,
             stat = "identity") + 
    labs(x = NULL, y = NULL) + 
    scale_y_continuous(breaks = 1:max(h_df$h), labels = 1:max(h_df$h)) + 
    geom_hline(yintercept = 1:max(h_df$h), color = "#FFFFFF")
  
  plot(aa)
}

hist_area = function(x){
  area = min(x) * length(x)
  area_sub = 0
  col_no1 = 1
  col_no2 = length(x)
  
  result_list = list(area = area,
                     col_no1 = col_no1,
                     col_no2 = col_no2)
  
  if(area < max(x)){
    area = max(x)
  }

  for(m in 1:length(x)){
    col_no1 = m
    for(n1 in m:1){
      if(x[n1] < x[m]){
        col_no1 = n1 + 1
        break
      }
      
      if(n1 == 1){
        col_no1 = 1
      }
    }
    
    col_no2 = m
    for(n2 in m:length(x)){
      if(x[n2] < x[m]){
        col_no2 = n2 - 1
        break
      }
      
      if(n2 == length(x)){
        col_no2 = length(x)
      }
    }
    
    area_sub = min(x[c(col_no1:col_no2)]) * (col_no2 - (col_no1-1))
    
    if(area_sub > result_list[["area"]]){
      result_list[["area"]] = area_sub
      result_list[["col_no1"]] = col_no1
      result_list[["col_no2"]] = col_no2                   
    } 
  }
    
  return(result_list)
}

h
result = hist_area(h)
unlist(result)
hist_plot(data = h,
          area = result$area, 
          point_l = result$col_no1, 
          point_r = result$col_no2)
