## 1. Merges the training and the test sets to create one data set:
x_train <- read.table("train/X_train.txt", header = FALSE)
X_test <- read.table("test/X_test.txt", header = FALSE)
y_train <- read.table("train/y_train.txt", header = FALSE)
y_test <- read.table("test/y_test.txt", header = FALSE)
subject_train <- read.table("train/subject_train.txt", header = FALSE)
subject_test <- read.table("test/subject_test.txt", header = FALSE)

x <- rbind(x_train, X_test)
y <- rbind(y_train, y_test)
s <- rbind(subject_train, subject_test)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement:
features <- read.table("features.txt")
names(features) <- c('feat_id', 'feat_name')
index_features <- grep("-mean\\(\\)|-std\\(\\)", features$feat_name) 
x <- x[, index_features] 
names(x) <- gsub("\\(|\\)", "", (features[index_features, 2]))

## 3. Uses descriptive activity names to name the activities in the data set:
activities <- read.table("activity_labels.txt")
names(activities) <- c('act_id', 'act_name')

## 4. Appropriately labels the data set with descriptive activity names:
y[, 1] = activities[y[, 1], 2]
names(y) <- "Activity"
names(s) <- "Subject"
tidyDataSet <- cbind(s, y, x)

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject:
tidyDataSet2 <- tidyDataSet[, 3:dim(tidyDataSet)[2]] 
tidyDataAVGSet <- aggregate(tidyDataSet2,list(tidyDataSet$Subject, tidyDataSet$Activity), mean)
names(tidyDataAVGSet)[1] <- "Subject"
names(tidyDataAVGSet)[2] <- "Activity"
write.table(tidyDataSet, "tidydataset.txt",row.name = FALSE)
write.table(tidyDataAVGSet,"tidyDataFileAVG.txt",row.name = FALSE)
