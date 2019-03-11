library("data.table")
df = fread("CALL_CHICKEN_01MONTH.csv", data.table = FALSE, encoding = "UTF-8")
colnames(df) = c("date", "wday", "gender", "age", "loc_1", "loc_2", "loc_3", "type", "call")
df_loc = unique(df[, 5:7])
df_call_agg = aggregate(data = df, call ~ loc_1 + loc_2 + loc_3, FUN = "sum")
df_call_agg = df_call_agg[order(-df_call_agg$call), ]
df_call_agg[, "loc_full"] = paste(df_call_agg$loc_1,
                                  df_call_agg$loc_2,
                                  df_call_agg$loc_3, sep = " ")
head(df_call_agg)

library("ggplot2")
ggplot(data = df_call_agg[1:20, ],
       aes(x = reorder(loc_full, call),
           y = call,
           fill = call)) + 
  geom_col() + 
  geom_text(data = df_call_agg[1:3, ],
            aes(label = call),
            color = "#FFFFFF",
            fontface = "bold", 
            nudge_y = -1600, 
            nudge_x = 0.1) +
  scale_y_continuous(expand = c(0.02, 0.02)) +
  coord_flip() + 
  labs(x = NULL, y = "Call") +
  theme_bw() + 
  theme(legend.position = "none")
