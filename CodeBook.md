---
title: "CodeBook.md"
author: Abhijit Bhinge
date: "Sunday, March 22, 2015"
output: html_document
---

## Data Source

The data for this project was taken from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Full description of the data can be obtained from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## About The Data

The data was gathered from a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## About run_analysis.R

This code is used to tiday up the data provided in the various text file which are extracted from the source zip. run_analysis.R has to be in your working directory. 

It expects the following two files in the working directory:

1. activity_labels.txt  and
2. features.txt

It also expects the train and test files as below:- The train and test folders should be in the working directory.

1. ./test/subject_test.txt
2. ./test/y_test.txt
3. ./test/X_test.txt
4. ./train/subject_train.txt
5. ./train/y_train.txt
6. ./train/X_train.txt

### run_analysis performs the following 5 operations to tidy the data.

1. Combine the test and train subjects, activities and features in 3 different data sets respectively. One data set for each.
For ex:- Both test and train subjects are rbinded into one. test and train activities are rbinded into 2nd one and so on and so forth.

2. Assign the desired column names and combine all the data sets into one big data set.

3. Get only those features/column names which has the word mean or std in it.

4. Assign the descriptive activity names to this final data set.

5. Lastly, create a tidy data set with the average of each variable for each activity and each subject.

## Variables

Following variables are used in the final data set:

1. subject - This is the subject id of the person.

2. activity_id - This is the activity id of different activities.

3. activity_names - This is the descriptive name of the activity id.

4. Feature names - The tidy data set has all the features which has mean or std in the feature name.















