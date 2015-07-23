## Task 2: Have total emissions from PM2.5 decreased in the Baltimore City,
## Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system
## to make a plot answering this question.

## Read source files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Find total annual emissions in Baltimore City, MD, and render a line plot in 
## PNG format.
totalEmissionsBalt <- aggregate(data = subset(NEI, fips == "24510"),
                                Emissions ~ year, FUN = sum)
png("plot2.png")
with(totalEmissionsBalt, plot(year, Emissions, 
                              xlab = "Year", 
                              ylab = "Annual total PM2.5 emissions (tons)",
                              type = "b", col = "blue", pch=19))
title(main = "Annual Total PM2.5 Emission Levels in\nBaltimore City, MD (1999-2008)")
dev.off()