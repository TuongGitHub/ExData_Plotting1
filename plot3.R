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

png(filename = "plot3.png",width = 480, height = 480)

with(data2, plot(DateTime,Sub_metering_1,type = 'l',
     ylab = 'Energy sub metering', xlab = '', col = 'black'))

with(data2, lines(DateTime,Sub_metering_2,col = 'red'))

with(data2, lines(DateTime,Sub_metering_3,col = 'blue'))

legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty = c(1,1,1), col = c('black','red','blue'))
dev.off()