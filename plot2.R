plot2 <- function(){
    source("getElectricData.R")
    source("getTickData.R")
    dataFile <- file.path("./data","household_power_consumption.txt")
    startDate <- "2007-02-01"
    endDate <- "2007-02-02"
    
    electricData <- getElectricData(dataFile,startDate,endDate)
    
    png(file="plot2.png")
    with(electricData,plot(electricData$Global_active_power, 
                           ylab = "Global Active Power (kilowatts)",xlab = "",
                           type = "n",xaxt = "n"))
    lines(electricData$Global_active_power)
    
    #get the first occurence of each weekday in the sequence
    tickData <- getTickData(electricData$Date,endDate)

    axis(1, at = tickData[[1]], labels = tickData[[2]])
    
    dev.off()
}
