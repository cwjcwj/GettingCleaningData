tidy2 CODEBOOK
==============

This data.frame, tidy2, is developed from the data which originally measured activities performed by subjects who had a Samsung phone attached during the performance of their activities.  The phone reported on the motions that it encountered.

The features selected for this database originally came from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables used in tidy2 were estimated from these signals using:

mean(): Mean value
std(): Standard deviation

For these selected variables, the run_analysis script created the mean()of each original mean()or std()variable for each combination of a subject performing an activity.

Since there were 6 distinct activities and 30 unique subjects, the result is 180 separate observations of the mean variables produced by each subject performing each activity with the unique identifier for each observation being the unique combination of the subject ID and the activity name.

The complete list of variables of each feature vector are:
"subjects"						The unique ID given each of 30 subjects in the original experiment
"activities"						Name of the 6 activities performed
"Mean of  tBodyAcc-mean()-X"			Mean of variable defined above, in the original units
"Mean of  tBodyAcc-mean()-Y"			Mean of variable defined above, in the original units
"Mean of  tBodyAcc-mean()-Z"			Mean of variable defined above, in the original units
"Mean of  tBodyAcc-std()-X"			Mean of variable defined above, in the original units
"Mean of  tBodyAcc-std()-Y"			Mean of variable defined above, in the original units
"Mean of  tBodyAcc-std()-Z"			Mean of variable defined above, in the original units
"Mean of  tGravityAcc-mean()-X"		Mean of variable defined above, in the original units
"Mean of  tGravityAcc-mean()-Y"		Mean of variable defined above, in the original units
"Mean of  tGravityAcc-mean()-Z"		Mean of variable defined above, in the original units
"Mean of  tGravityAcc-std()-X"		Mean of variable defined above, in the original units
"Mean of  tGravityAcc-std()-Y"		Mean of variable defined above, in the original units
"Mean of  tGravityAcc-std()-Z"		Mean of variable defined above, in the original units
"Mean of  tBodyAccJerk-mean()-X"		Mean of variable defined above, in the original units
"Mean of  tBodyAccJerk-mean()-Y"		Mean of variable defined above, in the original units
"Mean of  tBodyAccJerk-mean()-Z"		Mean of variable defined above, in the original units
"Mean of  tBodyAccJerk-std()-X"		Mean of variable defined above, in the original units
"Mean of  tBodyAccJerk-std()-Y"		Mean of variable defined above, in the original units
"Mean of  tBodyAccJerk-std()-Z"		Mean of variable defined above, in the original units
"Mean of  tBodyGyro-mean()-X"			Mean of variable defined above, in the original units
"Mean of  tBodyGyro-mean()-Y"			Mean of variable defined above, in the original units
"Mean of  tBodyGyro-mean()-Z"			Mean of variable defined above, in the original units
"Mean of  tBodyGyro-std()-X"			Mean of variable defined above, in the original units
"Mean of  tBodyGyro-std()-Y"			Mean of variable defined above, in the original units
"Mean of  tBodyGyro-std()-Z"			Mean of variable defined above, in the original units
"Mean of  tBodyGyroJerk-mean()-X"		Mean of variable defined above, in the original units
"Mean of  tBodyGyroJerk-mean()-Y"		Mean of variable defined above, in the original units
"Mean of  tBodyGyroJerk-mean()-Z"		Mean of variable defined above, in the original units
"Mean of  tBodyGyroJerk-std()-X"		Mean of variable defined above, in the original units
"Mean of  tBodyGyroJerk-std()-Y"		Mean of variable defined above, in the original units
"Mean of  tBodyGyroJerk-std()-Z"		Mean of variable defined above, in the original units
"Mean of  tBodyAccMag-mean()"			Mean of variable defined above, in the original units
"Mean of  tBodyAccMag-std()"			Mean of variable defined above, in the original units
"Mean of  tGravityAccMag-mean()"		Mean of variable defined above, in the original units
"Mean of  tGravityAccMag-std()"		Mean of variable defined above, in the original units
"Mean of  tBodyAccJerkMag-mean()"		Mean of variable defined above, in the original units
"Mean of  tBodyAccJerkMag-std()"		Mean of variable defined above, in the original units
"Mean of  tBodyGyroMag-mean()"		Mean of variable defined above, in the original units
"Mean of  tBodyGyroMag-std()"			Mean of variable defined above, in the original units
"Mean of  tBodyGyroJerkMag-mean()"		Mean of variable defined above, in the original units
"Mean of  tBodyGyroJerkMag-std()"		Mean of variable defined above, in the original units
"Mean of  fBodyAcc-mean()-X"			Mean of variable defined above, in the original units
"Mean of  fBodyAcc-mean()-Y"			Mean of variable defined above, in the original units
"Mean of  fBodyAcc-mean()-Z"			Mean of variable defined above, in the original units
"Mean of  fBodyAcc-std()-X"			Mean of variable defined above, in the original units
"Mean of  fBodyAcc-std()-Y"			Mean of variable defined above, in the original units
"Mean of  fBodyAcc-std()-Z"			Mean of variable defined above, in the original units
"Mean of  fBodyAccJerk-mean()-X"		Mean of variable defined above, in the original units
"Mean of  fBodyAccJerk-mean()-Y"		Mean of variable defined above, in the original units
"Mean of  fBodyAccJerk-mean()-Z"		Mean of variable defined above, in the original units
"Mean of  fBodyAccJerk-std()-X"		Mean of variable defined above, in the original units
"Mean of  fBodyAccJerk-std()-Y"		Mean of variable defined above, in the original units
"Mean of  fBodyAccJerk-std()-Z"		Mean of variable defined above, in the original units
"Mean of  fBodyGyro-mean()-X"			Mean of variable defined above, in the original units
"Mean of  fBodyGyro-mean()-Y"			Mean of variable defined above, in the original units
"Mean of  fBodyGyro-mean()-Z"			Mean of variable defined above, in the original units
"Mean of  fBodyGyro-std()-X"			Mean of variable defined above, in the original units
"Mean of  fBodyGyro-std()-Y"			Mean of variable defined above, in the original units
"Mean of  fBodyGyro-std()-Z"			Mean of variable defined above, in the original units
"Mean of  fBodyAccMag-mean()"			Mean of variable defined above, in the original units
"Mean of  fBodyAccMag-std()"			Mean of variable defined above, in the original units
"Mean of  fBodyBodyAccJerkMag-mean()"	Mean of variable defined above, in the original units
"Mean of  fBodyBodyAccJerkMag-std()"	Mean of variable defined above, in the original units
"Mean of  fBodyBodyGyroMag-mean()"		Mean of variable defined above, in the original units
"Mean of  fBodyBodyGyroMag-std()"		Mean of variable defined above, in the original units
"Mean of  fBodyBodyGyroJerkMag-mean()"	Mean of variable defined above, in the original units
"Mean of  fBodyBodyGyroJerkMag-std()"	Mean of variable defined above, in the original units
