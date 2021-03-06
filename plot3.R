rawdata<-read.table("household_power_consumption.txt", header = TRUE, nrows=100000, sep=";", stringsAsFactors=FALSE)
data<-subset(rawdata, Date=="1/2/2007"| Date == "2/2/2007")
data<-transform(data, Sub_metering_1=as.numeric(as.character(Sub_metering_1)))
data<-transform(data, Sub_metering_2=as.numeric(as.character(Sub_metering_2)))
data<-transform(data, Sub_metering_3=as.numeric(as.character(Sub_metering_3)))
data$Date<-paste(data$Date, data$Time)
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
data$Time<-strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME", "English")
png(file="plot3.png",width = 480, height = 480)
with(data, {
  plot(Time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(Time, Sub_metering_2, type="l", col="red")
  lines(Time, Sub_metering_3, type="l", col="blue")
  })
legend("topright", pch="-", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()