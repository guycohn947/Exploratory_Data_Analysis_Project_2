## Task 1: Have total emissions from PM2.5 decreased in the United States from 
## 1999 to 2008? Using the base plotting system, make a plot showing the total
## PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and
## 2008.

## Read source files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Find total annual emissions in the U.S. and render a line plot in PNG format.
totalEmissions <- aggregate(data = NEI, Emissions ~ year, FUN = sum)
png("plot1.png")
with(totalEmissions, plot(year, Emissions, 
                          main = "U.S. Annual Total PM2.5 Emission Levels (1999-2008)", 
                          xlab = "Year", ylab = "Annual total PM2.5 emissions (tons)",
                          type = "b", col = "blue", pch=19))
dev.off()