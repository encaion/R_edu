# R 패키지별 다운로드 숫자 확인

# http://www.r-bloggers.com/finally-tracking-cran-packages-downloads/

#======================================================================
## Step 1: Download all log files
## 
#======================================================================  

# Here's an easy way to get all the URLs in R
start = as.Date("2015-01-01")
today = as.Date("2016-09-30")

days_seq = seq(start, today, by = "day")

library("lubridate")
year = year(days_seq) # lubridate 패키지의 year 함수 사용
urls = paste0("http://cran-logs.rstudio.com/", year, "/", days_seq, ".csv.gz")
head(urls)

# only download the files you don't have:
date_mis = setdiff(as.character(days_seq),
                   tools::file_path_sans_ext(dir("CRANlogs"), TRUE))


dir.create("CRANlogs")
for(i in 593:length(date_mis))
{
  print(paste0(i, "/", length(date_mis)))
  download.file(urls[i], paste0("CRANlogs/", date_mis[i], ".csv.gz"))
}
# 8월 17일 부터 다시 할 것. i = 594!

#======================================================================
## Step 2: Load single data files into one big data.table
#======================================================================

file_list <- list.files("CRANlogs", full.names=TRUE)

logs <- list()
for (file in file_list) {
  print(paste("Reading", file, "..."))
  logs[[file]] <- read.table(file, header = TRUE, sep = ",", quote = "\"",
                             dec = ".", fill = TRUE, comment.char = "", as.is=TRUE)
}

# rbind together all files
library(data.table)
dat <- rbindlist(logs)

# add some keys and define variable types
dat[, date:=as.Date(date)]
dat[, package:=factor(package)]
dat[, country:=factor(country)]
dat[, weekday:=weekdays(date)]
dat[, week:=strftime(as.POSIXlt(date),format="%Y-%W")]

setkey(dat, package, date, week, country)

save(dat, file="CRANlogs/CRANlogs.RData")

# for later analyses: load the saved data.table
# load("CRANlogs/CRANlogs.RData")


#======================================================================
## Step 3: Analyze it!
# ======================================================================

library(ggplot2)
library(plyr)

str(dat)

# Overall downloads of packages
d1 <- dat[, length(week), by=package]
d1 <- d1[order(V1), ]
d1[package=="TripleR", ]
d1[package=="psych", ]

# plot 1: Compare downloads of selected packages on a weekly basis
agg1 <- dat[J(c("TripleR", "RSA")), length(unique(ip_id)), by=c("week", "package")]

ggplot(agg1, aes(x = week,
                 y = V1, 
                 color = package,
                 group = package)) + 
  geom_line() + 
  ylab("Downloads") + 
  theme_bw() + 
  theme(axis.text.x  = element_text(angle = 90, size = 8, vjust = 0.5))

agg1 <- dat[J(c("psych", "TripleR", "RSA")), length(unique(ip_id)), by=c("week", "package")]

ggplot(agg1, aes(x = week,
                 y = V1, 
                 color = package,
                 group = package)) + 
  geom_line() + 
  ylab("Downloads") + 
  theme_bw() + 
  theme(axis.text.x  = element_text(angle = 90, size = 8, vjust = 0.5))
