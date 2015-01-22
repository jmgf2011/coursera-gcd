# run_analysis.R

# Set the working folder
setwd("C:/coursera-gcd")

# Read the training data set
training = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
training[,562] = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
training[,563] = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

# Read the testing data set
testing = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
# Subject
testing[,562] = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
#Activity
testing[,563] = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)
activityLabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

# Read features and make the feature names better suited for R with some substitutions
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

# Merge the training and the test data sets
mergedData = rbind(training, testing)

# Get only the data on mean and std. dev.
colsWeWant <- grep(".*Mean.*|.*Std.*", features[,2])

# First reduce the features table to what we want
featuresTable <- features[colsWeWant,]

# Now add the last two columns (subject and activity)
colsWeWant <- c(colsWeWant, 562, 563)

# And remove the unwanted columns from mergedData
mergedData <- mergedData[,colsWeWant]

# Add the column names (featuresTable) to mergedData
colnames(mergedData) <- c(featuresData$V2, "Activity", "Subject")
colnames(mergedData) <- tolower(colnames(mergedData))

currentActivity = 1
for (currentActivityLabel in activityLabels$V2) {
mergedData$activity <- gsub(currentActivity, currentActivityLabel, mergedData$activity)
currentActivity <- currentActivity + 1
}
mergedData$activity <- as.factor(mergedData$activity)
mergedData$subject <- as.factor(mergedData$subject)
tidyData = aggregate(mergedData, by=list(activity = mergedData$activity, subject=mergedData$subject), mean)

# Remove the subject and activity column
tidy[,90] = NULL
tidy[,89] = NULL
write.table(tidyData, "tidy_data.txt", sep="\t")