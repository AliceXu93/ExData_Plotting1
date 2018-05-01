data <- read.csv("household_power_consumption.txt", header = FALSE, sep = ";", skip = 66637, nrows = 2880 )
names(data) <- names( read.csv("household_power_consumption.txt", sep = ";", nrows = 1))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
Sys.setlocale("LC_TIME", "en_US.UTF-8") 

png(filename = "plot2.png", width = 480, height = 480)
plot(strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S"), data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()