temp <- tempfile()
setInternet2(TRUE)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),sep=";",header=TRUE,na.strings="?")
unlink(temp)
                     
mydata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

mydata$Date <- as.Date(mydata$Date,"%d/%m/%Y")
mydata$datetime = paste(mydata$Date, mydata$Time, sep=" ")
mydata$datetime <- strptime(mydata$datetime,format="%Y-%m-%d %H:%M:%S")
save(mydata,file="mydata.RData")

png(filename = "plot1.png", 
    width = 480, height = 480, units = "px") 
with(mydata,hist(Global_active_power,
    col="red",
    xlab="Global Active Power (kilowatts)",
    main="Global Active Power"))
dev.off()



