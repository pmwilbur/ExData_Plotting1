# plot3.R
#
# Script exists in C:\Users\Peter.Wilbur\RStuff\ExploreData
#

# read data into table

df <- read.table("household_power_consumption.txt",header = TRUE,sep = ";", stringsAsFactors = FALSE)

# change the date format in the data frame

df$Date <- paste(df$Date,df$Time)
df$Date <- strptime(df$Date, "%d/%m/%Y %T")

# trim the data frame to 2/1/2007 to 2/2/2007

df1 <- subset(df,df$Date > as.POSIXct('2007-02-01 00:00:00'))
df2 <- subset(df1,df1$Date < as.POSIXct('2007-02-03 00:00:00'))

# create line plot

plot(df2$Date,df2$Sub_metering_1,pch="'",xlab="",ylab="Energy sub metering")
lines(df2$Date,df2$Sub_metering_1,col="black")
lines(df2$Date,df2$Sub_metering_2,col="red")
lines(df2$Date,df2$Sub_metering_3,col="blue")
legend("topright",c("Sub Meter 1","Sub Meter 2","Sub Meter 3"), lty=c(1,1,1),col=c("black","red","blue"))
