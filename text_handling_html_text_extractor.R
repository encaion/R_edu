text_extractor = function(x, start_pattern = ">", end_pattern = "<", adj_start = 1, adj_end = -1){
  pattern_position_start = gregexpr(pattern = start_pattern, text = x)[[1]]
  pattern_position_end   = gregexpr(pattern =   end_pattern, text = x)[[1]]
  
  if(start_pattern == ">"){
    pattern_count = length(pattern_position_start)
    text = substr(x = x, 
                  start = pattern_position_start[pattern_count/2] + adj_start,
                  stop  = pattern_position_end[pattern_count/2 + 1] + adj_end)
  } else { 
    text = substr(x = x, 
                  start = pattern_position_start + adj_start,
                  stop  = pattern_position_end   + adj_end)
  }
  return(text)
}
