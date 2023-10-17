require(randomForest)
fitKF <- randomForest(Kyphosis ~ Age + Number + Start,   data=kyphosis)
print(fitKF) 	# view results
importance(fitKF) # importance of each predictor
#
fitSwiss <- randomForest(Fertility ~ Agriculture + Education + Catholic, data = swiss)
print(fitSwiss) # view results
importance(fitSwiss) # importance of each predictor
varImpPlot(fitSwiss)

plot(fitSwiss)

getTree(fitSwiss,1, labelVar=TRUE)

help(randomForest) # look at all the package contents and the randomForest method options

# look at rfcv - random forest cross-validation - 
help(rfcv)

# other data....
data(imports85)

# perform randomForest and other tree methods.....
library(dplyr)
removed_missing_data = imports85 %>% select(!"normalizedLosses") %>% na.omit()
fit_newdata = randomForest(price ~., data = removed_missing_data)
print(fit_newdata)
plot(fit_newdata)

cv = rfcv(trainx = removed_missing_data %>% select(!"price"), trainy = removed_missing_data$price)

with(cv, plot(n.var, error.cv, log = "x"))
# so more variable is better I guess, not far from expectation. might not be the case for validation set
