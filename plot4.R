data<-read.csv("household_power_consumption.txt",sep = ";",na.strings = "?")
data$Date=as.Date(data$Date, "%d/%m/%Y" )
data$Time<-paste(data$Date,data$Time)
data$Time<-strptime(data$Time,"%Y-%m-%d %H:%M:%S")
str(data)

summary(data)

data<-data[(data$Date %in% as.Date(c("2007-02-01","2007-02-02"))),]
data_clean<-na.omit(data)

png(filename = "Plot 4.png",
    width = 480, height = 480, units = "px")
Sys.setlocale("LC_TIME","C")
par(mfcol=c(2,2))

with(data_clean,plot(Time,Global_active_power,type="l",xlab="",ylab="Global Active Power"))


with(data_clean,plot(Time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
lines(data_clean$Time,data_clean$Sub_metering_2,type="l",col="red")
lines(data_clean$Time,data_clean$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,col=c("black","red","blue"),bty="n")

with(data_clean,plot(Time,Voltage,type="l",xlab="datetime",ylab="Voltage"))

with(data_clean,plot(Time,Global_reactive_power,type="l",xlab="datetime"))

dev.off()