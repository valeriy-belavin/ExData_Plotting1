# Read data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Select data
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Add Datetime
data$Datetime <- as.POSIXct(paste(data$Date, data$Time))

# Plot
par(mfrow= c(2, 2), mar = c(5, 4, 2, 1))

with(data, {
    plot(Global_active_power ~ Datetime, type = "l", 
         xlab = "", ylab = "Global Active Power (kilowatts)")
    plot(Voltage ~ Datetime, type = "l", 
         xlab = "datetime", ylab = "Voltage (volt)")
    plot(Sub_metering_1 ~ Datetime, type = "l", 
         xlab = "", ylab = "Global Active Power (kilowatts)")
    
    lines(Sub_metering_2 ~ Datetime, col = "red")
    lines(Sub_metering_3 ~ Datetime, col = "blue")

    legend("topright", col = c("black", "red", "blue"), lty = 1, bty = "n",
      legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

    plot(Global_reactive_power ~ Datetime, type= "l",
      xlab= "datetime", ylab= "Global Rective Power (kilowatts)")
})

# Save into PNG file
dev.copy(png, file= "plot4.png", height= 480, width= 480)
dev.off()
