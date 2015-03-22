---
title: "Readme"
author: Abhijit Bhinge
date: "Sunday, March 22, 2015"
output: html_document
---
## Data Analysis

1. Combine the test and train subjects, activities and features in 3 different data sets respectively. One data set for each.
For ex:- Both test and train subjects are rbinded into one. test and train activities are rbinded into 2nd one and so on and so forth.

2. Assign the desired column names and combine all the data sets into one big data set.

3. Get only those features/column names which has the word mean or std in it.

4. Assign the descriptive activity names to this final data set.

5. Lastly, create a tidy data set with the average of each variable for each activity and each subject.

## The dataset includes the following files:

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

## The run_analysis.R file should be present in the working directory for it to generate the correct output.

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
