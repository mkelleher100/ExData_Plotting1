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
#Plot 2
png("plot2.png")
with(power, plot(Date, Global_active_power, type="l",
                 ylab="Global Active Power (kilowatts)",
                 xlab=""))
dev.off()