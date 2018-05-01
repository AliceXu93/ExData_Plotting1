data <- read.csv("household_power_consumption.txt", header = FALSE, sep = ";", skip = 66637, nrows = 2880 )
names(data) <- names( read.csv("household_power_consumption.txt", sep = ";", nrows = 1))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
time <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME", "en_US.UTF-8")

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S"), data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
plot(strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S"), data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S"), data$Sub_metering_1, xlab = "", ylab = "Energy sub meeting", type = "l")
lines(strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S"), data$Sub_metering_2, col = "red")
lines(strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S"), data$Sub_metering_3, col = "blue")
legend("topright", names(data)[7:9], col = c("black", "red", "blue"), lty = 1, bty = "n")

plot(strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S"), data$Global_reactive_power, xlab = "datetime", type = "l")

dev.off()