## This R script will read various project files and do the following
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
## 6. Store the variable into a .txt file

## Input to this function : 
## A path containing the unipped version of project directory "UCI HAR Dataset"
##
## Output from this function
## A tidy data set object which is of type data frame containing only the average of each of mean and standard deviation 
## observations for each activity and for each subject

## SET_WORKING_DIRECTORY
## In the below setwd() function call, pass the working directory that you want to use on your system
## Make sure you do this change before you run this script on your system. The script might fail if you do not provide a proper path
## Make sure that you have read and write access to the working directory that you provide below

setwd("C:/Users/karthikv/Documents/Coursera/Data Science/Getting & Cleaning Data/")
topDir <- "UCI HAR Dataset/"
testDir <- "UCI HAR Dataset/test/"
trainingDir <- "UCI HAR Dataset/train/"

# Check to see whether the following objects exists in memory. If so, do nothing. Else, initialize them.
# This is done so that large objects are not repeateadly read from disk into memory each time the program is run with
# minor modifications

if (!exists("features")) features <- character()
if (!exists("meansdfeatures")) meansdfeatures <- character()
if (!exists("meansdindex")) meansdindex <- integer()
if (!exists("activitylabels")) activitylabels <- character()

# Get the list of files to be read as input to construct tidy data set
allfileslist <- list.files(path=c(topDir,testDir,trainingDir),pattern="*.txt",full.names=TRUE)

# The for loop mainly has 2 parts to do the following
#
# Part 1
# - It scans through all the files in the provided project directory
# - Looks at only those files that are of interest to us
# - Reads each of those fiels into different objects
#
# Part 2
# - Maps activity names to activity ids
# - For each of testdata and trainingdata, it gets only those columns that correspond to mean and standard deviation
#
# Afer the for loop is run completely we should have 3 objects for each of test and training data
# - activitylabel data frame containing each of the activity labels
# - subjectid data frame containing subject id numbers
# - actual test data frame containing only those variables that correspond to mean and standard deviaton

for(filename in allfileslist){
        
        if ( length(grep("subject.*test",filename))>0 ){
                if (!exists("testsubjects")) testsubjects <- read.fwf(filename,widths=2,col.names="testsubjectid")      
        } 
        else if (length(grep("subject.*train",filename))>0 ) {
                if (!exists("trainingsubjects")) trainingsubjects <- read.fwf(filename,widths=2,col.names="trainsubjectid")
        }
        else if (length(grep("[xX].*test",filename))>0 ) {
                if (!exists("testdata")) testdata <- read.fwf(filename,widths=rep.int(16,561),colClasses=c(rep("numeric",561)),comment.char="",n=2947)
                colnames(testdata) <- features
                meansdtestdata <- testdata[,meansdindex]
                
        }
        else if (length(grep("[yY].*test",filename))>0 ) {
                if (!exists("testactivitylabels")) {
                        testactivitylabels <- read.delim(filename,header=FALSE,sep=" ")       
                        names(testactivitylabels) <- c("testactivitylabels")
                        testactivitylabels$testactivitylabels <- as.factor(testactivitylabels$testactivitylabels)
                        levels(testactivitylabels$testactivitylabels) <- activitylabels  
                }
        }
        else if (length(grep("[xX].*train",filename))>0 ) {
                if (!exists("trainingdata")) trainingdata <- read.fwf(filename,widths=rep.int(16,561),colClasses=c(rep("numeric",561)),comment.char="",n=7352)
                colnames(trainingdata) <- features
                meansdtrainingdata <- trainingdata[,meansdindex]
        }
        
        else if (length(grep("[yY].*train",filename))>0 ) {
                if (!exists("trainingactivitylabels")) {
                        trainingactivitylabels <- read.delim(filename,header=FALSE,sep=" ")
                        names(trainingactivitylabels) <- c("trainingactivitylabels")
                        trainingactivitylabels$trainingactivitylabels <- as.factor(trainingactivitylabels$trainingactivitylabels)
                        levels(trainingactivitylabels$trainingactivitylabels) <- activitylabels
                }
        }
        else if (length(grep("activity.*labels",filename))>0 ) {
                if (length(activitylabels)==0) {
                        suppressWarnings(activitylabels <- read.delim(filename,sep=" ",col.names=c("id","walking","walking_upstairs","walking_downstairs","sitting","standing","laying")))
                        activitylabels <- as.vector(names(activitylabels[2:7]))
                }
        }
        else if (length(grep("features\\.txt$",filename))>0 ) {        
                if (length(features)==0) {
                        features <- read.delim(filename,sep=" ",header=FALSE,)
                        names(features) <- c("featureid","featurename")
                        features <- as.character(features$featurename)
                }
                if (length(meansdindex)==0) meansdindex <- grep("mean|std",features)
                if (length(meansdfeatures)==0) meansdfeatures <- features[meansdindex]
                
        }
        
}


# Merge testsubjects, testactivity and testdata into a single data frame
tidytestframe <- cbind(testsubjects,testactivitylabels,meansdtestdata)

# Merge trainingsubjects, trainingactivity and trainingdata into a single data frame
tidytrainingframe <- cbind(trainingsubjects,trainingactivitylabels,meansdtrainingdata)

# Merge test and training data frames together
tidymatrix <- rbind(as.matrix(tidytestframe),as.matrix(tidytrainingframe))
tidyframe <- as.data.frame(tidymatrix,stringsAsFactors=FALSE)

# Convert "subjectid" and "activitylabel" to factors
# Rename id and label to be generic after merge.
# The code below names it generically as "subjectid" and "activitytype"
tidyframe$testsubjectid <- as.factor(tidyframe$testsubjectid)
tidyframe$testactivitylabels <- as.factor(tidyframe$testactivitylabels)
tidyframe[3:81] <- as.numeric(unlist(tidyframe[3:81]))
colnames(tidyframe)[1] <- c("subjectid")
colnames(tidyframe)[2] <- c("activitytype")


# Replace the measure varialbe names in the merged data set by removing any unnecessary characters and also making it
# more readable.
# Since the names of each of the variables when expanded becomes very long, it is not a good idea to have the whole name
# as the name of the variable
# So, the approach that is followed below is to have teh abbreviated name and have a mapping of the abbreviated name to the 
# actual description in Codebook.html or Codebook.Rmd file for easier reading
# Copuple of reasons why full name was not included are
# - The display becomes very cluttred and not readable
# - It is very difficult to type and write scripts with such long names
# - It is prone to user errors and would be wasting time fixing such typos
# - It is not very readable as names do not support spaces
# Read the codebook.html or Codebook.Rmd file for more info on name mappints
names(tidyframe)=gsub("Acc","Accl",names(tidyframe),ignore.case=TRUE)
names(tidyframe)=gsub("-meanFreq\\(\\)$","_meanfreq",names(tidyframe),ignore.case=TRUE)     
names(tidyframe)=gsub("-meanFreq.*x","_x_meanfreq",names(tidyframe),ignore.case=TRUE)
names(tidyframe)=gsub("-meanFreq.*y","_y_meanfreq",names(tidyframe),ignore.case=TRUE)
names(tidyframe)=gsub("-meanFreq.*z","_z_meanfreq",names(tidyframe),ignore.case=TRUE)
names(tidyframe)=gsub("-mean.*x","_x_mean",names(tidyframe),ignore.case=TRUE)
names(tidyframe)=gsub("-mean.*y","_y_mean",names(tidyframe),ignore.case=TRUE)
names(tidyframe)=gsub("-mean.*z","_z_mean",names(tidyframe),ignore.case=TRUE)
names(tidyframe)=gsub("-std.*x","_x_std",names(tidyframe),ignore.case=TRUE)
names(tidyframe)=gsub("-std.*y","_y_std",names(tidyframe),ignore.case=TRUE)
names(tidyframe)=gsub("-std.*z","_z_std",names(tidyframe),ignore.case=TRUE)
names(tidyframe)=gsub("-mean\\(\\)$","_mean",names(tidyframe),ignore.case=TRUE)
names(tidyframe)=gsub("-std\\(\\)$","_std",names(tidyframe),ignore.case=TRUE)   
names(tidyframe)=gsub("bodybody","Body",names(tidyframe),ignore.case=TRUE)

# Convert all the variable names to lower case for better handling and reduce user errors and typos
names(tidyframe) <- lapply(names(tidyframe),tolower)

# Convert the merged tidy data set by aggregating the results to calculate the averate of all the mean and standard 
# deviation values for each of the subjectids and each activity type
tidyset <- aggregate(tidyframe[c(3:81)],by=tidyframe[c(2,1)],FUN=mean)

# The following 2 line of code will :
# 1. Save all the objects created in the script to a file called "dataobjects.Rdata" in
# current working directory for future use. This file has been used in Codebook.Rmd file to display code snippets in the
# Codebook.html for easier reading and understanding
#
# 2. Write the tidyset object to a file called "tidydataset.txt" in the current working directory
# This file is the final output required by the Project
if (!exists("dataobjects.RData")) save.image(file="dataobjects.RData")
if (!exists("tidydataset.txt")) write.table(tidyset,"tidydataset.txt")






