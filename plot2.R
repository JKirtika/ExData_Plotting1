dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=T, sep=";", stringsAsFactors = FALSE)


subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
subdata$timestamp <- strptime(paste(subdata$Date, subdata$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot2.png", width=480, height=480)
plot(subdata$timestamp, subdata$Global_active_power, type="l",xlab="", ylab="Global Active Power (Kilowatts)")
dev.off()


cat("Plot2.png has been saved in", getwd())


