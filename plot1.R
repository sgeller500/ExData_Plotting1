data_file <- "household_power_consumption.txt"
data <- read.table(data_file, header = TRUE, sep = ";", dec = ".", na.strings = "?")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

png("plot1.png", width=480, height=480)
hist(subSetData[, "Global_active_power"], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
