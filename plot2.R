totaldata<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
                      na.strings = "?",stringsAsFactors = FALSE)
pdata<-rbind(totaldata[totaldata$Date=="1/2/2007",],totaldata[totaldata$Date=="2/2/2007",])
pdata$Time<-paste(pdata$Date, pdata$Time, sep=" ")
pdata$Date<-NULL
pdata$Time<-strptime(pdata$Time, format="%d/%m/%Y %H:%M:%S")
plot(pdata$Time,pdata$Global_active,"l",ylab="Global Active Power (kilowatts)",
     xlab="")
dev.copy(png,file="plot2.png") 
dev.off()