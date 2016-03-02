plot3 <- function(){
        ## Get full dataset
        dataFile <- "./household_power_consumption.txt" 
        data <- read.table(dataFile, header=TRUE, sep=";", 
                           stringsAsFactors=FALSE, dec=".") 
        ## Subset dataset between dates 2007-02-01 and 2007-02-02
        subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

        ## Convert dates 
        datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
        
        ## Plot 3
        globalActivePower <- as.numeric(subSetData$Global_active_power) 
        sub_Metering1 <- as.numeric(subSetData$Sub_metering_1) 
        sub_Metering2 <- as.numeric(subSetData$Sub_metering_2) 
        sub_Metering3 <- as.numeric(subSetData$Sub_metering_3) 

        png("plot3.png", width=480, height=480) 
        plot(datetime, sub_Metering1, type="l", ylab="Energy Submetering", xlab="") 
        lines(datetime, sub_Metering2, type="l", col="red") 
        lines(datetime, sub_Metering3, type="l", col="blue") 
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               lty=1, lwd=2.5, col=c("black", "red", "blue")) 
        
        dev.off() 
} ## End plot3 function
