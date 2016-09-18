data1 <- read.table(unz("exdata-data-household_power_consumption.zip",
                        'household_power_consumption.txt'
),
header = TRUE, sep=";", na.strings = '?',
colClasses = c("character","character","numeric","numeric",
               "numeric","numeric","numeric","numeric","numeric")
)


data2 <- subset(data1, Date == '1/2/2007' | Date == '2/2/2007')

data2$datetime <- strptime(paste(data2$Date,data2$Time,sep = ' '), 
                           format = '%d/%m/%Y %H:%M:%S')

png(filename = "plot4.png",width = 480, height = 480)
par(mfcol = c(2, 2))

with(data2, plot(datetime,Global_active_power,type = 'l',
                 ylab = 'Global Active Power (kilowatts)', 
                 xlab = ''))


with(data2, plot(datetime,Sub_metering_1,type = 'l',
                 ylab = 'Energy sub metering', 
                 xlab = '', col = 'black'))

with(data2, lines(datetime,Sub_metering_2,col = 'red'))

with(data2, lines(datetime,Sub_metering_3,col = 'blue'))

legend('topright', 
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty = c(1,1,1), 
       col = c('black','red','blue'), 
       bty = 'n')

with(data2, plot(datetime,Voltage,type = 'l'))
     
with(data2, plot(datetime,Global_reactive_power,type = 'l'))

dev.off()