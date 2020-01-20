df_base = expand.grid(type = c("문과", "이과"),
                      grade = 1:5,
                      year = 17:19,
                      sex = c("M", "F"))
head(df_base)

df = data.frame()
for(n in 1:10){
  df = rbind(df, df_base)
}
head(df)

df[, "score"] = round(runif(nrow(df)) * 100, 2)
head(df)

df_agg = aggregate(data = df, score ~ year + grade, FUN = "mean")
head(df_agg)

score_diff = function(x){
  x[, "score_diff"] = c(-999, diff(x$score))
  return(x)
}

df_agg = split(df_agg, f = df_agg$grade)
df_agg = lapply(df_agg, FUN = score_diff)
df_agg = dplyr::bind_rows(df_agg)
head(df_agg)

df_agg[, "text_x_pos"] = df_agg$grade + rep(c(-0.3, 0, 0.3), times = nrow(df_agg)/3)

df_agg_score = df_agg[df_agg$score_diff != -999, ]
df_agg_score[, "grade_pos"] = df_agg_score$grade + rep(c(-0.2, 0.2), times = nrow(df_agg_score)/2)
df_agg_score[, "y_pos"] = ifelse(df_agg_score$score_diff < 0,
                                 df_agg_score$score * 0.85 ,
                                 df_agg_score$score * 0.15)
df_agg_score

library("ggplot2")
ggplot() + 
  geom_col(data = df_agg, 
           aes(x = grade,
               y = score,
               group = year,
               fill = as.character(year)),
           position = "dodge",
           color = "#000000",
           size = 1) + 
  geom_text(data = df_agg,
            aes(x = text_x_pos + 0.015,
                y = score/2 - 0.15,
                group = year,
                label = round(score, 1)),
            color = "#000000",
            size = 6,
            angle = 90) +
  geom_text(data = df_agg,
            aes(x = text_x_pos,
                y = score/2,
                group = year,
                label = round(score, 1)),
            color = "#FFFFFF",
            size = 6,
            angle = 90) +
  geom_rect(data = df_agg_score,
            aes(xmin = grade_pos - 0.16,
                xmax = grade_pos + 0.16,
                ymin = y_pos - 2,
                ymax = y_pos + 2),
            fill = "#FFFFFF",
            color = "#000000",
            size = 1.3) +
  geom_text(data = df_agg_score,
            aes(x = grade_pos,
                y = y_pos,
                label = round(score_diff, 1)),
            size = 5) +
  scale_x_continuous(expand = c(0.01, 0.01)) +
  scale_y_continuous(expand = c(0.03, 0.03)) +
  scale_fill_manual(values = c("17" = "#EEEEEE",
                               "18" = "#A7CFF2",
                               "19" = "#1D3759")) +
  labs(x = "Grade") +
  theme_classic() + 
  theme(legend.position = "bottom",
        legend.title = element_blank(),
        axis.text = element_text(size = 15),
        axis.title = element_text(size = 20, face = "bold"),
        axis.line.x.bottom = element_line(size = 2.5))


# 0.16, 2
df_arrow_up = data.frame(x = c(0, 0.32, 0.32, 0.20, 0.20, 0.24, 0.16, 0.08, 0.12, 0.12, 0),
                         y = c(0, 0, 4, 4, 4.8, 4.8, 6, 4.8, 4.8, 4, 4))
df_arrow_dn = data.frame(x = c(0, 0.32, 0.32, 0.20, 0.20, 0.24, 0.16, 0.08, 0.12, 0.12, 0),
                         y = c(6, 6, 2, 2, 1.2, 1.2, 0, 1.2, 1.2, 2, 2))

ggplot(data = df_arrow_up,
       aes(x = x,
           y = y,
           group = 1)) + 
  geom_polygon(size = 5,
               color = "#000000",
               fill = "#FFFFFF")

ggplot(data = df_arrow_dn,
       aes(x = x,
           y = y,
           group = 1)) + 
  geom_polygon(size = 5,
               color = "#000000",
               fill = "#FFFFFF")

ggplot() + 
  geom_polygon(data = df_arrow_dn,
               aes(x = x,
                   y = y,
                   group = 1),
               size = 5,
               color = "#000000",
               fill = "#FFFFFF") + 
  geom_polygon(data = df_arrow_up,
               aes(x = x,
                   y = y + 9,
                   group = 1),
               size = 5,
               color = "#000000",
               fill = "#FFFFFF") + 
  lims(x = c(-0.3, 0.6))



df_arrow_poly = data.frame()
for(n in 1:nrow(df_agg_score)){
  # n = 2
  if(df_agg_score[n, "score_diff"] < 0){
    df_arrow_dn_create = data.frame(arr_x = df_arrow_dn$x + df_agg_score[n, "text_x_pos"],
                                    arr_y = df_arrow_dn$y + df_agg_score[n, "y_pos"] - 4,
                                    group = n)
    df_arrow_dn_create[, "arr_x"] = df_arrow_dn_create$arr_x - 0.36
    df_arrow_poly = rbind(df_arrow_poly, df_arrow_dn_create)
  } else {
    df_arrow_up_create = data.frame(arr_x = df_arrow_up$x + df_agg_score[n, "text_x_pos"],
                                    arr_y = df_arrow_up$y + df_agg_score[n, "y_pos"] - 2,
                                    group = n)
    df_arrow_up_create[, "arr_x"] = df_arrow_up_create$arr_x - 0.36
    df_arrow_poly = rbind(df_arrow_poly, df_arrow_up_create)
  }
}
head(df_arrow_poly)
df_arrow_poly[df_arrow_poly$group %% 2 == 0, "arr_x"] = df_arrow_poly[df_arrow_poly$group %% 2 == 0, "arr_x"] + 0.1

ggplot() + 
  geom_polygon(data = df_arrow_poly,
               aes(x = arr_x,
                   y = arr_y,
                   group = group),
               size = 1.5,
               color = "#000000",
               fill = "#FFFFFF")


ggplot() + 
  geom_col(data = df_agg, 
           aes(x = grade,
               y = score,
               group = year,
               fill = as.character(year)),
           position = "dodge",
           color = "#000000",
           size = 1) + 
  geom_text(data = df_agg,
            aes(x = text_x_pos + 0.015,
                y = score/2 - 0.15,
                group = year,
                label = round(score, 1)),
            color = "#000000",
            size = 6,
            angle = 90) +
  geom_text(data = df_agg,
            aes(x = text_x_pos,
                y = score/2,
                group = year,
                label = round(score, 1)),
            color = "#FFFFFF",
            size = 6,
            angle = 90) +
  geom_polygon(data = df_arrow_poly,
               aes(x = arr_x,
                   y = arr_y,
                   group = group),
               size = 1.2,
               color = "#000000",
               fill = "#FFFFFF") +
  geom_text(data = df_agg_score,
            aes(x = grade_pos,
                y = y_pos,
                label = sprintf(fmt = "%0.1f", round(score_diff, 1))),
            size = 5) +
  scale_x_continuous(expand = c(0.01, 0.01),
                     breaks = 1:5, labels = paste0(1:5, "학년")) +
  scale_y_continuous(expand = c(0.1, 0.1)) +
  scale_fill_manual(values = c("17" = "#EEEEEE",
                               "18" = "#A7CFF2",
                               "19" = "#1D3759")) +
  labs(x = "Grade") +
  theme_classic() + 
  theme(legend.position = c(0.86, 0.95),
        legend.direction = "horizontal",
        legend.title = element_blank(),
        legend.text = element_text(size = 15),
        axis.text.x = element_text(size = 20, vjust = 10),
        axis.text.y = element_blank(),
        axis.title.x = element_text(size = 20, face = "bold"),
        axis.title.y = element_blank(),
        axis.ticks = element_blank(),
        axis.line.y = element_blank(),
        axis.line.x.bottom = element_line(size = 2.5))
