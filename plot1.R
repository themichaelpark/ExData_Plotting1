household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors=FALSE, na.strings = "?")

data <- rbind(household_power_consumption[household_power_consumption$Date == "1/2/2007",],
              household_power_consumption[household_power_consumption$Date == "2/2/2007",])
data$Global_active_power <- as.numeric(data$Global_active_power)

png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()

