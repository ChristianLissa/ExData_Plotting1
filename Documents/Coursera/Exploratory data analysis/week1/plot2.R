
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
png("plot2.png", width=480, height=480)
plot(dt, as.numeric(hpc$Global_active_power), xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()
