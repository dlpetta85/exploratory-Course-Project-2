source("data store.R")
##5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

veiculo <- grepl(pattern = "vehicle", SCC$EISector, ignore.case = TRUE)
veiculoadd <- SCC[veiculo,]$SCC
NEIVei <- NEIdata[NEIdata$SCC %in% veiculoadd, ]
NEIveiBal <- subset(NEIVei, fips == "24510")
baltot <- aggregate(Emissions~year, NEIveiBal, sum)


##plotting
png("plot5.png",width=480,height=480,units="px",bg="transparent")

A <- ggplot(aes(year, Emissions/10^5), data=baltot)
A+geom_bar(stat="identity",fill="grey",width=0.75) +
  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999 to 2008"))

dev.off()
