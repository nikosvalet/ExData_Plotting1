setwd("C:/Users/user/Desktop")

mydata <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

subset_mydata <- mydata[mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007",]

png(filename = "plot3.png", width=480, height = 480)

Sub_1 <- data.frame(strptime(paste(subset_mydata$Date,subset_mydata$Time), "%d/%m/%Y %H:%M:%S"),
                    as.numeric(paste(subset_mydata$Sub_metering_1)))

Sub_2 <- data.frame(strptime(paste(subset_mydata$Date,subset_mydata$Time), "%d/%m/%Y %H:%M:%S"),
                    as.numeric(paste(subset_mydata$Sub_metering_2)))

Sub_3 <- data.frame(strptime(paste(subset_mydata$Date,subset_mydata$Time), "%d/%m/%Y %H:%M:%S"),
                    as.numeric(paste(subset_mydata$Sub_metering_3)))

with(Sub_1,plot(Sub_1[ ,1], Sub_1[ ,2], type = "l", col = "black", xlab = "",
                ylab = "Energy sub metering"))

with(Sub_2,points(Sub_2[ ,1], Sub_2[ ,2], type = "l", col = "red"))

with(Sub_3,points(Sub_3[ ,1], Sub_3[ ,2], type = "l", col = "blue"))

legend("topright", lty = 1, col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
