# install.packages("DBI")
# install.packages("RMySQL")

library("DBI")
library("RMySQL")
dri = dbDriver("MySQL")
con = dbConnect(drv = dri,
                host = "asdfasdf.ap-northeast-2.rds.amazonaws.com",
                port = 3306,
                dbname = "asdfasdf",
                user = "asdfsdaf",
                password = "asdfasdf")
df = dbGetQuery(conn = con,
           "select * from user")
df
