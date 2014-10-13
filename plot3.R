#	options(max.print = 10000000)

#	read household_power_consumption.txt file set ";" as segmentation symbols	
#	head is set to TRUE if and only if the first row contains one fewer field than the number of columns

alldata <- read.table("household_power_consumption.txt",sep = ";",head = TRUE)
#	record the date of 2/2/2007 rows
finddate <- which(alldata$Date == "2/2/2007" | alldata$Date == "1/2/2007")
dates <- as.Date(alldata[finddate,"Date"], "%d/%m/%Y")

datetimes <- paste(dates, alldata$Time)
strptime(datetimes, "%Y-%m-%d%H:%M:%S")	#需要使用Y 时间格式使用y  则格式错误
Sub_1 <- as.character(alldata[finddate,"Sub_metering_1"])
Sub_2 <- as.character(alldata[finddate,"Sub_metering_2"])
Sub_3 <- as.character(alldata[finddate,"Sub_metering_3"])
Sub_1 <- as.numeric(Sub_1)
Sub_2 <- as.numeric(Sub_2)
Sub_3 <- as.numeric(Sub_3)
png(filename = "plot3.png", width = 480, height = 480)
plot(Sub_1,type = "n",xaxt = "n",xlab = "",ylab = "Energy sub metering")
lines(Sub_1)
lines(Sub_2, col = "red")
lines(Sub_3, col = "blue")
legend("topright",pch = "━━━",col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1, at = c(1, 1440, 2880), labels = c("Thu","Fri","Sat"))
dev.off()




