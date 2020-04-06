##Libraries that will be used
library(ggplot2)
library(plyr)

## Creating and extracting the files
if(!(file.exists("summarySCC_PM25.rds") && 
     file.exists("Source_Classification_Code.rds"))) { 
  archiveFile <- "NEI_data.zip"
  if(!file.exists(archiveFile)) {
    archiveURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
    download.file(url=archiveURL,destfile=archiveFile,method="curl")
  }  
  unzip(archiveFile) 
}
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Working with the datafiles
sampling <- c("year", "type", "Pollutant","SCC","fips")
NEI[,sampling] <- lapply(NEI[,colToFactor], factor)
head(levels(NEI$fips))

levels(NEI$fips)[1] = NA
NEIdata<-NEI[complete.cases(NEI),]
colSums(is.na(NEIdata))