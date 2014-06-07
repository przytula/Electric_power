plot2 <- function() {
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
# png(filename="plot2.png",480,480)
 plot(spower$dt.time,spower$Global_active_power , type="o", col="black",pch=".",ylab="Global Active Power (kilowatts)",xlab="")
# dev.off() 
  
  
}