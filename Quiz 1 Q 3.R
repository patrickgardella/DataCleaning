fileName = "./data/NGAP.xlsx";
if (!file.exists(fileName)) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
  download.file(fileURL, destfile = fileName, method="curl")
}
list.files("./data")
dateDownloaded <- date()

colIndex <- 7:15
rowIndex <- 18:23

library(xlsx)
dat <- read.xlsx(fileName, sheetIndex = 1, colIndex=colIndex, rowIndex=rowIndex, header=TRUE)
answer <- sum(dat$Zip*dat$Ext,na.rm=T) 
print(answer)