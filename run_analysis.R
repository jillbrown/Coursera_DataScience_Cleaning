setwd("~/datasciencecoursera/cleaning/wk4/data")

# Step 1
# Load training datasets
trainX <- read.table("./train/X_train.txt")
trainY <- read.table("./train/Y_train.txt")
trainsubject <- read.table("./train/subject_train.txt")

# Load test datasets
testX <- read.table("./test/X_test.txt")
testY <- read.table("./test/Y_test.txt")
testsubject <- read.table("./test/subject_test.txt")

# Load other datasets
activity <- read.table("./activity_labels.txt")
features <- read.table("./features.txt.")

# Column names training data
colnames(trainX) = features[,2];
colnames(trainY) = "activityid";
colnames(trainsubject) = "id";

# Column names test data
colnames(testX) = features[,2];
colnames(testY) = "activityid";
colnames(testsubject) = "id";

# Column names other
colnames(activity) = c('ActivityType', 'ActivityLabel')

# Train data
finaltrain <- cbind(testsubject, testX, testY)

# Test data
finaltest <- cbind(trainsubject, trainX, trainY)

# final dataset
finaldata <- rbind(finaltrain, finaltest)

# Columns in final dataset
columns <- colnames(finaldata)

# Step 2
# Determine whether or not to keep column
colkeep <- (grepl("activityid", columns) | grepl("id", columns) | grepl("mean", columns) | grepl("std", columns))

# Make dataset with only mean and standard deviation columns
finaldata2 <- finaldata[colkeep == TRUE]

# Step 3
# Add activity labels
finaldata3 <- merge(finaldata2, activity, by.x = "activityid", by.y = "ActivityType")
columns3 <- colnames(finaldata3)

# Step 4
# Rename columns
for (i in 1:length(columns3))
{
  columns3[i] = gsub("\\()", "",columns3[i])
  columns3[i] = gsub("^t", "Time",columns3[i])
  columns3[i] = gsub("^f", "Transformed",columns3[i])
  columns3[i] = gsub("-mean", "Mean",columns3[i])
  columns3[i] = gsub("-std", "StandardDeviation",columns3[i])
  columns3[i] = gsub("-X", "X-Axis",columns3[i])
  columns3[i] = gsub("-Y", "Y-Axis",columns3[i])
  columns3[i] = gsub("-Z", "Z-Axis",columns3[i])
  columns3[i] = gsub("Acc", "Acceleration",columns3[i])
  columns3[i] = gsub("Mag", "Magnitude",columns3[i])
  columns3[i] = gsub("activityid", "ActivityType",columns3[i])
  columns3[i] = gsub("id", "SubjectID",columns3[i])
}

colnames(finaldata3) = columns3

# Step 5
# New data frame with means
finaldata3a <- data.frame(finaldata3)
finaldata4 <- aggregate(finaldata3a, by=list(subject=finaldata3$SubjectID,activity=finaldata3$ActivityType), FUN=mean, na.rm=TRUE)

# Add activity labels
tidydata <- merge(finaldata4, activity, by.x = "ActivityType", by.y = "ActivityType")

write.csv(file = "tidydata.csv", x = tidydata)