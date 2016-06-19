# Code Book

This codebook describes the generation of the HumanActivityRecognitionUsingSmartphones and 
HumanActivityRecognitionUsingSmartphonesSummary data frames from data downloaded from the Human Activity Recognition Using Smartphones Data Set in the UCI Machine Learning Repository (<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>). 

The source data can be retrieved from here: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> 

## Processing of the data
The tidying of the data consisted of:
* downloading and unzipping the source zip file
* using the features.txt names to name the columns in HumanActivityRecognitionUsingSmartphones
* Joining together subject\_train.txt, X_train.txt and Y_train.txt into a single dataset
* Taking the activity\_labels.txt activity names and joining them to the previous dataset
* cleaning the column names replacing "\-mean()\-" with "\_mean\_"
* cleaning the column names replacing "\-std()\-" with "\_std\_"
* cleaning the column names replacing "\-mean()" with "\_mean"
* cleaning the column names replacing "\-std()" with "\_mean"
* doing the same for the "test" files as the "train" files
* unioning the cleaned training and test datasets to create a single HumanActivityRecognitionUsingSmartphones dataframe.
* Grouping the HumanActivityRecognitionUsingSmartphones by subjectid and activityname and averaging all of the measures to create the HumanActivityRecognitionUsingSmartphonesSummary data frame.

## HumanActivityRecognitionUsingSmartphones.csv
The HumanActivityRecognitionUsingSmartphones CSV file contains 20598 observations of 70 variables.  This contains the measurements on the mean and standard deviation for each measurement from the original datasets as well as subject, activity and source.

The variables are as follows:

1. subjectid - an integer identifying the subject that generated this observation.
2. activityid - an integer identifying the activity performed.
3. activityname - a factor identify the activity performed.
4. source - a factor containing the source of the data, test or train.
5. tBodyAcc\_mean\_X - a numeric normalized mean bounded within [-1, 1].
6. tBodyAcc\_mean\_Y - a numeric normalized mean bounded within [-1, 1].
7. tBodyAcc\_mean\_Z - a numeric normalized mean bounded within [-1, 1].
8. tBodyAcc\_std\_X - a numeric normalized standard deviation bounded within [-1, 1].
9. tBodyAcc\_std\_Y - a numeric normalized standard deviation bounded within [-1, 1].
10. tBodyAcc\_std\_Z - a numeric normalized standard deviation bounded within [-1, 1].
11. tGravityAcc\_mean\_X - a numeric normalized mean bounded within [-1, 1].
12. tGravityAcc\_mean\_Y - a numeric normalized mean bounded within [-1, 1].
13. tGravityAcc\_mean\_Z - a numeric normalized mean bounded within [-1, 1].
14. tGravityAcc\_std\_X - a numeric normalized standard deviation bounded within [-1, 1].
15. tGravityAcc\_std\_Y - a numeric normalized standard deviation bounded within [-1, 1].
16. tGravityAcc\_std\_Z - a numeric normalized standard deviation bounded within [-1, 1].
17. tBodyAccJerk\_mean\_X - a numeric normalized mean bounded within [-1, 1].
18. tBodyAccJerk\_mean\_Y - a numeric normalized mean bounded within [-1, 1].
19. tBodyAccJerk\_mean\_Z - a numeric normalized mean bounded within [-1, 1].
20. tBodyAccJerk\_std\_X - a numeric normalized standard deviation bounded within [-1, 1].
21. tBodyAccJerk\_std\_Y - a numeric normalized standard deviation bounded within [-1, 1].
22. tBodyAccJerk\_std\_Z - a numeric normalized standard deviation bounded within [-1, 1].
23. tBodyGyro\_mean\_X - a numeric normalized mean bounded within [-1, 1].
24. tBodyGyro\_mean\_Y - a numeric normalized mean bounded within [-1, 1].
25. tBodyGyro\_mean\_Z - a numeric normalized mean bounded within [-1, 1].
26. tBodyGyro\_std\_X - a numeric normalized standard deviation bounded within [-1, 1].
27. tBodyGyro\_std\_Y - a numeric normalized standard deviation bounded within [-1, 1].
28. tBodyGyro\_std\_Z - a numeric normalized standard deviation bounded within [-1, 1].
29. tBodyGyroJerk\_mean\_X - a numeric normalized mean bounded within [-1, 1].
30. tBodyGyroJerk\_mean\_Y - a numeric normalized mean bounded within [-1, 1].
31. tBodyGyroJerk\_mean\_Z - a numeric normalized mean bounded within [-1, 1].
32. tBodyGyroJerk\_std\_X - a numeric normalized standard deviation bounded within [-1, 1].
33. tBodyGyroJerk\_std\_Y - a numeric normalized standard deviation bounded within [-1, 1].
34. tBodyGyroJerk\_std\_Z - a numeric normalized standard deviation bounded within [-1, 1].
35. tBodyAccMag\_mean - a numeric normalized mean bounded within [-1, 1].
36. tBodyAccMag\_std - a numeric normalized standard deviation bounded within [-1, 1].
37. tGravityAccMag\_mean - a numeric normalized mean bounded within [-1, 1].
38. tGravityAccMag\_std - a numeric normalized standard deviation bounded within [-1, 1].
39. tBodyAccJerkMag\_mean - a numeric normalized mean bounded within [-1, 1].
40. tBodyAccJerkMag\_std - a numeric normalized standard deviation bounded within [-1, 1].
41. tBodyGyroMag\_mean - a numeric normalized mean bounded within [-1, 1].
42. tBodyGyroMag\_std - a numeric normalized standard deviation bounded within [-1, 1].
43. tBodyGyroJerkMag\_mean - a numeric normalized mean bounded within [-1, 1].
44. tBodyGyroJerkMag\_std - a numeric normalized standard deviation bounded within [-1, 1].
45. fBodyAcc\_mean\_X - a numeric normalized mean bounded within [-1, 1].
46. fBodyAcc\_mean\_Y - a numeric normalized mean bounded within [-1, 1].
47. fBodyAcc\_mean\_Z - a numeric normalized mean bounded within [-1, 1].
48. fBodyAcc\_std\_X - a numeric normalized standard deviation bounded within [-1, 1].
49. fBodyAcc\_std\_Y - a numeric normalized standard deviation bounded within [-1, 1].
50. fBodyAcc\_std\_Z - a numeric normalized standard deviation bounded within [-1, 1].
51. fBodyAccJerk\_mean\_X - a numeric normalized mean bounded within [-1, 1].
52. fBodyAccJerk\_mean\_Y - a numeric normalized mean bounded within [-1, 1].
53. fBodyAccJerk\_mean\_Z - a numeric normalized mean bounded within [-1, 1].
54. fBodyAccJerk\_std\_X - a numeric normalized standard deviation bounded within [-1, 1].
55. fBodyAccJerk\_std\_Y - a numeric normalized standard deviation bounded within [-1, 1].
56. fBodyAccJerk\_std\_Z - a numeric normalized standard deviation bounded within [-1, 1].
57. fBodyGyro\_mean\_X - a numeric normalized mean bounded within [-1, 1].
58. fBodyGyro\_mean\_Y - a numeric normalized mean bounded within [-1, 1].
59. fBodyGyro\_mean\_Z - a numeric normalized mean bounded within [-1, 1].
60. fBodyGyro\_std\_X - a numeric normalized standard deviation bounded within [-1, 1].
61. fBodyGyro\_std\_Y - a numeric normalized standard deviation bounded within [-1, 1].
62. fBodyGyro\_std\_Z - a numeric normalized standard deviation bounded within [-1, 1].
63. fBodyAccMag\_mean - a numeric normalized mean bounded within [-1, 1].
64. fBodyAccMag\_std - a numeric normalized standard deviation bounded within [-1, 1].
65. fBodyBodyAccJerkMag\_mean - a numeric normalized mean bounded within [-1, 1].
66. fBodyBodyAccJerkMag\_std - a numeric normalized standard deviation bounded within [-1, 1].
67. fBodyBodyGyroMag\_mean - a numeric normalized mean bounded within [-1, 1].
68. fBodyBodyGyroMag\_std - a numeric normalized standard deviation bounded within [-1, 1].
69. fBodyBodyGyroJerkMag\_mean - a numeric normalized mean bounded within [-1, 1].
70. fBodyBodyGyroJerkMag\_std - a numeric normalized standard deviation bounded within [\-1, 1].

## HumanActivityRecognitionUsingSmartphonesSummary.csv
The HumanActivityRecognitionUsingSmartphonesSummary CSV file contains 180 observations of 67 variables.  This contains the average of each variable for each activity and each subject from the HumanActivityRecognitionUsingSmartphones data frame.

The variables are as follows:

1. subjectid - an integer identifying the subject that generated this observation.
2. activityname - a factor identify the activity performed.
3. tBodyAcc\_mean\_Y\_average - a numeric average.
4. tBodyAcc\_mean\_Z\_average - a numeric average.
5. tBodyAcc\_std\_X\_average - a numeric average.
6. tBodyAcc\_std\_Y\_average - a numeric average.
7. tBodyAcc\_std\_Z\_average - a numeric average.
8. tGravityAcc\_mean\_X\_average - a numeric average.
9. tGravityAcc\_mean\_Y\_average - a numeric average.
10. tGravityAcc\_mean\_Z\_average - a numeric average.
11. tGravityAcc\_std\_X\_average - a numeric average.
12. tGravityAcc\_std\_Y\_average - a numeric average.
13. tGravityAcc\_std\_Z\_average - a numeric average.
14. tBodyAccJerk\_mean\_X\_average - a numeric average.
15. tBodyAccJerk\_mean\_Y\_average - a numeric average.
16. tBodyAccJerk\_mean\_Z\_average - a numeric average.
17. tBodyAccJerk\_std\_X\_average - a numeric average.
18. tBodyAccJerk\_std\_Y\_average - a numeric average.
19. tBodyAccJerk\_std\_Z\_average - a numeric average.
20. tBodyGyro\_mean\_X\_average - a numeric average.
21. tBodyGyro\_mean\_Y\_average - a numeric average.
22. tBodyGyro\_mean\_Z\_average - a numeric average.
23. tBodyGyro\_std\_X\_average - a numeric average.
24. tBodyGyro\_std\_Y\_average - a numeric average.
25. tBodyGyro\_std\_Z\_average - a numeric average.
26. tBodyGyroJerk\_mean\_X\_average - a numeric average.
27. tBodyGyroJerk\_mean\_Y\_average - a numeric average.
28. tBodyGyroJerk\_mean\_Z\_average - a numeric average.
29. tBodyGyroJerk\_std\_X\_average - a numeric average.
30. tBodyGyroJerk\_std\_Y\_average - a numeric average.
31. tBodyGyroJerk\_std\_Z\_average - a numeric average.
32. tBodyAccMag\_mean\_average - a numeric average.
33. tBodyAccMag\_std\_average - a numeric average.
34. tGravityAccMag\_mean\_average - a numeric average.
35. tGravityAccMag\_std\_average - a numeric average.
36. tBodyAccJerkMag\_mean\_average - a numeric average.
37. tBodyAccJerkMag\_std\_average - a numeric average.
38. tBodyGyroMag\_mean\_average - a numeric average.
39. tBodyGyroMag\_std\_average - a numeric average.
40. tBodyGyroJerkMag\_mean\_average - a numeric average.
41. tBodyGyroJerkMag\_std\_average - a numeric average.
42. fBodyAcc\_mean\_X\_average - a numeric average.
43. fBodyAcc\_mean\_Y\_average - a numeric average.
44. fBodyAcc\_mean\_Z\_average - a numeric average.
45. fBodyAcc\_std\_X\_average - a numeric average.
46. fBodyAcc\_std\_Y\_average - a numeric average.
47. fBodyAcc\_std\_Z\_average - a numeric average.
48. fBodyAccJerk\_mean\_X\_average - a numeric average.
49. fBodyAccJerk\_mean\_Y\_average - a numeric average.
50. fBodyAccJerk\_mean\_Z\_average - a numeric average.
51. fBodyAccJerk\_std\_X\_average - a numeric average.
52. fBodyAccJerk\_std\_Y\_average - a numeric average.
53. fBodyAccJerk\_std\_Z\_average - a numeric average.
54. fBodyGyro\_mean\_X\_average - a numeric average.
55. fBodyGyro\_mean\_Y\_average - a numeric average.
56. fBodyGyro\_mean\_Z\_average - a numeric average.
57. fBodyGyro\_std\_X\_average - a numeric average.
58. fBodyGyro\_std\_Y\_average - a numeric average.
59. fBodyGyro\_std\_Z\_average - a numeric average.
60. fBodyAccMag\_mean\_average - a numeric average.
61. fBodyAccMag\_std\_average - a numeric average.
62. fBodyBodyAccJerkMag\_mean\_average - a numeric average.
63. fBodyBodyAccJerkMag\_std\_average - a numeric average.
64. fBodyBodyGyroMag\_mean\_average - a numeric average.
65. fBodyBodyGyroMag\_std\_average - a numeric average.
66. fBodyBodyGyroJerkMag\_mean\_average - a numeric average.
67. fBodyBodyGyroJerkMag\_std\_average - a numeric average.