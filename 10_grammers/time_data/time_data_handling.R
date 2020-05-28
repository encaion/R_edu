aa = as.POSIXlt("2017-03-30")
bb = as.POSIXct("2017-03-30")

str(aa)
str(bb)

class(aa)
class(bb)

unclass(aa)
unclass(bb)

as.POSIXct(1490799600, origin = "1970-01-01 00:00:00")

library("lubridate")
tt = ymd("2020-05-28")
paste0(as.numeric(tt), "000")

as_datetime(1587443975)
as_datetime(0000000001)
as.POSIXct(1, origin = "1970-01-01", tz = "UTC")
