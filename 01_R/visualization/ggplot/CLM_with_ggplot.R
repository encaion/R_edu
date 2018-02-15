library("ggplot2")
library("reshape2")

sample_size = 1:30

test_fun = function(sample_size,
                    trial = 1000,
                    p = 0.5,
                    mean = 0,
                    sd = 2,
                    dist = c("normal", "uniform", "binomial")){
  nums = if(dist == "normal"){
    rnorm(trial * sample_size, mean = mean, sd = sd)
  } else if(dist == "uniform"){
    runif(trial * sample_size)
  } else if(dist == "binomial"){
    sample(0:1, trial * sample_size, replace = TRUE, prob = c(p, 1 - p))
  }
  
  return(apply(matrix(nums, trial), MARGIN = 1, FUN = "mean"))
}

mat = sapply(sample_size, test_fun, dist = "binomial")
mat_melt = melt(mat)
colnames(mat_melt) = c("simulation", "sample_size", "mean")

ggplot(data = mat_melt,
       aes(x = mean,
           fill = as.factor(sample_size))) + 
  geom_histogram(aes(y = ..density..),
                 bins = 30) + 
  geom_density() + 
  facet_wrap( ~ sample_size) + 
  labs(title = "Central Limit Theorem Tested with different sample sizes",
       x = NULL, y = NULL, fill = "Sample Size") + 
  theme(axis.text  = element_blank(),
        axis.ticks = element_blank())
