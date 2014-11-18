Getting and Cleaning Data Course Project - Codebook for run_analysis.R
======================================================================

Background
-----------

This codebook contains information about the data, code and output of the run_analysis script. The overall purpose of this script is to create a summarized single data-set from various input files that captured smart-phone sensor data from various subjects performing certain actions.

Thanks to David Hood for providing some good advice and tips in his FAQ on how to approach this particular project.
His FAQ can be [found here] (https://class.coursera.org/getdata-009/forum/thread?thread_id=58#post-177)


Input Data Files
----------------

The original source data can be found at [this location] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
Once downloaded and unzipped, the following files were used as part of this project:

test folder:
* x_test.txt (test data-set with 561 features that represents the smartphone sensor output)
* y_test.txt (activity labels data-set with 1 feature representing the type of activity 1-6)
* subject_test.txt (test subjects data-set with 1 feature representing the person performing the activity)
	
train folder:
* x_train.txt (train data-set with 561 features that represents the smartphone sensor output)
* y_train.txt (activity labels data-set with 1 feature representing the type of activity 1-6)
* subject_train.txt (train subjects data-set with 1 feature representing the person performing the activity)
	
root folder:
* features.txt (this file contains 561 observations which are the names of the features in the test and train data-sets)
* activity_labels.txt (lookup of activity labels to names: 1=walking, 2=walking upstairs, 3=walking downstairs, 4=sitting, 5=stading, 6=laying)


Feature Names
-------------

While there were 563 features in total (after combining the various input files), the focus of this project was on the 59 features which were capturing mean and standard deviation information about x, y and z axis movements of the smartphones. Part of the instructions for the project stated that we should "extract only the measurements on the mean and standard deviation for each measurement".  Because of this, the focus was only on those feature names that contained the word "mean" or "std".  There were a set of feature names with the word "meanfreq" in the name.  For the purposes of this exercise, it was decided to omit the features with "meanfreq" in the name and so the following 59 features  were included in the final analysis:  

* subjectid - (numeric indicating the subject doing the activity: 1-30)
* activityid - (character indicating the type of activity: Walking, Walking Upstairs, Walking Downstairs, Standing, Laying, Sitting) 
* tbodyaccmeanx - (numeric indicating mean acceleration in x)
* tbodyaccmeany - (numeric indicating mean acceleration in y)
* tbodyaccmeanz - (numeric indicating mean acceleration in z)
* tgravityaccmeanx - (numeric indicating mean gravity acceleration in x)
* tgravityaccmeany - (numeric indicating mean gravity acceleration in y)
* tgravityaccmeanz - (numeric indicating mean gravity acceleration in z)
* tbodyaccjerkmeanx - (numeric indicating mean jerk acceleration in x)
* tbodyaccjerkmeany - (numeric indicating mean jerk acceleration in y)
* tbodyaccjerkmeanz - (numeric indicating mean jerk acceleration in z)
* tbodygyromeanx - (numeric indicating mean gyroscope in x)
* tbodygyromeany - (numeric indicating mean gyroscope in y)
* tbodygyromeanz - (numeric indicating mean gyroscope in z)
* tbodygyrojerkmeanx - (numeric indicating mean gyroscope jerk in x)
* tbodygyrojerkmeany - (numeric indicating mean gyroscope jerk in y)
* tbodygyrojerkmeanz - (numeric indicating mean gyroscope jerk in z)
* fbodyaccmeanx - (numeric indicating mean body acceleration in x)
* fbodyaccmeany - (numeric indicating mean body acceleration in y)
* fbodyaccmeanz - (numeric indicating mean body acceleration in z)
* fbodyaccjerkmeanx - (numeric indicating mean body acceleration jerk in x)
* fbodyaccjerkmeany - (numeric indicating mean body acceleration jerk in y)
* fbodyaccjerkmeanz - (numeric indicating mean body acceleration jerk in z)
* fbodygyromeanx - (numeric indicating mean body gyroscope in x)
* fbodygyromeany - (numeric indicating mean body gyroscope in y)
* fbodygyromeanz - (numeric indicating mean body gyroscope in z)
* tbodyaccstdx - (numeric indicating standard deviation body acceleration in x)
* tbodyaccstdy - (numeric indicating standard deviation body acceleration in y)
* tbodyaccstdz - (numeric indicating standard deviation body acceleration in z)
* tgravityaccstdx - (numeric indicating standard deviation gravity acceleration in x)
* tgravityaccstdy - (numeric indicating standard deviation gravity acceleration in y)
* tgravityaccstdz - (numeric indicating standard deviation gravity acceleration in z)
* tbodyaccjerkstdx - (numeric indicating standard deviation jerk acceleration in x)
* tbodyaccjerkstdy - (numeric indicating standard deviation jerk acceleration in y)
* tbodyaccjerkstdz - (numeric indicating standard deviation jerk acceleration in z)
* tbodygyrostdx - (numeric indicating standard deviation gyroscope in x)
* tbodygyrostdy - (numeric indicating standard deviation gyroscope in y)
* tbodygyrostdz - (numeric indicating standard deviation gyroscope in z)
* tbodygyrojerkstdx - (numeric indicating standard deviation gyroscope jerk in x)
* tbodygyrojerkstdy - (numeric indicating standard deviation gyroscope jerk in y)
* tbodygyrojerkstdz - (numeric indicating standard deviation gyroscope jerk in z)
* tbodyaccmagstd - (numeric indicating standard deviation accmag in x)
* tgravityaccmagstd - (numeric indicating standard deviation accmag in y)
* tbodyaccjerkmagstd - (numeric indicating standard deviation jerkmag in z)
* tbodygyromagstd - (numeric indicating standard deviation gyromag in x)
* tbodygyrojerkmagstd - (numeric indicating standard deviation gyromag in x)
* fbodyaccstdx - (numeric indicating standard deviation of body acceleration in x)
* fbodyaccstdy - (numeric indicating standard deviation of body acceleration in y)
* fbodyaccstdz - (numeric indicating standard deviation of body acceleration in z)
* fbodyaccjerkstdx - (numeric indicating standard deviation of acceleration jerk in x)
* fbodyaccjerkstdy - (numeric indicating standard deviation of acceleration jerk in y)
* fbodyaccjerkstdz - (numeric indicating standard deviation of acceleration jerk in z)
* fbodygyrostdx - (numeric indicating standard deviation of body gyroscope in x)
* fbodygyrostdy - (numeric indicating standard deviation of body gyroscope in y)
* fbodygyrostdz - (numeric indicating standard deviation of body gyroscope in z)
* fbodyaccmagstd - (numeric indicating standard deviation of accmag in x)
* fbodybodyaccjerkmagstd - (numeric indicating standard deviation of body acceleration jerk mag in x)
* fbodybodygyromagstd - (numeric indicating standard deviation of body acceleration jerk mag in y)
* fbodybodygyrojerkmagstd - (numeric indicating standard deviation of body acceleration jerk mag in z)


Code Description
----------------

The code in **run_analysis.R** can be broken into various blocks of functionality as described below:

**Combine Input Files:**

* The two input data-sets provided consisted of "test" data and "train" data.  
* Each category (test and train) contained three header-less data files with smartphone sensor output (x_test, x_train), the activity performed (y_test, y_train) and the subject performing the activity (subject_test, subject_train).
* The three data-sets per category were imported via separate read.table statements and combined to create an inclusive data-set of sensor data, user data and activity data.
* The combined data-set consisted of 563 unnamed features and 10,299 observations.
* The feature names for the sensor readings were provided in a separate file (features.txt).  This file was loaded using read.table.  Because there were some duplicate names in the file, the make.names function was used to ensure unique feature names. The feature names were also cleaned up somewhat to lowercase the names and remove periods & brackets with the gsub command.  These clean feature names were then used as the names for the combined data-set's features using the colnames command.
* The activity values were changed from numeric (1 through 6) to textual strings for easier reading.  This was done using 6 subsetting commands (one per activity type using mapping information found in the activity_labels.txt file).  For example, changing the activity value of 1 to "Walking" was done via the follwoing command in R: dataset[dataset$activityid==1,563] <- "Walking".  The activity value was stored in column 563 in the dataset, hence the reference to 563. 


**Narrow the Focus to Average & Standard Deviation Columns:**

* The combined data-set contained 561 sensor reading features and 10,299 observations.
* The purpose of the study was to only focus on 57 of those sensor reading variables that related to the mean and standard deviation measurements per subject, per activity.
* The 57 features of interest were identified using the **matchcols** function in the gdata package.  
* The matchcols function uses regular expressions to match text strings.  The search strings that were used were mean followed by either x, y or z at the end a sentence ($ string) or else the string "std".  The search method was "or" meaning that it should look for either a string with meanx, meany, meanz or a string with std.
* A filtered data-set was then created to only focus on those 57 features measuring standard deviation and mean.
* The filtered data-set also included the activity which listed one of six different activities that were monitored per observation and the subject performing the activity, resulting in 59 features in total.


**Aggregate the Results: **
 
* Multiple observations existed for each subject and activity (hence 10,299 observations).  The goal was to create a single observation per subject (30 subjects) per activity (6 activities) that showed the average per feature (in other words, create a file with 180 observations).
* This task was accomplished with the aggregate.data.frame command.  This command takes the name of the dataframe, the subjectid as one list input, the activityid as the other list input and the "mean" as the function to execute
* The final result is a matrix of 180 observations across 59 features.


**Export the Results:**

* The summarized result (59 features across 180 observations) was produced in the file called **summarized_average_sensor_results.txt**.
* The file contains column headers and each observation is delimited by a pipe symbol ( | ).
* Assuming this file has been downloaded to your working directory in R, you can load the file via the following command: data <- read.table ("summarized_sensor_results.txt", header=TRUE, sep="|")


Output File
-----------

A single output file called **summarized_sensor_results.txt** has been created as the final deliverable of this project.  This file contains the summarized mean and standard deviation features (57 of them) summarized by subject (30 subjects) and by activity (6 activities) for a total of 59 features (per the Feature Names section of this document).  The final output file contains 180 observations. The file contains column header names and each record is separated with the pipe symbol ( | ).

The file can be read into R with the following statement (assuming the file exists in your working directory):
data <- read.table ("summarized_sensor_results.txt", header=TRUE, sep="|")

