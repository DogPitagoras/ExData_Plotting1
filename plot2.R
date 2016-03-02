plot2 <- function(){
        
        ## Get full dataset
        dataFile <- "./household_power_consumption.txt" 
        data <- read.table(dataFile, header=TRUE, sep=";", 
                           stringsAsFactors=FALSE, dec=".") 
        ## Subset dataset between dates 2007-02-01 and 2007-02-02
        subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 
        
        ## Plot 2
        datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
        globalActivePower <- as.numeric(subSetData$Global_active_power) 
        png("plot2.png", width=480, height=480) 
        plot(datetime, globalActivePower, type="l", xlab="", 
             ylab="Global Active Power (kilowatts)")
        
        dev.off() 
} ## End plot2 function