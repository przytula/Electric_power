plot4 <- function() {
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

# png(filename="plot4.png",480,480)
par(mfcol=c(2,2))
# ---------
# topleft plot2
# --------------
plot(spower$dt.time,spower$Global_active_power , type="o", col="black",pch=".",ylab="Global Active Power (kilowatts)",xlab="",cex.lab=0.8)
# ---------
# botleft plot3
# --------------
plot(spower$dt.time,spower$Sub_metering_1 , type="o", col="black",pch=".",ylab="Energy sub metering",xlab="",cex.lab=0.8)
lines(spower$dt.time,spower$Sub_metering_2 , type="o", col="red",pch=".",ylab="Energy sub metering",xlab="",cex.lab=0.8)
lines(spower$dt.time,spower$Sub_metering_3 , type="o", col="blue",pch=".",ylab="Energy sub metering",xlab="",cex.lab=0.8)
legend("topright",  c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),  lty=c(1,1), bty="n",        
       lwd=c(2.5,2.5),col=c("black","red","blue")) 
# ---------
# topright plot4
# --------------

plot(spower$dt.time,spower$Voltage , type="o", col="black",pch=".",ylab="Voltage",xlab="datetime",cex.lab=0.8)
# ---------
# botright plot5
# --------------

plot(spower$dt.time,spower$Global_reactive_power , type="o", col="black",pch=".",ylab="Voltage",xlab="datetime",cex.lab=0.8)


# dev.off()
}