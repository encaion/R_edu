# http://code.markedmondson.me/googleAnalyticsR/articles/v4.html

# install.packages("googleAnalyticsR")
library("data.table")
library("googleAnalyticsR")

# 재시작 하면 무조건 다시 연결을 해야한다.
ga_auth()

## get your accounts
account_list = ga_account_list()
account_list
# fwrite(account_list, "account_list.csv")

account_list$viewId

ga_id = account_list$viewId[1]

df_sessions = google_analytics(viewId = ga_id, anti_sample = TRUE,
                               date_range = c("2019-01-01", "2019-12-31"), 
                               metrics = "sessions",
                               dimensions = "date")
head(df_sessions)

library("ggplot2")
ggplot(data = df_sessions,
       aes(x = date, y = sessions, fill = sessions)) + 
  geom_col() + 
  scale_x_date(expand = c(0.01, 0.01)) + 
  scale_y_continuous(expand = c(0.01, 0.01)) + 
  theme_bw() + 
  theme(panel.grid.major.y = element_line(size = 2),
        legend.position = "none")


?google_analytics
# 볼 수 있는 API
# - Reporting API V4
# - Realtime API V3
# - Multi-Channel Funnels API V3
# ※ https://developers.google.com/analytics/devguides/reporting/?fbclid=IwAR2-Y72BveexQuB4ug_RFVLUC-T9JLclfO12ZN6g0gxUtYqT6mKUrAb_pyM


# bounceRate - 이탈!!
sampled_data_fetch = google_analytics(ga_id, 
                                      date_range = c("2019-01-01", as.character(Sys.Date())),
                                      metrics    = c("users","sessions","bounceRate"), 
                                      dimensions = c("date","landingPagePath","source"),
                                      anti_sample = TRUE)
head(sampled_data_fetch)
tail(sampled_data_fetch)
unique(sampled_data_fetch$date)

# fwrite(sampled_data_fetch, "GA_bounce_rate.csv")
