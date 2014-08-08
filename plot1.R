plot1 <- function(){
    source("getElectricData.R")
    dataFile <- file.path("./data","household_power_consumption.txt")
    startDate <- "2007-02-01"
    endDate <- "2007-02-02"
    
    electricData <- getElectricData(dataFile,startDate,endDate)
    
    png(file="plot1.png")
    
    hist(electricData$Global_active_power, col = "red",main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)")
    
    dev.off()
}