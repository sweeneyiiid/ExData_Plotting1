# JHU Exploratory Data Analysis
# Course Project 1

#setup ===========================================================
setwd("C:/Users/dan/Desktop/Coursera/jhu_ds4/project1")
in_data = "./data/household_power_consumption.txt"

ds0 = read.table(in_data, header=T, sep = ";", as.is = T)
ds1 = ds0[ds0$Date %in% c("2/1/2007", "2/2/2007"),]

ds1$date = strptime(paste(ds1$Date, ds1$Time), "%m/%d/%Y %H:%M:%S")
ds1$gap = as.numeric(ds1$Global_active_power)
ds1$sub1 = as.numeric(ds1$Sub_metering_1)
ds1$sub2 = as.numeric(ds1$Sub_metering_2)
ds1$sub3 = as.numeric(ds1$Sub_metering_3)
ds1$volts = as.numeric(ds1$Voltage)
ds1$react = as.numeric(ds1$Global_reactive_power)

#plot 2 ===========================================================
plot.new()
par(mfrow=c(1,1))
plot(ds1[,c("date","gap")], type="l", 
     ylab= "Global Active Power (kilowatts)",
     xlab= "")


