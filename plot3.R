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


##Plot3
with(Data, plot(dateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
with(Data, points(dateTime, Sub_metering_1, col = "black", type = "l"))
with(Data, points(dateTime, Sub_metering_2, col = "red", type = "l"))
with(Data, points(dateTime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
