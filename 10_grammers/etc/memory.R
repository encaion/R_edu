memory.size()
# memory.limit()


# source: https://stackoverflow.com/questions/6457290/how-to-check-the-amount-of-ram-in-r
# R> memfree <- as.numeric(system("awk '/MemFree/ {print $2}' /proc/meminfo", intern=TRUE))
# R> memfree
# [1] 3342480
