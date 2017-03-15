dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=T, sep=";", stringsAsFactors = FALSE)


subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subdata$Sub_metering_1 <- as.numeric(subdata$Sub_metering_1)
subdata$Sub_metering_2 <- as.numeric(subdata$Sub_metering_2)
subdata$Sub_metering_3 <- as.numeric(subdata$Sub_metering_3)
subdata$timestamp <- strptime(paste(subdata$Date, subdata$Time), "%d/%m/%Y %H:%M:%S")


png(file="plot3.png", width=480, height=480)
plot(subdata$timestamp, subdata$Sub_metering_1, type="l",xlab="", ylab="Enery Sub Metering")
lines(subdata$timestamp, subdata$Sub_metering_2,col="red")
lines(subdata$timestamp, subdata$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1)
dev.off()


cat("Plot3.png has been saved in", getwd())