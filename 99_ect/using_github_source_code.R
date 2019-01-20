source_from_github = function(url){
  library("RCurl")
  url = gsub(pattern = "//github", replacement = "//raw.githubusercontent", x = url)
  url = gsub(pattern = "/blob/", replacement = "/", x = url)
  
  script = getURL(url, ssl.verifypeer = FALSE)
  eval(parse(text = script))
}
url_mine = "https://github.com/encaion/R_edu/blob/master/30_visualization/ggplot/statVis/stat_vis_01.R"
source(url_mine)
