# plot1.R
#
# Script exists in C:\Users\Peter.Wilbur\RStuff\ExploreData
#

# read data into table

df <- read.table("household_power_consumption.txt",header = TRUE, na.strings= "?",sep = ";", stringsAsFactors = FALSE)

# change the date format in the data frame

df$Date <- paste(df$Date,df$Time)
df$Date <- strptime(df$Date, "%d/%m/%Y %T")

# trim the data frame to 1/2/2007 to 2/2/2007

df1 <- subset(df,df$Date > as.POSIXct('2007-01-02 00:00:00'))
df2 <- subset(df1,df1$Date < as.POSIXct('2007-02-03 00:00:00'))

# create line plot

hist(as.numeric(df2$Global_active_power),breaks=10,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

