myfun = function(x, y = 1, z = c("a", "b", "c")){
  print(x)
  print(y)
  print(z)
  
  aa = switch(z,
         "a" = plot(1:10, 1:10),
         "b" = plot(10:1, 10:1),
         "c" = plot(5, 5))
  print(aa)
}

myfun()
# Error in print(x) : argument "x" is missing, with no default

myfun(x = "hi!")
# [1] "hi!"
# [1] 1
# [1] "a" "b" "c"
# Error in switch(z, a = plot(1:10, 1:10), b = plot(10:1, 10:1), c = plot(5,  : 
# EXPR must be a length 1 vector

myfun(x = "hi!", z = "a")
# [1] "hi!"
# [1] 1
# [1] "a"
# NULL
