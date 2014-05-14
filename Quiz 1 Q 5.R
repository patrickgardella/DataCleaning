fileName <- "./data/ss06pid.csv"

if (!file.exists(fileName)) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
  download.file(fileURL, destfile = fileName, method="curl")
  list.files("./data")
  dateDownloaded <- date()
}

library(data.table)
DT <- fread(fileName)

trial_size <- 200
collected_results <- numeric(trial_size)
for (i in 1:trial_size){
  single_function_time <- system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
  collected_results[i] <- single_function_time[1]
}
print("Answer 1")
print(mean(collected_results))

#print("Answer 2")
#print(system.time(mean(DT$pwgtp15,by=DT$SEX)))


collected_results <- numeric(trial_size)
for (i in 1:trial_size){
  single_function_time <- system.time(DT[,mean(pwgtp15),by=SEX])
  collected_results[i] <- single_function_time[1]
}
print("Answer 3")
print(mean(collected_results))

print("Answer 4")
#print(system.time(rowMeans(DT)[DT$SEX==1]))
#print(system.time(rowMeans(DT)[DT$SEX==2]))


collected_results <- numeric(trial_size)
for (i in 1:trial_size){
  single_function_timeA <- system.time(mean(DT[DT$SEX==1,]$pwgtp15))
  single_function_timeB <- system.time(mean(DT[DT$SEX==2,]$pwgtp15))
  collected_results[i] <- single_function_timeA[1] + single_function_timeB[1]
}
print("Answer 5")
print(mean(collected_results))

collected_results <- numeric(trial_size)
for (i in 1:trial_size){
  single_function_time <- system.time(tapply(DT$pwgtp15,DT$SEX,mean))
  collected_results[i] <- single_function_time[1]
}
print("Answer 6")
print(mean(collected_results))
