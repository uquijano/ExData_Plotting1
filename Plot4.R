
##plot 2 rows 2 cols 
par(mfrow=c(2,2))
#plot1 
plot(total$timestamp,total$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#plot2
plot(total$timestamp,total$Voltage, type="l", xlab="datetime", ylab="Voltage")
#plot3
plot(total$timestamp,total$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(total$timestamp,total$Sub_metering_2,col="red")
lines(total$timestamp,total$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)
#plot4
plot(total$timestamp,total$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
#Copy png
dev.copy(png, file="plot_4.png", width=480, height=480)
#Close Device 
dev.off()
