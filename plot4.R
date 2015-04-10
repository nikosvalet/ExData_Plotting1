setwd("C:/Users/user/Desktop")

mydata <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

subset_mydata <- mydata[mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007",]

Sub_1 <- data.frame(strptime(paste(subset_mydata$Date,subset_mydata$Time), "%d/%m/%Y %H:%M:%S"),
                    as.numeric(paste(subset_mydata$Sub_metering_1)))

Sub_2 <- data.frame(strptime(paste(subset_mydata$Date,subset_mydata$Time), "%d/%m/%Y %H:%M:%S"),
                    as.numeric(paste(subset_mydata$Sub_metering_2)))

Sub_3 <- data.frame(strptime(paste(subset_mydata$Date,subset_mydata$Time), "%d/%m/%Y %H:%M:%S"),
                    as.numeric(paste(subset_mydata$Sub_metering_3)))

Sub_4 <- data.frame(strptime(paste(subset_mydata$Date,subset_mydata$Time), "%d/%m/%Y %H:%M:%S"),
                    as.numeric(paste(subset_mydata$Voltage)))

Sub_5 <- data.frame(strptime(paste(subset_mydata$Date,subset_mydata$Time), "%d/%m/%Y %H:%M:%S"),
                    as.numeric(paste(subset_mydata$Global_reactive_power)))

png(filename = "plot4.png", width=480, height = 480)

par(mfcol = c(2,2))

with(subset_mydata, hist(as.numeric(paste(subset_mydata$Global_active_power)),
                         col = "red",
                         main = " ",
                         ylab = "Global Active Power",
                         xlab=""))

with(Sub_1,plot(Sub_1[ ,1], Sub_1[ ,2], type = "l", col = "black", xlab = "",
                ylab = "Energy sub metering"))

with(Sub_2,points(Sub_2[ ,1], Sub_2[ ,2], type = "l", col = "red"))

with(Sub_3,points(Sub_3[ ,1], Sub_3[ ,2], type = "l", col = "blue"))

legend("topright", lty = 1, col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(Sub_4,plot(Sub_4[ ,1], Sub_4[ ,2], type = "l", xlab = "datetime",
                ylab = "Voltage"))


with(Sub_5,plot(Sub_5[ ,1], Sub_5[ ,2], type = "l", xlab = "datetime",
                ylab = "Global_reactive_power"))



dev.off()