Original data source:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Zipped data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

R Script does the following:
1. Merges the training and the test sets to create one data set.
1.a. Training and test datasets are loaded separately with data, labels, and subject IDs.
1.b. Additional dataset with activity and feature information are loaded.
1.c. Column names are assigned for training, test, and other datasets.
1.d. Training datasets are merged into finaltrain.
1.e. Test datasets are merged into finaltest.
1.f. Training and test datasets are merged together into finaldata.
1.g. Column headers are saved.

2. Extracts only the measurements on the mean and standard deviation for each measurement.
2.a. Create a column idenfying variables to keep.
2.b. Subset data by keep column.

3. Uses descriptive activity names to name the activities in the data set
3.a. Add activity labels to merged datasets.
3.b. Update column names variable.

4. Appropriately labels the data set with descriptive variable names.
4.a. Change variable names.
4.b. Add variable names to current dataset (finaldata3).

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
5.a. Get means of variables by subject and activity type.
5.b. Add labels back to activity type.
5.c. Write tidy data to file.