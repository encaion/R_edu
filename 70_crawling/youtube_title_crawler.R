library("rvest")
read_html(paste0("https://www.youtube.com/results?search_query=", URLencode("BTS"))) %>%
  html_nodes(xpath = '//*[@class="yt-lockup-content"]') %>%
  html_nodes(xpath = '//*[@rel="spf-prefetch"]') %>%
  html_attr("title")
