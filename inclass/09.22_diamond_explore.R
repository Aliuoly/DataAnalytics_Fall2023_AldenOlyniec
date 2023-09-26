library(ggplot2)
data(diamonds)


head(diamonds)

ggplot(diamonds) + geom_histogram(aes(x=x),binwidth = 0.5)
