# Title: Exploratory Data Analysis
# Author: Alizhan Tapeyev

# Get data
power <- data.table::fread("household_power_consumption.txt",
                           na.strings = "?")

power[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter dates from 2007-02-01 to 2007-02-02
power <- power[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

# Set the names of weekdays in english
Sys.setlocale("LC_TIME", "English")

# Set the plotting parameters
par(mfrow = c(2, 2))

# Create plots
#Plot 1
plot(x = power$dateTime, y = power$Global_active_power
     , type = "l"
     , xlab = ""
     , ylab = "Global Active Power")

#Plot 2
plot(x = power$dateTime, y = power$Voltage
     , xlab = 'datetime'
     , ylab = 'Voltage'
     , type = 'l')

#plot3
plot(x = power$dateTime, y = power$Sub_metering_1
     , type = "l"
     , xlab = ""
     , ylab = "Energy sub metering")
lines(power$dateTime, power$Sub_metering_2
      , col = "red")
lines(power$dateTime, power$Sub_metering_3
      , col = "blue")
legend("topright", col = c('black', 'red', 'blue')
       , c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
       , lty = c(1,1), lwd = c(1,1), bty = 'n', cex = 0.5)

plot(power$dateTime, power$Global_reactive_power
     , xlab = 'datetime'
     , ylab = 'Global_reactive_power'
     , type = 'l')

# Save the plot in PNG
dev.copy(png, file = "plot4.png"
         , width = 480
         , height = 480)
dev.off()
