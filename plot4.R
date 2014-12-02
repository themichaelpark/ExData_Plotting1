household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors=FALSE)
data <- rbind(household_power_consumption[household_power_consumption$Date == "1/2/2007",],
              household_power_consumption[household_power_consumption$Date == "2/2/2007",])
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data[, 3:9] <- sapply(data[, 3:9], as.numeric)

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(y = data$Global_active_power, x = data$Time, ylab = "Global Active Power (kilowatts)", type = "l", xlab = "")

plot(y = data$Voltage , x = data$Time, ylab = "Voltage", xlab = "datetime", type ="l")

plot(x = data$Time, y = data$Sub_metering_1, ylab = "Energy sub metering", type = "l", xlab = "")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")

plot(y = data$Global_reactive_power , x = data$Time, xlab = "datetime", type = "l")

dev.off()
