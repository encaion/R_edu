options(stringsAsFactors = FALSE)

df = data.frame(ID = rep(LETTERS[1:3], each = 3),
                inquiry = c("benefit", "point", "discount",
                            "loan", "card", "account", 
                            "point", "benefit", "loan"),
                sequence = c(sample(1:3, size = 3), 
                             sample(1:3, size = 3), 
                             sample(1:3, size = 3)))
df = df[order(df$ID, df$sequence), ]
df

df_split = split(df, f = df$ID)
df_split = lapply(df_split, FUN = function(x){data.frame(ID = x[1, 1],
                                                         inquiry = paste(x[, 2], collapse = "->"))})
df_split = dplyr::bind_rows(df_split)
df_split
