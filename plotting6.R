source("data store.R")

##6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips=="06037"). Which city has seen greater changes over time in motor vehicle emissions?
dodgen <- SCC[grepl("mobile",SCC$EI.Sector, ignore.case=TRUE),]
scc_list <- dodgen[grep("vehicle",dodgen$SCC.Level.Two, ignore.case=TRUE),]

gen1 <- SCC[scc_list$SCC,]$SCC
gen2 <- NEI[NEI$SCC %in% gen1,]
gen2 <- NEI[NEI$SCC %in% gen1 & NEI$fips %in% c("06037", "24510"),]
gen2$year <- as.factor(gen2$year)
dual <- mutate(gen2, City = ifelse(fips == "06037", "Los Angeles, CA", ifelse(fips == "24510", "Baltimore City, MD", 0)))
info <- aggregate(Emissions~(City+year), dual, sum)

##plotting
png("plot6.png",width=480,height=480,units="px",bg="transparent")

ggplot(data=info, aes(y=Emissions, x=year, fill = City)) + 
  geom_bar(stat="identity", position = "dodge") +
  scale_y_continuous(breaks = round(seq(500, 7500, by = 500),1)) +
  ggtitle("Total PM2.5 Emissions - Motor Vehicles", subtitle = "Baltimore City vs Los Angeles") +
  labs(x = "Year", y = "PM2.5 Emissions (Tons)")

dev.off()

