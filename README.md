# Getting And Cleaning Data Course Project

This project takes the data for the Human Activity Recognition Using Smartphones Data Set in the UCI Machine Learning Repository (<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>), tidies it and produces two data frames.

The source data can be retrieved from here: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> 

This repository contains five files:
* Readme.md which is this readme file.
* CodeBook.md which describes the variables, data, and transformations that were performed to clean up the data.
* HumanActivityRecognitionUsingSmartphones.csv which is the tidied mean and standard deviation measure data with subject and activity info.
* HumanActivityRecognitionUsingSmartphonesSummary.csv which is a summary of HumanActivityRecognitionUsingSmartphones.csv by subject and activity with all of the measures averaged.
* run_analysis.R that downloads the source data, tidies that data and creates two data frames of tidied data.

For further information please see CodeBook.md