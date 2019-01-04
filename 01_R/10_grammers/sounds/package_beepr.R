install.packages("beepr")
library("beepr")
beep(3)

for(n in 1:11){
  beep(n)
  print(paste0("==== Sound No.", n, " ===="))
  Sys.sleep(3)
}
