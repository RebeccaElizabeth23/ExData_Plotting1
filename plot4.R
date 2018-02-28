
# Read in the data file 
data <- read.csv("/Users/rek514/Desktop/Coursera/household_power_consumption.txt", header = TRUE, sep = ';', na.strings = '?')

# Convert date variables to date avariable classes rather than factor.
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')

# Subset out the data for the desired dates 1st and 2nd Feb 2007
data <- data[(which(data$Date=="2007-02-01" |data$Date=="2007-02-02")),]

# Create a new combined date and time factor
data$DateTime <- as.POSIXct((paste(data$Date, data$Time)))

# Create a 2x2 window to store the plots
par(mfrow=c(2,2), mar = c(4.5,4.5,1.5,1))

#Plot 1 (top left)
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
plot(data$DateTime, data$Global_active_power, type = 'l', xlab = '', ylab = 'Global active power (kilowatts)')


#Plot 2 (top right)
data$Voltage <- as.numeric(as.character(data$Voltage))
plot(data$DateTime, data$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')

# Plot 3 (bottom left)
plot(data$DateTime, data$Sub_metering_1, type = 'l',  ylab = 'Energy Sub metering', xlab='')
lines(data$DateTime, data$Sub_metering_2, col='Red')
lines(data$DateTime, data$Sub_metering_3, col='Blue')
# Add a legend to the graph
legend('topright',cex = 0.5,lwd =2, col = c('Black','Red','Blue'), legend = c("Sub_metering_1","Sub_metering_2",'Sub_metering_3'))

# Plot 4 (bottom right)
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
plot(data$DateTime, data$Global_reactive_power, type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')

# Copy plot to a png file and save
dev.copy(png,file='/Users/rek514/Documents/Data_science/Git_hub/datasciencecoursera/plot4.png')
dev.off()


