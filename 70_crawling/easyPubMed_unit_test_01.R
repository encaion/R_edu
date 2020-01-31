library("easyPubMed")
terms = c("corona", "virus")
pubid = get_pubmed_ids(paste(terms, collapse = "+"))
total_count = pubid$Count
article_xml = fetch_pubmed_data(pubmed_id_list = pubid, 
                                retmax = 20,
                                format = "xml",
                                encoding = "UTF-8")
str(article_xml[[1]])
xml_article = xml2::read_html(article_xml[[1]])
xml_article

library("rvest")
xml_article %>%
  html_nodes(css = "author")

xml_article %>%
  html_children() %>%
  html_children() %>%
  html_children() -> article_each

article_each[[1]] %>%
  html_nodes("author") -> authors_sub

authors_sub %>%
  html_children() %>%
  html_name() %>%
  unique() -> author_tags
author_tags

authors_sub %>% html_nodes("forename") %>% html_text() -> authors_sub_forename
authors_sub %>% html_nodes("initials") %>% html_text() -> authors_sub_initials
authors_sub %>% html_nodes("lastname") %>% html_text() -> authors_sub_lastname
# authors_sub %>% html_nodes("identifier") %>% html_text() -> authors_sub_id

df_author_sub = data.frame(forename = authors_sub_forename,
                           initials = authors_sub_initials,
                           lastname = authors_sub_lastname)
df_author_sub

authors_sub[[1]]
# library("XML")
# as.character(authors_sub)[1] %>%
#   xmlParse(asText = TRUE)
# xmlToDataFrame(nodes = authors_sub[[1]])
# ?xmlToDataFrame

authors_sub %>%
  as.character() %>%
  gsub(pattern = "<.*?>", replacement = "@") %>%
  gsub(pattern = "@@", replacement = ".") %>%
  gsub(pattern = "^\\.|\\.{1,}@$", replacement = "") %>%
  strsplit(split = "@") %>%
  lapply(FUN = "gsub", pattern = "\\.$|,", replacement = "") -> authors_list

df_authors_sub = data.frame(names = unlist(lapply(authors_list, FUN = "[[", 1)),
                            addr = unlist(lapply(authors_list, FUN = "[[", 2)))
library("stringr")
df_authors_sub[, "ID"] = unlist(lapply(str_extract_all(string = df_authors_sub$names,
                                                       pattern = "[0-9]{4}.*?$"),
                                       FUN = "paste", collapse = ""))
df_authors_sub[, "names"] = gsub(pattern = "(\\.)[0-9]{4}.*?$", replacement = "", df_authors_sub$names)
df_authors_sub
