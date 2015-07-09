source("load_data.R")

# open png device
png(filename = "plot3.png", width=480, height=480)
par(mfrow = c(1,1))
# open a new plot
plot.new()
# plot the data points first without showing them
plot(my_data$DateTime, my_data$Sub_metering_1, type = "n", 
     ylab = "Energy sub metering", xlab = "")
# plot the line plots for each sub-metering
lines(my_data$DateTime, my_data$Sub_metering_1, type = "l", col = 'black')
lines(my_data$DateTime, my_data$Sub_metering_2, type = "l", col = 'red')
lines(my_data$DateTime, my_data$Sub_metering_3, type = "l", col = 'blue')
# include the legend
legend('topright', col=c('black', 'red', 'blue'), lty=1, 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()