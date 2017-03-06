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

# subject contains
subject_train <- read.table(unz("./getdata_dataset.zip", "UCI HAR Dataset/train/subject_train.txt"))
subject_test <- read.table(unz("./getdata_dataset.zip", "UCI HAR Dataset/test/subject_test.txt"))

##############################
# Merge train and test data. #
##############################

message("Creating merged data frame...")

# Combine the test and train data sets as the difference is not relevant for the assignment
merged_data <- rbind(x_train, x_test)

# set column names for the x data sets according to features.txt second column (V2)
colnames(merged_data)<-(features$V2)

message("Merged data frame (solution of part 1 and 4) is stored in the variable merged_data.")

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

message("Mean and standard deviation data frame (solution of part 2 and 4) is stored in the variable mean_stddev_data.")

# show mean_stddev_data in the viewer. 
View(mean_stddev_data)

##########################################################
# Add a column for subject and activity (speaking names) #
##########################################################

message("Creating data frame with subjects and activities...")

# Combine subject for train and test
subject_merged <- rbind(subject_train, subject_test)

# Combine y for train and test
y_merged <- rbind(y_train, y_test)

# Convert y tables to speaking names
activity_speaking <- activities[y_merged$V1, 2]

# Put subject ID and speaking names into a data frame
add_columns_dataframe <- data.frame("Subject" = subject_merged$V1, "Activity" = activity_speaking);

# Merge the activities into the data set
data_subject_activities <- cbind(add_columns_dataframe, mean_stddev_data)

message("Data frame with activities (solution of part 3 and 4) is stored in the variable data_subject_activities.")

# show data_subject_activities in the viewer. 
View(data_subject_activities)

#####################################
# Summarize by subject and activity #
#####################################

message("Creating mean-by-activity data frame...")

# Create a data table from the previous result. 
data_subject_activities_table <- data.table(data_subject_activities)

# Compute the means of all columns grouped by activity
mean_by_subject_activity <- data_subject_activities_table[, lapply(.SD, mean), by=c("Subject", "Activity") ]

# write table to hard disk. 
write.table(mean_by_subject_activity, "mean_by_subject_activity.txt", row.name=FALSE)

message("Data frame with activities (solution of part 5) is stored in the variable mean_by_subject_activity and written to mean_by_subject_activity")

# show mean_by_subject_activity in the viewer. 
View(mean_by_subject_activity)