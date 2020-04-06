source("data store.R")
##6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips=="06037"). Which city has seen greater changes over time in motor vehicle emissions?
baltLAsMotors <- subset(NEI, NEI$fips %in% c("24510","06037") & NEI$type == "ON-ROAD")
baltLAsMotorsadd <- aggregate(Emissions ~ year + fips, baltLAsMotors, sum)

##plotting
png("plot6.png",width=480,height=480,units="px",bg="transparent")
ggplot(baltLAsMotorsadd, aes(year, Emissions, col = fips)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Baltimore and Los Angeles" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
  labs(x = "Year", y = expression(~PM[2.5]~ "Motor Vehicle Emissions") ) +
  scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore")) +
  theme(legend.title = element_text(face = "bold"))
dev.off()
