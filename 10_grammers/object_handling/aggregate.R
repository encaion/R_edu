data("diamonds", package = "ggplot2")
dia = as.data.frame(diamonds)
head(dia)

# single
dia_agg = aggregate(data = dia, price ~ color, FUN = "mean")
dia_agg = aggregate(data = dia, price ~ color + clarity, FUN = "mean")


# multi
dia_agg = aggregate(data = dia[, c("depth", "table", "color")], . ~ color, FUN = "mean")
dia_agg = aggregate(data = dia[, c("depth", "table", "color")], . ~ color + clarity, FUN = "mean")

