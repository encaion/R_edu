#### In Windows ####

# default: euc-kr
URLencode("추천")
# [1] "%C3%DF%C3%B5"

URLencode(iconv("추천", from = "euc-kr", to = "UTF-8"))
# [1] "%EC%B6%94%EC%B2%9C"

# with Package stringi
URLencode(stringi::stri_encode("추천", from = "euc-kr", to = "UTF-8"))
# [1] "%EC%B6%94%EC%B2%9C"
