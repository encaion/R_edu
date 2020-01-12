#### 1. Environment & connection ####
# install.packages("aws.s3")
library("aws.s3")
library("lubridate")

source("00_environment_setting.R", encoding = "UTF-8")

#### 2. Object checking #### 
# bucket이 1개 있는 경우는 양식이 올바르지 않다.
ls_bucket = bucketlist()
class(ls_bucket)

ls_bucket

ls_bucket[, "CreationDate"] = ymd_hms(ls_bucket$CreationDate, 
                                      tz = "Asia/Seoul")
ls_bucket

bucket = ls_bucket[1, "Bucket"]
# get_bucket(bucket = bucket)
ls_object = get_bucket(bucket = bucket)
ls_object_parsed = as.character(lapply(ls_object, FUN = "[[", 1))
ls_object_parsed = grep(pattern = "[^/]$", ls_object_parsed, value = TRUE)
ls_object_parsed

s3_obj_list = function(bucket){
  obj_list = get_bucket(bucket = bucket)
  obj_list = as.character(lapply(obj_list, FUN = "[[", 1))
  obj_list = grep(pattern = "[^/]$", obj_list, value = TRUE)
  return(obj_list)
}


head_object(object = "bike.csv", bucket = bucket)

for(list_f in ls_object_parsed){
  print(head_object(list_f, bucket = bucket))
  Sys.sleep(2)
}

#### 3. Object Reading ####
#### __ 1) raw ####
df_raw = get_object(object = ls_object_parsed[1], bucket = bucket)
head(df_raw)

df_raw_char = rawToChar(df_raw)
head(df_raw_char)

df_parsed = read.csv(textConnection(df_raw_char),
                     stringsAsFactors = FALSE)
head(df_parsed)

#### __ 2) function ####
df_using = s3read_using(FUN = read.csv, 
                        object = ls_object_parsed[1],
                        bucket = bucket)
head(df_using)

#### 4. Object Writing ####
s3write_using(x = iris[1:2, 1:2],
              FUN = write.csv,
              object = "iris_2by2.csv",
              bucket = bucket)

# 확인
s3read_using(FUN = read.csv, 
             object = "iris_2by2.csv",
             bucket = bucket)
# rownames = FALSE 가 필요하다. 

s3write_using(x = iris[1:2, 1:2],
              FUN = write.csv,
              object = "iris_2by2_row_FALSE.csv",
              bucket = bucket,
              row.names = FALSE)

s3read_using(FUN = read.csv, 
             object = "iris_2by2_row_FALSE.csv",
             bucket = bucket)

#### 5. Object Delete ####
delete_object(object = "iris_2by2_row_FALSE.csv", 
              bucket = bucket,
              quiet = TRUE)
s3_obj_list(bucket = bucket)
