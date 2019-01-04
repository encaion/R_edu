set.seed(123)
table1 = data.frame(id = sample(sprintf("%06d", 1:999999), size = 10^3, replace = FALSE),
                    start_at  = sample(seq(as.POSIXct("2017-01-01"), 
                                           as.POSIXct("2017-06-30"),
                                           by = "15 sec"),
                                       size = 10^5, replace = TRUE),
                    finish_at = sample(seq(as.POSIXct("2017-01-01"), 
                                           as.POSIXct("2017-06-30"),
                                           by = "15 sec"),
                                       size = 10^5, replace = TRUE),
                    stringsAsFactors = FALSE)


table2 = data.frame(id = sample(table1$id, size = 10^5, replace = TRUE),
                    score = sample(seq(10, 100, by = 10), size = 10^5, replace = TRUE),
                    created_at = sample(seq(as.POSIXct("2017-01-01"), 
                                            as.POSIXct("2017-06-30"),
                                            by = "15 sec"),
                                        size = 10^5, replace = TRUE),
                    stringsAsFactors = FALSE)

user_id = table1$id[2]
timestamps = range(table1[table1$id == user_id, "start_at"])
table2_sub = table2[(table2$id == user_id) & 
                      (table2$created_at >= timestamps[1]) &
                      (table2$created_at <= timestamps[2]), ]
head(table2_sub)
