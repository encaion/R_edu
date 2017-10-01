aa = as.POSIXlt("2017-03-30")
bb = as.POSIXct("2017-03-30")

str(aa)
str(bb)

class(aa)
class(bb)

unclass(aa)
unclass(bb)

as.POSIXct(1490799600, origin = "1970-01-01 00:00:00")
