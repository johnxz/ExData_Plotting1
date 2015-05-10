setwd(".")
if(file.exists("mydata.RData")){
  load("mydata.RData")
}

if(!file.exists("mydata.RData")){
  temp <- tempfile()
  setInternet2(TRUE)
  dataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(dataUrl,temp)
  data <- read.table(unz(temp, "household_power_consumption.txt"),sep=";",header=TRUE,na.strings="?")
  unlink(temp)
  
  mydata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
  
  mydata$Date <- as.Date(mydata$Date,"%d/%m/%Y")
  mydata$datetime = paste(mydata$Date, mydata$Time, sep=" ")
  mydata$datetime <- strptime(mydata$datetime,format="%Y-%m-%d %H:%M:%S")
  save(mydata,file="mydata.RData")
}

png(filename = "plot3.png", 
    width = 480, height = 480, units = "px") 
with(mydata,{
  plot(datetime,Sub_metering_1, 
       type="l",col="darkgrey",xlab="",ylab="Energy sub metering")
  lines(datetime,Sub_metering_2, 
        type="l",col="red",xlab="",ylab="Energy sub metering")
  lines(datetime,Sub_metering_3, 
        type="l",col="blue",xlab="",ylab="Energy sub metering")
  legend("topright",pch=1,col=c("darkgrey","red","blue"),
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})
dev.off()