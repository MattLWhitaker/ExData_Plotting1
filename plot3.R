plot3 <- function(){
    source("getElectricData.R")
    source("getTickData.R")
    dataFile <- file.path("./data","household_power_consumption.txt")
    startDate <- "2007-02-01"
    endDate <- "2007-02-02"
    
    png(file="plot3.png")
    electricData <- getElectricData(dataFile,startDate,endDate)
    with(electricData,plot(electricData$Sub_metering_1, 
                           ylab = "Energy sub metering",xlab = "",
                           type = "n",xaxt = "n"))
    lines(electricData$Sub_metering_1)
    lines(electricData$Sub_metering_2,col = "red")
    lines(electricData$Sub_metering_3,col = "blue")
    
    #get the first occurence of each weekday in the sequence
    tickData <- getTickData(electricData$Date,endDate)
    
    axis(1, at = tickData[[1]], labels = tickData[[2]])
    
    legend("topright",col = c("black","red","blue"),lty = 1,
           cex = 0.8,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    dev.off()
}