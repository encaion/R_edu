library("rvest")
library("splitstackshape")
library("ggplot2")

source_main = read_html("https://www.cdc.gov/flu/about/burden/index.html", encoding = "UTF-8")
source_main %>%
  html_nodes(xpath = '//*[@class="table table-condensed table-bordered table-responsive"]') %>%
  html_table() -> df_flu
df_flu = df_flu[[1]]

col_names = paste0(colnames(df_flu)[-1], "_", df_flu[1, -1])
col_names = c(df_flu[1, 1], gsub("[^A-z0-9]", "", col_names))
colnames(df_flu) = col_names
df_flu = df_flu[-grep("^[^0-9]", df_flu$Season), ]
for(n in 2:ncol(df_flu)){
  # n = 3
  df_flu[, n] = gsub(" . ", "@", df_flu[, n])
  df_flu[, n] = gsub("[^0-9@]", "", df_flu[, n])
}

df_flu_sp = as.data.frame(cSplit(indt = df_flu, sep = "@",
                                 splitCols = grep("UI$", colnames(df_flu), value = TRUE)))
for(n in 2:ncol(df_flu_sp)){
  df_flu_sp[, n] = as.numeric(df_flu_sp[, n])
}
head(df_flu_sp)

ggplot(data = df_flu_sp,
       aes(x = 1:nrow(df_flu_sp))) + 
  geom_ribbon(aes(ymin = Deaths_95UI_1,
                  ymax = Deaths_95UI_2),
              fill = "#AA0000",
              alpha = 0.3) + 
  geom_line(aes(y = Deaths_Estimate),
            color = "#AA0000",
            size = 2) + 
  scale_x_continuous(breaks = 1:nrow(df_flu_sp),
                     labels = df_flu_sp$Season) + 
  labs(x = NULL, y = "Deaths",
       title = "Estimated Influenza Disease Burden, by Season",
       subtitle = "United States, 2010-11 through 2018-19 Influenza Seasons") + 
  theme_bw() + 
  theme(panel.grid.minor.x = element_blank(),
        panel.grid.major.x = element_line(size = 1.5),
        axis.text = element_text(size = 12),
        axis.title = element_text(face = "bold",
                                  size = 15),
        plot.title = element_text(size = 20))
