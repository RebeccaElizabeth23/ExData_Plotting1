
# Read in the data file 
data <- read.csv("/Users/rek514/Desktop/Coursera/household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")

# Convert date variables to date classes rather than factor.
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')

# Subset out the data for the desired dates 1st and 2nd Feb 2007
data <- data[(which(data$Date=="2007-02-01" |data$Date=="2007-02-02")),]

# Change the variable from a factor to a numeric class
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

# PLOT ONE: Plots a histogram for the Global Active power against frequency
# Open apng file to save the plot to
png(filename = '/Users/rek514/Documents/Data_science/Git_hub/datasciencecoursera/plot1.png')
# Create histgram with specified colour, main title and x label.
with(data, hist(Global_active_power, col='Red', main='Global Active Power',xlab ="Global active power (kilowatts)"))
# Close graphic device to save plot
dev.off()


