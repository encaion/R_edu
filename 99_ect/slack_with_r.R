# reference
# https://cran.r-project.org/web/packages/slackr/slackr.pdf

# setup
library("slackr")
slackr_setup(api_token = "", 
             channel = "#data", 
             username = "bot", 
             icon_emoji = ":grin:")

# checking channels in workspace
slackr_channels()

# text
text_slackr(text = "asdf")
text_slackr(text = "asdf", as_user = TRUE)

# plot
library("ggplot2")
gg_point = ggplot() + 
  geom_point(aes(x = 1:10,
                 y = 1:10))
ggslackr(plot = gg_point,
         width = 100, height = 100, units = "mm")

ggslackr(channels = "@encaionkim", # send message to specific user
         plot = gg_point,
         width = 100, height = 100, units = "mm")
