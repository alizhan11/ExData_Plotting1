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
# Create plot
plot(x = power$dateTime, y = power$Global_active_power
        , type = "l"
        , xlab = ""
        , ylab = "Global Active Power (kilowatts)")
# Save the plot in PNG
dev.copy(png, file = "plot2.png"
         , width = 480
         , height = 480)
dev.off()
