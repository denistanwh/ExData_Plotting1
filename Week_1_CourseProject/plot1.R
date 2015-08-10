# Preset
setwd("~/ExData_Plotting1/Week_1_CourseProject")

# Load data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("Global_active_power"="character"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]

# Plot & Print
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(data$Global_active_power), col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
