library("ggplot2")
library("colorspace")

pi = data.frame(companies = LETTERS[1:12],
                `CNG stations opened` = c(396, 24, 42, 3, 3, 7,
                                          54, 31, 2, 421, 245, 5))
class(pi)
# [1] "data.frame"
class(pi$companies)
# [1] "factor"

pi[, "per"] = round(pi[, 2]/sum(pi[, 2]) * 100, 1)
#    companies CNG.stations.opened  per
# 1          A                 396 32.1
# 2          B                  24  1.9
# 3          C                  42  3.4
# 4          D                   3  0.2
# 5          E                   3  0.2
# 6          F                   7  0.6
# 7          G                  54  4.4
# 8          H                  31  2.5
# 9          I                   2  0.2
# 10         J                 421 34.1
# 11         K                 245 19.9
# 12         L                   5  0.4


colors = rainbow_hcl(12)
names(colors) = pi$companies

ggplot(data = pi, 
       aes(x = "", 
           y = per, 
           fill = companies)) +
  geom_col(width = 1, size = 1, color = "white") +
  coord_polar(theta = "y") +
  geom_text(aes(label = paste0(round(per), "%")), 
            position = position_stack(vjust = 0.5)) +
  labs(x = NULL, y = NULL, fill = NULL, 
       title = "Companies opened CNG stations in 2017-18") +
  guides(fill = guide_legend(reverse = TRUE)) +
  scale_fill_manual(values = colors) +
  theme_classic() +
  theme(axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        plot.title = element_text(hjust = 0.5, color = "#666666"))
