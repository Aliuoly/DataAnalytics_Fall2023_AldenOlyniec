EPI_data <- read.csv(file.choose(),header = TRUE)
#View(EPI_data)
# somehow even when header=TRUE is passed, header is not correctly configured
# fix the header:
column_names = as.matrix(EPI_data[1,])
EPI_data = EPI_data[-1,]
colnames(EPI_data) = column_names

#notices that somehow there are only 164 entries but still R thinks theres 65467 entries
# will use a purely numeric column as criteria for row removal
# will use EPI since its mostly present
EPI = EPI_data$		# assign to new variable. I didn't want to use the attach thing
EPI = as.numeric(EPI)
invalid_rows = is.na(EPI)
filtered_EPI_data = EPI_data[!invalid_rows,]

# exploring climate column
climate = as.numeric(filtered_EPI_data$CLIMATE)

# get some summary metrics and plots
summary(climate) 	# stats
fivenum(climate,na.rm=TRUE)
#help(stem)
stem(climate)		 # stem and leaf plot
#help(hist)
hist(climate)
hist(climate, seq(2., 159., 1.0), prob=TRUE) #using the entire range of the climate data, with bin witdths of 1
#help(lines)
lines(density(climate,na.rm=TRUE,bw="SJ")) # or try bw=“SJ”
#help(rug)
rug(climate) 
# in conclusion, climate metric is very uniform across all EPI countries in 2010


#Cumulative Density Function
plot(ecdf(climate), do.points=FALSE, verticals=TRUE) 
#Quantile-Quantile?
par(pty="s") 
qqnorm(climate); qqline(climate)
#Simulated data from t-distribution:
x <- rt(250, df = 5)
qqnorm(x); qqline(x)
#Make a Q-Q plot against the generating distribution by: x<-seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)

help(distributions)
# try different ones.....
# will try a uniform distribution since earlier analysis suggests such a distribution
x = runif(250, min = 2., max = 139.)
qqnorm(x); qqline(x)
# that looks exactly like the QQ plot of climate

# lets explore agriculture - since I assume that will correlate with climate
agri = as.numeric(filtered_EPI_data$AGRICULTURE)

# get some summary metrics and plots
summary(agri) 	# stats
fivenum(agri,na.rm=TRUE)
#help(stem)
stem(agri)		 # stem and leaf plot
#help(hist)
hist(agri, seq(2., 115., 1.0), prob=TRUE) #using the entire range of the climate data, with bin witdths of 1
#help(lines)
lines(density(climate,na.rm=TRUE,bw="SJ")) # or try bw=“SJ”
#help(rug)
rug(climate) 
# in conclusion, agriculture metric is pretty uniform across all EPI countries in 2010


#Cumulative Density Function
plot(ecdf(agri), do.points=FALSE, verticals=TRUE) 
#Quantile-Quantile?
par(pty="s") 
qqnorm(agri); qqline(agri)
# will try a uniform distribution since earlier analysis suggests such a distribution
x = runif(250, min = 2., max = 115.)
qqnorm(x); qqline(x)
# that looks pretty much like the QQ plot of climate

#lets also explore the interplay of agriculture and climate
qqplot(climate, agri)
# roughtly straight, i guess? i.e., same distribution

# lets check again with box plots
boxplot(climate, agri)
# while from QQ plot it looks like both share the same distribution type
# from box plot it is clear the two have difference mean and std (obviously)
