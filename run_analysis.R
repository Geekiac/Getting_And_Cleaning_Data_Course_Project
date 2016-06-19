## Getting and Cleaning Data Course Project
## run_analysis.R
library(dplyr)

if (!file.exists("UCI HAR Dataset")) {
  dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  filename <- "dataset.zip"
  download.file(dataUrl, destfile = filename)
  unzip(filename)
}

# This function creates the HumanActivityRecognitionUsingSmartphones data frame.
#
# This function implements the following four requirements:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
#
# A function was used to scope all of the temporary variables to this function
# so that they would be removed when the function completes.
createHumanActivityRecognitionUsingSmartphones <- function() {
  # get all of the column names for the source data
  features <- read.table("UCI HAR Dataset/features.txt", col.names = c("featureid", "name"), header = FALSE, stringsAsFactors = TRUE)
  # get the column names containing mean or std so we can get just the means and standard deviation info.
  features_mean_std <- as.vector(features[grepl("-(mean|std)[(][)]", features$name), ]$name)
  
  # get all of the activity labels
  activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activityid", "name"), header = FALSE, stringsAsFactors = TRUE)
  
  # get the subject ids for each observation
  subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c("subjectid"), header = FALSE, stringsAsFactors = TRUE)
  # get the activity ids for each observation
  y_train <- read.table("UCI HAR Dataset/train/Y_train.txt", col.names = c("activityid"), header = FALSE, stringsAsFactors = TRUE)
  # get the measured data for each observation
  x_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE, stringsAsFactors = TRUE)
  # update the column names using the feature data
  names(x_train) <- features$name
  # add the activity names to the activity ids
  activities_train <- mutate(y_train, activityname = activity_labels[y_train$activityid ,]$name, source="train")
  
  # join together the subject, activity, means and standard deviations into a single data frame
  x_train_reduced <- cbind(subject_train, activities_train, x_train[, features_mean_std])
  # clean up the column names replacing - with _ and removing ()
  names(x_train_reduced) <- gsub("-(mean|std)[(][)]-", "_\\1_", names(x_train_reduced))
  names(x_train_reduced) <- gsub("-(mean|std)[(][)]", "_\\1", names(x_train_reduced))
  
  # get the subject ids for each observation
  subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c("subjectid"), header = FALSE, stringsAsFactors = TRUE)
  # get the activity ids for each observation
  y_test <- read.table("UCI HAR Dataset/test/Y_test.txt", col.names = c("activityid"), header = FALSE, stringsAsFactors = TRUE)
  # get the measured data for each observation
  x_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE, stringsAsFactors = TRUE)
  # update the column names using the feature data
  names(x_test) <- features$name
  # add the activity names to the activity ids
  activities_test <- mutate(y_test, activityname = activity_labels[y_test$activityid ,]$name, source = "test")
  
  # join together the subject, activity, means and standard deviations into a single data frame
  x_test_reduced <- cbind(subject_test, activities_test, x_test[, features_mean_std])
  # clean up the column names replacing - with _ and removing ()
  names(x_test_reduced) <- gsub("-(mean|std)[(][)]-", "_\\1_", names(x_test_reduced))
  names(x_test_reduced) <- gsub("-(mean|std)[(][)]", "_\\1", names(x_test_reduced))
  
  # union the training and test data together into a single data frame
  result <- rbind(x_train_reduced, x_test_reduced)
  # convert source to a factor
  mutate(result, source = as.factor(source))
}
  
# This function creates the HumanActivityRecognitionUsingSmartphonesSummary data frame.
#
# This function implements the following requirements:
# creates a tidy data set from the the HumanActivityRecognitionUsingSmartphones data frame with the average of each variable for each activity and each subject.
#
# A function was used to scope all of the temporary variables to this function
# so that they would be removed when the function completes.
createHumanActivityRecognitionUsingSmartphonesSummary <- function(data) {
  # organise the data into groups by subject id and activity name
  by_subjectid_activityname <- group_by(data, subjectid, activityname)
  # create a result set averageing each of the measure columns by subject id and activity name
  summarise(by_subjectid_activityname, 
            tBodyAcc_mean_Y_average = mean(tBodyAcc_mean_Y),          
            tBodyAcc_mean_Z_average = mean(tBodyAcc_mean_Z),          
            tBodyAcc_std_X_average = mean(tBodyAcc_std_X),         
            tBodyAcc_std_Y_average = mean(tBodyAcc_std_Y),         
            tBodyAcc_std_Z_average = mean(tBodyAcc_std_Z),         
            tGravityAcc_mean_X_average = mean(tGravityAcc_mean_X),          
            tGravityAcc_mean_Y_average = mean(tGravityAcc_mean_Y),          
            tGravityAcc_mean_Z_average = mean(tGravityAcc_mean_Z),          
            tGravityAcc_std_X_average = mean(tGravityAcc_std_X),         
            tGravityAcc_std_Y_average = mean(tGravityAcc_std_Y),         
            tGravityAcc_std_Z_average = mean(tGravityAcc_std_Z),         
            tBodyAccJerk_mean_X_average = mean(tBodyAccJerk_mean_X),          
            tBodyAccJerk_mean_Y_average = mean(tBodyAccJerk_mean_Y),          
            tBodyAccJerk_mean_Z_average = mean(tBodyAccJerk_mean_Z),          
            tBodyAccJerk_std_X_average = mean(tBodyAccJerk_std_X),         
            tBodyAccJerk_std_Y_average = mean(tBodyAccJerk_std_Y),         
            tBodyAccJerk_std_Z_average = mean(tBodyAccJerk_std_Z),                                  
            tBodyGyro_mean_X_average = mean(tBodyGyro_mean_X),          
            tBodyGyro_mean_Y_average = mean(tBodyGyro_mean_Y),          
            tBodyGyro_mean_Z_average = mean(tBodyGyro_mean_Z),          
            tBodyGyro_std_X_average = mean(tBodyGyro_std_X),         
            tBodyGyro_std_Y_average = mean(tBodyGyro_std_Y),         
            tBodyGyro_std_Z_average = mean(tBodyGyro_std_Z),
            tBodyGyroJerk_mean_X_average = mean(tBodyGyroJerk_mean_X),          
            tBodyGyroJerk_mean_Y_average = mean(tBodyGyroJerk_mean_Y),          
            tBodyGyroJerk_mean_Z_average = mean(tBodyGyroJerk_mean_Z),          
            tBodyGyroJerk_std_X_average = mean(tBodyGyroJerk_std_X),         
            tBodyGyroJerk_std_Y_average = mean(tBodyGyroJerk_std_Y),         
            tBodyGyroJerk_std_Z_average = mean(tBodyGyroJerk_std_Z),   
            tBodyAccMag_mean_average = mean(tBodyAccMag_mean),        
            tBodyAccMag_std_average = mean(tBodyAccMag_std),
            tGravityAccMag_mean_average = mean(tGravityAccMag_mean),
            tGravityAccMag_std_average = mean(tGravityAccMag_std),
            tBodyAccJerkMag_mean_average = mean(tBodyAccJerkMag_mean),
            tBodyAccJerkMag_std_average = mean(tBodyAccJerkMag_std),
            tBodyGyroMag_mean_average = mean(tBodyGyroMag_mean),
            tBodyGyroMag_std_average = mean(tBodyGyroMag_std),
            tBodyGyroJerkMag_mean_average = mean(tBodyGyroJerkMag_mean),
            tBodyGyroJerkMag_std_average = mean(tBodyGyroJerkMag_std),
            fBodyAcc_mean_X_average = mean(fBodyAcc_mean_X),          
            fBodyAcc_mean_Y_average = mean(fBodyAcc_mean_Y),          
            fBodyAcc_mean_Z_average = mean(fBodyAcc_mean_Z),          
            fBodyAcc_std_X_average = mean(fBodyAcc_std_X),         
            fBodyAcc_std_Y_average = mean(fBodyAcc_std_Y),         
            fBodyAcc_std_Z_average = mean(fBodyAcc_std_Z), 
            fBodyAccJerk_mean_X_average = mean(fBodyAccJerk_mean_X),          
            fBodyAccJerk_mean_Y_average = mean(fBodyAccJerk_mean_Y),          
            fBodyAccJerk_mean_Z_average = mean(fBodyAccJerk_mean_Z),          
            fBodyAccJerk_std_X_average = mean(fBodyAccJerk_std_X),         
            fBodyAccJerk_std_Y_average = mean(fBodyAccJerk_std_Y),         
            fBodyAccJerk_std_Z_average = mean(fBodyAccJerk_std_Z),                               
            fBodyGyro_mean_X_average = mean(fBodyGyro_mean_X),          
            fBodyGyro_mean_Y_average = mean(fBodyGyro_mean_Y),          
            fBodyGyro_mean_Z_average = mean(fBodyGyro_mean_Z),          
            fBodyGyro_std_X_average = mean(fBodyGyro_std_X),         
            fBodyGyro_std_Y_average = mean(fBodyGyro_std_Y),         
            fBodyGyro_std_Z_average = mean(fBodyGyro_std_Z),     
            fBodyAccMag_mean_average = mean(fBodyAccMag_mean),       
            fBodyAccMag_std_average = mean(fBodyAccMag_std),
            fBodyBodyAccJerkMag_mean_average = mean(fBodyBodyAccJerkMag_mean),
            fBodyBodyAccJerkMag_std_average = mean(fBodyBodyAccJerkMag_std),
            fBodyBodyGyroMag_mean_average = mean(fBodyBodyGyroMag_mean),
            fBodyBodyGyroMag_std_average = mean(fBodyBodyGyroMag_std),
            fBodyBodyGyroJerkMag_mean_average = mean(fBodyBodyGyroJerkMag_mean),
            fBodyBodyGyroJerkMag_std_average = mean(fBodyBodyGyroJerkMag_std)) 
}

# create the HumanActivityRecognitionUsingSmartphones data frame
HumanActivityRecognitionUsingSmartphones <- createHumanActivityRecognitionUsingSmartphones()
# Output data frame as a CSV file
write.csv(HumanActivityRecognitionUsingSmartphones, file = "HumanActivityRecognitionUsingSmartphones.csv", row.names = FALSE)

# create the HumanActivityRecognitionUsingSmartphones data frame
HumanActivityRecognitionUsingSmartphonesSummary <- createHumanActivityRecognitionUsingSmartphonesSummary(HumanActivityRecognitionUsingSmartphones)
# Output data frame as a CSV file
write.csv(HumanActivityRecognitionUsingSmartphonesSummary, file = "HumanActivityRecognitionUsingSmartphonesSummary.csv", row.names = FALSE)

