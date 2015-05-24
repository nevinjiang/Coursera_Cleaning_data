# Code Book for Coursera Getting and Cleaning Data Project

## Data measurement
**Quote** Feature selection

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

**Modified** Only these variable extracted from original dataset:

mean(): Mean value

std(): Standard deviation

angle(): Angle between to vectors.


**Quote** Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean


## Variables details
- 'dir' : current working directory
- 'mainDir', 'trainDir', 'testDir' : file path for datasets
- 'features' : list of measurement types from features.txt
- 'activity_lables' : data frame index activity ID number and activities
- 'X_test' : data frame read in from X_test.txt with column names from features, equivalent for X_train
- 'y_test' : data frame read in from y_test.txt indicate activity ID for each x_test row, equivalent for y_train
- 'sub_test' : data frame read in from sub_test.txt indicate subject ID for each x_test row, equivalent for sub_train
- 'testMeasure' : data frame extract all mean and std measurement from x_test and merge with y_test and sub_test, equivalent for trainmeasure.
- 'allMeasure' : data frame merged from test and train data and added activity column based on activity_labels
- 'allMeasureTidy' : data frame calculate the average mean and std from allMeasure by each subject and each activity

## Output tidy data columns
- 'subID' : subject id number from file sub_test and sub_train
- 'activity' : types of activities
- 'actID' : original activity id number from file y_test and y_train
- 'tBodyAcc-mean()-X' ... 'angle(Z,gravityMean)' : averaged mean and std from X_test and X_train by subject and activities

## End of Codebook

