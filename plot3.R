## Task 3: Of the four types of sources indicated by the type (point, nonpoint,
## onroad, nonroad) variable, which of these four sources have seen decreases in
## emissions from 1999-2008 for Baltimore City? Which have seen increases in
## emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer
## this question.

## Read source files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Find total annual emissions in Baltimore City, MD, for each type variable, and
## render a line plot in PNG format.
totalEmissionsBalt <- aggregate(data = subset(NEI, fips == "24510"),
                                Emissions ~ year + type, FUN = sum)
library(ggplot2)
png("plot3.png", width = 720, height = 480)
qplot(year, Emissions, data = totalEmissionsBalt, facets = . ~ type, xlab = "Year",
      ylab = "Annual PM2.5 emissions (tons)", 
      main = "Annual PM2.5 Emissions by Type in Baltimore, MD (1999-2008)")
dev.off()