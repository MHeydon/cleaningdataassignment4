# Human Activity Recognition Using Smartphones Data Set 
Source of data: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

Acknowledgement

----------
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 


> [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
> 

## Details of data in the zip file ##

The data unzips into a main directory 'UCI HAR Dataset'

Within the base 'UCI HAR Dataset' folder there are four files and two sub-folders ('test' and 'train').
### /UCI HAR Dataset/
----------

**README.txt** - Describes at a high level the source of the data and the structure of the file.  This file is reproduded in OrigReadMe.md.
 
**activity_labels.txt** - This file maps activity numeric codes in the data to descriptions of the activity

**features.txt** - This file contains the complete list of variables of each feature vector.  It lists 561 features.  These are essentially column headings for the data files in the 'train' and 'test' sub-folders.

**features_info.txt** - This file contains some detailed description of the data, expanding on some of the information provided in README.txt.  Some key notes from this file are:

- The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ

- These time domain signals (**prefix 't' to denote time**) were captured at a constant rate of 50 Hz.

- They were filtered to remove noise. The acceleration signal was separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ).

- The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).

- The magnitude of these three-dimensional signals were calculated (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

- Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (**Note the 'f' to indicate frequency domain signals**).

- These signals were used to estimate variables of the feature vector for each pattern ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions):
	- tBodyAcc-XYZ
	- tGravityAcc-XYZ
	- tBodyAccJerk-XYZ
	- tBodyGyro-XYZ
	- tBodyGyroJerk-XYZ
	- tBodyAccMag
	- tGravityAccMag
	- tBodyAccJerkMag
	- tBodyGyroMag
	- tBodyGyroJerkMag
	- fBodyAcc-XYZ
	- fBodyAccJerk-XYZ
	- fBodyGyro-XYZ
	- fBodyAccMag
	- fBodyAccJerkMag
	- fBodyGyroMag
	- fBodyGyroJerkMag

- Taking each of these features (including each of X, Y & Z), there are 33 basic features.
- The following 17 measures are provided [not all measures for all features]:
	- **mean()**: Mean value
	- **std()**: Standard deviation
	- **mad()**: Median absolute deviation
	- **max()**: Largest value in array
	- **min()**: Smallest value in array
	- **sma()**: Signal magnitude area
	- **energy()**: Energy measure. Sum of the squares divided by the number of values.
	- **iqr()**: Interquartile range
	- **entropy()**: Signal entropy
	- **arCoeff()**: Autorregresion coefficients with Burg order equal to 4
	- **correlation()**: correlation coefficient between two signals
	- **maxInds()**: index of the frequency component with largest magnitude
	- **meanFreq()**: Weighted average of the frequency components to obtain a mean frequency
	- **skewness()**: skewness of the frequency domain signal
	- **kurtosis()**: kurtosis of the frequency domain signal
	- **bandsEnergy()**: Energy of a frequency interval within the 64 bins of the FFT of each window.
	- **angle()**: Angle between to vectors. 

- From the README, features are normalized and bounded within [-1,1]

----------
### /UCI HAR Dataset/test/

**subfolder /Inertial Signals/** - This contains the original raw data, prior to the transformations/summarizations described in features_info.txt.  This data was not required for completion of the assignment.

**subject_test.txt** - This file contains the identifier of the subject for each row of the test data in X_test.txt.

**X_test.txt** - This file contains the test data.  There are 561 columns of variables corresponding to the labels in features.txt.  There are no headers in this file.

**y_test.txt** - This file contains the activity identifier (numeric index which maps to a description as contained in activity_labels.txt) for each row of the test data in X_test.txt.

### /UCI HAR Dataset/train/
This folder has identical contents as /UCI HAR Dataset/test/ except that it is in respect of training data rather than test data.