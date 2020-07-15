# version 1
vec = c("a", "a", "b", "b", "c", "c", "a", "d")
vec_num = c(0, abs(diff(as.numeric(factor(vec)))))
cumsum(ifelse(vec_num >= 2, 1, vec_num)) + 1

# version 2
vec = c("a", "a", "b", "b", "c", "c", "a", "d")
df = data.frame(obs = rep(1:2, each = length(vec)),
                vec = c(vec, vec))
numbering = function(x){
  x_num = c(0, abs(diff(as.numeric(factor(x[, 2])))))
  x[, "num"] = cumsum(ifelse(x_num >= 2, 1, x_num)) + 1
  return(x)  
}
df_split = split(df, f = df$obs)
df_bind = do.call("rbind", lapply(df_split, FUN = "numbering"))
rownames(df_bind) = NULL
df_bind

