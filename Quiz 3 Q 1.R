fileName <- "./data/ss06hid.csv"

if (!file.exists("./data")) { dir.create("./data") }

if (!file.exists(fileName)) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  download.file(fileURL, destfile = fileName, method="curl")
  list.files("./data")
  dateDownloaded <- date()
}

library(data.table)
DT <- fread(fileName)


#Create a logical vector that identifies the households on greater than 10 acres 
#who sold more than $10,000 worth of agriculture products. 
#Assign that logical vector to the variable agricultureLogical. 
#Apply the which() function like this to identify the rows of the data frame 
#where the logical vector is TRUE. which(agricultureLogical) 

#What are the first 3 values that result?

#ACR = 3 
#AGS = 6

DT$isTenAcres = ifelse(DT$ACR == 3, TRUE, FALSE)
DT$soldTenK = ifelse(DT$AGS == 6, TRUE, FALSE)
DT$agricultureLogical = ifelse(DT$ACR == 3 & DT$AGS == 6,TRUE, FALSE)

results = which(DT$agricultureLogical == TRUE)
print(head(results, 3))

#[1] 125 238 262