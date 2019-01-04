# install.packages("data.table")
# install.packages("binhf")
data.table::shift(1:5, n = 1, type = "lag")
binhf::shift(1:5, places = 1, dir = "right")
