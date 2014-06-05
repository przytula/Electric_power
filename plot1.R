plot1 <- function() {
## -------------------------
## read input file  
## -------------------------
  tpower<-read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".",na.strings="?")
## -------------------------
## get subset of data
## -------------------------
  spower<-subset(tpower,Date=="1/2/2007" | Date=="2/2/2007",select=1:9)
## -------------------------
# define device and plot
## -------------------------  
  
  png(filename="plot1.png")
  hist(spower$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
  dev.off() 
  
  
}