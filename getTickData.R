getTickData <- function(dateVector,endDate){
    #get the first occurence of each weekday in the sequence
    w <- weekdays(dateVector,abbreviate = T)
    uniqueWD  <- unique(w)
    idx <- integer()
    for (wd in uniqueWD){
        idx <- c(idx,min(which(w==wd)))
    }
    
    #append the next day to get the last tick mark
    idx <- c(idx,length(dateVector)+1)
    uniqueWD <- c(uniqueWD,weekdays(ymd(endDate)+days(1),
                                    abbreviate = T))
    
    list(idx,uniqueWD)
}