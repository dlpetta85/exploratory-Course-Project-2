source("data store.R")

##3.Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
NEIBal<-subset(NEIdata, fips == "24510")
totbal <- aggregate(Emissions ~ year, NEIBal, sum)
totbal

##plotting
png("plot3.png",width=480,height=480,units="px",bg="transparent")

A <- ggplot(aes(x = year, y = Emissions, fill=type), data=NEIdataBaltimore)
A + geom_bar(stat="identity")+
  facet_grid(.~type)+
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City from 1999 to 2008 based on source Types"))+
  guides(fill=FALSE)

dev.off()

