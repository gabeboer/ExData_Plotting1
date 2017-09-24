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
feb2$Global_active_power <- as.numeric(as.character(feb2$Global_active_power))

## Step 2: creating the graph - plot 2 = line (on screen)
## combine data & time
library(lubridate)
datetime <- as.POSIXct(paste(feb2$Date, feb2$Time))

plot(datetime,feb2$Global_active_power, type = "l", xlab = " ", 
     ylab = "Global Active Power (kiloWatts)")

## step 3: save plot 2 to file (PNG)
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()



