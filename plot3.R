# Read data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Select data
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Add Datetime
data$Datetime <- as.POSIXct(paste(data$Date, data$Time))

# Plot
with(data, {
    plot(Sub_metering_1 ~ Datetime, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(Sub_metering_2 ~ Datetime, col = "red")
    lines(Sub_metering_3 ~ Datetime, col = "blue")
})

legend("topright", col = c("black", "red", "blue"), lty = 1,
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save into PNG file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
