data1 <- read.table(unz("exdata-data-household_power_consumption.zip",
                        'household_power_consumption.txt'
                        ), 
                    header = TRUE, sep=";", na.strings = '?',
                    colClasses = c("character","character","numeric","numeric",
                                   "numeric","numeric","numeric","numeric","numeric")
                    )


data2 <- subset(data1, Date == '1/2/2007' | Date == '2/2/2007',select = 'Global_active_power')

png(filename = "plot1.png",
    width = 480, height = 480)

hist(data2$Global_active_power, 
     col = 'red',
     main = 'Global Active Power', 
     xlab = 'Global Active Power (kilowatts)')

dev.off()