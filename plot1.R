# Title: Exploratory Data Analysis
# Author: Alizhan Tapeyev

library(data.table)
library(dplyr)

# Read data
power <- data.table::fread("household_power_consumption.txt",
                           na.strings = "?")

# Change format of Date column to as.Dare()
power[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Select the appropriate Dates
power <- power[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#Creat plot
hist(power$Global_active_power, main = "Global Active Power"
     , xlab = "Global Active Power (kilowatts)"
     , ylab = "Frequency"
     , col = "red")
# Copy the plot to PNG file 
dev.copy(png, file = 'plot1.png'
         , width = 480
         , height = 480)
dev.off()
