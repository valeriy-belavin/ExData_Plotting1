# Read data
data <- read.csv("household_power_consumption.txt", sep= ";", na.strings= "?")
data$Date <- as.Date(data$Date, format= "%d/%m/%Y")

# Select data
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Add Datetime
data$Datetime <- as.POSIXct(paste(data$Date, data$Time))

# Plot
with(data, 
  plot(Global_active_power ~ Datetime, type= "l",
  xlab= "", ylab= "Global Active Power (kilowatts)")
)

# Save into PNG file
dev.copy(png, file= "plot2.png", height= 480, width= 480)
dev.off()
