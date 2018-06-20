# Getting-and-Cleaning-DAta
Coursera Data Science Specialization / 03. Getting and Cleaning Data

The data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Training set files:
- X_train.txt
- y_train.txt
- subject_train.txt

Test set files:
- X_test.txt
- y_test.txt
- subject_test.txt

# Script
run_analysis.R
Merges the train and test sets.  Adds labels to columns and activities and select only the columns for means and standard deviation.
Finally, it creates a tidy data set containing the mean for each variable for each activity and subject and writes it into the file tidy.txt in the same directory.

Prerequisites:
Train and test files must be available in a directory called "data".

# Code book
CodeBook.md describes the variables, the data, and transformations performed to clean up the data.