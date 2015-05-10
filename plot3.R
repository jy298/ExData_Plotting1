totaldata<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
                      na.strings = "?",stringsAsFactors = FALSE)
pdata<-rbind(totaldata[totaldata$Date=="1/2/2007",],totaldata[totaldata$Date=="2/2/2007",])
pdata$Time<-paste(pdata$Date, pdata$Time, sep=" ")
pdata$Date<-NULL
pdata$Time<-strptime(pdata$Time, format="%d/%m/%Y %H:%M:%S")
plot(pdata$Time,pdata$Sub_metering_1 ,"n",ylab="Energy sub metering",xlab="")
lines(pdata$Time,pdata$Sub_metering_1 ,col="black")
lines(pdata$Time,pdata$Sub_metering_2 ,col="red")
lines(pdata$Time,pdata$Sub_metering_3 ,col="blue")
legend("topright",lty=c(1,1),col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

    
dev.copy(png,file="plot3.png") 
dev.off()