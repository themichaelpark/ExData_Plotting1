household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors=FALSE)
data <- rbind(household_power_consumption[household_power_consumption$Date == "1/2/2007",],
              household_power_consumption[household_power_consumption$Date == "2/2/2007",])
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data[, 3:9] <- sapply(data[, 3:9], as.numeric)

png(filename = "plot2.png", width = 480, height = 480)
plot(y = data$Global_active_power, x = data$Time, ylab = "Global Active Power (kilowatts)", type = "l", xlab = "")
dev.off()
