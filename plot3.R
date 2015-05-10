load("mydata.RData")

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