CleaningData
============
1) Create data frame for the feature names by reading the features.txt
2) Select the features for mean by using grep command on feature name
2) Select the features for std by using grep command on feature name
3) Join the mean and std feature names dataframe using rbind to create master list of features we are interested in. This DF will be used later
4) Assign proper column names to above DF and sort by the feature ID
5) Create DF for activity ID and Labels by reading activity_labels.txt. This DF will be used later
6) Create DF for Test Oservation data(all features) by reading  X_test.txt. We will extract only the mean and std features later from this DF
7) Create DF for Test Subject data by reading the subject_test.txt file. 
8) Create DF for Activity Test data by reading the file y_test.txt
9) Add ID column to Activity data in order to sort after merge operation
10) Add Activity Labels to the Activity ID DF using merge command
11) After merging, sort based on the ID added earlier.
12) Merge using cbind all 3 data(Subject, Activity Labels and Observations) to create Master Data Set.
13) Perform similar processing for the train dataset
14) Join the Test and Train Data Sets using rbind to create Master Data Set
15) Use the Feature Vector created earlier to subset the Master Data Set and select only the Mean and Std columns. 
16) Put descriptive names for the columns using the feature DF created earlier. Also ensure putting names for "subject" and "activity" columns
17) Calculate the mean of each observation for each subject and activity using the aggregate command grouped by subject and activity
18) Return the tidy Data Set returned by the aggregate command above.