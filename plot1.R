data <- read.csv("household_power_consumption.txt", header = FALSE, sep = ";", skip = 66637, nrows = 2880 )
names(data) <- names( read.csv("household_power_consumption.txt", sep = ";", nrows = 1))

png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()