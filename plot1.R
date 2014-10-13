#	household_power_consumption
#	options(max.print = 10000000)

#	read household_power_consumption.txt file set ";" as segmentation symbols	
#	head is set to TRUE if and only if the first row contains one fewer field than the number of columns

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
png(filename = "plot1.png", width = 480, height = 480)
hist(x = active,xlab = "Global_Active_Power(kilowatt)", ylab = "Freqency", 
	 border = "black",col = "red",right = FALSE,main = "Global Active Power")
dev.off()
