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



## Step 2: creating the graph - plot 2 = line (on screen)
## combine data & time
library(lubridate)
datetime <- as.POSIXct(paste(feb2$Date, feb2$Time))

# the actual plot
with(feb2, {
        plot(Sub_metering_1~datetime, type= 'l', 
             xlab=" ",
             ylab="Energy sub metering")
        lines(Sub_metering_2~datetime, col="Red")
        lines(Sub_metering_3~datetime, col="Blue")
}
)
# what was missing --> legend. 
legend("topright", col = c("black", "red", "blue"), lwd = 2, 
# playing with cex to get legend in png right (doesn't work)
# use of spaces does ;-)
#       cex = 0.75,
#       pt.cex = 0.75,
       xjust = 1,
       legend = c("Sub_metering_1                            ", #use some spaces here and PNG is ok
                  "Sub_metering_2                            ", 
                  "Sub_metering_3                            "))

## step 3: save plot 3 to file (PNG)
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()



