library(gdata) 

library(xlsx)
bronx1<-read.xlsx(file.choose(),pattern="BOROUGH",stringsAsFactors=FALSE,sheetIndex=1,startRow=5,header=TRUE)
#View(bronx1)
summary(bronx1)
# there are many NAs and 0's (missing data i assume) in land and gross square feet.
# There are also VERY LOW sale prices - prices of 0, 1, 2, 3, 4, etc. are obviously wrong.
# will remove any sale price under 10000 dollars
library(dplyr)
bronx1 = bronx1 %>% filter(!is.na(GROSS.SQUARE.FEET)) %>% filter(!is.na(LAND.SQUARE.FEET)) %>% filter(SALE.PRICE > 10000) %>% filter(GROSS.SQUARE.FEET > 0)
summary(bronx1)
# better, should be fine to do regression now
attach(bronx1) # If you choose to attach, leave out the "data=." in lm regression
plot(log(GROSS.SQUARE.FEET), log(SALE.PRICE)) 

m1<-lm(log(SALE.PRICE)~log(GROSS.SQUARE.FEET))
summary(m1)
abline(m1,col="red",lwd=2)
plot(resid(m1))

# Model 2

m2<-lm(log(bronx1$SALE.PRICE)~log(bronx1$GROSS.SQUARE.FEET)+log(bronx1$LAND.SQUARE.FEET)+factor(bronx1$NEIGHBORHOOD))
summary(m2)
plot(resid(m2))
# Suppress intercept - using "0+ ..."
m2a<-lm(log(bronx1$SALE.PRICE)~0+log(bronx1$GROSS.SQUARE.FEET)+log(bronx1$LAND.SQUARE.FEET)+factor(bronx1$NEIGHBORHOOD))
summary(m2a)
plot(resid(m2a))

# Model 3
m3<-lm(log(bronx1$SALE.PRICE)~0+log(bronx1$GROSS.SQUARE.FEET)+log(bronx1$LAND.SQUARE.FEET)+factor(bronx1$NEIGHBORHOOD)+factor(bronx1$BUILDING.CLASS.CATEGORY))
summary(m3)
plot(resid(m3))

# Model 4
m4<-lm(log(bronx1$SALE.PRICE)~0+log(bronx1$GROSS.SQUARE.FEET)+log(bronx1$LAND.SQUARE.FEET)+factor(bronx1$NEIGHBORHOOD)*factor(bronx1$BUILDING.CLASS.CATEGORY))
summary(m4)
plot(resid(m4))
# so m2a is probably best model in terms of generalization. m3 and m4 do not improve much but has more features
# i.e., m3 and m4 are more likely overfitted
