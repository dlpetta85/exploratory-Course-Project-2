source("data store.R")
##4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

names(SCC)<-gsub("\\.","", names(SCC))

combust <- grepl(pattern = "comb", SCC$SCCLevelOne, ignore.case = TRUE)
carv <- grepl(pattern = "coal", SCC$SCCLevelFour, ignore.case = TRUE)

carvcom <- SCC[combust & carv,]$SCC
valores <- NEIdata[NEIdata$SCC %in% carvcom,]
tot <- aggregate(Emissions~year, valores, sum)



##plotting
png("plot4.png",width=480,height=480,units="px",bg="transparent")
g <- ggplot(aes(year, Emissions/10^5), data=tot)
g+geom_bar(stat="identity",fill="grey",width=0.75) +
  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999 to 2008"))
dev.off()

