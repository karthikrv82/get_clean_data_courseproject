---
title: "README"
author: "Karthik Viswanath"
date: "Wednesday, June 18, 2014"
output: md_document
---

Coursera Course : Getting & Cleaning Data
========
## Course Project

This README document is broken down into following sections:<br />

        * Pre-requisites for generating the tidy data set
        * How to generate the tidy data set using the provided R Script
        * What steps were followed to create the tidy data set (or) how is the R Script designed to work
        * References
        * License

## Pre-requisites for generating the tidy data set
1. Download the project data from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
Link is also provided in the references section of this document
2. Place the downloaded .zip file into your current working directory (say $WORKING_DIR)
3. Unzip the .zip file and place the contents in _$WORKING\_DIR_

        * You should have a folder by name 'UCI HAR Dataset' in your $WORKING_DIR
        * DO NOT modify or rename the contents of 'UCI HAR Dataset' folder
4. Make sure you have read and write access to $WORKING_DIR



## How to generate the tidy data set using the provided R Script
1. Download "_run\_analysis.R_" from [here](https://github.com/karthikrv82/get_clean_data_courseproject/blob/master/run_analysis.R) and place it in _$WORKING\_DIR_
2. Open "_run\_analysis.R_" in either R or R Studio

        * Under "##SET_WORKING_DIRECTORY" section in the script, enter the absolute path of your working directory ($WORKING_DIR) in the setwd() function call
        * You might have to replace the existing directory path in the setwd() if a path already exists
3. Run "_run_analysis.R_" either from R or R Studio

        * Depending on the speed and memory on your system, the script might take a while to execute as the data files that are being loaded are large
        * Do not interrupt the script run in between. Once the script run is complete, your prompt will be back and Global Environment will have the required objects for you to analyze
4. How to make sure that the script was run successfully and tidy data set was created properly?

        * If the script is run successfully, you should have the following
                - A tidyset object of type data frame in memory with 180 observations and 81 variables
                - A file called "tidydataset.txt" in your current working directory ($WORKING_DIR)
                
        * To test whether the "tidydataset.txt" file is a valid file containing the tidy data set
                - Open a empty R script or execute the following on R Console
                - testobject <- read.table("<Absolute path to $WORKING_DIR>/tidydataset.txt")
                - testobject should be similar to tidyset object that was created by "_run_analysis.R_" script
                
        * Note: The only difference in testobject and tidyobject is that the "testsubjectid" variable in testobject will be a vector of type Int where as the "testsubjectid" variable in tidyset will be a factor
                - If you want you can convert the "testsubjectid" variable in testobject to factor by executing the following
                - testobject$testsubjectid <- as.factor(testobject$testsubjectid)


## What steps were followed to create the tidy data set (or) how is the R Script designed to work
The following approach was taken to create the tidy data set from the project files<br />
1. Identify the relevant project files that are required to create tidy data set

        *How?
        From the README.txt file that was part of the project folder, I was able to get the following
        - Experiment overview and the following details
                * # of volunteers : 30
                * # of groups : 2 ( test and training)
                * What other files are in the data set
                        - features_info.txt : What variables are used and how the values are recorded for how to interpret each variable by looking at the name
                        e.g. tBodyAcc-XYZ  =>      	timeDomainBodyAccelerationSignal in X, Y or Z direction
                        - features.txt : Actual feature list along with feature ids
                        - activity_labels.txt : Activity labels for various activities in the experiment
                        - train and test folder containing data related to test and training groups in the experiment
                                * x_train and x_test contain actual data
                                * y_train and y_test contain labels for corresponding group
                        - Inertial Signals folder containing bunch of text files related to some signal values which are not required for this project as we are interested only in mean and standard deviation values

2. Extract the relevant data from the files identified in step 1

        a) Extract relevant data from generic files
                1a. By reading features.txt file into R studio using Tools -> Import Dataset, found out that it is space delimited file with feature id and feature names as content of the file
                1b. Use read.delim() function to read the feature id and feature name details from features.txt file and name the columns 'featureid' and 'featurename'
                1c. Noted the total number of features in the feature vector : 561 observations
                   So, there has to be 561 columns in the test and train data files
                   
                2a. By reading activity_labels.txt file into R studio using Tools -> Import Dataset, found out that it is space delimited file with activity names as content of the file
                2b. Use read.delim() function to read the activity labels into a vector. Rename the activities with user-friendly names [ "walking","walking_upstairs","walking_downstairs","sitting","standing","laying"]
        
        b) Extract relevant data for test group
                1a. By reading subject_test.txt file into R studio using Tools -> Import Dataset, found out that it is a fixed width file with subjectid listed as numbers
                1b. Use read.fwf() function to read test subject details from subject_test.txt file and name the column 'testsubjectid'
                
                2a. By reading y_test.txt file into R studio using Tools -> Import Dataset, found out that it is a space delimited file containing test labels as numbers ranging from 1:6
                2b. Use read.delim() function to read test labels ids from y_test.txt file and name the column 
                test labels
                2c. Convert the test labels into factor
                2d. Map test label id vector into test label name vector using 'activitylabel' vector created in step 2.a.2b. At the end of this step, you would end up with a factor with 6 levels [ "walking","walking_upstairs","walking_downstairs","sitting","standing","laying"]
                2e. Note down the total number of observations in the factor : 2947 observations
                
                3a. By reading x_test.txt file into R studio using Tools -> Import Dataset, found out that it is a fixed width field file containing test data. The width of each field is 16. Also we know that there should be 561 values for each observation
                3b. Use read.fwf() to read it into a data frame with 2957 observations of 561 variables
                3c. Map the feature names in the dataframe with features vector created in step 2.a.1c above
                
        c) Extract relevant data for training group
                1a. By reading subject_train.txt file into R studio using Tools -> Import Dataset, found out that it is a fixed width file with subjectid listed as numbers
                1b. Use read.fwf() function to read training subject details from subject_train.txt file and name the column 'trainingsubjectid'
                
                2a. By reading y_train.txt file into R studio using Tools -> Import Dataset, found out that it is a space delimited file containing training labels as numbers ranging from 1:6
                2b. Use read.delim() function to read training labels ids from y_train.txt file and name the column 
                traininglabels
                2c. Convert the training labels into factor
                2d. Map training label id vector into training label name vector using 'activitylabel' vector created in step 2.a.2b. At the end of this step, you would end up with a factor with 6 levels [ "walking","walking_upstairs","walking_downstairs","sitting","standing","laying"]
                2e. Note down the total number of observations in the factor : 7353 observations
                
                3a. By reading x_train.txt file into R studio using Tools -> Import Dataset, found out that it is a fixed width field file containing training data. The width of each field is 16. Also we know that there should be 561 values for each observation
                3b. Use read.fwf() to read it into a data frame with 7352 observations of 561 variables
                3c. Map the feature names in the dataframe with features vector created in step (2.a.1c) above
                
3. Merge the final data from steps (2.a) and (2.b) above

                a. Use cbind() function to merge  testsubjects, testactivity and testdata into a single data frame
                b. Use cbind() function to merge trainingsubjects, trainingactivity and trainingdata into a single data frame
                c. Convert unified test and training data frame into matrix and rbind it into tidydataframe
        
4. Using gsub() function, re-name the variables to have some meaningful abbreviation as mentioned in the code comment
        
5. Using aggregate() function, calculate the Average of all the measure variables relative to 'subjectid' and 'activitytype'
        
6. Write the final tidy data set object created from step (e) into a file using write.table() function

The final aggregated tidy data set contains 180 observations of 81 variables

## References
[Data Science & Wearable Computing](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/)

[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[Original Project Data Files](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

# License
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
