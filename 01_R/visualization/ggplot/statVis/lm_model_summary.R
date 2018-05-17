options(stringsAsFactors = FALSE)

kidney = read.csv("kidney_data.csv")
head(kidney)

t(t(colnames(kidney)))
model = lm(RAIV ~ Exophytic_rate_PADUA + Urinarycollectingsystem_PADUA 
           + Tumor_size__PADUA + Renal_rim_PADUA + Renal_sinus_PADUA
           + polarlocation_PADUA,
           data = kidney)
model_summary = summary(model)

range_1 = confint(model, level = 0.99)
range_2 = confint(model, level = 0.95)
range_3 = confint(model, level = 0.90)
colnames(range_1) = c("range_0005", "range_0995")
colnames(range_2) = c("range_0025", "range_0975")
colnames(range_3) = c("range_0050", "range_0950")


df = as.data.frame(cbind(vars = rownames(model_summary$coefficients),
                         model_summary$coefficients,
                         range_1,
                         range_2,
                         range_3,
                         VIF = c(-1, car::vif(model)) ))
rownames(df) = NULL

for(n in 2:ncol(df)){
  df[, n] = round(as.numeric(df[, n]), 4)
}
df[1, "VIF"] = " "
df[, "stars"] = c("***", ".", "***", "***", ".", "", "")

# write.csv(df, "model_01_data.csv", row.names = FALSE)

library("ggplot2")
ggplot(data = df, aes(x = vars)) +
  geom_hline(yintercept = 0, size = 1.5, color = "#040072", alpha = 0.4) + 
  # 베타의 첫 번째 신뢰구간(연한 소다색)
  geom_linerange(aes(ymin = range_0005,
                     ymax = range_0995),
                 size = 4,
                 color = "#86DED7",
                 alpha = 0.4) +
  # 베타의 두 번째 신뢰구간(연한 보라색)
  geom_linerange(aes(ymin = range_0025,
                     ymax = range_0975),
                 size = 4,
                 color = "#A6ACFF",
                 alpha = 0.6) + 
  # 베타의 세 번째 신뢰구간(진한 소다색)
  geom_linerange(aes(ymin = range_0050,
                     ymax = range_0950),
                 size = 4,
                 color = "#86DED7") + 
  # 베타값(빨간 점)
  geom_point(aes(y = Estimate),
             color = "#FF0000",
             size = 3) + 
  # 막대 위의 p-value(별표)
  geom_text(data = df[c(1, 3, 4), ],
                      aes(y = Estimate,
                label = stars),
            vjust = 0.2,
            size = 7) + 
  geom_text(data = df[c(2, 5, 6), ],
            aes(y = Estimate,
                label = stars),
            vjust = -0.4,
            size = 10) + 
  # 막대 아래의 VIF 값
  geom_text(aes(y = Estimate,
                label = VIF),
            vjust = 1.6,
            size = 3) + 
  # y축 설정 부분
  scale_y_continuous(breaks = seq(-25, 45, by = 5),
                     labels = seq(-25, 45, by = 5),
                     expand = c(0.03, 0.03)) +
  labs(x = "Variables", y = NULL) + 
  theme(axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10)) +
  coord_flip() # 그래프 x, y축 반전(?)
