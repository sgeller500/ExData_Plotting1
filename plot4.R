data_file <- "household_power_consumption.txt"
data <- read.table(data_file, header = TRUE, sep = ";", dec = ".", na.strings = "?")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

DT <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
time_axis <- as.POSIXct(DT)

globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)

SM1 <- as.numeric(subSetData$Sub_metering_1)
SM2 <- as.numeric(subSetData$Sub_metering_2)
SM3 <- as.numeric(subSetData$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

plot(time_axis, globalActivePower, type="l", xaxt = "n", xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at = c(time_axis[1], time_axis[1440], time_axis[2880]), labels = c("Thu","Fri","Sat"))

plot(time_axis, voltage, type="l", xaxt = "n", xlab="datetime", ylab="Voltage")
axis(1, at = c(time_axis[1], time_axis[1440], time_axis[2880]), labels = c("Thu","Fri","Sat"))

plot(DT, SM1, type="l", xaxt = "n", ylab="Energy Submetering", xlab="")
lines(DT, SM2, type="l", col="red")
lines(DT, SM3, type="l", col="blue")
axis(1, at = c(time_axis[1], time_axis[1440], time_axis[2880]), labels = c("Thu","Fri","Sat"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty = "n")

plot(time_axis, globalReactivePower, type="l", xaxt = "n", xlab="datetime", ylab="Global_reactive_power")
axis(1, at = c(time_axis[1], time_axis[1440], time_axis[2880]), labels = c("Thu","Fri","Sat"))
dev.off()


