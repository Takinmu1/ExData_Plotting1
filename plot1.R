# Checking if archive already exists
filename<- "exdata_data_household_power_consumption.zip"
if(!file.exists("./data")){dir.create("./data")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, filename)

# Checking if folder exists
if (!file.exists("exdata_data_household_power_consumption.zip")) { 
        unzip(filename) 
}

## Plot 1
Completedata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                           nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(Completedata, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
png("plot1.png", width=480, height=480)
dev.off()
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()



