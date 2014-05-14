
fileName = "./data/BaltimoreRestaurants.xml";
if (!file.exists(fileName)) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
  download.file(fileURL, destfile = fileName, method="curl")
}
list.files("./data")
dateDownloaded <- date()

library(XML)
doc <- xmlTreeParse("~/DataCleaning/data/BaltimoreRestaurants.xml", useInternal=TRUE)
rootNode <- xmlRoot(doc)
zips <- xpathSApply(rootNode,"//zipcode",xmlValue)
print(table(xpathSApply(rootNode,"//zipcode",xmlValue)))
print(count(zips[zips == 21231]))

