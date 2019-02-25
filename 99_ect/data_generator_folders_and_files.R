library("lubridate")

dir.create("Item_19274_DB")
setwd("./Item_19274_DB")

for(n in 1:100){
  # n = 1
  dir.create(as.character(as.Date(Sys.time()) - n))
}

dir_list = list.dirs(full.names = FALSE, recursive = FALSE)

for(n in 1:length(dir_list)){
  setwd(paste0("./", dir_list[n]))
  
  random_number = sample(3:10, 1)
  sample_df = data.frame( aa = 1:random_number,
                          bb = runif(random_number))
  write.csv(sample_df, 
            paste0("POS_", dir_list[n], "_", sample(100:299, 1), ".csv"),
            row.names = FALSE)
  write.csv(sample_df, 
            paste0("POS_Backup_", dir_list[n], "_", sample(100:299, 1), ".csv"),
            row.names = FALSE)
  
  sample_df = data.frame(aa = 1:random_number,
                        bb = sample(0:1, replace = TRUE, size = random_number))
  write.csv(sample_df, paste0("Item_promo_", dir_list[n], "_", sample(100:299, 1), ".csv"), 
            row.names = FALSE)
  
  setwd("..")
}
setwd("..")
