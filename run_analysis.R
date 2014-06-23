#### Coursera - Getting and Cleaning Data Course Project ####

## Set working directory to be in the same folder as the UCI HAR Dataset folder
## Read in the train and test datasets
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

## Merge the train and test sets into one data set and label the data with descriptive variable names
data <- rbind(X_train,X_test)
subject <- rbind(subject_train,subject_test)
label <- rbind(y_train,y_test)
names(data) <- features[,2]
data <- cbind(subject,label,data)
names(data)[0:2] <- c("subject","label")

## Extract the mean and standard deviation measurements
meanStdData <- cbind(data[0:8],data[43:48],data[83:88],data[123:128],data[163:168],
                     data[203:204],data[216:217],data[230:231],data[242:243],
                     data[255:256], data[268:273],data[347:352],data[426:431],
                     data[505:506],data[518:519],data[531:532],data[544:545])

## Apply descriptive activity names to the labels
desc_labels = seq(1:nrow(meanStdData))
for (i in 1:nrow(meanStdData)) {
  desc_labels[i] <- as.character(activity_labels[,2][meanStdData[2][i,]])
}
meanStdData <- cbind(meanStdData[1],desc_labels,meanStdData[2:68])

## Creates a data set with the average of each variable for each activity and each subject and writes to csv
tidyData <- c()
for(s in unique(meanStdData$subject)) {
  for (l in unique(meanStdData$label)) {
    row <- subset(meanStdData, subject==s&label==l)
    means <- t(as.data.frame(colMeans(row[4:68]))[,1])
    colnames(means) <- names(row[4:68])
    row <- cbind(row[1:3][1,],means)
    tidyData <- rbind(tidyData,row)
  }
}
write.csv(tidyData,"cleanData.csv")
