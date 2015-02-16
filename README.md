---
title:"Getting and Cleaning Data Course Project"
---
#This is the readme file for my course project for Coursera course Getting and Cleaning Data.

##The run_analysis.r is the script for the analysis and create by following steps:
1. Merges the training and the test sets to create one data set.
1.1 Read datas.
1.2 Combines data table (train vs test) by rows.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
2.1 Read features labels.
2.2 Friendly names to features column.
2.3 Search for matches to argument mean or standard deviation (sd)  within each element of character vector.
2.4 Replaces all matches of a string features.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
4.1 Friendly names to activities column.
4.2 Combines data table by columns.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
5.1 Create a 2nd data.
5.2 Activity and Subject name of columns.
5.3 Create txt files.


##The CodeBook.md is a code book that describes the data.