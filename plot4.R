setwd("C:/Users/Goran/Desktop/Exploratory_Data_Analysis")


tab <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";")
tab$Date = as.character(tab$Date)


vec1 <- subset(tab, Date == "1/2/2007")$Voltage
vec1 <- vec1[vec1 != "?"]
vec1 <- as.numeric(as.character(vec1))


vec2 <- subset(tab, Date == "2/2/2007")$Voltage
vec2 <- vec2[vec2 != '?']
vec2 <- as.numeric(as.character(vec2))


volt <- c(vec1, vec2)

vec1 <- subset(tab, Date == "1/2/2007")$Global_reactive_power
vec1 <- vec1[vec1 != "?"]
vec1 <- as.numeric(as.character(vec1))


vec2 <- subset(tab, Date == "2/2/2007")$Global_reactive_power
vec2 <- vec2[vec2 != '?']
vec2 <- as.numeric(as.character(vec2))

power <- c(vec1, vec2)

png("plot4.png")

par(mfrow = c(2, 2))
plot(G_A_P, type="l", ylab = "Global Active Power", xlab="", xaxt = 'n')
axis(1, c(0, length(G_A_P)/2, length(G_A_P)), c("Thu", "Fri", "Sat"))

plot(volt, type="l",ylab = "Voltage", xlab="datetime", xaxt = 'n')
axis(1, c(0, length(G_A_P)/2, length(G_A_P)), c("Thu", "Fri", "Sat"))

plot(SM1, xlab="", xaxt = 'n', type='l', ylab="Energy sub metering")
points(SM2, type='l', col = "Red")
points(SM3, type='l', col = "Blue")
axis(1, c(0, length(SM1)/2, length(SM1)), c("Thu", "Fri", "Sat"))
legend("topright", lty= 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n")

plot(power,  type="l",, xlab="datetime", xaxt = 'n', ylab = "Global_reactive_power" )
axis(1, c(0, length(G_A_P)/2, length(G_A_P)), c("Thu", "Fri", "Sat"))
dev.off()
