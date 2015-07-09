# download the file if it is not in the current folder
if (!file.exists("./household_power_consumption.zip")) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl, destfile = "household_power_consumption.zip", method = "curl")
}

# if there is no data file, we need to unzip the downloaded file
if (!file.exists("./household_power_consumption.txt")) {
  unzip("household_power_consumption.zip")
}

# if my_data object has already been loaded, then skipping the step of loading data
if (!exists("my_data")) {
  filename = "./household_power_consumption.txt"
  # read data from file
  my_data <- read.table(file = filename, header = TRUE, sep = ";", na.string = "?")
  # merge column Date and Time into column DateTime
  my_data$DateTime <- paste(my_data$Date, my_data$Time)
  # convert column DateTime into Time format
  my_data$DateTime <- strptime(my_data$DateTime, "%d/%m/%Y %H:%M:%S")

  library(dplyr)
  my_data <- tbl_df(my_data)
  # remove column Date and column Time because column DateTime contains all information about time
  my_data <- select(my_data, -Date, -Time)
  # get all data rows which are between 02/01/2007 and 02/02/2007
  my_data <- subset(my_data, DateTime >= "2007-02-01 00:00:00" & DateTime < "2007-02-03 00:00:00")
}