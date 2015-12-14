# Plot 2
# Global Active Power vs day

Proj_Data <- read.csv("household_power_consumption.txt",sep=";",colClasses=c(rep("character",2),rep("numeric",7)),na.strings="?")

# Concatenate the date and time with the required format
Proj_Data$Timestamp <- strptime(paste(Proj_Data$Date,Proj_Data$Time),format="%d/%m/%Y %H:%M:%S")

# Subset the Proj_Data only with needed date
Sub_Proj_Data = subset(Proj_Data,as.Date(Proj_Data$Timestamp) >= "2007-02-01" & as.Date(Proj_Data$Timestamp) < "2007-02-03")

# Plot the figure
png(filename="Plot2.png", height=480, width=480, bg="transparent")
plot(Sub_Proj_Data$Timestamp,Sub_Proj_Data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()