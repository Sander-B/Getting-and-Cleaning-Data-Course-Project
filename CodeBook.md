#Codebook of run_analysis

##Introduction
This document describes the variables and actions of run_analysis.R. 

##Imported libraries
- data.table. 

##Description of the variables in run_analysis.R
###Download the .zip file
- fileUrl: contains the URL to the .zip file on the internet. 
- dateDownloaded: contains the date on which the file was downloaded. 
- features: contains the raw data from features.txt. 
###Read out the relevant files
- activities: contains the raw data from activity_labels.txt.
- y_train: contains the raw data from y_train.txt.
- y_test: contains the raw data from y_test.txt. 
- x_train: contains the raw data from x_train.txt.
- x_test: contains the raw data from x_test.txt. 
- subject_train: contains the raw data from subject_train.txt.
- subject_test: contains the raw data from subject_test.txt.
###Merge train and test data
- subject_merged: contains the merged data of subject_train and subject_test. 
- merged_data: contains the merged and labeled data of x_train and x_test (solution to step 1 and 4). 
- mean_stddev_column_indices: contains the indices of labels containing "mean()", "meanFreq()" or "std()".
- mean_stddev_data: subset of merged_data with only colums containing  "mean()", "meanFreq()" or "std()" (solution to step 2 and 4). 
- y_merged: contains the merged and labeled data of y_train and y_test.
- activity_speaking: version of y_merged converted to speaking names. 
- add_columns_dataframe: dataframe of subject_merge and activity_speaking.
- data_subject_activities: combination of data frames add_columns_dataframe and mean_stddev_data (solution to step 3 and 4). 
###Summarize by subject and activity 
- data_subject_activities_table: data table formatted version of data_subject_activities. 
- mean_by_subject_activity: means of all columns grouped by subject and activity (solution to step 5). 

##Files generated:
- getdata_dataset.zip: raw data set, downloaded from internet. 
- mean_by_subject_activity.txt: writeout of mean_by_activity (solution to step 5)

##Description of mean_by_subject_activity.txt
The data set contains a table of the mean values of interesting values of the original dataset. The means are calculated per subject and activity. The data contains the following variables: 
- Subject
- Activity
- tBodyAcc-mean()-X
- tBodyAcc-mean()-Y
- tBodyAcc-mean()-Z
- tBodyAcc-std()-X
- tBodyAcc-std()-Y
- tBodyAcc-std()-Z
- tGravityAcc-mean()-X
- tGravityAcc-mean()-Y
- tGravityAcc-mean()-Z
- tGravityAcc-std()-X
- tGravityAcc-std()-Y
- tGravityAcc-std()-Z
- tBodyAccJerk-mean()-X
- tBodyAccJerk-mean()-Y
- tBodyAccJerk-mean()-Z
- tBodyAccJerk-std()-X
- tBodyAccJerk-std()-Y
- tBodyAccJerk-std()-Z
- tBodyGyro-mean()-X
- tBodyGyro-mean()-Y
- tBodyGyro-mean()-Z
- tBodyGyro-std()-X
- tBodyGyro-std()-Y
- tBodyGyro-std()-Z
- tBodyGyroJerk-mean()-X
- tBodyGyroJerk-mean()-Y
- tBodyGyroJerk-mean()-Z
- tBodyGyroJerk-std()-X
- tBodyGyroJerk-std()-Y
- tBodyGyroJerk-std()-Z
- tBodyAccMag-mean()
- tBodyAccMag-std()
- tGravityAccMag-mean()
- tGravityAccMag-std()
- tBodyAccJerkMag-mean()
- tBodyAccJerkMag-std()
- tBodyGyroMag-mean()
- tBodyGyroMag-std()
- tBodyGyroJerkMag-mean()
- tBodyGyroJerkMag-std()
- fBodyAcc-mean()-X
- fBodyAcc-mean()-Y
- fBodyAcc-mean()-Z
- fBodyAcc-std()-X
- fBodyAcc-std()-Y
- fBodyAcc-std()-Z
- fBodyAcc-meanFreq()-X
- fBodyAcc-meanFreq()-Y
- fBodyAcc-meanFreq()-Z
- fBodyAccJerk-mean()-X
- fBodyAccJerk-mean()-Y
- fBodyAccJerk-mean()-Z
- fBodyAccJerk-std()-X
- fBodyAccJerk-std()-Y
- fBodyAccJerk-std()-Z
- fBodyAccJerk-meanFreq()-X
- fBodyAccJerk-meanFreq()-Y
- fBodyAccJerk-meanFreq()-Z
- fBodyGyro-mean()-X
- fBodyGyro-mean()-Y
- fBodyGyro-mean()-Z
- fBodyGyro-std()-X
- fBodyGyro-std()-Y
- fBodyGyro-std()-Z
- fBodyGyro-meanFreq()-X
- fBodyGyro-meanFreq()-Y
- fBodyGyro-meanFreq()-Z
- fBodyAccMag-mean()
- fBodyAccMag-std()
- fBodyAccMag-meanFreq()
- fBodyBodyAccJerkMag-mean()
- fBodyBodyAccJerkMag-std()
- fBodyBodyAccJerkMag-meanFreq()
- fBodyBodyGyroMag-mean()
- fBodyBodyGyroMag-std()
- fBodyBodyGyroMag-meanFreq()
- fBodyBodyGyroJerkMag-mean()
- fBodyBodyGyroJerkMag-std()
- fBodyBodyGyroJerkMag-meanFreq()
