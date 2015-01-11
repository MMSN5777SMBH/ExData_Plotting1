#
# Plot2.R
#
#==========================================================================
#
#	 Reading the text file: "household_power_consumption.txt"
#
#==========================================================================

data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

#==========================================================================
#
#	 Selecting data from the dates 2007-02-01 and 2007-02-02
#
#========================================================================== 

data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#	clearing memory

rm(data_full)



# Converting the dates

	datetime <- paste(as.Date(data$Date), data$Time)
	data$Datetime <- as.POSIXct(datetime)

#==========================================================================
#
#	 Figure, plot2.R
#
#========================================================================== 


plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")


# Saving the figure

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()