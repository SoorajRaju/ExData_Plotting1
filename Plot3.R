# Plot 3
# Plot of energy vs day

Proj_Data <- read.csv("household_power_consumption.txt",sep=";",colClasses=c(rep("character",2),rep("numeric",7)),na.strings="?")

# Combine the date and time columns into one timestapm
Proj_Data$Timestamp <- strptime(paste(Proj_Data$Date,Proj_Data$Time),format="%d/%m/%Y %H:%M:%S")

# Subset Data 
Subset_Dat = subset(Proj_Data,as.Date(Proj_Data$Timestamp) >= "2007-02-01" & as.Date(Proj_Data$Timestamp) < "2007-02-03")

# Plot the figure
png(filename="Plot3.png", height=480, width=480, bg="transparent")
plot(Subset_Dat$Timestamp,Subset_Dat$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(Subset_Dat$Timestamp,Subset_Dat$Sub_metering_2,type="l",col="red")
lines(Subset_Dat$Timestamp,Subset_Dat$Sub_metering_3,type="l",col="blue")
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=2,col=c("black","red","blue"))
dev.off()