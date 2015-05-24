## Getting and cleaning data in Coursera.com ##
# final project #

# check if dplyr package installed
if("dplyr" %in% rownames(installed.packages()) == FALSE) {
      install.packages("dplyr")
}
# load dplyr package
library(dplyr)

# check if dataset exists
dir <- getwd()
if (!file.exists(file.path(dir, "UCI HAR Dataset"))) {
      url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file(url, "project.zip", method = "curl")
      unzip("project.zip")
} else {
      print("file directory:")
      print(getwd())
}
# create file path for all training and test files
mainDir <- file.path(dir, "UCI HAR Dataset")
trainDir <- file.path(dir, "UCI HAR Dataset", "train")
#trainSigDir <- file.path(dir, "UCI HAR Dataset", "train", "Inertial Signals")
testDir <- file.path(dir, "UCI HAR Dataset", "test")
#testSigDir <- file.path(dir, "UCI HAR Dataset", "test", "Inertial Signals")

# read in data
# read in features which would be the column names for x_test/x_train data frame
features <- read.table(file.path(mainDir, "features.txt"), header = FALSE, 
                       col.names = c("index", "measurement"), stringsAsFactors = FALSE)
features <- as.list(features$measurement)

# read in activity labels
activity_labels <- read.table(file.path(mainDir, "activity_labels.txt"), header = FALSE,
                              col.names = c("actID", "activity"), stringsAsFactors = FALSE)

# read in test dataset
x_test <- read.table(file.path(testDir, "X_test.txt"), header = FALSE,
                     stringsAsFactors = FALSE)
colnames(x_test) <- features
y_test <- read.table(file.path(testDir, "y_test.txt"), header = FALSE, 
                     stringsAsFactors = FALSE, col.names = c("actID"))
sub_test <- read.table(file.path(testDir, "subject_test.txt"), header = FALSE, 
                       stringsAsFactors = FALSE, col.names = c("subID"))

# extract mean and std data from x_test and merge test dataset
testMeasure <- cbind(sub_test, y_test, 
                     x_test[, grepl("mean|std", colnames(x_test), ignore.case = TRUE)])


# read in train dataset
x_train <- read.table(file.path(trainDir, "X_train.txt"), header = FALSE,
                     stringsAsFactors = FALSE)
colnames(x_train) <- features
y_train <- read.table(file.path(trainDir, "y_train.txt"), header = FALSE, 
                     stringsAsFactors = FALSE, col.names = c("actID"))
sub_train <- read.table(file.path(trainDir, "subject_train.txt"), header = FALSE, 
                       stringsAsFactors = FALSE, col.names = c("subID"))

# extract mean and std data from x_train and merge test dataset
trainMeasure <- cbind(sub_train, y_train, 
                      x_train[, grepl("mean|std", colnames(x_train), ignore.case = TRUE)])


# merge test and train dataset
allMeasure <- rbind(testMeasure, trainMeasure)

# convert activity ID to activity name
allMeasure <- merge(activity_labels, allMeasure, by.x  = "actID", by.y = "actID")

# output the tidy data which average each activity per subject
allMeasureTidy <- allMeasure %>% group_by(subID, activity) %>% summarise_each(funs(mean))
write.table(allMeasureTidy, "allMeasureTidy.txt", sep = "\t", quote = FALSE, row.names = FALSE)


