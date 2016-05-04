# Getting-and-Cleaning-Data

Introduction
This repository contains my work for the "Getting and Cleaning Data" project, which is part of the Data Science specialization through Johns HopkinsUniversity

About the raw data
The features are unlabeled and can be found in the x_test.txt. The activity labels are in the y_test.txt file. The test subjects are in the subject_test.txt file.

This is true for the training set as well.

I created a script called R Script.R which combines the test and training sets. 

Prerequisites for this script
the UCI HAR Dataset must be extracted and be availble in a directory called "UCI HAR Dataset"
The testing and training data are merged, labels are added, and only columns dealing with mean and standard deviation are included. This script creates a tidy data set containing the means of all the columns by test subject and activity. It is then written to This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.

About the Code Book
The CodeBook.md file explains the steps I took in this project, and the resulting data and variables.
