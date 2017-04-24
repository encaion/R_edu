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

# > dates_sub
#  [1] "\t\t\t\t\t\t\t<dd class=\"txt_inline\">2017.04.19.</dd>" "\t\t\t\t\t\t\t<dd class=\"txt_inline\">2017.04.05.</dd>"
#  [3] "\t\t\t\t\t\t\t<dd class=\"txt_inline\">2017.04.11.</dd>" "\t\t\t\t\t\t\t<dd class=\"txt_inline\">2017.04.24.</dd>"
#  [5] "\t\t\t\t\t\t\t<dd class=\"txt_inline\">2017.03.17.</dd>" "\t\t\t\t\t\t\t<dd class=\"txt_inline\">2017.04.20.</dd>"
#  [7] "\t\t\t\t\t\t\t<dd class=\"txt_inline\">2017.04.24.</dd>" "\t\t\t\t\t\t\t<dd class=\"txt_inline\">2017.04.23.</dd>"
#  [9] "\t\t\t\t\t\t\t<dd class=\"txt_inline\">2017.04.17.</dd>" "\t\t\t\t\t\t\t<dd class=\"txt_inline\">2017.04.05.</dd>"

# > text_extractor(dates_sub)
#  [1] "2017.04.19." "2017.04.05." "2017.04.11." "2017.04.24." "2017.03.17." "2017.04.20." "2017.04.24." "2017.04.23."
#  [9] "2017.04.17." "2017.04.05."
