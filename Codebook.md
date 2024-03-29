# This codebook explain the all the procedures (initial set up , variables and dataframes creation, data manipulation) I created in order to perform the 5 tasks assigned for this project.

## 1.	Download the dataset
   -Dataset downloaded and extracted under the folder called UCI HAR Dataset
   -For simplicity I put all datasets in the same folder to load at the same time the files in R 

## 2.	Dataframe creation

I load the following files and assign them to the following dataframes:
   -features <- features.txt 
   -Activities <- activity_labels.txt 
   -Subject_test <- subject_test.txt 
   -Subject_train <- test/subject_train.txt 
   -Test_set <- X_test.txt
   -Training_set<- X_train.txt
   -Activity_train<- y_train.txt
   -Activity_test<-y_test.txt

## 3.	Merges the training and the test sets to create one data set

   I created three datasets (A,B,C):
   
   1.	Dataset A is created by merging “Subject_train” and “Subject_test“datasets  by row (rbind)
   2.	Dataset B is created by merging “Activity_train” and “Activity_test “datasets   by row (rbind)
   3.	Dataset C is created by merging “Training_set” and “Test_set “datasets   by row (rbind)

   Finally I merge them by column (cbind) in a big dataset called dataset1 

## 4.	Extracts only the measurements on the mean and standard deviation for each measurement

   -Dataset2 is created by subsetting dataset1, selecting only columns: subject, code and the measurements on the mean and standard         deviation (std) for each measurement

## 5.	Uses descriptive activity names to name the activities in the data set

   -The label code in code column of the Dataset2 have been replaced with corresponding code activity taken from second column of the       Activities datasets

## 6.	Appropriately labels the data set with descriptive variable names
   -	code column in dataset2 renamed into activities
   -	All Acc in column’s name replaced by Accelerometer
   -	All Gyro in column’s name replaced by Gyroscope
   -	All BodyBody in column’s name replaced by Body
   -	All Mag in column’s name replaced by Magnitude
   -	All start with character f in column’s name replaced by Frequency
   -	All start with character t in column’s name replaced by Time
   -	All dots have been deleted 

## 7.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

   -CleanDataSet is created by grouped by subject and activity the dataset2 and calculating the means of each variable for each activity     and each subject

## 8.	Finally, I Export CleanDataSet into CleanDataSet.txt file.

