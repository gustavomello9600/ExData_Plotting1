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
png("plot4.png", width = 480, height = 480)

#Sets the canvas properly
par(mfcol = c(2, 2))

#Plots all the subplots

    #Plot 1

        #Plots first chart
        with(data, plot(Date + Time,
                        Global_active_power,
                        type = "l",
                        main = NULL,
                        xlab = "",
                        ylab = "Global Active Power"))

    #Plot 2

        #Initializes second chart and draws its first line
        with(data, plot(Date + Time,
                        Sub_metering_1,
                        type = "l",
                        main = NULL,
                        xlab = "",
                        ylab = "Energy sub metering"))
    
        #Draws second line
        with(data, lines(Date + Time,
                         Sub_metering_2,
                         col = "red"))
             
        #Draws third line
        with(data, lines(Date + Time,
                         Sub_metering_3,
                         col = "blue"))
        
        #Inserts legend
        legend("topright",
               lty = 1,
               bty = "n",
               col = c("black", "red", "blue"),
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
    #Plot 3
        
        #Plots third chart
        with(data, plot(Date + Time,
                        Voltage,
                        type = "l",
                        main = NULL,
                        xlab = "datetime"))
        
    #Plot 4
        
        #Plots fourth chart
        with(data, plot(Date + Time,
                        Global_reactive_power,
                        type = "l",
                        main = NULL,
                        xlab = "datetime"))

# <<NOTE>>
#"qui", "sex", "sáb" are equivalent to "thu", "fri" and "sat" in portuguese.

#Closes and saves PNG file
dev.off()