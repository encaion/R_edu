Sys.setenv(DB_USER = "",
           DB_PASSWD = "")
           
source("00_environment.R", encoding = "UTF-8")
library("RMySQL")
con = dbConnect(drv = MySQL(), 
                user = Sys.getenv("DB_USER"), 
                password = Sys.getenv("DB_PASSWD"), 
                host = "?????.ap-northeast-?.rds.amazonaws.com")

list_db = dbGetQuery(conn = con, "show databases")
list_db

# https://mariadb.com/kb/en/r-statistical-programming-using-mariadb-as-the-background-database/

# mariadb-sql: https://mariadb.com/kb/ko/basic-sql-statements/
# sql: https://www.w3schools.com/sql/sql_check.asp
# naming rule: https://willeeproject.tistory.com/193
# SQL data types: https://www.journaldev.com/16774/sql-data-types
# DB index: https://jojoldu.tistory.com/243

# dbExecute(conn = con, "CREATE DATABASE test")
# dbExecute(conn = con, "DROP DATABASE test")
# dbGetQuery(conn = con, "SHOW databases")
# dbGetQuery(conn = con, "USE api")
# dbGetQuery(conn = con, "SELECT DATABASE()")
# dbCreateTable(conn = con, name = "test",
#               fields = c(aa = "integer",
#                          bb = "timestamp"))
# dbRemoveTable(conn = con, name = "test")
# dbGetQuery(conn = con, "SELECT CURRENT_TIMESTAMP AS current_date_time;")

# dbExecute(conn = con, "CREATE TABLE test (
#   id int AUTO_INCREMENT,
#   timestamp datetime,
#   name varchar(20),
#   PRIMARY KEY (id, timestamp)
# ) DEFAULT CHARSET=utf8")
# dbListTables(conn = con)
# dbGetQuery(conn = con, "DESC test")
# 
# dbGetQuery(conn = con, "SELECT * FROM test")
# dbSendQuery(conn = con, "INSERT INTO test (timestamp, name) 
#             VALUES (CURRENT_TIMESTAMP, 'asdf')")

# table size
dbGetQuery(conn = con, "SELECT table_schema, sum(data_length) /1024/1024 AS mb 
                        FROM information_schema.tables  
                        GROUP BY table_schema 
                        ORDER BY sum(data_length+index_length) DESC")

