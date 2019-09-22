pi_mont = function(x){
  cnt = 0
  for(num in 1:x){
    points = runif(2, min = -2, max = 2)
    points_rss = sqrt(sum(points^2))
    if(points_rss < 2){
      cnt = cnt + 1
    }
  }
  ratio = cnt / x
  return(4 * ratio)
}
pi_mont(1000)
