
# Load data
setwd("~/Coursera/Exploratory data analysis/week1")
hpc_raw <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset Data 
hpc <- hpc_raw[hpc_raw$Date %in% c("1/2/2007", "2/2/2007"), ]
# head(hpc)

# Create datetime
dt <- strptime(paste(hpc$Date, hpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
# head(dt)

# Plot data
png("plot4.png", width=480, height=480)
par(mfrow=c(2, 2))
plot(dt, as.numeric(hpc$Global_active_power), xlab="", ylab="Global Active Power", type="l")
plot(dt, as.numeric(hpc$Voltage), xlab="datetime", ylab="Voltage", type="l")
plot(dt, as.numeric(hpc$Sub_metering_1), xlab="", ylab="Energy sub metering", type="l")
lines(dt, as.numeric(hpc$Sub_metering_2), type="l", col="Red")
lines(dt, as.numeric(hpc$Sub_metering_3), type="l", col="Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="n")
plot(dt, as.numeric(hpc$Global_reactive_power), xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()
