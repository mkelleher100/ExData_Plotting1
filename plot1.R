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

#Plot 1
png("plot1.png")
hist(power$Global_active_power, 
     col="red", main = "Global Active Power", 
     xlab= "Global Active Power (kilowatts)")
dev.off()