png(filename = "plot4.png", width = 480, height = 480)
alldata <- read.table("household_power_consumption.txt",sep = ";",head = TRUE)
#	record the date of 2/2/2007 rows
finddate <- which(alldata$Date == "2/2/2007" | alldata$Date == "1/2/2007")
dates <- as.Date(alldata[finddate,"Date"], "%d/%m/%Y")

datetimes <- paste(dates, alldata$Time)
strptime(datetimes, "%Y-%m-%d%H:%M:%S")	#需要使用Y 时间格式使用y  则格式错误
active <- as.character(alldata[finddate,"Global_active_power"])
active <- as.numeric(active)
#barplot(active, xlab = "Global_Active_Power(kilowatt)",ylab = "Frequency",border = "red")
#hist(x = active,Global_Active_Power(kilowatt), breaks = 0.5, border = "red",main = "Global Active Power")

Sub_1 <- as.character(alldata[finddate,"Sub_metering_1"])
Sub_2 <- as.character(alldata[finddate,"Sub_metering_2"])
Sub_3 <- as.character(alldata[finddate,"Sub_metering_3"])
Sub_1 <- as.numeric(Sub_1)
Sub_2 <- as.numeric(Sub_2)
Sub_3 <- as.numeric(Sub_3)
Voltage <- as.character(alldata[finddate,"Voltage"])
Voltage <- as.numeric(Voltage)
Global_reactive_power <- as.character(alldata[finddate,"Global_reactive_power"])
Global_reactive_power <- as.numeric(Global_reactive_power)
	 
#plot(active, type = "l", ylab = "Global_Active_Power(kilowatt)",border = "red")	#	plot2
#axis(1, at = c(1,1440,2880), labels = c("Thu","Fri","Sat"))

#plot(Sub_1,type = "n",xaxt = "n",xlab = "",ylab = "Energy sub metering")		#	plot3
#lines(Sub_1)
#lines(Sub_2, col = "red")
#lines(Sub_3, col = "blue")
#legend("topright",pch = "━━━",col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot(x = Voltage, type = "l", ylab = "Voltage", xlab = "datetime")				#	plot4
#axis(1, at = c(1,1440,2880), labels = c("Thu","Fri","Sat"))
#plot(x = Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
#axis(1, at = c(1,1440,2880), labels = c("Thu","Fri","Sat"))
par(mfrow = c(2,2))
with(alldata, {
	plot(active, type = "l", ylab = "Global_Active_Power(kilowatt)",border = "red")	#	plot2
	axis(1, at = c(1,1440,2880), labels = c("Thu","Fri","Sat"))
	plot(Voltage, type = "l", ylab = "Voltage", xlab = "datetime")				#	plot
	#axis(1, at = c(1,1440,2880), labels = c("Thu","Fri","Sat"))
	plot(Sub_1,type = "n",xaxt = "n",xlab = "",ylab = "Energy sub metering")
	lines(Sub_1)		#	plot3
	lines(Sub_2, col = "red")
	lines(Sub_3, col = "blue")
	#legend("topright",pch = "━━━",col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	plot(Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
	#axis(1, at = c(1,1440,2880), labels = c("Thu","Fri","Sat"))
})

dev.off()
