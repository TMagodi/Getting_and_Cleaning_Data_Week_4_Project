The run_analysis.R script performs the data preparation and then followed by the 5 steps required as described in the course project’s definition.

The initial step is to Download The dataset:
The dataset was downloaded and extracted under the folder called FUCI HAR Dataset

Each data was then assigned a variable
    Features_Variable <- features.txt : 561 rows, 2 columns :-> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
    Activities_Variable <- activity_labels.txt : 6 rows, 2 columns :->List of activities performed when the corresponding measurements were taken and its codes (labels)
    subject_test <- test/subject_test.txt : 2947 rows, 1 column :-> contains test data of 9/30 volunteer test subjects being observed
    xtest <- test/X_test.txt : 2947 rows, 561 columns :-> contains recorded features test data
    ytest <- test/y_test.txt : 2947 rows, 1 columns :-> contains test data of activities’code labels
    subject_train <- test/subject_train.txt : 7352 rows, 1 column :->contains train data of 21/30 volunteer subjects being observed
    xtrain <- test/X_train.txt : 7352 rows, 561 columns :-> contains recorded features train data
    ytrain <- test/y_train.txt : 7352 rows, 1 columns :-> contains train data of activities’code labels

Merging training and test data-sets
   X (10299 rows, 561 columns) was created by merging xtrain and xtest using rbind() function
   Y (10299 rows, 1 column) was created by merging ytrain and ytest using rbind() function
   Subject (10299 rows, 1 column) was created by merging subject_train and subject_test using rbind() function
   Combined_Data (10299 rows, 563 column) was created by merging Subject, Y and X using cbind() function

Extracts only the measurements on the mean and standard deviation for each measurement
  CleanData (10299 rows, 88 columns) is created by subsetting Combined_Data and selecting columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement

Using descriptive activity names to name the activities in the data set
  Entire numbers in code column of the CleanData replaced with corresponding activity taken from second column of the activities variable

Appropriately labels the data set with descriptive variable names
code column in TidyData was renamed to activities
 Every Acc in column’s name replaced by Accelerometer
 Every Gyro in column’s name replaced by Gyroscope
 Every BodyBody in column’s name replaced by Body
 Every Mag in column’s name replaced by Magnitude
 Every word starting with character f in column’s name replaced by Frequency
 Every word starting with character t in column’s name replaced by Time

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
 TidyData (180 rows, 88 columns) is created by sumarizing CleanData and taking the means of each variable for each activity and each subject, 
 a grouping by was perfomed on subject and activity.
 Export TidyData into TidyData.txt file.
