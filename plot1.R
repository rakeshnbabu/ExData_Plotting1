# Create plot1.png

#Read in all raw data
rawData <- read.table("household_power_consumption.txt", header=F, sep=";", colClasses = "character")
# Retain only the dates required
myData <- rawData[grepl("^[12]/2/2007", rawData[,1]),]
# Bind the "Date" and "Time" columns to a single "Date/Time" column
myData <- cbind(strptime(paste(myData[,1], myData[,2]), format="%d/%m/%Y %H:%M:%S"), myData[,-c(1,2)])
# Set the column headers
names(myData) <- c("Date/Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Open "PNG" device
png(filename="plot1.png", width=480, height=480)
# Create the histogram
hist(as.numeric(myData$Global_active_power), col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
# Close the "PNG" device
dev.off()
