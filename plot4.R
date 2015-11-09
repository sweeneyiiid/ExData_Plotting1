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


#plot 4 ===========================================================
plot.new()
par(mfrow=c(2,2))
#plot from first one
plot(ds1[,c("date","gap")], type="l", 
     ylab= "Active Power",
     xlab= "")
#voltage
plot(ds1[,c("date","volts")], type="l", 
     ylab= "voltage",
     xlab= "")
#plot from third one
plot(ds1[,c("date","sub1")], type="n", ylim = c(0,20), ylab="meter kw")
lines(ds1[,c("date","sub1")], col="black")
lines(ds1[,c("date","sub2")], col="red")
lines(ds1[,c("date","sub3")], col="blue")
#global reactive power
plot(ds1[,c("date","react")], type="l", 
     ylab= "RE-active Power",
     xlab= "")




