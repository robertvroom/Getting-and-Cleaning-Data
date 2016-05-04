# 1. Read the data files into R
subjecttest <- read.table("./test/subject_test.txt")
xtest <- read.table("./test/X_test.txt")
ytest <- read.table("./test/Y_test.txt")
subjecttrain <- read.table("./train/subject_train.txt")
xtrain <- read.table("./train/X_train.txt")
ytrain <- read.table("./train/Y_train.txt")
features <- read.table("./features.txt")
activities <- read.table("./activity_labels.txt")

# 2. Merge data into one dataset
xall <- rbind(xtrain, xtest)
yall <- rbind(ytrain, ytest)
subjectall <- rbind(subjecttrain, subjecttest)
allfit <- cbind(subjectall, yall, xall)

#Get rid of unneeded variables
rm(xtest,ytest,xtrain,ytrain,subjecttrain,subjecttest,xall,yall,subjectall)

# 3. Name the columns
featureNames <- as.character(features[,2])
newCols <- c("subject", "activity", featureNames)
colnames(allfit) <- newCols

# 4. Create a new data frame with only mean and stdevd

Means <- grep("mean()", colnames(allfit))
StDev <- grep("std()", colnames(allfit))
Columns <- c(Means, StDev)
Columns2 <- sort(Columns) 
newDataFrame <- allfit[, c(1,2,Columns2)]
newDataFrame2 <- newDataFrame[, !grepl("Freq", colnames(newDataFrame))] #get rid of the meanFreq columns

#Get rid of unneeded variables
rm(newDataFrame, allfit)

# 5. Cleanup rows to only show mean values for subject/activity pairs
tidyframe <- data.frame()
for (i in 1:30) {
  subj<- subset(newDataFrame2,subject==i)
  for (j in 1:6){
    actv<- subset(subj, activity==j)
    myresult<-as.vector(apply(actv,2,mean))
    tidyframe<-rbind(tidyframe,myresult) 
  }
  
}

# 6. Rename columns and create Samsung_Data.txt file
colnames(tidyframe)<-colnames(newDataFrame2)
levels(tidyframe[,2])<-c('walk','upstairswalk','downstairswalk', 'sit','stand', 'lay')
write.table(tidyframe, "Samsung_Data.txt", sep = "")

