data_file <- "household_power_consumption.txt"
data <- read.table(data_file, header = TRUE, sep = ";", dec = ".", na.strings = "?")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

DT <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
time_axis <- as.POSIXct(DT)
globalActivePower <- as.numeric(subSetData$Global_active_power)

png("plot2.png", width=480, height=480)
plot(time_axis, globalActivePower, type="l", xaxt = "n", xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at = c(time_axis[1], time_axis[1440], time_axis[2880]), labels = c("Thu","Fri","Sat"))
dev.off()
