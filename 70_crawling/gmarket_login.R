library("RSelenium")
library("rvest")
library("XML")

url = "https://gmarket.co.kr"

sel = rsDriver(port = sample(1000:8000, 1), browser = "chrome", verbose = FALSE)
sel_cl = sel$client
sel_cl$navigate(url)

Sys.sleep(1 + runif(1))

url_login = "https://signinssl.gmarket.co.kr/login/login"

sel_cl$navigate(url_login)

sel_cl$findElement(using = "id",
                   value  = "id_span")$clickElement()

sel_cl$sendKeysToActiveElement(list(""))
Sys.sleep(1 + runif(1))

sel_cl$findElement(using = "id",
                   value  = "password_span")$clickElement()

sel_cl$sendKeysToActiveElement(list(""))
Sys.sleep(1 + runif(1))

sel_cl$findElement(using = "class name",
                   value  = "btn-login")$clickElement()

url_daily_check = "http://promotion.gmarket.co.kr/Event/PlusZone.asp"
sel_cl$navigate(url_daily_check)

sel_cl$findElement(using = "css selector",
                   value  = "#wrapper > a")$clickElement()
# class="button_start"
