

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
EPI = EPI_data$EPI		# assign to new variable. I didn't want to use the attach thing
EPI = as.numeric(EPI)
invalid_rows = is.na(EPI)
filtered_EPI_data = EPI_data[!invalid_rows,]

EPI = filtered_EPI_data$EPI
Landlock = as.logical(as.numeric(filtered_EPI_data$Landlock))
EPILand = as.numeric(EPI[!Landlock])
Eland <- EPILand[!is.na(EPILand)]
#
hist(Eland)
hist(Eland, seq(30., 95., 1.0), prob=TRUE)

