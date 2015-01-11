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
#	 Figure, plot4.R
#
#========================================================================== 


par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
   
  
   legend("topright", bty = "n", lty = c(1,1), lwd = c(1, 1, 1), y.intersp = 0.7, x.intersp = 0.4,
   col = c("black", "red", "blue"), legend = c("1-Sub_metering", "2-Sub_metering", "3-Sub_metering"))       
   
   
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
})

# Saving the figure

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()