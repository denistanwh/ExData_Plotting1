# Preset
setwd("~/ExData_Plotting1/Week_1_CourseProject")

# Load data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("Global_active_power"="character"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]

# Manipulate data
data$datetime <- as.POSIXct(paste(data$Date, data$Time))

# Plot & Print
png(filename = "plot2.png", width = 480, height = 480)
plot(data$datetime, as.numeric(data$Global_active_power), type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
