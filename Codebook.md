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

While there were 563 features in total (after combining the various input files), the focus of this project was on 59 features. Part of the instructions for the project stated that we should "extract only the measurements on the mean and standard deviation for each measurement".  Because of this, the focus was only on those feature names that contained the word "mean" or "std".  There were a set of feature names with the word "meanfreq" in the name.  For the purposes of this exercise, it was decided to omit the features with "meanfreq" in the name and so the following 59 features  were included in the final analysis:  

* tbodyaccmeanx
* tbodyaccmeany
* tbodyaccmeanz
* tgravityaccmeanx
* tgravityaccmeany
* tgravityaccmeanz
* tbodyaccjerkmeanx
* tbodyaccjerkmeany
* tbodyaccjerkmeanz
* tbodygyromeanx
* tbodygyromeany
* tbodygyromeanz
* tbodygyrojerkmeanx
* tbodygyrojerkmeany
* tbodygyrojerkmeanz
* fbodyaccmeanx
* fbodyaccmeany
* fbodyaccmeanz
* fbodyaccjerkmeanx
* fbodyaccjerkmeany
* fbodyaccjerkmeanz
* fbodygyromeanx
* fbodygyromeany
* fbodygyromeanz
* tbodyaccstdx
* tbodyaccstdy
* tbodyaccstdz
* tgravityaccstdx
* tgravityaccstdy
* tgravityaccstdz
* tbodyaccjerkstdx
* tbodyaccjerkstdy
* tbodyaccjerkstdz
* tbodygyrostdx
* tbodygyrostdy
* tbodygyrostdz
* tbodygyrojerkstdx
* tbodygyrojerkstdy
* tbodygyrojerkstdz
* tbodyaccmagstd
* tgravityaccmagstd
* tbodyaccjerkmagstd
* tbodygyromagstd
* tbodygyrojerkmagstd
* fbodyaccstdx
* fbodyaccstdy
* fbodyaccstdz
* fbodyaccjerkstdx
* fbodyaccjerkstdy
* fbodyaccjerkstdz
* fbodygyrostdx
* fbodygyrostdy
* fbodygyrostdz
* fbodyaccmagstd
* fbodybodyaccjerkmagstd
* fbodybodygyromagstd
* fbodybodygyrojerkmagstd
* subjectid - (1-30)
* activityid - (Walking, Walking Upstairs, Walking Downstairs, Standing, Laying, Sitting) 








Code Description
----------------


xxxxxxxxxx


Output File
-----------


