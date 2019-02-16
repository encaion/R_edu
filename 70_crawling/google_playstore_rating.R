library("rvest")
read_html("https://play.google.com/store/apps/details?id=com.netmarble.destiny", encoding = "UTF-8") %>%
  html_nodes(xpath = '//*[@class="pf5lIe"]') %>%
  gsub(pattern = "^.*?Rated | stars.*?$", replacement = "")
