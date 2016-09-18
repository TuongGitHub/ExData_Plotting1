data1 <- read.table(unz("exdata-data-household_power_consumption.zip",
                        'household_power_consumption.txt'
),
header = TRUE, sep=";", na.strings = '?',
colClasses = c("character","character","numeric","numeric",
               "numeric","numeric","numeric","numeric","numeric")
)


data2 <- subset(data1, Date == '1/2/2007' | Date == '2/2/2007')

data2$DateTime <- strptime(paste(data2$Date,data2$Time,sep = ' '), 
                           format = '%d/%m/%Y %H:%M:%S')

png(filename = "plot2.png",width = 480, height = 480)

with(data2, plot(DateTime,Global_active_power,type = 'l',
     ylab = 'Global Active Power (kilowatts)', xlab = ''))


dev.off()