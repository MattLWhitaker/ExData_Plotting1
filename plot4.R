plot4 <- function(){
    source("getElectricData.R")
    source("getTickData.R")
    dataFile <- file.path("./data","household_power_consumption.txt")
    startDate <- "2007-02-01"
    endDate <- "2007-02-02"
    
    electricData <- getElectricData(dataFile,startDate,endDate)
    tickData <- getTickData(electricData$Date,endDate)
    png(file="plot4.png")
    par(mfcol = c(2,2),cex = 0.8)
    
    #upper left plot
    with(electricData,plot(electricData$Global_active_power, 
                           ylab = "Global Active Power",xlab = "",
                           type = "n",xaxt = "n"))
    lines(electricData$Global_active_power)    
    
    axis(1, at = tickData[[1]], labels = tickData[[2]])
    
    #lower left plot
    with(electricData,plot(electricData$Sub_metering_1, 
                           ylab = "Energy sub metering",xlab = "",
                           type = "n",xaxt = "n"))
    legend("topright",col = c("black","red","blue"),lty = 1,
           cex = 1,box.lty = 0,inset = 0.02,
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    lines(electricData$Sub_metering_1)
    lines(electricData$Sub_metering_2,col = "red")
    lines(electricData$Sub_metering_3,col = "blue")
       
    axis(1, at = tickData[[1]], labels = tickData[[2]])
    
    
    
    #upper right plot
    with(electricData,plot(electricData$Voltage, 
                           ylab = "Voltage",xlab = "datetime",
                           type = "n",xaxt = "n"))
    lines(electricData$Voltage)
    axis(1, at = tickData[[1]], labels = tickData[[2]])
    
    #lower right plot
    with(electricData,plot(electricData$Global_reactive_power, 
                           ylab = "Global_reactive_power",
                           xlab = "datetime",
                           type = "n",xaxt = "n"))
    lines(electricData$Global_reactive_power)
    axis(1, at = tickData[[1]], labels = tickData[[2]])
    
    dev.off()
}