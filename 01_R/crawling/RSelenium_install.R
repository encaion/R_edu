# over R ver. 3.5.0
# As of July 2nd, 2018.

devtools::install_github("johndharrison/binman")
devtools::install_github("johndharrison/wdman")
devtools::install_github("ropensci/RSelenium")

library("RSelenium")

sel = rsDriver(browser = "chrome", verbose = FALSE)
sel_cl = sel$client
sel_cl$navigate("https://www.google.com")

sel_cl$close()
