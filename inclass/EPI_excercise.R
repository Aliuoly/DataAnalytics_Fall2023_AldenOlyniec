path = 'C:/Users/alden/Desktop/Data Analytics/Class excercises/datasets/2010EPI_data.csv'
data = read.csv(path,header=TRUE)
column_names = as.matrix(data[1,])
colnames(data) = column_names
data = data[-1,]

summary(data)
