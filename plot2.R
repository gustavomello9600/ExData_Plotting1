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
png("plot2.png", width = 480, height = 480)

#Builds the desired chart
with(data, plot(Date + Time,
                Global_active_power,
                type = "l",
                main = NULL,
                xlab = "",
                ylab = "Global Active Power (kilowatts)"))

# <<NOTE>>
#"qui", "sex", "sáb" are equivalent to "thu", "fri" and "sat" in portuguese.

#Closes and saves PNG file
dev.off()