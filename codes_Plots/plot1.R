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



##Plot1
hist(Data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
