
# Read in the data file 
data <- read.csv("/Users/rek514/Desktop/Coursera/household_power_consumption.txt", header = TRUE, sep = ';')

# Convert date variables to date avariable classes rather than factor.
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')

# Subset out the data for the desired dates 1st and 2nd Feb 2007
data <- data[(which(data$Date=="2007-02-01" |data$Date=="2007-02-02")),]

# Create a new combined date and time factor
data$DateTime <- as.POSIXct((paste(data$Date, data$Time)))


# PLOT THREE: Plots the three Sub meterings against time and day in a line graph
# Open a png file to save the plot to
png(filename = '/Users/rek514/Documents/Data_science/Git_hub/datasciencecoursera/plot3.png')
plot(data$DateTime, data$Sub_metering_1, type = 'l',  ylab = 'Energy Sub metering', xlab='')
lines(data$DateTime, data$Sub_metering_2, col='Red')
lines(data$DateTime, data$Sub_metering_3, col='Blue')
# Add a legend to the graph
legend('topright',lwd =2, col = c('Black','Red','Blue'), legend = c("Sub_metering_1","Sub_metering_2",'Sub_metering_3'))
# Close graphics device to save file
dev.off()


