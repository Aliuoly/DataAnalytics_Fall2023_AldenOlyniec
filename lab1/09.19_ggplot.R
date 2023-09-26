# plotting wt vs mpg
attach(mtcars)
plot(wt,mpg)

# install.packages("ggplot2")
sss
#now use ggplot
library(ggplot2)
??qplot
# using quickplot - same as plot
# qplot(wt,mpg)# this is deprecated - cant run

# now using ggplot
detach(mtcars)
ggplot(data = mtcars, mapping = aes(x = mtcars$wt, y = mtcars$mpg))+geom_point()
plot(pressure$temperature, pressure$pressure, type = 'l')
points(pressure$temperature, pressure$pressure)

close
lines(pressure$temperature, pressure$pressure/2,col = 'red')
points(pressure$temperature, pressure$pressure/2, col = 'blue')

ggplot(pressure, aes(x = temperature, y = pressure)) + geom_line()+ geom_point()

