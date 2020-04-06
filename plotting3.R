source("data store.R")
##3.Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.


baltimore <- subset(NEI, NEI$fips == "24510")
baltimoreTipo <- aggregate(Emissions ~ year + type, baltimore, sum)


##plotting
png("plot3.png",width=480,height=480,units="px",bg="transparent")

ggplot(baltimoreTipo, aes(year, Emissions, col = type)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Total in Baltimore " ~ PM[2.5] ~ "Emissions by Type and Year")) +
  ylab(expression("Total in Baltimore " ~ PM[2.5] ~ "Emissions")) +
  xlab("Year") +
  scale_colour_discrete(name = "Type of sources") +
  theme(legend.title = element_text(face = "bold"))

dev.off()