download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip")
unzip("household_power_consumption.zip")
cat(grep("^(Date|1/2/2007|2/2/2007)", readLines("household_power_consumption.txt"), value = TRUE), sep = "\n", file = "household_power_consumption_subset.txt")
