# Codebook for final project of "Getting and Cleaning Data" hosted by Johns Hopkins University

This document describes the raw data source, the process, and the final data set associated with the aforementioned class.

The dataset can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Please refer to features_info.txt in the .ZIP file for information about how the raw data were gathered and processed to generate the data files of interest to this project.

There are two blocks of data, training and test.  They contain the same types of data, but the training block of data is intended for use in training a machine learning algorithm and the test block is for testing the resulting algorithm.  For purposes of this project, we will combine them.  The following are files that are of interest to this project:  

<ol>
<li> test/subject_test.txt</li>
	contains the subject (or person) number for a row of test data
<li> test/y_test.txt</li>
	contains the activity code for a row of test data
<li> test/x_test.txt</li>
	contains the rows of test data
<li> train/subject_train.txt</li>
	contains the subject (or person) number for a row of training data
<li> train/y_train.txt</li>
	contains the activity code for a row of training data
<li> train/x_train.txt</li>
	contains the rows of trainig data
<li> activity_labels.txt</li>
	contains the description associated with an activity code
<li> features.txt</li>
	contains the names associated with the data columns	
</ol>

Procedure:

* Read and combine 1), 2), and 3) into a)  
* Read and combine 4), 5), and 6) into b)  
* Combine a) and b) to create c)  
* Read 7), replace activity codes in c) with these activity names  
* Read 8), combine with c)  
* Create d) with only desired data from c) by keeping all columns that include "mean()" or "std()" in its name
* Massage column names of d) into something more user-friendly  
* Create e) with means of data in d), grouped by Subject and Activity  
* Sort e) on Subject then Activity  
* Write e) as the final tidy data set, unoriginally titled "output.txt"

The resulting file contains 180 rows of data, the means for each subject and activity for that subject.  
The resulting file also contains 68 columns.  There are four main types of column:

* Subject - The idenitifier for the person who was instrumented
* Activity - A string describing the activity for the data row
* All acceleration columns use units of g (gravity)
* All gyroscope columns use units of radians/sec
  
