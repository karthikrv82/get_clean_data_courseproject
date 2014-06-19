---
title: "Codebook"
author: "Karthik Viswanath"
date: "Tuesday, June 17, 2014"
output: md_document
---

Course Project: Getting and Cleaning Data
=========================================

This codebok document describes the tidy data set that is created for this project from various raw data sets. It also describes all the fields in the tidy data set including its name, variables, variable type and any other parameter of interest required to do analysis.

The README.md file will list out the steps on how the tidy data set was created from various raw data files. Read the README.Rmd file before you read through this CodeBook to better understand the variables and its parameters.

<!-- Load the data objects to display snippets of tidy data set in the code book --> 
<!-- If you want to reproduce this code book for your analysis, you should have read the README.md file and executed run_analysis.R script to create the dataobjects.Rdata. --> 
<!-- dataobjects.RData file will be automatically created after you run run_analysis.R and placed in your current working directory --> 
<!-- You need to change the path mentioned below to point to the working directory on your system where dataobject.RData file is stored --> 



The tidy data set is a data frame containing 180 rows and 81 columns 

```r
class(tidyset)
```

```
## [1] "data.frame"
```

```r
dim(tidyset)
```

```
## [1] 180  81
```

The names of the variables are as follows. The first 2 variables "activitytype" and "subjectid" are ID variables and the rest 79 variables are measure variables which describe average mean and standard deviation attribures pertaining to one or both of the Id variables. The details of what these ID and measure variables are explained below along with the Data Dictionary


```r
names(tidyset)
```

```
##  [1] "activitytype"              "subjectid"                
##  [3] "tbodyaccl_x_mean"          "tbodyaccl_y_mean"         
##  [5] "tbodyaccl_z_mean"          "tbodyaccl_x_std"          
##  [7] "tbodyaccl_y_std"           "tbodyaccl_z_std"          
##  [9] "tgravityaccl_x_mean"       "tgravityaccl_y_mean"      
## [11] "tgravityaccl_z_mean"       "tgravityaccl_x_std"       
## [13] "tgravityaccl_y_std"        "tgravityaccl_z_std"       
## [15] "tbodyaccljerk_x_mean"      "tbodyaccljerk_y_mean"     
## [17] "tbodyaccljerk_z_mean"      "tbodyaccljerk_x_std"      
## [19] "tbodyaccljerk_y_std"       "tbodyaccljerk_z_std"      
## [21] "tbodygyro_x_mean"          "tbodygyro_y_mean"         
## [23] "tbodygyro_z_mean"          "tbodygyro_x_std"          
## [25] "tbodygyro_y_std"           "tbodygyro_z_std"          
## [27] "tbodygyrojerk_x_mean"      "tbodygyrojerk_y_mean"     
## [29] "tbodygyrojerk_z_mean"      "tbodygyrojerk_x_std"      
## [31] "tbodygyrojerk_y_std"       "tbodygyrojerk_z_std"      
## [33] "tbodyacclmag_mean"         "tbodyacclmag_std"         
## [35] "tgravityacclmag_mean"      "tgravityacclmag_std"      
## [37] "tbodyaccljerkmag_mean"     "tbodyaccljerkmag_std"     
## [39] "tbodygyromag_mean"         "tbodygyromag_std"         
## [41] "tbodygyrojerkmag_mean"     "tbodygyrojerkmag_std"     
## [43] "fbodyaccl_x_mean"          "fbodyaccl_y_mean"         
## [45] "fbodyaccl_z_mean"          "fbodyaccl_x_std"          
## [47] "fbodyaccl_y_std"           "fbodyaccl_z_std"          
## [49] "fbodyaccl_x_meanfreq"      "fbodyaccl_y_meanfreq"     
## [51] "fbodyaccl_z_meanfreq"      "fbodyaccljerk_x_mean"     
## [53] "fbodyaccljerk_y_mean"      "fbodyaccljerk_z_mean"     
## [55] "fbodyaccljerk_x_std"       "fbodyaccljerk_y_std"      
## [57] "fbodyaccljerk_z_std"       "fbodyaccljerk_x_meanfreq" 
## [59] "fbodyaccljerk_y_meanfreq"  "fbodyaccljerk_z_meanfreq" 
## [61] "fbodygyro_x_mean"          "fbodygyro_y_mean"         
## [63] "fbodygyro_z_mean"          "fbodygyro_x_std"          
## [65] "fbodygyro_y_std"           "fbodygyro_z_std"          
## [67] "fbodygyro_x_meanfreq"      "fbodygyro_y_meanfreq"     
## [69] "fbodygyro_z_meanfreq"      "fbodyacclmag_mean"        
## [71] "fbodyacclmag_std"          "fbodyacclmag_meanfreq"    
## [73] "fbodyaccljerkmag_mean"     "fbodyaccljerkmag_std"     
## [75] "fbodyaccljerkmag_meanfreq" "fbodygyromag_mean"        
## [77] "fbodygyromag_std"          "fbodygyromag_meanfreq"    
## [79] "fbodygyrojerkmag_mean"     "fbodygyrojerkmag_std"     
## [81] "fbodygyrojerkmag_meanfreq"
```

This dataset is the result of an experiment that was carried out with a group of 30 volunteers. Each person performed six activities wearing a smartphone on the waist. Various measurements related to frequency, angular velocity, body acceleration was taken for each of the subjects and each of the activity. 

With all the measure variables, the data has been divided by its range (gyroscope, entropy, etc) to normalize it and hence there are no units associated with those variables.

This tidy dataset summarize the average of mean and standard deviation for each of these parameters based on the subject and the activity the subject performed.

So, the activity variable in the dataset corresponds to one of the activities that the subject performed during the experiment and the subjectid identifies the subject who performed the activity


```r
unique(tidyset$subjectid)
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
## [24] 24 25 26 27 28 29 30
## 30 Levels:  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 ... 30
```

```r
unique(tidyset$activitytype)
```

```
## [1] laying             sitting            standing          
## [4] walking            walking_downstairs walking_upstairs  
## 6 Levels: laying sitting standing walking ... walking_upstairs
```


Columns 3-81 in the tidy data set represents the various mean and standard deviation measurements that were taken during the experiment and the value represents the average value for that measurement for a particular subject and particular activity as denoted by the values of subjectid and activitytype

The average mean values are denoted by variables ending with "mean" and the average standard deviation values are denoted by variables ending with "std"

To understand what each of these mean and standard deviation variables denote, we need to understand how the values were captured during the experiment. 

<i>The variables selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

<i>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

<i>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

<i>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.</i>


###Mapping of variable names to descriptions
The names that are used for variables are tried to be kept as intuitive as possible. For the measure variables in columns 3-81, the names might seem a little cryptic at first glance, but after going through the mapping table below it would be easy for anybody to map the names to their descriptions

For the variables names I have used the abbreviated versions of the actual description as having the whole description would name the variable name very long and hard to manipulate in the code.
For e.g. Time Domain is denoted by _"t"_ in the variable name, Acceleration is denoted by _"accl"_, Angular Velocity is denoted by _"gyro"_, etc





```r
kable(varnamedescframe, format = "markdown")
```

```
## 
## 
## |VariableName                         |Variable_Description                                                                                    |
## |:------------------------------------|:-------------------------------------------------------------------------------------------------------|
## |tbodyaccl_[x or y or z]_mean         |Average of Mean Time Domain Body Acceleration Signal in [X or Y or Z] direction                         |
## |tbodyaccljerk_[x or y or z]_mean     |Average of Mean Time Domain Body Acceleration Jerk Signal in [X or Y or Z] direction                    |
## |tbodygyro_[x or y or z]_mean         |Average of Mean Time Domain Body Angular Velocity Signal in [X or Y or Z] direction                     |
## |tbodygyrojerk_[x or y or z]_mean     |Average of Mean Time Domain Angular Velocity Jerk Signal in [x or y or z] direction                     |
## |tbodyacclmag_mean                    |Average of Mean Time Domain Body Acceleration Magnitude                                                 |
## |tbodyaccljerkmag_mean                |Average of Mean Time Domain Body Acceleration Jerk Magnitude                                            |
## |tbodygyromag_mean                    |Average of Mean Time Domain Angular Velocity Magnitude                                                  |
## |tbodygyrojerkmag_mean                |Average of Mean Time Domain Angular Velocity Jerk Magnitude                                             |
## |tbodyaccl_[x or y or z]_std          |Average Standard Deviation of Time Domain Body Acceleration Signal in [X or Y or Z] direction           |
## |tbodyaccljerk_[x or y or z]_std      |Average Standard Deviation of Time Domain Body Acceleration Jerk Signal in [X or Y or Z] direction      |
## |tbodygyro_[x or y or z]_std          |Average Standard Deviation of Time Domain Body Angular Velocity Signal in [X or Y or Z] direction       |
## |tbodygyrojerk_[x or y or z]_std      |Average Standard Deviation of Time Domain Angular Velocity Jerk Signal in [X or Y or Z] direction       |
## |tbodyacclmag_std                     |Average Standard Deviation of Time Domain Body Acceleration Magnitude                                   |
## |tbodyaccljerkmag_std                 |Average Standard Deviation of Time Domain Body Acceleration Jerk Magnitude                              |
## |tbodygyromag_std                     |Average Standard Deviation of Time Domain Angular Velocity Magnitude                                    |
## |tbodygyrojerkmag_std                 |Average Standard Deviation of Time Domain Angular Velocity Jerk Magnitude                               |
## |tgravityaccl_[x or y or z]_mean      |Average of Mean Time Domain Gravity Acceleration Signal in [X or Y or Z] direction                      |
## |tgravityacclmag_mean                 |Average of Mean Time Domain Gravity Acceleration Magnitude                                              |
## |tgravityaccl_[x or y or z]_std       |Average Standard Deviation of Time Domain Gravity Acceleration Signal in [X or Y or Z] direction        |
## |tgravityacclmag_std                  |Average Standard Deviation of Time Domain Gravity Acceleration Magnitude                                |
## |fbodyaccl_[x or y or z]_mean         |Average of Frequency Domain Body Acceleration Signal in [X or Y or Z] direction                         |
## |fbodyaccl_[x or y or z]_meanfreq     |Average of Mean Frequency Domain Body Acceleration Signal in [X or Y or Z] direction                    |
## |fbodyaccljerk_[x or y or z]_mean     |Average of Frequency Domain Body Acceleration Jerk Signal in [X or Y or Z] direction                    |
## |fbodyaccljerk_[x or y or z]_meanfreq |Average of Mean Frequency Domain Body Acceleration Jerk Signal in [X or Y or Z] direction               |
## |fbodygyro_[x or y or z]_mean         |Average of Frequency Domain Body Angular Velocity Signal in [X or Y or Z] direction                     |
## |fbodygyro_[x or y or z]_meanfreq     |Average of Mean Frequency Domain Body Angular Velocity Signal in [X or Y or Z] direction                |
## |fbodyacclmag_mean                    |Average of Frequency Domain Body Acceleration Magnitude                                                 |
## |fbodyacclmag_meanfreq                |Average of Mean Frequency Domain Body Acceleration Magnitude                                            |
## |fbodyaccljerkmag_mean                |Average of Frequency Domain Body Acceleration Jerk Magnitude                                            |
## |fbodyaccljerkmag_meanfreq            |Average of Mean Frequency Domain Body Acceleration Jerk Magnitude                                       |
## |fbodygyromag_mean                    |Average of Frequency Domain Angular Velocity Magnitude                                                  |
## |fbodygyromag_meanfreq                |Average of Mean Frequency Domain Angular Velocity Magnitude                                             |
## |fbodygyrojerkmag_mean                |Average of Frequency Domain Angular Velocity Jerk Magnitude                                             |
## |fbodygyrojerkmag_meanfreq            |Average of Mean Frequency Domain Angular Velocity Jerk Magnitude                                        |
## |fbodyaccl_[x or y or z]_std          |Average Standard Deviation of Frequency Domain Body Acceleration Signal in [X or Y or Z] direction      |
## |fbodyaccljerk_[x or y or z]_std      |Average Standard Deviation of Frequency Domain Body Acceleration Jerk Signal in [X or Y or Z] direction |
## |fbodygyro_[x or y or z]_std          |Average Standard Deviation of Frequency Domain Body Angular Velocity Signal in [X or Y or Z] direction  |
## |fbodyacclmag_std                     |Average Standard Deviation of Frequency Domain Body Acceleration Magnitude                              |
## |fbodyaccljerkmag_std                 |Average Standard Deviation of Frequency Domain Body Acceleration Jerk Magnitude                         |
## |fbodygyromag_std                     |Average Standard Deviation of Frequency Domain Angular Velocity Magnitude                               |
## |fbodygyrojerkmag_std                 |Average Standard Deviation of Frequency Domain Angular Velocity Jerk Magnitude                          |
```

<br />

# Data Dictionary:
<p>**Variable Name**    : "activitytype"<br/>
**Variable Description**: Activity Type of the Subject for this observation <br/>
**Data Type**           : Factor w/ 6 levels "laying","sitting","standing","walking","walking_downstairs","walking_upstairs"<br/> 
**Value Range**         : "laying","sitting","standing","walking","walking_downstairs","walking_upstairs"<br/>
</p>

<p>**Variable Name**    : "subjectid"<br/>
**Variable Description**: Identification of the subject who was part of the experiment <br/>
**Data Type**           : Factor w/ 30 levels " 1"," 2"," 3",..: 1 1 1 1 1 1 2 2 2 2 ... <br/>
**Value Range**         : int 1:30 <br/>
</p>

<p>**Variable Name**    : "tbodyaccl_x_mean"<br/>
**Variable Description**    : "Average of Mean Time Domain Body Acceleration Signal in X direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodyaccl_y_mean"<br/>
**Variable Description**    : "Average of Mean Time Domain Body Acceleration Signal in Y direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodyaccl_z_mean"<br/>
**Variable Description**    : "Average of Mean Time Domain Body Acceleration Signal in Z direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodyaccl_x_std"<br/> 
**Variable Description**    : "Average Standard Deviation of Time Domain Body Acceleration Signal in X direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodyaccl_y_std"<br/>
**Variable Description**    : "Average Standard Deviation of Time Domain Body Acceleration Signal in Y direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodyaccl_z_std"<br/>
**Variable Description**    : "Average Standard Deviation of Time Domain Body Acceleration Signal in Z direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tgravityaccl_x_mean"<br/>
**Variable Description**    : "Average of Mean Time Domain Gravity Acceleration Signal in X direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tgravityaccl_y_mean"<br/>
**Variable Description**    : "Average of Mean Time Domain Gravity Acceleration Signal in Y direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tgravityaccl_z_mean"<br/> 
**Variable Description**    : "Average of Mean Time Domain Gravity Acceleration Signal in Z direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tgravityaccl_x_std"<br/>
**Variable Description**    : "Average Standard Deviation of Time Domain Gravity Acceleration Signal in X direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tgravityaccl_y_std"<br/>
**Variable Description**    : "Average Standard Deviation of Time Domain Gravity Acceleration Signal in Y direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/> 
</p>

<p>**Variable Name**    : "tgravityaccl_z_std"<br/>
**Variable Description**    : "Average Standard Deviation of Time Domain Gravity Acceleration Signal in Z direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodyaccljerk_x_mean"<br/>
**Variable Description**    : "Average of Mean Time Domain Body Acceleration Jerk Signal in X direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodyaccljerk_y_mean"<br/> 
**Variable Description**    : "Average of Mean Time Domain Body Acceleration Jerk Signal in Y direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodyaccljerk_z_mean"<br/>
**Variable Description**    : "Average of Mean Time Domain Body Acceleration Jerk Signal in Z direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodyaccljerk_x_std"<br/>
**Variable Description**    : "Average Standard Deviation of Time Domain Body Acceleration Jerk Signal in X direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodyaccljerk_y_std"<br/>
**Variable Description**    : "Average Standard Deviation of Time Domain Body Acceleration Jerk Signal in Y direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodyaccljerk_z_std"<br/>
**Variable Description**    : "Average Standard Deviation of Time Domain Body Acceleration Jerk Signal in Z direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodygyro_x_mean"<br/>
**Variable Description**    : "Average of Mean Time Domain Body Angular Velocity Signal in X direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodygyro_y_mean"<br/>
**Variable Description**    : "Average of Mean Time Domain Body Angular Velocity Signal in Y direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodygyro_z_mean"<br/>
**Variable Description**    : "Average of Mean Time Domain Body Angular Velocity Signal in Z direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodygyro_x_std"<br/>
**Variable Description**    : "Average Standard Deviation of Time Domain Body Angular Velocity Signal in X direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodygyro_y_std"<br/>
**Variable Description**    : "Average Standard Deviation of Time Domain Body Angular Velocity Signal in Y direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodygyro_z_std"<br/>
**Variable Description**    : "Average Standard Deviation of Time Domain Body Angular Velocity Signal in Z direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodygyrojerk_x_mean"<br/>
**Variable Description**    : "Average of Mean Time Domain Angular Velocity Jerk Signal in X direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodygyrojerk_y_mean"<br/>
**Variable Description**    : "Average of Mean Time Domain Angular Velocity Jerk Signal in Y direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodygyrojerk_z_mean"<br/>
**Variable Description**    : "Average of Mean Time Domain Angular Velocity Jerk Signal in Z direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodygyrojerk_x_std"<br/>
**Variable Description**    : "Average Standard Deviation of Time Domain Angular Velocity Jerk Signal in X direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodygyrojerk_y_std"<br/> 
**Variable Description**    : "Average Standard Deviation of Time Domain Angular Velocity Jerk Signal in Y direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodygyrojerk_z_std"<br/>
**Variable Description**    : "Average Standard Deviation of Time Domain Angular Velocity Jerk Signal in Z direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyaccl_x_mean"<br/>
**Variable Description**    : "Average of Frequency Domain Body Acceleration Signal in X direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyaccl_y_mean"<br/>
**Variable Description**    : "Average of Frequency Domain Body Acceleration Signal in Y direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyaccl_z_mean"<br/>
**Variable Description**    : "Average of Frequency Domain Body Acceleration Signal in Z direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyaccl_x_std"<br/>
**Variable Description**    : "Average Standard Deviation of Frequency Domain Body Acceleration Signal in X direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyaccl_y_std"<br/>
**Variable Description**    : "Average Standard Deviation of Frequency Domain Body Acceleration Signal in Y direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyaccl_z_std"<br/>
**Variable Description**    : "Average Standard Deviation of Frequency Domain Body Acceleration Signal in Z direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyaccl_x_meanfreq"<br/> 
**Variable Description**    : "Average of Mean Frequency Domain Body Acceleration Signal in X direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyaccl_y_meanfreq"<br/>
**Variable Description**    : "Average of Mean Frequency Domain Body Acceleration Signal in Y direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyaccl_z_meanfreq"<br/>
**Variable Description**    : "Average of Mean Frequency Domain Body Acceleration Signal in Z direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyaccljerk_x_mean"<br/>
**Variable Description**    : "Average of Frequency Domain Body Acceleration Jerk Signal in X direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyaccljerk_y_mean"<br/> 
**Variable Description**    : "Average of Frequency Domain Body Acceleration Jerk Signal in Y direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyaccljerk_z_mean"<br/>
**Variable Description**    : "Average of Frequency Domain Body Acceleration Jerk Signal in Z direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyaccljerk_x_std"<br/>
**Variable Description**    : "Average Standard Deviation of Frequency Domain Body Acceleration Jerk Signal in X direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyaccljerk_y_std"<br/>
**Variable Description**    : "Average Standard Deviation of Frequency Domain Body Acceleration Jerk Signal in Y direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyaccljerk_z_std"<br/>
**Variable Description**    : "Average Standard Deviation of Frequency Domain Body Acceleration Jerk Signal in Z direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyaccljerk_x_meanfreq"<br/>
**Variable Description**    : "Average of Mean Frequency Domain Body Acceleration Jerk Signal in X direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyaccljerk_y_meanfreq"<br/>
**Variable Description**    : "Average of Mean Frequency Domain Body Acceleration Jerk Signal in Y direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyaccljerk_z_meanfreq"<br/>
**Variable Description**    : "Average of Mean Frequency Domain Body Acceleration Jerk Signal in Z direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodygyro_x_mean"<br/>
**Variable Description**    : "Average of Frequency Domain Body Angular Velocity Signal in X direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodygyro_y_mean"<br/>
**Variable Description**    : "Average of Frequency Domain Body Angular Velocity Signal in Y direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodygyro_z_mean"<br/>
**Variable Description**    : "Average of Frequency Domain Body Angular Velocity Signal in Z direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodygyro_x_std"<br/>
**Variable Description**    : "Average Standard Deviation of Frequency Domain Body Angular Velocity Signal in X direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodygyro_y_std"<br/>
**Variable Description**    : "Average Standard Deviation of Frequency Domain Body Angular Velocity Signal in Y direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodygyro_z_std"<br/>
**Variable Description**    : "Average Standard Deviation of Frequency Domain Body Angular Velocity Signal in Z direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodygyro_x_meanfreq"<br/> 
**Variable Description**    : "Average of Mean Frequency Domain Body Angular Velocity Signal in X direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodygyro_y_meanfreq"<br/>
**Variable Description**    : "Average of Mean Frequency Domain Body Angular Velocity Signal in Y direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodygyro_z_meanfreq"<br/>
**Variable Description**    : "Average of Mean Frequency Domain Body Angular Velocity Signal in Z direction"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodyacclmag_mean"<br/>
**Variable Description**    : "Average of Mean Time Domain Body Acceleration Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodyacclmag_std"<br/>
**Variable Description**    : "Average Standard Deviation of Time Domain Body Acceleration Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tgravityacclmag_mean"<br/>
**Variable Description**    : "Average of Mean Time Domain Gravity Acceleration Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tgravityacclmag_std"<br/>
**Variable Description**    : "Average Standard Deviation of Time Domain Gravity Acceleration Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p> 

<p>**Variable Name**    : "tbodyaccljerkmag_mean"<br/>
**Variable Description**    : "Average of Mean Time Domain Body Acceleration Jerk Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodyaccljerkmag_std"<br/>
**Variable Description**    : "Average Standard Deviation of Time Domain Body Acceleration Jerk Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodygyromag_mean"<br/>
**Variable Description**    : "Average of Mean Time Domain Angular Velocity Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/> 
</p>

<p>**Variable Name**    : "tbodygyromag_std"<br/>
**Variable Description**    : "Average Standard Deviation of Time Domain Angular Velocity Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodygyrojerkmag_mean"<br/>
**Variable Description**    : "Average of Mean Time Domain Angular Velocity Jerk Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "tbodygyrojerkmag_std"<br/>
**Variable Description**    : "Average Standard Deviation of Time Domain Angular Velocity Jerk Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyacclmag_mean"<br/>
**Variable Description**    : "Average of Frequency Domain Body Acceleration Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyacclmag_std"<br/>
**Variable Description**    : "Average Standard Deviation of Frequency Domain Body Acceleration Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyacclmag_meanfreq"<br/>
**Variable Description**    : "Average of Mean Frequency Domain Body Acceleration Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyaccljerkmag_mean"<br/>
**Variable Description**    : "Average of Frequency Domain Body Acceleration Jerk Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyaccljerkmag_std"<br/>
**Variable Description**    : "Average Standard Deviation of Frequency Domain Body Acceleration Jerk Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodyaccljerkmag_meanfreq"<br/>
**Variable Description**    : "Average of Mean Frequency Domain Body Acceleration Jerk Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodygyromag_mean"<br/>
**Variable Description**    : "Average of Frequency Domain Angular Velocity Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodygyromag_std"<br/>
**Variable Description**    : "Average Standard Deviation of Frequency Domain Angular Velocity Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p> 

<p>**Variable Name**    : "fbodygyromag_meanfreq"<br/>
**Variable Description**    : "Average of Mean Frequency Domain Angular Velocity Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodygyrojerkmag_mean"<br/>
**Variable Description**    : "Average of Frequency Domain Angular Velocity Jerk Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodygyrojerkmag_std"<br/>
**Variable Description**    : "Average Standard Deviation of Frequency Domain Angular Velocity Jerk Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<p>**Variable Name**    : "fbodygyrojerkmag_meanfreq"<br/>
**Variable Description**    : "Average of Mean Frequency Domain Angular Velocity Jerk Magnitude"<br/>
**Data Type**           : Numeric<br/>
**Value Range**         : [-1,1]<br/>
</p>

<br />

# Glimse of tidy data set:

```r
head(tidyset)
```

```
##         activitytype subjectid tbodyaccl_x_mean tbodyaccl_y_mean
## 1             laying         1           0.2216        -0.040514
## 2            sitting         1           0.2612        -0.001308
## 3           standing         1           0.2789        -0.016138
## 4            walking         1           0.2773        -0.017384
## 5 walking_downstairs         1           0.2892        -0.009919
## 6   walking_upstairs         1           0.2555        -0.023953
##   tbodyaccl_z_mean tbodyaccl_x_std tbodyaccl_y_std tbodyaccl_z_std
## 1          -0.1132        -0.92806        -0.83683        -0.82606
## 2          -0.1045        -0.97723        -0.92262        -0.93959
## 3          -0.1106        -0.99576        -0.97319        -0.97978
## 4          -0.1111        -0.28374         0.11446        -0.26003
## 5          -0.1076         0.03004        -0.03194        -0.23043
## 6          -0.0973        -0.35471        -0.00232        -0.01948
##   tgravityaccl_x_mean tgravityaccl_y_mean tgravityaccl_z_mean
## 1             -0.2489              0.7055             0.44582
## 2              0.8315              0.2044             0.33204
## 3              0.9430             -0.2730             0.01349
## 4              0.9352             -0.2822            -0.06810
## 5              0.9319             -0.2666            -0.06212
## 6              0.8934             -0.3622            -0.07540
##   tgravityaccl_x_std tgravityaccl_y_std tgravityaccl_z_std
## 1            -0.8968            -0.9077            -0.8524
## 2            -0.9685            -0.9355            -0.9490
## 3            -0.9938            -0.9812            -0.9763
## 4            -0.9766            -0.9713            -0.9477
## 5            -0.9506            -0.9370            -0.8959
## 6            -0.9564            -0.9528            -0.9124
##   tbodyaccljerk_x_mean tbodyaccljerk_y_mean tbodyaccljerk_z_mean
## 1              0.08109            0.0038382             0.010834
## 2              0.07748           -0.0006191            -0.003368
## 3              0.07538            0.0079757            -0.003685
## 4              0.07404            0.0282721            -0.004168
## 5              0.05416            0.0296504            -0.010972
## 6              0.10137            0.0194863            -0.045563
##   tbodyaccljerk_x_std tbodyaccljerk_y_std tbodyaccljerk_z_std
## 1            -0.95848             -0.9241             -0.9549
## 2            -0.98643             -0.9814             -0.9879
## 3            -0.99460             -0.9856             -0.9923
## 4            -0.11362              0.0670             -0.5027
## 5            -0.01228             -0.1016             -0.3457
## 6            -0.44684             -0.3783             -0.7066
##   tbodygyro_x_mean tbodygyro_y_mean tbodygyro_z_mean tbodygyro_x_std
## 1         -0.01655         -0.06449          0.14869         -0.8735
## 2         -0.04535         -0.09192          0.06293         -0.9772
## 3         -0.02399         -0.05940          0.07480         -0.9872
## 4         -0.04183         -0.06953          0.08494         -0.4735
## 5         -0.03508         -0.09094          0.09009         -0.4580
## 6          0.05055         -0.16617          0.05836         -0.5449
##   tbodygyro_y_std tbodygyro_z_std tbodygyrojerk_x_mean
## 1       -0.951090         -0.9083             -0.10727
## 2       -0.966474         -0.9414             -0.09368
## 3       -0.987734         -0.9806             -0.09961
## 4       -0.054608         -0.3443             -0.09000
## 5       -0.126349         -0.1247             -0.07396
## 6        0.004105         -0.5072             -0.12223
##   tbodygyrojerk_y_mean tbodygyrojerk_z_mean tbodygyrojerk_x_std
## 1             -0.04152             -0.07405             -0.9186
## 2             -0.04021             -0.04670             -0.9917
## 3             -0.04406             -0.04895             -0.9929
## 4             -0.03984             -0.04613             -0.2074
## 5             -0.04399             -0.02705             -0.4870
## 6             -0.04215             -0.04071             -0.6148
##   tbodygyrojerk_y_std tbodygyrojerk_z_std tbodyacclmag_mean
## 1             -0.9679             -0.9578          -0.84193
## 2             -0.9895             -0.9879          -0.94854
## 3             -0.9951             -0.9921          -0.98428
## 4             -0.3045             -0.4043          -0.13697
## 5             -0.2388             -0.2688           0.02719
## 6             -0.6017             -0.6063          -0.12993
##   tbodyacclmag_std tgravityacclmag_mean tgravityacclmag_std
## 1         -0.79514             -0.84193            -0.79514
## 2         -0.92708             -0.94854            -0.92708
## 3         -0.98194             -0.98428            -0.98194
## 4         -0.21969             -0.13697            -0.21969
## 5          0.01988              0.02719             0.01988
## 6         -0.32497             -0.12993            -0.32497
##   tbodyaccljerkmag_mean tbodyaccljerkmag_std tbodygyromag_mean
## 1              -0.95440             -0.92825          -0.87476
## 2              -0.98736             -0.98412          -0.93089
## 3              -0.99237             -0.99310          -0.97649
## 4              -0.14143             -0.07447          -0.16098
## 5              -0.08945             -0.02579          -0.07574
## 6              -0.46650             -0.47899          -0.12674
##   tbodygyromag_std tbodygyrojerkmag_mean tbodygyrojerkmag_std
## 1          -0.8190               -0.9635              -0.9358
## 2          -0.9345               -0.9920              -0.9883
## 3          -0.9787               -0.9950              -0.9947
## 4          -0.1870               -0.2987              -0.3253
## 5          -0.2257               -0.2955              -0.3065
## 6          -0.1486               -0.5949              -0.6486
##   fbodyaccl_x_mean fbodyaccl_y_mean fbodyaccl_z_mean fbodyaccl_x_std
## 1         -0.93910         -0.86707          -0.8827        -0.92444
## 2         -0.97964         -0.94408          -0.9592        -0.97641
## 3         -0.99525         -0.97707          -0.9853        -0.99603
## 4         -0.20279          0.08971          -0.3316        -0.31913
## 5          0.03823          0.00155          -0.2256         0.02433
## 6         -0.40432         -0.19098          -0.4333        -0.33743
##   fbodyaccl_y_std fbodyaccl_z_std fbodyaccl_x_meanfreq
## 1        -0.83363        -0.81289             -0.15879
## 2        -0.91728        -0.93447             -0.04951
## 3        -0.97229        -0.97794              0.08652
## 4         0.05604        -0.27969             -0.20755
## 5        -0.11296        -0.29793             -0.30740
## 6         0.02177         0.08596             -0.41874
##   fbodyaccl_y_meanfreq fbodyaccl_z_meanfreq fbodyaccljerk_x_mean
## 1              0.09753              0.08944             -0.95707
## 2              0.07595              0.23883             -0.98660
## 3              0.11748              0.24486             -0.99463
## 4              0.11309              0.04973             -0.17055
## 5              0.06322              0.29432             -0.02766
## 6             -0.16070             -0.52011             -0.47988
##   fbodyaccljerk_y_mean fbodyaccljerk_z_mean fbodyaccljerk_x_std
## 1             -0.92246              -0.9481            -0.96416
## 2             -0.98158              -0.9861            -0.98749
## 3             -0.98542              -0.9908            -0.99507
## 4             -0.03523              -0.4690            -0.13359
## 5             -0.12867              -0.2883            -0.08633
## 6             -0.41344              -0.6855            -0.46191
##   fbodyaccljerk_y_std fbodyaccljerk_z_std fbodyaccljerk_x_meanfreq
## 1             -0.9322             -0.9606                   0.1324
## 2             -0.9825             -0.9883                   0.2566
## 3             -0.9870             -0.9923                   0.3142
## 4              0.1067             -0.5347                  -0.2093
## 5             -0.1346             -0.4017                  -0.2532
## 6             -0.3818             -0.7260                  -0.3770
##   fbodyaccljerk_y_meanfreq fbodyaccljerk_z_meanfreq fbodygyro_x_mean
## 1                  0.02451                 0.024388          -0.8502
## 2                  0.04754                 0.092392          -0.9762
## 3                  0.03916                 0.138581          -0.9864
## 4                 -0.38624                -0.185530          -0.3390
## 5                 -0.33759                 0.009372          -0.3524
## 6                 -0.50950                -0.551104          -0.4926
##   fbodygyro_y_mean fbodygyro_z_mean fbodygyro_x_std fbodygyro_y_std
## 1          -0.9522         -0.90930         -0.8823        -0.95123
## 2          -0.9758         -0.95132         -0.9779        -0.96235
## 3          -0.9890         -0.98077         -0.9875        -0.98711
## 4          -0.1031         -0.25594         -0.5167        -0.03351
## 5          -0.0557         -0.03187         -0.4954        -0.18141
## 6          -0.3195         -0.45360         -0.5659         0.15154
##   fbodygyro_z_std fbodygyro_x_meanfreq fbodygyro_y_meanfreq
## 1         -0.9166            -0.003547             -0.09153
## 2         -0.9439             0.189153              0.06313
## 3         -0.9823            -0.120293             -0.04472
## 4         -0.4366             0.014784             -0.06577
## 5         -0.2384            -0.100454              0.08255
## 6         -0.5717            -0.187450             -0.47357
##   fbodygyro_z_meanfreq fbodyacclmag_mean fbodyacclmag_std
## 1            0.0104581          -0.86177          -0.7983
## 2           -0.0297839          -0.94778          -0.9284
## 3            0.1006076          -0.98536          -0.9823
## 4            0.0007733          -0.12862          -0.3980
## 5           -0.0756762           0.09658          -0.1865
## 6           -0.1333739          -0.35240          -0.4163
##   fbodyacclmag_meanfreq fbodyaccljerkmag_mean fbodyaccljerkmag_std
## 1               0.08641              -0.93330              -0.9218
## 2               0.23666              -0.98526              -0.9816
## 3               0.28456              -0.99254              -0.9925
## 4               0.19064              -0.05712              -0.1035
## 5               0.11919               0.02622              -0.1041
## 6              -0.09774              -0.44265              -0.5331
##   fbodyaccljerkmag_meanfreq fbodygyromag_mean fbodygyromag_std
## 1                   0.26639           -0.8622          -0.8243
## 2                   0.35185           -0.9584          -0.9322
## 3                   0.42222           -0.9846          -0.9785
## 4                   0.09382           -0.1993          -0.3210
## 5                   0.07649           -0.1857          -0.3984
## 6                   0.08535           -0.3260          -0.1830
##   fbodygyromag_meanfreq fbodygyrojerkmag_mean fbodygyrojerkmag_std
## 1            -0.1397750               -0.9424              -0.9327
## 2            -0.0002622               -0.9898              -0.9870
## 3            -0.0286058               -0.9948              -0.9947
## 4             0.2688444               -0.3193              -0.3816
## 5             0.3496139               -0.2820              -0.3919
## 6            -0.2193034               -0.6347              -0.6939
##   fbodygyrojerkmag_meanfreq
## 1                    0.1765
## 2                    0.1848
## 3                    0.3345
## 4                    0.1907
## 5                    0.1900
## 6                    0.1143
```


# References:
[Data Science & Wearable Computing](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/)

[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[Original Project Data Files](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.





