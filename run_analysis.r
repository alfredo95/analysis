# Download and unzip data.
fileName <- "UCIdata.zip"
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir <- "UCI HAR Dataset"

#Check if exist file continue else download it.
if(!file.exists(fileName)){
  download.file(url,fileName, mode = "wb") 
}

#If the directory doesn't exist, unzip the downloaded file.
if(!file.exists(dir)){
  unzip("UCIdata.zip", files = NULL, exdir=".")
}

# Get all variables: subject, test and train from their respective text files.
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")  

# 1) Merges the training and the test sets to create one data set.

#Merge to create dataSet
dataSet <- rbind(X_train,X_test)
# Merge to create subject
subject <- rbind(subject_train, subject_test)
names(subject) <- 'subject'
# Merge to create activity
activity <- rbind(y_train, y_test)
names(activity) <- 'activity'

# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_std <- grep("mean()|std()", features[, 2]) 
dataSet <- dataSet[,mean_std]


# 4) Appropriately labels the data set with descriptive activity names.
CleanFeatureNames <- sapply(features[, 2], function(x) {gsub("[()]", "",x)})
names(dataSet) <- CleanFeatureNames[mean_std]


# Combine subject, activity, and mean and std only data set to create final data set.
dataSet <- cbind(subject,activity, dataSet)

# 3. Uses descriptive activity names to name the activities in the data set
act_group <- factor(dataSet$activity)
levels(act_group) <- activity_labels[,2]
dataSet$activity <- act_group

print(head(dataSet))

# 5. Creates a new tidy data set. 

# We use the library reshape2, and check if package is installed
if (!"reshape2" %in% installed.packages()) {
  install.packages("reshape2")
}

#Loading the library
library("reshape2")

# Rewrite the tidy data to the working directory as "tidy_data.txt"
baseData <- melt(dataSet,(id.vars=c("subject","activity")))
secondDataSet <- dcast(baseData, subject + activity ~ variable, mean)
names(secondDataSet)[-c(1:2)] <- paste("[mean of]" , names(secondDataSet)[-c(1:2)] )
write.table(secondDataSet, "tidy_data.txt", sep = ",")
