#Read data only from Feb 1 to Feb 2 on 2007 into my workspace
data <- read.csv("ds4/project1/household_power_consumption.txt", sep = ";")
realData <- subset(data, Date == "1/2/2007" | Date == "2/2/2007"))

#Convert factor values into double values in order to create a plot
sub1_values <- as.numeric(as.character(realData$Sub_metering_1))
sub2_values <- as.numeric(as.character(realData$Sub_metering_2))
sub3_values <- as.numeric(as.character(realData$Sub_metering_3))

#Convert date
datetime <- strptime(paste(realData$Date, realData$Time, 
                           sep = " "), "%d/%m/%Y %H:%M:%S")

#Open a png graphics device
png("plot3.png", width=480, height=480)

#Construct a third plot
plot(datetime, sub1_values, xlab = "", 
     ylab = "Energy sub metering", type = "l")

#Add more graphs along with the legend
lines(datetime, sub2_values, col = "red")
lines(datetime, sub3_values, col = "blue")
legend("topright", pch = "", lwd = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Close device
dev.off()