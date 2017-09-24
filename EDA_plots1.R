## exploratory data analysis - graphs
## electric power consumption data set is used

## step 0: make sure wd is correct
setwd("~/Coursera R folder")

## step 1: loading the data and filter when loading

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

        ## Check if zip has already been downloaded in Coursera R folder directory? 
if(!file.exists("./Coursera R folder/household_power_consumption.zip"))
        { 
        download.file(url,destfile="./Coursera R folder/household_power_consumption.zip",mode = "wb") 
} 
        ## Check if zip has already been unzipped? 
if(!file.exists("./Coursera R folder/household_power_consumption"))
        { 
        unzip(zipfile="./Coursera R folder/household_power_consumption.zip",exdir="./Coursera R folder")
}
        ## locate data
        file <- "./Coursera R folder/household_power_consumption.txt"
        ## make restriction when reading table
        days <- read.table(file, header=TRUE,sep = ";")
        days$Date <- as.Date(days$Date, format="%d/%m/%Y")

## Subsetting the data
feb2 <- subset(days, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## and then we have the issue that global active power is not seen as a number
feb2$Global_active_power <- as.numeric(as.character(feb2$Global_active_power))

## Step 2: creating the graph - plot 1 = histogram (on screen)
hist(as.numeric(feb2$Global_active_power), main="Global Active Power", 
     xlab="Global Active Power (kiloWatts)", ylab="Frequency", col="Red")

## step 3: save plot 1 to file (PNG)
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()



