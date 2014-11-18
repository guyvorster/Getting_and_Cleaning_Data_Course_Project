Getting and Cleaning Data Course Project - Codebook for run_analysis.R
======================================================================

Background
-----------

This codebook contains information about the data, code and output of the run_analysis script.
Thanks to David Hood for providing some good advice and tips in his FAQ on how to approach the project.
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

While there were 563 features in total (after combining the files), the focus of this project was on 59 features. Part of the instructions for the project stated that we should "extract only the measurements on the mean and standard deviation for each measurement".  Because of this, the focus was only on those feature names that ended in mean or std.following logic was applied to narrow the larger data-set down to 59 features:







Code Description
----------------


xxxxxxxxxx


Output File
-----------


