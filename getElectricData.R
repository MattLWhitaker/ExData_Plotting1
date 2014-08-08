getElectricData <- function(dataFile,startDate,endDate){
    #read in the data file
    dt <- read.csv(dataFile, header = T,sep = ";", 
                   colClasses = c("character",
                                   "character",
                                   "numeric",
                                   "numeric",
                                   "numeric",
                                   "numeric",
                                   "numeric",
                                   "numeric",
                                   "numeric"),
                   na.strings = c("?"))
    #convert the dates columns
    library(lubridate)
    dt$Date <- dmy(dt$Date)
    startDate <- ymd(startDate)
    endDate <- ymd(endDate)
    
    #subset the data
    dt <- dt[(dt$Date >= startDate & dt$Date <= endDate),]
    
    dt
}