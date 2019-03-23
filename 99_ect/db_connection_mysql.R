# install.packages("DBI")
# install.packages("RMySQL")

library("DBI")
library("RMySQL")
dri = dbDriver("MySQL")
con = dbConnect(drv = dri,
                host = "localhost",
                port = 3306,
                dbname = "test",
                user = "second",
                password = "asdf1234")
df = dbGetQuery(conn = con,
           "select * from user")
sapply(df, "class")

dbColumnInfo(dbSendQuery(conn = con, "select * from user"))

# if there are latin-1 encoding characters!?
# type this before get data
dbGetQuery(conn = con, "set names 'utf8'") # or 'utf8mb4'
