## Task 4: Across the United States, how have emissions from coal combustion-related
## sources changed from 1999-2008?

## Read source files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Generate vector of SCC's corresponding to coal combustion-related sources
coalSCC <- SCC$SCC[grep("Coal", as.character(SCC$EI.Sector), fixed = TRUE)]
## Find total annual emissions from coal combustion-related sources and
## render a line plot in PNG format.
totalCoalEmissions <- aggregate(data = subset(NEI, SCC %in% coalSCC),
                                Emissions ~ year, FUN = sum)
png("plot4.png")
with(totalCoalEmissions, 
     plot(year, Emissions, xlab = "Year",
          ylab = "Annual PM2.5 emissions from coal combustion (tons)",
          type = "b", col = "blue", pch = 19))
title(main = "U.S. Annual PM2.5 Emission Levels\n from Coal Combustion (1999-2008)")
dev.off()