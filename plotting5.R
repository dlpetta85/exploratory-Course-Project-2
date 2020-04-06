source("data store.R")
##5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

bMotor <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")
bMotoradd <- aggregate(Emissions ~ year, bMotor, sum)

png("plot5.png",width=480,height=480,units="px",bg="transparent")
ggplot(bMotoradd, aes(year, Emissions)) +
  geom_line(col = "steelblue3") +
  geom_point(col = "steelblue3") +
  ggtitle(expression("Baltimore " ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
  xlab("Year") +
  ylab(expression(~PM[2.5]~ "Motor Vehicle Emissions"))
dev.off()
