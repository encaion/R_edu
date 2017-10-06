# install.packages("corrplot")
library("corrplot")

set.seed(567)
df_3 = data.frame(col_a = sample(1:20, 20, replace = TRUE),
                  col_b = sample(1:20, 20, replace = TRUE),
                  col_c = sample(1:20, 20, replace = TRUE),
                  col_d = sample(1:20, 20, replace = TRUE),
                  col_e = sample(1:20, 20, replace = TRUE),
                  col_f = sample(1:20, 20, replace = TRUE),
                  col_g = sample(1:20, 20, replace = TRUE))
head(df_3)

cor_df_3 = cor(df_3)
cor_df_3

corrplot(cor_df_3, method = "square", type = "full")
corrplot(cor_df_3, method = "square", type = "upper")
corrplot(cor_df_3, method = "square", type = "lower")

corrplot(cor_df_3, method = "circle")
corrplot(cor_df_3, method = "square")
corrplot(cor_df_3, method = "ellipse")
corrplot(cor_df_3, method = "number")
corrplot(cor_df_3, method = "shade")
corrplot(cor_df_3, method = "color")
corrplot(cor_df_3, method = "pie")

corrplot(cor_df_3, method = "number", bg = "#000000")
corrplot(cor_df_3, method = "number", bg = "#FFAACC")

corrplot(cor_df_3, method = "color", diag = TRUE)
corrplot(cor_df_3, method = "color", diag = FALSE)

corrplot(cor_df_3, method = "color", diag = TRUE,
         addrect = 3, rect.col = "black", order = "hclust")
