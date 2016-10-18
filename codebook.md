# Codebook for Getting and Cleaning Data, Week 4 Assignment

For complete details of where the data comes from and what it represents, please see README.md and Datafiles.md.

----------
## Filename: output.txt ##
In this file there are two columns which describe the "observational unit", subject and activity.  The remaining columns represent measurements.

The variable names for measurements are composed of the concatenation of elements describing the measurement:

**'t' or 'f'** - representing 'time domain signals' and 'frequency domain signals' respectively.

**activity type** -  a short description of the activity being measured.  The raw measurements were from an accelerometer (represented by "acc" in the column name) and a gyroscope ("gyro").
Acceleration was separated into body and gravity acceleration signals, represented in the column names by "body" and "gravity".
Body linear acceleration and angular velocity were derived in time to obtain Jerk signals - represented in the column names "jerk".
The magnitude of the three-dimensional signals were calculated, giving the "mag" found in the column names.

**mean or standard deviation** - the measurements subsetted from the complete data were either the mean or standard deviation.  These appear in the variable names as "mean" or "std" respectively.

**x, y or z** - raw measurements were on 3-axial raw signals, x, y, and z.  The trailing "x", "y" or "z" in the variable names denotes the axial measurement represented.

For example:
- 'tbodyaccmeanx' represents the time signal domain of the body component of acceleration in the 'x' direction and the measure is the mean.
-  'fbodyaccjerkstdz' represents the frequency signal domain of the jerk signal of the body component of acceleration in the 'z' direction and the measure is the standard deviation.

Measurements are normalized and bounded within [-1,1].

**subject**
An identifier of the individual whose activity the data records. (1:30)

**activity**
Description of the activity being measured, takes the values:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

**measurements**

tbodyaccmeanx
tbodyaccmeany
tbodyaccmeanz
tgravityaccmeanx
tgravityaccmeany
tgravityaccmeanz
tbodyaccjerkmeanx
tbodyaccjerkmeany
tbodyaccjerkmeanz
tbodygyromeanx
tbodygyromeany
tbodygyromeanz
tbodygyrojerkmeanx
tbodygyrojerkmeany
tbodygyrojerkmeanz
tbodyaccmagmean
tgravityaccmagmean
tbodyaccjerkmagmean
tbodygyromagmean
tbodygyrojerkmagmean
fbodyaccmeanx
fbodyaccmeany
fbodyaccmeanz
fbodyaccjerkmeanx
fbodyaccjerkmeany
fbodyaccjerkmeanz
fbodygyromeanx
fbodygyromeany
fbodygyromeanz
fbodyaccmagmean
fbodybodyaccjerkmagmean
fbodybodygyromagmean
fbodybodygyrojerkmagmean
tbodyaccstdx
tbodyaccstdy
tbodyaccstdz
tgravityaccstdx
tgravityaccstdy
tgravityaccstdz
tbodyaccjerkstdx
tbodyaccjerkstdy
tbodyaccjerkstdz
tbodygyrostdx
tbodygyrostdy
tbodygyrostdz
tbodygyrojerkstdx
tbodygyrojerkstdy
tbodygyrojerkstdz
tbodyaccmagstd
tgravityaccmagstd
tbodyaccjerkmagstd
tbodygyromagstd
tbodygyrojerkmagstd
fbodyaccstdx
fbodyaccstdy
fbodyaccstdz
fbodyaccjerkstdx
fbodyaccjerkstdy
fbodyaccjerkstdz
fbodygyrostdx
fbodygyrostdy
fbodygyrostdz
fbodyaccmagstd
fbodybodyaccjerkmagstd
fbodybodygyromagstd
fbodybodygyrojerkmagstd

## Filename: means.txt ##
This files summarises data contained in output.txt, containing the mean of each measurement variable for each activity and each subject.  The columns are the same as shown above for output.txt.