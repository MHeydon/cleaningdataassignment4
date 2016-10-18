# Getting and Cleaning Data, Week 4 Assignment 
This project is the assignment for week 4 of the Coursera/Johns Hopkins course "Getting and Cleaning Data".
The instructions for this assignment are in the file Instructions.md.

## Background ##

The purpose of this project is to demonstrate ones ability to collect, work with, and clean a data set.
The data in the project comes from a series of experiments using smartphones to record activity data.  Further details of this data are contained in the README.txt file which came with the data.  I have reformatted this file into a markdown file and this is included in this repository as OrigReadMe.md.

This project required:
1. Tidying and subsetting of the data as per Instructions.md.
2. Storing of all relevant files in a github repo.
3. Submission of a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4. README that explains the analysis files in a clear and understandable manner.

## Data provided ##
The data provided comes from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

Further details of this data are available in the README.txt and features_info.txt included in the zip file, as well as from the site where the data was obtained: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

A description of the full contents of the zip file data is contained in the file Datafiles.md.

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

> [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
>

## Data preparation procedure ##
The script in R used to process the data is contained in run_analysis.R.
In outline, the procedure was:
- Download and unzip the datafile [this step is commented out in the script on the basis that it is outside the scope of the script required to be submitted].  The data is downloaded and unzipped into a "Data" folder in the working directory and the remainder of the script assumes that this is where the data resides.  
- Read in each of the required files into R variables using the read.table function.
- Set column names of the data:
	- For subject and activity dataframes, the column names were set manually to "subject" and "activitycode".
	- For the main data containing the 561 variables, the column names were set to the values in the file features.txt.  No modifications were made to the column names at this point since these column names contained all the information required to fully identify the values in the column and to allow selection of the mean() and std() values.  These column names are tidied up a little in the final datasets required.
- A complete dataset is created for each of the training and test data by binding the columnns of subject, activity and variables data.  I have also added a "source" column to identify whether the data was originally "test" or "train" data so that this distinction is carried forward in the output dataset in case it is requried.
- The activity description is added in to the dataset by merging the data with that in the activity mapping table.  Note - at this point the data is resorted so the orignal order is lost.
- The full data is subsetted to include only the mean and standard deviation for each measurement.  I have interpreted this to include only the measures mean() and std().  While there is also a measurement "meanFreq()", defined as "Weighted average of the frequency components to obtain a mean frequency", my judgement was that this did not meet the requirement in the Instructions to extract "measurements on the mean".  I have therefore not extracted this measure.
- The column names in the subsetted data are tidied up by:
	- removing the "fulldataset$" from the names in the first two columns
	- removing "-", "(" and ")" characters from the names
	- putting all the characters into lowercase 
- The required summary by subject and activity is created using the `summarize_each` function from the `dplyr` package.  The code for doing this summary was modelled after that provided in [http://stackoverflow.com/questions/22644804/how-can-i-use-dplyr-to-apply-a-function-to-all-non-group-by-columns](http://stackoverflow.com/questions/22644804/how-can-i-use-dplyr-to-apply-a-function-to-all-non-group-by-columns).
- Both the subsetted data and summary are output to text files using the `write.table` function.

## Output files
The output files are placed in the working directory.
The output files are:
**subset.txt** - the subset of the data containing only mean() and std() variables.
**means.txt** - the summary of the data in subset.txt with the mean of each variable for each activity and each subject.
Details of the data in each of these files can be found in codebook.md.

The data in these files are "tidy" in that:

- Each column of the data contains either values that define the observational unit (subject, activity) or values that measure the same underlying attribute.  That is, each variable forms a column.
- The observations are the acceleration/frequency etc. measures in respect of a particular subject for a particular activity and these observations are one per row.
- There is only one "obervational unit" (the activity for the subject) in the table.

The files written out can be read into an R dataframe using the read.table function, for example:
`mydata <- read.table("./subset.txt", header = TRUE)` 