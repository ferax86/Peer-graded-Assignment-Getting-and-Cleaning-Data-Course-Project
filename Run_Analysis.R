#Initial set up 


Features<-read.table("features.txt", header = FALSE, sep = "", dec = ".",col.names = c("n","functions"))

Subject_train<-read.table("subject_train.txt", header = FALSE, sep = "", dec = ".",col.names = "subject")
Subject_test<-read.table("subject_test.txt", header = FALSE, sep = "", dec = ".",col.names = "subject")

Activity_train<-read.table("y_train.txt", header = FALSE, sep = "", dec = ".",col.names = "code")
Activity_test<-read.table("y_test.txt", header = FALSE, sep = "", dec = ".",col.names = "code")


Training_set<-read.table("X_train.txt", header = FALSE, sep = "", dec = ".",col.names = Features$functions)
Test_set<-read.table("X_test.txt", header = FALSE, sep = "", dec = ".",col.names = Features$functions)

Activities <- read.table("activity_labels.txt", col.names = c("code", "activity"))






# Step 1: Merges the training and the test sets to create one data set.

A<-rbind(Subject_train,Subject_test)
B<-rbind(Activity_train,Activity_test)
C<-rbind(Training_set,Test_set)

dataset1<-cbind(A,B,C)


# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.

library(dplyr)


dataset2<-dataset1 %>%
         select(subject,code,contains("mean"),contains("std")) 


# Step 3:Uses descriptive activity names to name the activities in the data set   


dataset2$code <- Activities[dataset2$code, 2]


# Step 4:Appropriately labels the data set with descriptive variable names.


names(dataset2)[2]<-c("Activity")
names(dataset2)<-gsub("^t","Time",names(dataset2))
names(dataset2)<-gsub("^f","Frequency",names(dataset2))
names(dataset2)<-gsub("Acc","Accelerometer",names(dataset2))
names(dataset2)<-gsub("Gyro","Gyroscope",names(dataset2))    
names(dataset2)<-gsub("Mag","Magnitude",names(dataset2))
names(dataset2)<-gsub("\\.","",names(dataset2))
names(dataset2)<-gsub("std()","StandardDeviation",names(dataset2),ignore.case = TRUE)
names(dataset2)<-gsub("BodyBody","Body",names(dataset2),ignore.case = TRUE)
names(dataset2)<-gsub("mean","Mean",names(dataset2),ignore.case = TRUE)




# Step 4:From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity 
#and each subject.



dataset2<-tbl_df(dataset2)

CleanDataSet<-dataset2%>%
    group_by(subject,Activity)%>% 
    summarise_all(funs(mean))

write.table(CleanDataSet, "CleanDataSet.txt", row.name=FALSE)




