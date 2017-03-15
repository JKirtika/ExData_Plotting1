dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=T, sep=";", stringsAsFactors = FALSE)


subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
subdata$Global_reactive_power <- as.numeric(subdata$Global_reactive_power)
subdata$Voltage <- as.numeric(subdata$Voltage)
subdata$Sub_metering_1 <- as.numeric(subdata$Sub_metering_1)
subdata$Sub_metering_2 <- as.numeric(subdata$Sub_metering_2)
subdata$Sub_metering_3 <- as.numeric(subdata$Sub_metering_3)

subdata$timestamp <- strptime(paste(subdata$Date, subdata$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot4.png", width=480,height=480)
par(mfrow=c(2,2))
plot(subdata$timestamp, subdata$Global_active_power, type="l",xlab="",ylab="Global Active Power")
plot(subdata$timestamp, subdata$Voltage, type="l", xlab="datetime",ylab="Voltage")
plot(subdata$timestamp, subdata$Sub_metering_1, type="l", xlab="",ylab="Energy Sub Metering")
lines(subdata$timestamp, subdata$Sub_metering_2, col="red")
lines(subdata$timestamp, subdata$Sub_metering_3, col="blue")
plot(subdata$timestamp, subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()


cat("Plot4.png has been saved in", getwd())