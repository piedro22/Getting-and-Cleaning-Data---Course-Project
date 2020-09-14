##Creating the train dataset
subject_train <- read.table("subject_train.txt")
View(subject_train)
x_train <- read.table("X_train.txt")
View(x_train)
y_train <- read.table("y_train.txt")
View(y_train)
library(dplyr)
y_train <- rename(y_train, activity = V1)
subject_train <- rename(subject_train, subject_id = Subject_ID)
train_DS <- cbind(y_train, x_train)
train_DS <- cbind(subject_train, train_DS)

##Creating the test dataset
subject_test <- read.table("subject_test/txt")
View(subject_test)
x_test <- read.table("X_test.txt")
View(x_test)
y_test <- read.table("y_test.txt")
View(y_test)
y_test <- rename(y_test, activity = V1)
subject_test <- rename(subject_test, subject_id = V1)
test_DS <- cbind(y_test, x_test)
test_DS <- cbind(subject_test, test_DS)

##Merging the two Datasets and organizing the resulting one
merged_DS <- bind_rows(train_DS, test_DS)
View(merged_DS)
merged_DS <- arrange(merged_DS, subject_id, activity)

##Extracting measures on the mean and standard deviation for each measurement
selected_DS <- select(merged_DS, c(subject_id, activity, V1:V6, V41:V46, V81:V86, V121:V126, 
                    V161:V166, V201, V202, V214, V215, V227, V228, V240, V241, 
                    V253, V254, V266:V271,V345:V350, V424:V429, V503, V504, 
                    V516, V517, V529, V530, V542, V543))

##Naming activites descriptively
selected_DS$activity <- factor(selected_DS$activity, levels = c(1:6), 
                               labels = c("walking", "walking upstairs", 
                                          "walking downstairs", "sitting", 
                                          "standing", "laying"))

##Labelling descriptively the variables
selected_DS <- rename(selected_DS, tBodyAcc_mean_X = V1, tBodyAcc_mean_Y = V2, 
                      tBodyAcc_mean_Z = V3, tBodyAcc_std_X = V4, tBodyAcc_std_Y = V5, 
                      tBodyAcc_std_Z = V6, tGravityAcc_mean_X = V41, 
                      tGravityAcc_mean_Y = V42, tGravityAcc_mean_Z = V43,
                      tGravityAcc_std_X = V44, tGravityAcc_std_Y = V45,
                      tGravityAcc_std_Z = V46, tBodyAccJerk_mean_X = V81,
                      tBodyAccJerk_mean_Y = V82, tBodyAccJerk_mean_Z = V83,
                      tBodyAccJerk_std_X = V84, tBodyAccJerk_std_Y = V85,
                      tBodyAccJerk_std_Z = V86, tBodyGyro_mean_X = V121,
                      tBodyGyro_mean_Y = V122, tBodyGyro_mean_Z = V123,
                      tBodyGyro_std_X = V124, tBodyGyro_std_Y = V125,
                      tBodyGyro_std_Z = V126, tBodyGyroJerk_mean_X = V161,
                      tBodyGyroJerk_mean_Y = V162, tBodyGyroJerk_mean_Z = V163,
                      tBodyGyroJerk_std_X = V164, tBodyGyroJerk_std_Y = V165,
                      tBodyGyroJerk_std_Z = V166, tBodyAccMag_mean = V201,
                      tBodyAccMag_std = V202, tGravityAccMag_mean = V214,
                      tGravityAccMag_std = V215, tBodyAccJerkMag_mean = V227,
                      tBodyAccJerkMag_std = V228, tBodyGyroMag_mean = V240,
                      tBodyGyroMag_std = V241, tBodyGyroJerkMag_mean = V253,
                      tBodyGyroJerkMag_std = V254, fBodyAcc_mean_X = V266,
                      fBodyAcc_mean_Y = V267, fBodyAcc_mean_Z = V268,
                      fBodyAcc_std_X = V269, fBodyAcc_std_Y = V270, 
                      fBodyAcc_std_Z = V271, fBodyAccJerk_mean_X = V345,
                      fBodyAccJerk_mean_Y = V346, fBodyAccJerk_mean_Z = V347,
                      fBodyAccJerk_std_X = V348, fBodyAccJerk_std_Y = V349,
                      fBodyAccJerk_std_Z = V350, fBodyGyro_mean_X = V424,
                      fBodyGyro_mean_Y = V425, fBodyGyro_mean_Z = V426,
                      fBodyGyro_std_X = V427, fBodyGyro_std_Y = V428,
                      fBodyGyro_std_Z = V429, fBodyAccMag_mean = V503,
                      fBodyAccMag_std = V504, fBodyBodyAccJerkMag_mean = V516,
                      fBodyBodyAccJerkMag_std = V517, fBodyBodyGyroMag_mean = V529,
                      fBodyBodyGyroMag_std = V530, fBodyBodyGyroJerkMag_mean = V542,
                      fBodyBodyGyroJerkMag_std = V543)

##Creating and saving a second tidy dataset with the average for each variable for each activity and subject
final_tidy_DS <- selected_DS %>% 
        group_by(subject_id, activity) %>% 
        summarise_all(mean)
write.table(final_tidy_DS, file = "tidy_DS.txt", row.names = F)
