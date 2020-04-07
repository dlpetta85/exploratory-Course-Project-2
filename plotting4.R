source("data store.R")
##4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

names(SCC)<-gsub("\\.","", names(SCC))

combustao<-grepl(pattern = "comb", SCC$SCCLevelOne, ignore.case = TRUE)
carv<-grepl(pattern = "coal", SCC$SCCLevelFour, ignore.case = TRUE)

## extracting the SCC in 
combustaoadd<-SCC[combustao & carv,]$SCC
valor<-NEIdata[NEIdata$SCC %in% combustaoadd,]
NIECoalCombustionTotalEm <- aggregate(Emissions~year, valor, sum)


##plotting
png("plot4.png",width=480,height=480,units="px",bg="transparent")
ggplot(carvao, aes(year, Emissions, col = type)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Total US" ~ PM[2.5] ~ "Coal Emission by Type and Year")) +
  xlab("Year") +
  ylab(expression("US " ~ PM[2.5] ~ "Coal Emission")) +
  scale_colour_discrete(name = "Type of sources") +
  theme(legend.title = element_text(face = "bold"))
dev.off()
