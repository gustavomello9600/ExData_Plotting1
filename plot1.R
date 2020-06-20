#Loads the date/time parser
library(lubridate)

#Reads all the data
full_data <- read.csv2("data/household_power_consumption.txt")

#Subsets the relevant data
data <- subset(full_data, Date == "1/2/2007"|Date == "2/2/2007")

#Sets the type right for each column
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
data[3:9] <- sapply(sapply(data[3:9], as.character), as.double)

#Opens the PNG file
png("plot1.png", width = 480, height = 480)

#Builds the desired histogram
with(data, hist(Global_active_power,
                col = "red",
                main = "Global Active Power",
                xlab = "Global Active Power (kilowatts)"))

#Closes and saves PNG file
dev.off()