Getting and Cleaning Data Course Project
========================================

Calculating Averages From Sensor Data
-------------------------------------

The goal of this effort is to produce a single output file from a series of different input files containing smartphone sensor data. The sensor data was gathered from 30 subjects as they were performing one of six different activities.  The output file calculates the average per variable (feature) per person for the actvities that were measured.

The following steps were performed in an R function called **run_analysis.R** to calculate the average per feature per person per activity:

1. Combine Input Files (Pre-Processing Step #1):

	* The two input data-sets provided consisted of "test" data and "train" data.  
	* Each category (test and train) contained header-less data files from smartphone sensors, the activity performed and the subject performing the activity.
	* The data-sets were imported va read.table statements and combined to create an inclusive data-set of sensor data, user data and activity data.
	* The combined data-set consisted of 561 unnamed sensor reading features over xxx observations.
	* The combined data-set also contained a feature for the activity performed per observation as well as the subject performing the activity.
	* The feature names (561) were provided in a separate file.  This file was read in using read.table.  Because there were some duplicate names in the file, the make.names function was used to ensure unique feature names. The feature names were also cleaned up somewhat to lowercase the names and remove periods & brackets.  These clean feature names were then used as the names for the combined data-set's features.
	* The activity values were changed from numeric (1 through 6) to textual strings for easier reading.  This wwas done using subsetting.

2. Narrow the Focus to Average & Standard Deviation Columns (Pre-Processing Step #2):

	* The combined data-set contained 561 sensor reading variables.
	* The purpose of the study was to only focus on 57 of those sensor reading variables that related to the mean and standard deviation measurements.
	* The 57 features of interest were identified using the matchcols function in the gdata package.  
	* The matchcols function uses regular expressions to match text strings.  The search strings that were used were mean followed by either x, y or z at the end a sentence ($ string) or else the string "std".  The search method was "or" meaning that it should look for either a string with meanx, meany, meanz or a string with std.
	* A filtered data-set was then created to only focus on those 57 variables measuring standard deviation and mean.
	* The filtered data-set also included the activity which listed one of six different activities that were monitored per observation and the subject performing the activity

3. Aggregate the Results 
 
	* Multiple observations existed for each subject and activity.  The goal was to create a single observation per subject per activity that showed the average per feature.
	* This task was accomplished with the aggregate.data.frame command.  This command takes the name of the dataframe, the subjectid as one list input, the activityid as the other list input and the "mean" as the function to execute
	* The final result is a matrix of 59 features across 180 observations.


4. Export the Results

	* The summarized result (59 features across 180 observations) was produced in the file called "summarized_average_sensor_results.txt".
	* The file contains column headers and each observation is delimited by a pipe symbol ( | ).
	* Assuming this file has been downloaded to your working directory in R, you can load the file via the following command: x <- read.table ("summarized_sensor_results.txt", header=TRUE, sep="|")







