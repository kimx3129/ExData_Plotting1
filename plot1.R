#Read data only from Feb 1 to Feb 2 on 2007 into my workspace
data <- read.csv("ds4/project1/household_power_consumption.txt", sep = ";")
realData <- subset(data, Date == "1/2/2007" | Date == "2/2/2007"))

#Convert factor values into double values in order to create a plot
values <- as.numeric(as.character(realData$Global_active_power))

#Construct a first plot
hist(values, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

#Save it to a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)

#Close device
dev.off()