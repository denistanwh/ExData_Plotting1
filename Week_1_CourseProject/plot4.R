# Preset
setwd("~/ExData_Plotting1/Week_1_CourseProject")

# Load data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("Global_active_power"="character", "Global_reactive_power"="character", "Voltage"="character", "Sub_metering_1"="character", "Sub_metering_2"="character", "Sub_metering_3"="character"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]

# Manipulate data
data$datetime <- as.POSIXct(paste(data$Date, data$Time))

# Plot & Print
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(data$datetime, as.numeric(data$Global_active_power), type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(data$datetime, as.numeric(data$Voltage), type = "l", ylab = "Voltage")
plot(data$datetime, as.numeric(data$Sub_metering_1), type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$datetime, as.numeric(data$Sub_metering_2), col="red")
lines(data$datetime, as.numeric(data$Sub_metering_3), col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
plot(data$datetime, as.numeric(data$Global_reactive_power), type = "l", ylab = "Global_reactive_power")
dev.off()
