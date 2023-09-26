wd = getwd()
path = file.path(wd, 'datasets','multivariate.csv')
multivariate = read.csv(path,header = TRUE)
head(multivariate)
help(lm)


attach(multivariate)
mm = lm(Homeowners ~ Immigrants)
summary(mm)$coef

coefs = mm$coef
b = coefs['(Intercept)']
m = coefs['Immigrants']
pred = m*Immigrants + b
plot(Homeowners, pred)
lines(Homeowners, Homeowners)

plot(Homeowners~Immigrants)
help(abline)
abline(mm)
abline(mm,col=2, lwd = 3) # color 2 line width 3
attributes(mm)
