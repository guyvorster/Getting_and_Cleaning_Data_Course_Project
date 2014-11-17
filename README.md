Getting and Cleaning Data Course Project
========================================

Calculating Averages From Sensor Data
-------------------------------------

The goal of this effort is to produce a single output file from a series of different input files containing smartphone sensor data. The sensor data was gathered from 30 subjects as they were performing one of six different activities.  The output file calculates the average per variable per person for the actvities that were measured.

The following steps were performed to calculate the average per variable per person per activity:

1. Combine Input Files (Pre-Processing Step #1):

	* The two input data-sets provided consisted of "test" data and "train" data.  
	* Each category (test and train) contained data files from smartphone sensors, the activity performed and the subject performing the activity.
	* The data-sets were combined to create an inclusive data-set of sensor data, user data and activity data.
	* The combined data-set consisted of 561 sensor reading variables over xxx observations.
	* The combined data-set also contained a variable for the activity performed per observation as well as the subject performing the activity.

2. Narrow the Focus to Average & Standard Deviation Columns (Pre-Processing Step #2):

	* The combined data-set contained 561 sensor reading variables.
	* The purpose of the study was to only focus on 57 of those sensor reading variables that related to the mean and standard deviation measurements.  
	* A filtered data-set was created to only focus on those 57 variables measuring standard deviation and mean.
	* The filtered data-set also included the activity which listed one of six different activities that were monitored per observation and the subject performing the activity

3. Aggregate the Results 
 
	* Multiple observations existed for each subject and activity.  The goal was to create a single observation per subject per activity that showed the average per variable.
	* This task was accomplished with the aggregate.data.frame command.  This command takes the name of the dataframe, the subjectid as one list input, the activityid as the other list input and the "mean" as the function to execute
	* The final result would be a matrix of 59 variables across 180 observations.






