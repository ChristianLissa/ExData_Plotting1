
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
png("plot3.png", width=480, height=480)
plot(dt, as.numeric(hpc$Sub_metering_1), xlab="", ylab="Energy Submetering", type="l")
lines(dt, as.numeric(hpc$Sub_metering_2), type="l", col="Red")
lines(dt, as.numeric(hpc$Sub_metering_3), type="l", col="Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
