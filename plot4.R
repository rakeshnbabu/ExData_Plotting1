# Create plot4.png

#Read in all raw data
rawData <- read.table("household_power_consumption.txt", header=F, sep=";", colClasses = "character")
# Retain only the dates required
myData <- rawData[grepl("^[12]/2/2007", rawData[,1]),]
# Bind the "Date" and "Time" columns to a single "Date/Time" column
myData <- cbind(strptime(paste(myData[,1], myData[,2]), format="%d/%m/%Y %H:%M:%S"), myData[,-c(1,2)])
# Set the column headers
names(myData) <- c("Date/Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Open "PNG" device
png(filename="plot4.png", width=480, height=480)
# Set the plotting area to have 2 rows and 2 columns, filled by row
par(mfrow=c(2,2))

# Plot 1: identical to plot2.R
# Prepare the plot, but do not add any points
plot(myData$Date, as.numeric(myData$Global_active_power), pch=NA, main="", ylab = "Global Active Power", xlab = "")
# Connect the dots
lines(myData$Date, as.numeric(myData$Global_active_power))

# Plot 2: Voltage
# Prepare the plot, but do not add any points
plot(myData$Date, as.numeric(myData$Voltage), pch=NA, main="", ylab = "Voltage", xlab = "datetime")
# Connect the dots
lines(myData$Date, as.numeric(myData$Voltage))

# Plot 3: identical to plot3.R, but without a box around the legend
# Prepare the plot, but do not add any points
plot(myData$Date, as.numeric(myData$Sub_metering_1), pch=NA, main="", ylab = "Energy sub metering", xlab = "")
# Connect the dots: black is station 1, red is 2, blue is 3
lines(myData$Date, as.numeric(myData$Sub_metering_1), col="black")
lines(myData$Date, as.numeric(myData$Sub_metering_2), col="red")
lines(myData$Date, as.numeric(myData$Sub_metering_3), col="blue")
# Add a legend
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),
       lwd=c(1,1,1),
       col=c("black", "red", "blue"),
       bty="n")#Removes the border around the legend

# Plot 4: Global Reactive Power
# Prepare the plot, but do not add any points
plot(myData$Date, as.numeric(myData$Global_reactive_power), pch=NA, main="", ylab = "Global_reactive_power", xlab = "datetime")
# Connect the dots
lines(myData$Date, as.numeric(myData$Global_reactive_power))

# Close the "PNG" device
dev.off()
