dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=T, sep=";", stringsAsFactors = FALSE)


subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)


png(file="plot1.png", width=480, height=480)
hist(subdata$Global_active_power,col="red", xlab="Global Active Power(Kilowatts)", main="Global Active Power")
dev.off()

cat("Plot1.png has been saved in", getwd())