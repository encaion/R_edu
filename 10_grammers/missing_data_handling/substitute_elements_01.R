options(stringsAsFactors = FALSE)
df = data.frame(size = c("a", "b", "(same)", "c", "d", "(same)"),
                brand = c("LB", "LB", "LB", "B", "B", "B"))
df

for(n in 1:nrow(df)){
  if(df[n, "size"] == "(same)"){
    df[n, "size"] = df[n - 1, "size"] 
  }
}
df
