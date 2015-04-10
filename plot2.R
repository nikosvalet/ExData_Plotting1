setwd("C:/Users/user/Desktop")

mydata <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

subset_mydata <- mydata[mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007",]

png(filename = "plot2.png", width=480, height = 480)

with(subset_mydata, plot(strptime(paste(subset_mydata$Date,subset_mydata$Time),
                                  "%d/%m/%Y %H:%M:%S"),
                         as.numeric(paste(subset_mydata$Global_active_power)),type="l",
                         xlab = "",
                         ylab = "Global Active Power (kilowatts)"))
     

dev.off()
