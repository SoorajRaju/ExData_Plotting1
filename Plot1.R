# Plot 1
# Frequency vs Global Active Power

# getting the data from website
if (!file.exists("Proj_Data")) {
dir.create("Proj_Data")

# file URL & destination file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- "./data/power_consumption.zip"

#download the file 
#download.file(fileUrl, destfile)
#Record the download time
dateDownloaded <- date()
}
# set the file to read
#d <- file("./data/household_power_consumption.txt", "r");

Proj_Data <- read.csv("./data/household_power_consumption.txt",sep=";",colClasses=c(rep("character",2),rep("numeric",7)),na.strings="?")

# Concatenate the date and time with the required format
Proj_Data$Timestamp <- strptime(paste(Proj_Data$Date,Proj_Data$Time),format="%d/%m/%Y %H:%M:%S")

# create subset of data
Sub_Proj_Data = subset(Proj_Data,as.Date(Proj_Data$Timestamp) >= "2007-02-01"& as.Date(Proj_Data$Timestamp) < "2007-02-03")

# plot the figure
png(filename="Plot1.png", height=480, width=480, bg="transparent")
hist(Sub_Proj_Data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()