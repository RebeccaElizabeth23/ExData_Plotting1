
# Read in the data file 
data <- read.csv("/Users/rek514/Desktop/Coursera/household_power_consumption.txt", header = TRUE, sep = ';', na.strings = '?')

# Convert date variables to date avariable classes rather than factor.
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')

# Subset out the data for the desired dates 1st and 2nd Feb 2007
data <- data[(which(data$Date=="2007-02-01" |data$Date=="2007-02-02")),]

# Create a new combined date and time factor
data$DateTime <- as.POSIXct((paste(data$Date, data$Time)))

# Change the variable from a factor to a numeric class
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

# PLOT TWO: Plots the Global active power against time and day in a line graph
# Open a png file to save the plot to
png(filename = '/Users/rek514/Documents/Data_science/Git_hub/datasciencecoursera/plot2.png')
plot(data$DateTime, data$Global_active_power, type = 'l', xlab = '', ylab = 'Global active power (kilowatts)')
# Close graphic device to save plot
dev.off()