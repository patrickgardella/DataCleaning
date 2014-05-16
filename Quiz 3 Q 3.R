

# Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
# 
# Load the educational data from this data set: 
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 
# 
# Match the data based on the country shortcode. How many of the IDs match? Sort the data frame in descending order by GDP rank. What is the 13th country in the resulting data frame? 
# 
# Original data sources: 
#   http://data.worldbank.org/data-catalog/GDP-ranking-table 
# http://data.worldbank.org/data-catalog/ed-stats

if (!file.exists("./data")) { dir.create("./data") }

fileName <- "./data/GDP.csv"
if (!file.exists(fileName)) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  download.file(fileURL, destfile = fileName, method="curl")
  dateDownloaded <- date()
}

fileName2 <- "./data/FEDSTATS_Country.csv"
if (!file.exists(fileName2)) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
  download.file(fileURL, destfile = fileName2, method="curl")
  dateDownloaded <- date()
}

GDP <- read.csv(fileName, header=FALSE, stringsAsFactors=FALSE)
colnames(GDP) <- c("CountryCode","Ranking","V3","Country","GDP","Footnotes", "V5", "V6", "V7", "V8")
GDP <- GDP[6:195,]
GDP$Ranking <- as.integer(GDP$Ranking)
GDP$GDP <- gsub(",", "", GDP$GDP)
GDP$GDP <- as.integer(as.character(GDP$GDP))

new <- GDP[order(GDP$GDP, decreasing = TRUE),]
new2 <- GDP[order(GDP$Ranking, decreasing = FALSE),]

Stats <- read.csv(fileName2, stringsAsFactors=FALSE)

mergedData <- merge(GDP, Stats,by="CountryCode", all = FALSE)
mergedData$GDP <- as.integer(as.character(mergedData$GDP))

mergedDataSorted <- mergedData[order(mergedData$Ranking, decreasing = TRUE),]
print("Question 3")
print(mergedDataSorted[13,1:5])
#    CountryCode Ranking V3             Country GDP
#109         KNA     178 NA St. Kitts and Nevis 767

print("Question 4")
#### Question 4
print(tapply(mergedData$Ranking,mergedData$Income.Group,mean, na.rm=TRUE))
#                      High income: nonOECD    High income: OECD           Low income  Lower middle income 
#NaN             91.91304             32.96667            133.72973            107.70370 
#
#Upper middle income 
#92.13333 

##### Question 5
print("Question 5")
mds <- mergedData[order(mergedData$GDP, decreasing = TRUE),]
print(table(mds[1:38,]$Income.Group))

