memory.size()
# memory.limit()

cat("GB =", round(sum(gc()[,2])/1024, 3), "\n")
# Ncells + Vcells

# source: https://stackoverflow.com/questions/6457290/how-to-check-the-amount-of-ram-in-r
# R> memfree <- as.numeric(system("awk '/MemFree/ {print $2}' /proc/meminfo", intern=TRUE))
# R> memfree
# [1] 3342480
