# Read data
data <- read.csv("household_power_consumption.txt", sep= ";", na.strings= "?")
data$Date <- as.Date(data$Date, format= "%d/%m/%Y")

# Select data
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Plot
with(data, hist(Global_active_power, 
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)", 
  col = "red")
)

# Save plot into PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
