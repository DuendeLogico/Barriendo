RAW DATA: Feature Selection 
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
The names of the variables which begin with an "f" (variables "in the frequency domain") were modified and begin with "freq".
The activities that the subjects were doing during the signal acquisition (a factor variable) are in one column, renamed "activity.label".
Finally, the table was grouped by subject and activity and a wide dataframe was obtained, only with the mean of each group for each of the variables remaining.


JUSTIFICATION:
"t" and "f" as the initial character in variable names:

I changed the "t" and "f" in the beginning of the variable names to "time" and "freq" because it has something to do with the time domain and the frequency domain, only to please the apparent taste of the instructors and reviewers. I personally think it's more clumsy, not less.

Strange variable names

There are some variables that have "BodyBody" in their name. If I erased one "Body" there would be duplicate variables. I could have name one of each "Body2" or something like that, but because I have no idea of what they're talking about when they talk about "domains", I have left them as they are. In the real world I would warn the original data sender about strange or duplicated variable names, of course.
