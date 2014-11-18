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

The code can be broken into various blocks of functionality as described below:







Output File
-----------

A single output file called **summarized_sensor_results.txt** has been created as the final deliverable of this project.  This file contains the summarized mean and standard deviation features (57 of them) summarized by subject (30 subjects) and by activity (6 activities) for a total of 59 features (per the Feature Names section of this document).  The final output file contains 180 observations. The file contains column header names and each record is separated with the pipe symbol ( | ).

The file can be read into R with the following statement (assuming the file exists in your working directory):
data <- read.table ("summarized_sensor_results.txt", header=TRUE, sep="|")

