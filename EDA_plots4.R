## exploratory data analysis - graphs
## electric power consumption data set is used
setwd("~/Coursera R folder")
# locate data
        file <- "./Coursera R folder/household_power_consumption.txt"
        ## make restriction when reading table
        days <- read.table(file, header=TRUE,sep = ";")
        days$Date <- as.Date(days$Date, format="%d/%m/%Y")

## Subsetting the data
feb2 <- subset(days, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## and then we have the issue that global active power is not seen as a number
feb2$Sub_metering_1 <- as.numeric(as.character(feb2$Sub_metering_1))
feb2$Sub_metering_2 <- as.numeric(as.character(feb2$Sub_metering_2))
feb2$Sub_metering_3 <- as.numeric(as.character(feb2$Sub_metering_3))
feb2$Voltage <- as.numeric(as.character(feb2$Voltage))
feb2$Global_active_power <- as.numeric(as.character(feb2$Global_active_power))
feb2$Global_reactive_power <- as.numeric(as.character(feb2$Global_reactive_power))



## Step 2: creating the graph - plot 2 = line (on screen)
## combine data & time
library(lubridate)
datetime <- as.POSIXct(paste(feb2$Date, feb2$Time))

# creation of 'frame' where 4 plots are in
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0, 2, 0))

# the actual plots (top left, top right, down left, down right (rows))

# plot 1
        plot(datetime, feb2$Global_active_power, type = "l",  
             xlab=" ", ylab="Global Active Power")
# plot 2     
        plot(datetime, feb2$Voltage, type = "l", xlab = "datetime", 
        ylab = "Voltage")
# plot 3     
        plot(datetime, feb2$Sub_metering_1, type= 'l', 
        xlab=" ",
        ylab="Energy sub metering")
        lines(datetime, feb2$Sub_metering_2, col="Red")
        lines(datetime, feb2$Sub_metering_3, col="Blue")

        legend("topright",  col = c("black", "red", "blue"), lwd = 2, 
        legend = c("Sub_metering_1                            ", 
                   "Sub_metering_2                            ", 
                   "Sub_metering_3                            "))

# plot 4
        plot(datetime, feb2$Global_reactive_power, type = "l",
        xlab = "datetime", ylab="Global_reactive_power")
 

## step 3: save plot 4 to file (PNG)
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
