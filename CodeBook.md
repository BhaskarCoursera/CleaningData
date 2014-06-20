In this Data Analysis, data obtained via certain experiments were summarized into a tidy set of data. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 
Input Files Information:
The data in the Test and Train folders represent two parts of the data. They have been merged together before performing the analysis of the data. 
X_test.txt: contains the 561 time and frequency domain variables (variables have been described below). 
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
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:\
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
subject_test.txt: contains the subject ID. It is numeric of length 1.
y_test.txt: contains the activity ID. It is numeric of length 1
features.txt: contains the list of features that have been recorded. each variable is recorded in 3 dimensions (X, Y and Z)
The output dataset is a tidy dataset that has the subject ID, activity label and the average of the mean and std of each variable for each activity and each subject. Each column of the Dataset has appropriate Label.
