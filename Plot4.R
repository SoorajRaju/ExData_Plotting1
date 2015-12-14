# Plot 4

Proj_Data <- read.csv("household_power_consumption.txt",sep=";",colClasses=c(rep("character",2),rep("numeric",7)),na.strings="?")

# Combine the date and time 
Proj_Data$Timestamp <- strptime(paste(Proj_Data$Date,Proj_Data$Time),format="%d/%m/%Y %H:%M:%S")

# Subset the data 
Sub_Proj_Data = subset(Proj_Data,as.Date(Proj_Data$Timestamp) >= "2007-02-01" & as.Date(Proj_Data$Timestamp) < "2007-02-03")

# Plot the data in 4 figures
png(filename="Plot4.png", height=480, width=480, bg="transparent")
par(mfrow=c(2,2))

#Sub plot 1 - Global Active Power
plot(Sub_Proj_Data$Timestamp,Sub_Proj_Data$Global_active_power,type="l", xlab="",ylab="Global Active Power")
#Sub plot 2 - Voltage
plot(Sub_Proj_Data$Timestamp,Sub_Proj_Data$Voltage,type="l",xlab="datetime",ylab="Voltage")
#Sub plot 3 - Energy  
plot(Sub_Proj_Data$Timestamp,Sub_Proj_Data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(Sub_Proj_Data$Timestamp,Sub_Proj_Data$Sub_metering_2,type="l",col="red")
lines(Sub_Proj_Data$Timestamp,Sub_Proj_Data$Sub_metering_3,type="l",col="blue")
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=2,col=c("black","red","blue"),bty="n")
#Sub plot 4 - Global Reactive Power
plot(Sub_Proj_Data$Timestamp,Sub_Proj_Data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()