library("ggplot2")
df = data.frame(obs = 1:900,
                group = rep(paste0("Sample", 1:3), each = 300),
                period = rep(rep(c(0, 1, 24), 3), each = 100),
                value = abs(rnorm(900, mean = 2, sd = 6)))

df_col = aggregate(value ~ group + period, FUN = "quantile", data = df, probs = 0.75)
df_col[, "value2"] = aggregate(value ~ group + period, FUN = "quantile", data = df, probs = 0.8)[, 3]

gg = ggplot(data = df_col,
       aes(x = as.factor(period),
           y = value)) + 
  geom_errorbar(aes(ymin = value,
                    ymax = value2),
                width = 0.3) +
  geom_col() + 
  scale_y_continuous(limits = c(0, max(df_col$value2) * 1.4),
                     expand = c(0, 0)) +
  facet_wrap(~group, nrow = 1) +
  annotate(geom = "text", 
           x = 2, 
           y = max(df_col$value2) * 1.35, 
           label = c("p=0.02", "p<0.01", "p=0.16"),
           size = 3.5) + 
  annotate(geom = "text", # higher one
           x = 2, 
           y = max(df_col$value2) * 1.25,
           label = c("***", "**", "*"),
           size = 5) +
  annotate(geom = "segment", # high - horizontal
           x = 1, 
           xend = 3,
           y = max(df_col$value2) * 1.22,
           yend = max(df_col$value2) * 1.22) +
  annotate(geom = "segment", # high - vertical
           x = 1, 
           xend = 1,
           y = max(df_col$value2) * 1.15,
           yend = max(df_col$value2) * 1.22) +
  annotate(geom = "text", # lower one
           x = 1.5, 
           y = max(df_col$value2) * 1.15,
           label = c("**", "***", "*"),
           size = 5) +
  annotate(geom = "segment",  # low - horizontal
           x = 1, 
           xend = 2,
           y = max(df_col$value2) * 1.12,
           yend = max(df_col$value2) * 1.12) +
  geom_errorbar(aes(ymin = value2 * 1.03,
                    ymax = rep(c(max(df_col$value2) * c(1.12, 1.12, 1.22)), 3)),
                width = 0) +
  labs(x = "Period[h]", y = "Dose Response\n[Median +/- IQR]") + 
  theme(strip.text = element_text(face = "bold"))

print(gg)
