# Preparation Stage
setwd("C:/Users/vkjh6510/Desktop/RPROGRAMMING COURSERA/FUCI HAR Dataset/FUCI HAR Dataset/UCI HAR Dataset/")

#Loading required packages

library(dplyr)

#Reading data

features <- read.table("./features.txt", col.names = c("n","functions"))
activities <- read.table("./activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("./test/subject_test.txt", col.names = "subject")
xtest <- read.table("./test/X_test.txt", col.names = features$functions)
ytest <- read.table("./test/y_test.txt", col.names = "code")
subject_train <- read.table("./train/subject_train.txt", col.names = "subject")
xtrain <- read.table("./train/X_train.txt", col.names = features$functions)
ytrain <- read.table("./train/y_train.txt", col.names = "code")

#Step 1: Merges the training and the test sets to create one data set.

X <- rbind(xtrain, xtest)
Y <- rbind(ytrain, ytest)
Subject <- rbind(subject_train, subject_test)
Combined_Data <- cbind(Subject, Y, X)


#Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.

CleanData <- Combined_Data %>% select(subject, code, contains("mean"), contains("std"))

#Step 3: Uses descriptive activity names to name the activities in the data set.

CleanData$code <- activities[CleanData$code, 2]


#Step 4: Appropriately labels the data set with descriptive variable names.

names(CleanData)[2] = "activity"
names(CleanData)<-gsub("Acc", "Accelerometer", names(CleanData))
names(CleanData)<-gsub("Gyro", "Gyroscope", names(CleanData))
names(CleanData)<-gsub("BodyBody", "Body", names(CleanData))
names(CleanData)<-gsub("Mag", "Magnitude", names(CleanData))
names(CleanData)<-gsub("^t", "Time", names(CleanData))
names(CleanData)<-gsub("^f", "Frequency", names(CleanData))
names(CleanData)<-gsub("tBody", "TimeBody", names(CleanData))
names(CleanData)<-gsub("-mean()", "Mean", names(CleanData), ignore.case = TRUE)
names(CleanData)<-gsub("-std()", "STD", names(CleanData), ignore.case = TRUE)
names(CleanData)<-gsub("-freq()", "Frequency", names(CleanData), ignore.case = TRUE)
names(CleanData)<-gsub("angle", "Angle", names(CleanData))
names(CleanData)<-gsub("gravity", "Gravity", names(CleanData))


#Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

TidyData <- CleanData %>%
  group_by(subject, activity) %>%
  summarise_all(tibble::lst(mean))

write.table(TidyData, "TidyData.txt", row.name=FALSE)


#Final Check Stage

#Checking variable names

str(TidyData)
View(TidyData)
