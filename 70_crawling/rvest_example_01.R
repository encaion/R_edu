library("rvest")

tx = read_html("https://entertain.naver.com/home")
tx %>%
  html_nodes(xpath = '//*[@class="hdline_type_thumb_sub"]/ul/li/a') %>%
  html_attrs() %>%
  lapply(FUN = function(x){x["href"]}) %>%
  unlist()
