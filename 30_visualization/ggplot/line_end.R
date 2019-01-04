# http://sape.inf.usi.ch/quick-reference/ggplot2/lineend
d=data.frame(x=c(0,2,0), y=c(0,1,2))
t=data.frame(x=c(0,1,2), l=c("round", "butt", "square"))
ggplot() +
geom_path(data=d, mapping=aes(x=x, y=y), size=10, lineend="round") +
geom_path(data=d, mapping=aes(x=x+1, y=y), size=10, lineend="butt") +
geom_path(data=d, mapping=aes(x=x+2, y=y), size=10, lineend="square") +
geom_path(data=d, mapping=aes(x=x, y=y), size=1, color="white") +
geom_path(data=d, mapping=aes(x=x+1, y=y), size=1, color="white") +
geom_path(data=d, mapping=aes(x=x+2, y=y), size=1, color="white") + 
geom_text(data=t, mapping=aes(x=x+0.15, y=0, label=l), hjust=0, vjust=1.2)
