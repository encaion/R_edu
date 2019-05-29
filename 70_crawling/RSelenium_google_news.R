options(stringsAsFactors = FALSE)
library("rvest")
library("RSelenium")

url = "google_news_url"

port_no = sample(2000:8000, size = 1)
dd = rsDriver(port = port_no, browser = "chrome", chromever = "74.0.3729.6")
dd_client = dd$client
dd_client$navigate(url)

tx_base = dd_client$getPageSource()
tx_base = read_html(tx_base[[1]])

tx_base %>%
  html_nodes(xpath = "//a[@aria-label and @class='fl']") %>%
  html_attr("href") %>%
  paste0("https://www.google.com", .) -> page_links

tx_base %>%
  html_nodes(xpath = "//a[@class='l lLrAF' and @href]") %>%
  html_text() %>%
  gsub(pattern = ",", replacement = " ") -> title

tx_base %>%
  html_nodes(xpath = "//div[@class='slp']/span[1]") %>%
  html_text() %>%
  gsub(pattern = ",", replacement = " ") -> ref

tx_base %>%
  html_nodes(xpath = "//div[@class='slp']/span[3]") %>%
  html_text() %>%
  gsub(pattern = "\\. ", replacement = "-") %>%
  gsub(pattern = "\\.",  replacement = "") %>%
  as.Date() -> time


# tx_base %>%
#   html_nodes(xpath = "//a[@class='l lLrAF' and @href]/text()")
# 
# tx_base %>%  
#   html_nodes(css = ".r.dO0Ag") %>%
#   html_text() -> title
# 
# tx_base %>%
#   html_nodes(css = ".slp .xQ82C") %>%
#   html_text() -> ref
# 
# tx_base %>%
#   html_nodes(css = ".slp .f") %>%
#   html_text() %>%
#   gsub(pattern = "\\. ", replacement = "-") %>%
#   gsub(pattern = "\\.",  replacement = "") %>%
#   as.Date() -> time

news_sub = data.frame(no = 1:length(title),
                      date = time,
                      reference = ref,
                      title = title)
head(news_sub)
