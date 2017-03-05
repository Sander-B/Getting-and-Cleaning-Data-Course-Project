# Import the data.table library that we need for step 5. 
library(data.table)

###########################
# Download the .zip file. #
###########################

message("Downloading .zip file...")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./getdata_dataset.zip")
dateDownloaded <- base::date()  # base to make sure we don't conflict with lubridate

################################
# Read out the relevant files. #
################################

message("Reading out individual .zip files...")

# read out features.txt. This contains speaking names for all computed values.
features <- read.table(unz("./getdata_dataset.zip", "UCI HAR Dataset/features.txt"))

# read out the speaking names for the activities. 
activities <- read.table(unz("./getdata_dataset.zip", "UCI HAR Dataset/activity_labels.txt"))

# y contains two columns: measurement ID and a number 1-6 indicating the activity.
y_train <- read.table(unz("./getdata_dataset.zip", "UCI HAR Dataset/train/y_train.txt"))
y_test <- read.table(unz("./getdata_dataset.zip", "UCI HAR Dataset/test/y_test.txt"))

# x contains 561 columns indicating the activities defined in features.txt.
x_train <- read.table(unz("./getdata_dataset.zip", "UCI HAR Dataset/train/X_train.txt"))
x_test <- read.table(unz("./getdata_dataset.zip", "UCI HAR Dataset/test/X_test.txt"))

##############################
# Merge train and test data. #
##############################

message("Creating merged data frame...")

# Combine the test and train data sets as the difference is not relevant for the assignment
merged_data <- rbind(x_train, x_test)

# set column names for the x data sets according to features.txt second column (V2)
colnames(merged_data)<-(features$V2)

# write table to hard disk. 
write.table(merged_data, "merged_data.txt", row.name=FALSE)

message("Merged data frame (solution of part 1 and 4) is stored in the variable merged_data and written to merged_data.txt.")

# show merged_data in the viewer. 
View(merged_data)

###############################################################
# Extract the columns representing mean or standard deviation #
###############################################################

message("Creating mean/stddev data frame...")

# Select all variables containing the text "mean()", "meanFreq()" or "std()" ignoring case. 
# meanFreq is defined as "Weighted average of the frequency components to obtain a mean frequency"
# and is therefore also a type of mean. 
mean_stddev_column_indices <- grep("mean(Freq)?\\(\\)|std\\(\\)", names(merged_data), ignore.case = TRUE)

# Extract all mean and standard deviation data from the merged data set. 
mean_stddev_data <- merged_data[, mean_stddev_column_indices]

# write table to hard disk. 
write.table(mean_stddev_data, "mean_stddev_data.txt", row.name=FALSE)

message("Mean and standard deviation data frame (solution of part 2 and 4) is stored in the variable mean_stddev_data and written to mean_stddev_data.txt.")

# show mean_stddev_data in the viewer. 
View(mean_stddev_data)

################################################
# Add a column for activities (speaking names) #
################################################

message("Creating data frame with activities...")

# Combine y for train and test
y_merged <- rbind(y_train, y_test)

# Convert y tables to speaking names
activity_speaking <- activities[y_merged$V1, 2]

# Put speaking names into a data frame
activity_dataframe <- data.frame("Activity" = activity_speaking);

# Merge the activities into the data set
data_activities <- cbind(activity_dataframe, mean_stddev_data)

# write table to hard disk. 
write.table(data_activities, "data_activities.txt", row.name=FALSE)

message("Data frame with activities (solution of part 3 and 4) is stored in the variable data_activities and written to data_activities.txt.")

# show data_activities in the viewer. 
View(data_activities)

#########################
# Summarize by activity #
#########################

message("Creating mean-by-activity data frame...")

# Create a data table from the previous result. 
data_activities_table <- data.table(data_activities)

# Compute the means of all columns grouped by activity
mean_by_activity <- data_activities_table[, lapply(.SD, mean), by="Activity" ]

# write table to hard disk. 
write.table(mean_by_activity, "mean_by_activity.txt", row.name=FALSE)

message("Data frame with activities (solution of part 5) is stored in the variable mean_by_activity and written to mean_by_activity.txt.")

# show data_activities in the viewer. 
View(mean_by_activity)