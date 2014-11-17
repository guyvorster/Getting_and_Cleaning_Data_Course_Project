Getting and Cleaning Data Course Project
========================================

Calculating Averages From Sensor Data
-------------------------------------

The goal of this project is to produce a single summarized output file from a series of different input files containing smartphone sensor data. The sensor data was gathered from 30 subjects as they were performing one of six different activities.  The output file (called **summarized_average_sensor_results.txt**) calculates the average per variable (feature) per person for one of six actvities that were measured.

The following steps were performed in the R function called **run_analysis.R** to calculate the average per feature per person per activity:

1. Combine Input Files:

	* The two input data-sets provided consisted of "test" data and "train" data.  
	* Each category (test and train) contained three header-less data files with smartphone sensor output (x_test, x_train), the activity performed (y_test, y_train) and the subject performing the activity (subject_test, subject_train).
	* The three data-sets per category were imported via separate read.table statements and combined to create an inclusive data-set of sensor data, user data and activity data.
	* The combined data-set consisted of 563 unnamed features and 10,299 observations.
	* The feature names for the sensor readings were provided in a separate file (features.txt).  This file was loaded using read.table.  Because there were some duplicate names in the file, the make.names function was used to ensure unique feature names. The feature names were also cleaned up somewhat to lowercase the names and remove periods & brackets with the gsub command.  These clean feature names were then used as the names for the combined data-set's features using the colnames command.
	* The activity values were changed from numeric (1 through 6) to textual strings for easier reading.  This wwas done using 6 subsetting commands (one per activity type).  For example, changing the activity value of 1 to "Walking" was done via the follwoing command in R: dataset[dataset$activityid==1,563] <- "Walking".  The activity value was stored in column 563 in the dataset, hence the reference to 563. 

2. Narrow the Focus to Average & Standard Deviation Columns:

	* The combined data-set contained 561 sensor reading features and 10,299 observations.
	* The purpose of the study was to only focus on 57 of those sensor reading variables that related to the mean and standard deviation measurements per subject, per activity.
	* The 57 features of interest were identified using the **matchcols** function in the gdata package.  
	* The matchcols function uses regular expressions to match text strings.  The search strings that were used were mean followed by either x, y or z at the end a sentence ($ string) or else the string "std".  The search method was "or" meaning that it should look for either a string with meanx, meany, meanz or a string with std.
	* A filtered data-set was then created to only focus on those 57 features measuring standard deviation and mean.
	* The filtered data-set also included the activity which listed one of six different activities that were monitored per observation and the subject performing the activity, resulting in 59 features in total.

3. Aggregate the Results: 
 
	* Multiple observations existed for each subject and activity (hence 10,299 observations).  The goal was to create a single observation per subject (30 subjects) per activity (6 activities) that showed the average per feature (in other words, create a file with 180 observations).
	* This task was accomplished with the aggregate.data.frame command.  This command takes the name of the dataframe, the subjectid as one list input, the activityid as the other list input and the "mean" as the function to execute
	* The final result is a matrix of 180 observations across 59 features.


4. Export the Results:

	* The summarized result (59 features across 180 observations) was produced in the file called **summarized_average_sensor_results.txt**.
	* The file contains column headers and each observation is delimited by a pipe symbol ( | ).
	* Assuming this file has been downloaded to your working directory in R, you can load the file via the following command: x <- read.table ("summarized_sensor_results.txt", header=TRUE, sep="|")







