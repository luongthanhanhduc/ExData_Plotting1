source("load_data.R")

# open a png device
png(filename = "plot4.png", width=480, height=480)
# set the picture to consist of 2 x 2 figures
par(mfrow = c(2,2))
# plot 1st figure
plot(my_data$DateTime, my_data$Global_active_power, type = "l", 
     ylab = "Global Active Power", xlab = "")
# plot 2nd figure
plot(my_data$DateTime, my_data$Voltage, type = "l", 
     ylab = "Voltage", xlab = "datetime")
# plot 3rd figure
plot(my_data$DateTime, my_data$Sub_metering_1, type = "n", 
     ylab = "Energy sub metering", xlab = "")
lines(my_data$DateTime, my_data$Sub_metering_1, type = "l", col = 'black')
lines(my_data$DateTime, my_data$Sub_metering_2, type = "l", col = 'red')
lines(my_data$DateTime, my_data$Sub_metering_3, type = "l", col = 'blue')
legend('topright', col=c('black', 'red', 'blue'), lty=1, 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

# plot 4th figure
plot(my_data$DateTime, my_data$Global_reactive_power, type = "l", 
     ylab = "Global_reactive_power", xlab = "datetime")

dev.off()