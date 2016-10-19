
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# read training data
train_data <- read.csv("./data/UCI HAR Dataset/train/x_train.txt", sep = "", header = FALSE)
# read training subject number 
train_subject <- read.csv("./data/UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)
# read training activity index
train_activity <- read.csv("./data/UCI HAR Dataset/train/y_train.txt", sep = "", header = FALSE)
# combine training data into one table
train_all_data <- cbind(train_subject, train_activity, train_data)

# read test data
test_data <- read.csv("./data/UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
# read subject number 
test_subject <- read.csv("./data/UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)
# read activity index
test_activity <- read.csv("./data/UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE)
# combine test data into one table
test_all_data <- cbind(test_subject, test_activity, test_data)

# combine training data with test data
all_data <- rbind(train_all_data, test_all_data)

# read activity labels
activity <- read.csv("./data/UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)
# replace activity index with activity label
all_data[, 2] <- activity[all_data[ , 2], 2]

# get column labels
column_titles <- read.csv("./data/UCI HAR Dataset/features.txt", sep = "", header = FALSE)
# convert factors into strings
column_titles[, 2] <- as.character(column_titles[, 2])
# add first two labels to list of column labels
column_titles <- rbind(c(0,"Subject"), c(0,"Activity"), column_titles)

# add column labels to all_data
colnames(all_data) <- column_titles[ , 2]

# find all columns with "mean()" or "std()" in the name
hits <- grep("mean\\(\\)|std\\(\\)", column_titles[ ,2])
# include the subject and activity columns!
hits <- c(1, 2, hits)

# create compact data set
compact_data <- all_data[ , hits]

# make the names a little more user friendly
names(compact_data) <- gsub("^t", "time", names(compact_data))
names(compact_data) <- gsub("^f", "frequency", names(compact_data))
names(compact_data) <- gsub("Acc", "Acceleration", names(compact_data))
names(compact_data) <- gsub("Mag", "Magnitude", names(compact_data))
names(compact_data) <- gsub("Gyr", "Gyroscope", names(compact_data))

# aggregate subsets, find mean on subject and activity, then sort by subject then activity
final_data <- aggregate(. ~Subject + Activity, compact_data, mean)
final_data <- final_data[order(final_data$Subject, final_data$Activity), ]

# finally, output results
write.table(final_data, file = "output.txt", row.names = FALSE, quote = FALSE)
