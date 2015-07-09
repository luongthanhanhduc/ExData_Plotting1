source("load_data.R")

# open png device
png(filename = "plot2.png", width=480, height=480)
par(mfrow = c(1,1))
# open a new plot
plot.new()
# plot the data points first without showing them
plot(my_data$DateTime, my_data$Global_active_power, type = "n", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
# plot the line to connect data points
lines(my_data$DateTime, my_data$Global_active_power, type = "l")
dev.off()