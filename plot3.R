png(file="plot3.png", width=480, height=480)
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")
data$Date <-as.Date(data$Date, format="%d/%m/%Y")
data2<-subset(data,data$Date=="2007-2-1"|data$Date=="2007-2-2")
data2$dateTime<-as.POSIXct(strptime(paste(data2$Date, data2$Time), format="%F %H:%M:%S"))
plot(data2$dateTime, data2$Sub_metering_1, type="l", color="black", ylab= "Energy sub metering")
lines(data2$dateTime, data2$Sub_metering_2, type="l", col="red")
lines(data2$dateTime, data2$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
