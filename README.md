# coursera-gcd
Coursera - Getting and cleaning data. Project
=============================================

Introduction
------------
This repository contains 

README.md      This file

run_analysis.R R script that does the following 
               
			   1. Merges the training and the test sets to create one data set.
               2. Extracts only the measurements on the mean and standard deviation for each measurement. 
               3. Uses descriptive activity names to name the activities in the data set
               4. Appropriately labels the data set with descriptive variable names. 
               5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
			      variable for each activity and each subject.

				  tidy_data.txt  Tidy data set generated by run_analysis.README

CodeBook.md    Code Book that explains the transformations performed and the data and variables used

Raw data
------------------
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Test set

x_test.txt       Features unlabelled
y_test.txt       Activity labels
subject_test.txt Test subjects

Training test

x_training.txt       Features unlabelled
y_training.txt       Activity labels
subject_training.txt Test subjects

