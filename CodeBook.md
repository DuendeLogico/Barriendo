RAW DATA:

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

MODIFICATIONS FOR COURSERA GETTING AND CLEANING DATA COURSE.


All the vectors, variable names of the vectors, subjects, and activities that the subjects were developing were joined in one wide dataframe.

All the variables not related to means (without mean() or std() in their original names) were dropped.
The variable names were "cleaned", eliminating the unnecesary dots in them.
The names of the variables which begin with a "t" (variables "in the time domain") were modified and begin with "time".
The names of the variables which begin with a \'93f\'94 (variables \'93in the freq domain\'94) were modified and begin with \'93freq\'94.\
The activities that the subjects were doing during the signal acquisition (a factor variable) are in one column, renamed \'93activity.label\'94.\
Finally, the table was grouped by subject and activity and a wide dataframe was obtained, only with the mean of each group for each of the variables remaining.\
\
\
JUSTIFICATION:\
\
\'93t\'94 and \'93f\'94 as the initial character in variable names\
\
I changed the \'93t\'94 and \'93f\'94 in the beginning of the variable names to \'93time\'94 and \'93freq\'94 because it has something to do with the \'93time domain\'94 and the \'93frequency\'94 domain, only to please the apparent taste of the instructors and reviewers. I personally think it\'92s more clunky, not less.\
\
Strange variable names\
\
There are some variables that have \'93BodyBody\'94 in their name. If I erased one \'93Body\'94 there would be duplicate variables. I could have name one of each \'93Body2\'94 or something like that, but because I have no idea of what they\'92re talking about when they talk about \'93domains\'94, I have left them as they are. In the real world I would warn the original data sender about strange or duplicated variable names, of course.\
\
\
\
\
\
\
\
\
}
