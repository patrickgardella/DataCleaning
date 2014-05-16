#https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for

library(data.table)

fileName <- "./data/wksst8110.for"

if (!file.exists(fileName)) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
  download.file(fileURL, destfile = fileName, method="curl")
  list.files("./data")
  dateDownloaded <- date()
}

sst <- read.fwf(
  file=fileName,
  skip=4,
  widths=c(12, 7,4, 9,4, 9,4, 9,4))

print(sum(sst$V4))