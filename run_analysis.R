run_analysis <- function()
{
        #load all required packages
        
        #load the data table package
        if (!require(data.table)) 
        {
                install.packages("data.table")
                library(data.table)
                require(data.table)
        }
        
        #load gdata package        
        if (!require(gdata)) 
        {
                install.packages("gdata")
                library(gdata)
                require(gdata)
        }
        
        #disable warning messages because we will get a few during the processing but they
        #can be ignored
        options(warn=-1)
        
        
        #------------------------------------------        
        #STEP 1: COMBINE INPUT FILES
        #------------------------------------------
        
        #get the names of the attributes from the file called features.txt
        #file contains 2 columns with column 2 havingt the names
        features <- read.table ("./data/features.txt", header=FALSE)
        
        #use the make names function to ensure we have unique column names because 
        #there are some repeats
        #thanks to an anonymous posting (https://class.coursera.org/getdata-009/forum/thread?thread_id=58#comment-394),
        #the problem of duplicate column names was solved using 
        #the make names function
        unique_features <- make.names(features[,2])
        
        #no need to keep the features data in memory anymore
        rm(features)
        
        #add the extra 2 column names that will be added to the dataset so that we have all
        #the column names
        unique_features <- append (unique_features, c("subjectid", "activityid"), after=561)
        
        #read test data
        testdata <- read.table ("./data/test/x_test.txt", header=FALSE)
        # print (nrow(data))
        
        #read in the set of test subjects
        testsubject <- read.table ("./data/test/subject_test.txt", header=FALSE)
       # colnames (testsubject) <- "subjectid"
        
        #read in the set of test activity labels
        testlabels <- read.table ("./data/test/y_test.txt", header=FALSE)
       # colnames(testlabels)="labelid"
     
        #column bind the test-data and test-subjects to add the test subject id to the dataset
        testdata <- cbind(testdata, testsubject)
        
        #now add the test labels to the dataset
        testdata <- cbind(testdata, testlabels)
       
        #the testdata object now contains the info from testlabels and testsubject so
        #no need to keep those object around
        rm(testlabels)
        rm(testsubject)
       
        
        #now load up the training dataset
        traindata <- read.table ("./data/train/x_train.txt", header=FALSE)
        
        #read the training subjects
        trainsubject <- read.table ("./data/train/subject_train.txt", header=FALSE)
       # colnames (trainsubject) <- "subjectid"
        
        #read in the set of test subjects
        trainlabels <- read.table ("./data/train/y_train.txt", header=FALSE)
        
        
        #add the training subjects to the training dataset
        traindata <- cbind(traindata, trainsubject)
        
        #add the labels
        traindata <- cbind(traindata, trainlabels)
        
        #the traindata object now contains the info from trainlabels and trainsubject so
        #no need to keep those object around
        rm(trainlabels)
        rm(trainsubject)
       
        #combine the 2 data-sets to make one table
        combinedset <- rbind(testdata, traindata)
        
        #set the column names of the combined dataset. lower case the names and 
        #remove all periods to make clean names
        colnames(combinedset) <- gsub ("\\.", "", tolower(unique_features))
     
     
        #now change the activity labels (last column) to descriptive text using subsetting
        combinedset[combinedset$activityid==1,563] <- "Walking"
        combinedset[combinedset$activityid==2,563] <- "Walking Upstairs"
        combinedset[combinedset$activityid==3,563] <- "Walking Downstairs"
        combinedset[combinedset$activityid==4,563] <- "Sitting"
        combinedset[combinedset$activityid==5,563] <- "Standing"
        combinedset[combinedset$activityid==6,563] <- "Laying"
   
       
       #------------------------------------------------------------------
       #STEP 2: NARROW THE FOCUS TO AVERAGE AND STD DEVIATION COLUMNS ONLY
       #------------------------------------------------------------------
       
       
        #use the gdata package's matchcols function to filter the list
        #of column names of the combined data-set and only return those column names who have 
        #meanx, y or z in the name (ending with x, y or z) or have "std' in the column name
     
        cols <-  matchcols(combinedset, with=c("mean[x,y,z]$","std"),method="or")
     
        #create the list of columns which will be used as the column names to filter the dataset on
        filtercolumnlist <- as.character(cols$mean)
        filtercolumnlist <- append (filtercolumnlist, as.character(cols$std))
        filtercolumnlist <- append (filtercolumnlist, c("subjectid", "activityid"))
     
        #create the filtered data-set that only focuses on the mean and std columns
        #along with the subjectid and activityid
        filtereddataset <- combinedset[, filtercolumnlist]
       
       
       #------------------------------
       #STEP 3:  AGGREGATE THE RESULTS
       #------------------------------
       
       #create the final sumamrized dataset using the aggregate function
       #and grouping by subjectid and activtyid to calculate the average by subject by activity
       summaryset <- aggregate.data.frame(x = filtereddataset, by = list(filtereddataset$subjectid, filtereddataset$activityid), FUN = "mean")
       
       #remove the original activityid and subjectid because the aggregate function adds these back
       #in as the first 2 columns called group.1 and group.2 and the aggregate function would have 
       #set the activityid to NA because it was not numeric
       summaryset$activityid <- NULL 
       summaryset$subjectid <- NULL
       
       #rename the group by columns
       colnames(summaryset)[1] <- "subjectid"
       colnames(summaryset)[2] <- "activityid"
       
       
       #-----------------------------------------
       #STEP 4: EXPORT THE SUMMARIZED INFORMATION
       #-----------------------------------------
       
       #now write out the final summarized dataset using the pipe symbol {|} as the delimiter
       #the file is written to the users working directory
       write.table(summaryset,file=paste(getwd(),"summarized_average_sensor_results.txt", sep="/"), na = 'NA', sep = '|',
                   row.names = FALSE, col.names = TRUE)
       
    
       print("Summarized table created")
    
}