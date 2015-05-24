# Project for Getting and Cleaning Data in Coursera Data Science Track
## Dataset information
**Dataset** **Origin**
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Dataset file information
|UCI HAR Dataset|  | | |
|:---|:---|:---|:---|
||test|Inertial Signals|......|
|||subject_test.txt||
|||X_test.txt||
|||y_test.txt||
||train|Inertial Signals|......|
|||subject_train.txt||
|||X_train.txt||
|||y_train.txt||
||activity_labels.txt|||
||features.txt|||
||features_info.txt|||
||README.txt|||
**Quote form README**
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Goal of tidy data
1. Merge training and testing dataset
2. Extract only mean and std for each measurement
3. Convert activity ID to activity name
4. Assign X_train/test dataset column names by features
5. Average mean and std for each activity and each subject

## Code steps
1. Check and prepare required packages and dataset
2. Create variables for different file path
3. Read in required files
4. Assign proper column names
5. Extract "mean" and "std" data
6. Merge data within test and train
7. Merge train and test data
8. convert activity id to name
9. Summarise average mean and std of the data by subject and activity
10. Output tidy data to txt file

## Tidy data explained
- 'subID' : subject id number from file sub_test and sub_train
- 'activity' : types of activities
- 'actID' : original activity id number from file y_test and y_train
- 'tBodyAcc-mean()-X' ... 'angle(Z,gravityMean)' : averaged mean and std from X_test and X_train 


