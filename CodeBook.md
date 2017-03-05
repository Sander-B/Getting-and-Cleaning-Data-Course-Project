This document describes the variables and actions of run_analysis.R. 

Imported libraries: 
data.table. 

Variables:
fileUrl: contains the URL to the .zip file on the internet. 
dateDownloaded: contains the date on which the file was downloaded. 
features: contains the raw data from features.txt. 
activities: contains the raw data from activity_labels.txt.
y_train: contains the raw data from y_train.txt.
y_test: contains the raw data from y_test.txt. 
x_train: contains the raw data from x_train.txt.
x_test: contains the raw data from x_test.txt. 
merged_data: contains the merged and labeled data of x_train and x_test (solution to step 1 and 4). 
mean_stddev_column_indices: contains the indices of labels containing "mean()", "meanFreq()" or "std()".
mean_stddev_data: subset of merged_data with only colums containing  "mean()", "meanFreq()" or "std()" (solution to step 2 and 4). 
y_merged: contains the merged and labeled data of y_train and y_test.
activity_speaking: version of y_merged converted to speaking names. 
activity_dataframe: dataframe version of activity_speaking.
data_activities: combination of data frames activity_dataframe and mean_stddev_data (solution to step 3 and 4). 
data_activities_table: data table formatted version of data_activities. 
mean_by_activity: means of all columns grouped by activity (solution to step 5). 

files: 
getdata_dataset.zip: raw data set, downloaded from internet. 
merged_data.csv: writeout of merged_data (solution to step 1 and 4). 
mean_stddev_data.csv: writeout of mean_stddev_data (solution to step 2 and 4)
data_activities.csv: writeout of data_activities (solution to step 3 and 4)
mean_by_activity.csv: writeout of mean_by_activity (solution to step 5)