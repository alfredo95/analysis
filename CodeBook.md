---
title: "CodeBook"
author: "Alfredo"
date: "10/10/2020"
output: pdf_document
---

## Instructions

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

* Read data and merge
  + subject_test: ids for test
  + subject_train: ids for train
  + X_test: variables in test
  + X_train: variables in train
  + y_test: id for test
  + y_train: id for train
  + activity_labels: description of all activitys in y_test and y_train
  + features: description of all variables in X_test and X_train
  + dataSet: bind of X_train and X_test

* Extract only mean() and std()
  + Create a vector of only mean and std labels, then use the vector to subset dataSet.
  + mean_std: a vector of only mean and std labels extracted from second column of features
  + dataSet: result set containing mean and std

* Changing column label of dataSet
  + Create a vector of "clean" feature names by getting rid of "()" and then apply that  to the dataSet
 + CleanFeatureNames: a vector of "clean" feature names

* Adding subject and activity to the dataSet
  + To bind the test and training data into a new data set, then set new header names are assigned
  + subject: bind of subject_train and subject_test
  + activity: bind of y_train and y_test

* Rename ID
  + Use act_group in order to rename each levels with 2nd column of activity_levels and the renamed act_group to dataSet's activity column.
  +act_group: factored activity column of dataSet

* Output tidy data
  + It is the set of data ordered from the previous section, in this data we also add its means for each column.

  + baseData: melted tall and skinny dataSet
  + tidyData:  baseData has means of each variables
