htmltag_stripper = function(tags){
  return(gsub(pattern = "<.*?>", replacement = "", x = tags))
}
