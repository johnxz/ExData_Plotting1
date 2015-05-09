load("mydata.RData")

png(filename = "plot4.png", 
    width = 480, height = 480, units = "px") 
par(mfrow=c(2,2))
with(mydata,{
  plot(datetime,Global_active_power, 
       type="l",xlab="",ylab="Global Active Power (kilowatts)")
  plot(datetime,Voltage,type="l")
  {plot(datetime,Sub_metering_1, 
        type="l",col="darkgrey",xlab="",ylab="Energy sub metering")
   lines(datetime,Sub_metering_2, 
         type="l",col="red",xlab="",ylab="Energy sub metering")
   lines(datetime,Sub_metering_3, 
         type="l",col="blue",xlab="",ylab="Energy sub metering")
   legend("topright",pch=1,col=c("darkgrey","red","blue"),
          legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))}
  plot(datetime,Global_reactive_power,type="l")
})
dev.off()
  