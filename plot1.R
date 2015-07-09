source("load_data.R")

# open png device
png(filename = "plot1.png", width=480, height=480)
par(mfrow = c(1,1))
# open a new plot
plot.new()
# plot the histogram
hist(my_data$Global_active_power, main = "Global Active Power", col = "red",
     xlab = "Global Active Power (kilowatts)")
dev.off()
