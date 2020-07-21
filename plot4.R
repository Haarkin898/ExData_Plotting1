library(readr)
library(plyr)
library(lubridate)


HHPC2 <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
HHPC2 <- na.omit(HHPC2)
HHPC3 <- HHPC2[HHPC2$Date == "1/2/2007" | HHPC2$Date == "2/2/2007",]
##str(HHPC3)
dateTime <- apply(HHPC3,1 ,function(x) paste(toString(x[1]), toString(x[2])))
HHPC3$dateTime <- apply(HHPC3,1 ,function(x) paste(toString(x[1]), toString(x[2]))) ##Data <- cbind(dateTime, HHPC3)
Data <- HHPC3
Data$dateTime <- dmy_hms(Data$dateTime)



##Plot4
par(mfcol = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(Data, {
        plot(dateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
        plot(dateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
        points(dateTime, Sub_metering_1, col = "black", type = "l")
        points(dateTime, Sub_metering_2, col = "red", type = "l")
        points(dateTime, Sub_metering_3, col = "blue", type = "l")
        legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
        plot(dateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        plot(dateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
        
})