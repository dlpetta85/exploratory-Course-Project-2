source("data store.R")
##2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

baltimore <- subset(NEI, NEI$fips == "24510")
numBalt <- aggregate(Emissions ~ year, baltimore, sum)

##plotting
png("plot2.png",width=480,height=480,units="px",bg="transparent")
plot(numBalt$year, numBalt$Emissions, type = "o", main = expression("Total Baltimore" ~ PM[2.5] ~ "Emissions by Year"), xlab = "Year", ylab = expression("Total Baltimore "~ PM[2.5] ~ "Emissions"), col = "steelblue3")
dev.off()
