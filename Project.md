# Codebook for final project of "Getting and Cleaning Data" hosted by Johns Hopkins University

This document describes the raw data source, the process, and the final data set associated with the aforementioned class.

The dataset can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

<p>The following are files that are of interest to this project.  There are two blocks of data, training and test.  They contain the same types of data, but the training block of data is intended for use in training a machine learning algorithm and the test block is for testing the resulting algorithm.  For purposes of this project, we will combine them:</P>

<ol>
<li> test/subject_test.txt</li>
	contains the subject (or person) number for a row of test data
<li> test/y_test.txt</li>
	contains the activity code for a row of test data
<li> test/x_test.txt</li>
	contains the rows of test data
<li> train/subject_train.txt  
<li> train/y_train.txt
<li> train/x_train.txt  
<li> activity_labels.txt: contains the description associated with an activity code
</ol>
