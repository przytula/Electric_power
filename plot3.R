plot3 <- function() {
## -------------------------
## read input file  
## -------------------------
  tpower<-read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".",na.strings="?")
## -------------------------
## get subset of data
## -------------------------
spower<-subset(tpower,Date=="1/2/2007" | Date=="2/2/2007",select=1:9)
#convert date and time to dt.time
spower$dt.time <- as.POSIXct(paste(spower$Date, spower$Time),format="%d/%m/%Y %H:%M:%S")

## -------------------------
# define device and plot
## -------------------------  
png(filename="plot3.png",480,480)
plot(spower$dt.time,spower$Sub_metering_1 , type="o", col="black",pch=".",ylab="Energy sub metering",xlab="")
   
lines(spower$dt.time,spower$Sub_metering_2 , type="o", col="red",pch=".",ylab="Energy sub metering",xlab="")
lines(spower$dt.time,spower$Sub_metering_3 , type="o", col="blue",pch=".",ylab="Energy sub metering",xlab="")



legend("topright",  c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),  lty=c(1,1),        
       lwd=c(2.5,2.5),col=c("black","red","blue")) 
dev.off()
}