#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv

library(data.table)
library(sqldf)

fileName <- "./data/ss06pid.csv"

if (!file.exists(fileName)) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
  download.file(fileURL, destfile = fileName, method="curl")
  list.files("./data")
  dateDownloaded <- date()
}

acs <- fread(fileName)

#sqldf("select * from acs where AGEP < 50 and pwgtp1")
#Correct answer is:
sqldf("select pwgtp1 from acs where AGEP < 50")
#sqldf("select * from acs where AGEP < 50")
#sqldf("select pwgtp1 from acs")

#### Q3 #####
#sqldf("select distinct AGEP from acs")

