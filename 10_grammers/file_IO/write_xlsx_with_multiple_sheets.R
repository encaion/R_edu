library("writexl")
write_xlsx(list(sheet1 = head(iris),
                sheet2 = tail(iris)), 
           path = "test.xlsx")
