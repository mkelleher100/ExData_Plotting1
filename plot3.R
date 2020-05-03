library(lubridate)

#Read file and select relevant data
data <- read.table("./data/household_power_consumption.txt", sep =";", 
                   header = TRUE, na.strings ="?", 
                   colClasses = c(rep("character", 2), rep("numeric",7))
)
dates <- dmy(data$Date)
data <- data[(dates== mdy("02/01/2007")| dates ==mdy("02/02/2007")),]

power<- data.frame("Date"=dmy_hms(paste(data$Date, data$Time)),
                   data[, -(1:2)])
#Plot 3
png("plot3.png")
with(power, plot(Date, Sub_metering_1, type="l",
                 ylab="Energy sub metering",
                 xlab=""))
with(power, points(Date, Sub_metering_2, type="l",
                   col="red"))
with(power, points(Date, Sub_metering_3, type="l",
                   col="blue"))
legend("topright", col=c("black", "red", "blue"), lty=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
