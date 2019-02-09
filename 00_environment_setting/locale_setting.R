# check current locale 
Sys.getlocale()

# Korea
Sys.setLocale("LC_ALL", "ko_KR.CP949")
Sys.setLocale("LC_ALL", "ko_KR.UTF-8")

# US
Sys.setlocale("LC_CTYPE", locale="C")

Sys.setlocale("LC_TIME", "en_US.UTF-8")
Sys.setlocale("LC_CTYPE", "en_US.UTF-8")
Sys.setlocale("LC_COLLATE", "en_US.UTF-8")
Sys.setlocale("LC_MONETARY", "en_US.UTF-8")
Sys.setlocale("LC_MESSAGES", "en_US.UTF-8")
