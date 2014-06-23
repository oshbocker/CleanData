CleanData
=========

Repository for the Getting and Cleaning Data Coursera course project 

The run_analysis.R script consolidates and cleans data collected from the accelerometers from the Samsung Galaxy S smartphone. The original data set is located at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphonesand the files used for this project were downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The script should be placed in the same folder as the downloaded UCI HAR Dataset folder. It begins by reading both the training data and the test data from their respective folders. It then merges the data sets and applies the descriptive names from features.txt to the columns.

Next, the script extracts only the data that is a mean or a standard deviation of the original accelerometer data. The script then applies descriptive labels to the activities for each measurment.

Finally, the script creates a data set by averaging each measurment for each activity of each subject and writes the final clean data set to a csv file in the working directory.
