## Task 6: Compare emissions from motor vehicle sources in Baltimore City with
## emissions from motor vehicle sources in Los Angeles County, California
## (fips == "06037"). Which city has seen greater changes over time in motor vehicle
## emissions?

## Read source files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Generate vector of SCC's corresponding to motor vehicle-related sources
vehicleSCC <- SCC$SCC[grep("Vehicles", as.character(SCC$EI.Sector), fixed = TRUE)]
## Find total annual emissions from motor vehicle-related sources in LA County, CA,
## and in Baltimore City, MD, and render a line plot in PNG format.
totalVehEmissions <- 
    aggregate(data = subset(NEI, SCC %in% vehicleSCC & fips %in% c("24510", "06037")),
              Emissions ~ year + fips, FUN = sum)
totalVehEmissions$fips <- 
    factor(totalVehEmissions$fips,
           labels = c("Los Angeles County, CA","Baltimore City, MD"))
library(ggplot2)
png("plot6.png")
qplot(year, Emissions, data = totalVehEmissions, facets = . ~ fips, xlab = "Year",
      ylab = "Annual motor vehicle PM2.5 emissions (tons)",
      main = "Annual Motor Vehicle PM2.5 Emissions (1999-2008)")
dev.off()