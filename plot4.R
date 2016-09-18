#cat(grep("^(Date|1/2/2007|2/2/2007)", readLines("household_power_consumption.txt"), value = TRUE), sep = "\n", file = "household_power_consumption_subset.txt")
hpc <- read.csv("household_power_consumption_subset.txt", sep=";", na.strings="?")
hpc$datetime <- strptime(paste(hpc$Date,hpc$Time), format="%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y ")
png(filename="plot4.png", width=480, height=480)
par(mfcol=c(2,2))
with(hpc,{plot(datetime, Global_active_power,type = "l",xlab="")}) 
with(hpc,{
  plot(datetime, Sub_metering_1,type = "n",xlab="",ylab = "Energy submetering")
  lines(datetime, Sub_metering_1, col = "black")
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
  legend("topright",bty = "n",lwd=c(1,1),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))
}) 
with(hpc,{plot(datetime, Voltage, type = "l")}) 
with(hpc,{plot(datetime, Global_reactive_power, type = "l")}) 


dev.off()