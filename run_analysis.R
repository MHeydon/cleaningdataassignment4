## This first bit was the code to download and unzip the data.
## It is commented out since it is not required per the Instructions for
## this assignment.
# setwd("C:/Users/mheydon/Coursera/Johns_Hopkins_Data_Science/3_Getting_and_cleaning_data/week4/project")
# if(!file.exists("./Data")){dir.create("./Data")}
# fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(fileUrl,destfile = "./Data/data.zip")
# unzip("./Data/data.zip")

## Read all the relevant data in
## The activiy coding
	activities <- read.table("./Data/UCI HAR Dataset/activity_labels.txt")
	colnames(activities) <- c("activitycode","activity")
## The vector of subject identifiers for the training data
	subjecttrain <- read.table("./Data/UCI HAR Dataset/train/subject_train.txt")
	colnames(subjecttrain) <- "subject"
## The training data
	datatrain <- read.table("./Data/UCI HAR Dataset/train/x_train.txt")
## The vector of activity labels which goes with the training data
	activitytrain <- read.table("./Data/UCI HAR Dataset/train/y_train.txt")
	colnames(activitytrain) <- "activitycode"
## The vector of subject identifiers for the test data
	subjecttest <- read.table("./Data/UCI HAR Dataset/test/subject_test.txt")
	colnames(subjecttest) <- "subject"
## The vector of activity labels which goes with the test data
	activitytest <- read.table("./Data/UCI HAR Dataset/test/y_test.txt")
	colnames(activitytest) <- "activitycode"
## The test data
	datatest <- read.table("./Data/UCI HAR Dataset/test/x_test.txt")
## The list of features in the test and training data
## these are essentially the column headings for the test and training data
	features <- read.table("./Data/UCI HAR Dataset/features.txt")
	colnames(features) <- c("index","feature") # add column names
## Add the names in 'features' as the column headings in the data
	colnames(datatrain) <- features$feature
	colnames(datatest) <- features$feature
## add a 'source' identifier to the data so that it can be retrieved
## separately from the combined data if required
	datatrain$source <- rep("train",dim(datatrain)[1])
	datatest$source <- rep("test",dim(datatest)[1])
## add the activity labels and subjects to the training data
	datatrain <- cbind(subjecttrain,activitytrain,datatrain)
## add the activity labels and subjects to the test data
	datatest <- cbind(subjecttest,activitytest,datatest)
## merge the training and test data into the one data frame
	fulldataset <- rbind(datatrain,datatest)
## add the activity into the data subset
	fulldataset <- merge(fulldataset,activities)
## remove data no longer required from the workspace
	rm("subjecttest","subjecttrain","datatest","datatrain","activitytest",
			"activitytrain")
## subset the means and std deviations
	datasubset <- cbind(fulldataset$subject,fulldataset$activity,
				fulldataset[,c(grep("mean()",
				colnames(fulldataset),fixed = TRUE),grep("std()",
				colnames(fulldataset),fixed = TRUE))])

## tidy up the column headings
	colnames(datasubset) <- gsub(pattern = "(.*)\\$", replacement = "",
							x = colnames(datasubset))
	colnames(datasubset) <- gsub(pattern = "-", replacement = "",
							x = colnames(datasubset))
	colnames(datasubset) <- gsub(pattern = "\\(\\)", replacement = "",
							x = colnames(datasubset))
	colnames(datasubset) <- tolower(colnames(datasubset))

## create the required summary dataset
	require(dplyr) # load dplyr to make summary easy
	meandata <- datasubset %>% group_by(subject,activity) %>% 
					summarize_each(funs(mean))

	## output the subset of data containing all mean and std variables to file
write.table(datasubset,file = "./subset.txt", row.name=FALSE)
## output the required summary dataset to file
write.table(meandata,file = "./means.txt",row.name=FALSE)
