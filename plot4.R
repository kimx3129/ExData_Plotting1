#Read data only from Feb 1 to Feb 2 on 2007 into my workspace
data <- read.csv("ds4/project1/household_power_consumption.txt", sep = ";")
realData <- subset(data, Date == "1/2/2007" | Date == "2/2/2007"))

#Convert factor values into double values in order to create a plot
sub1_values <- as.numeric(as.character(realData$Sub_metering_1))
sub2_values <- as.numeric(as.character(realData$Sub_metering_2))
sub3_values <- as.numeric(as.character(realData$Sub_metering_3))

#Convert factor values into double values in order to create a plot
global <- as.numeric(as.character(realData$Global_active_power))
voltage <- as.numeric(as.character(realData$Voltage))
global_re <- as.numeric(as.character(realData$Global_reactive_power))

#Convert date
datetime <- strptime(paste(realData$Date, realData$Time, 
                           sep = " "), "%d/%m/%Y %H:%M:%S")

#Open a png graphics device
png("plot4.png", width=480, height=480)

#Create 2 by 2 plot window and add my plots
par(mfrow = c(2,2))
plot(datetime, global, type = "l", xlab = "", ylab = "Global Active Power")
plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(datetime, sub1_values, xlab = "", ylab = "Energy sub metering", type = "l")
lines(datetime, sub2_values, col = "red")
lines(datetime, sub3_values, col = "blue")
legend("topright", pch = "", lwd = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(datetime, global_re, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

#Close device
dev.off()