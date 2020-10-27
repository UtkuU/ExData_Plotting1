data<-read.csv("household_power_consumption.txt",sep = ";",na.strings = "?")
data$Date=as.Date(data$Date, "%d/%m/%Y" )
data$Time<-paste(data$Date,data$Time)
data$Time<-strptime(data$Time,"%Y-%m-%d %H:%M:%S")
str(data)

summary(data)

data<-data[(data$Date %in% as.Date(c("2007-02-01","2007-02-02"))),]
data_clean<-na.omit(data)

png(filename = "Plot 1.png",
    width = 480, height = 480, units = "px")
hist(data_clean$Global_active_power,col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
