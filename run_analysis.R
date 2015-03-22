## run_analysis.R creates a clean and tidy data set from the raw data collected from the accelerometers and the gyroscope 
## for training and test subjects for a given set of activities.
## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

run_analysis <- function()
{
        library(data.table)
        
        ## Read the test files
        testSubjects <- read.table("./test/subject_test.txt", header = FALSE)
        testActivities <- read.table("./test/y_test.txt", header = FALSE)
        testFeatures <- read.table("./test/X_test.txt", header = FALSE)
        
        
        ## Read the training
        trainSubjects <- read.table("./train/subject_train.txt", header = FALSE)
        trainActivities <- read.table("./train/y_train.txt", header = FALSE)
        trainFeatures <- read.table("./train/X_train.txt", header = FALSE)
        
        ## Put the test and train subjects, activities and features in 3 different data sets respectively.
        subjectData <- rbind(testSubjects, trainSubjects)
        activitiesData <- rbind(testActivities, trainActivities)
        featuresData <- rbind(testFeatures, trainFeatures)
        
        ## Assign column names to the above data sets
        names(subjectData) <- c("subject")
        names(activitiesData) <- c("activity_id")
        
        featureNames <- read.table("features.txt", header = FALSE)
        names(featuresData) <- featureNames$V2
        
        ## Now combine the data sets together
        finalData <- cbind(subjectData, activitiesData, featuresData)
        
        ## Extracts only the measurements on the mean and standard deviation for each measurement. 
        ## This means to get only those features/column names which has the word mean or std in it.
        colNamesWithMeanOrStd <- featureNames$V2[grep("mean\\(\\)|std\\(\\)", featureNames$V2)]
        
        
        ## Subset the final data.
        colNamesToSubset <- c("subject", as.character(colNamesWithMeanOrStd), "activity_id")
        
        finalData <- subset(finalData, select = colNamesToSubset)
        
        ## Uses descriptive activity names to name the activities in the data set
        
        activitiyLabels <- read.table("activity_labels.txt", header = FALSE, as.is = TRUE, col.names = c("activity_id", "activity_names"))
        
        activitiyLabels$activity_names <- as.factor(activitiyLabels$activity_names)
        
        finalData <- merge(activitiyLabels, finalData)
        
        
        ## Appropriately labels the data set with descriptive variable names. 
        #         t is replaced by time
        #         Acc is replaced by Accelerometer
        #         Gyro is replaced by Gyroscope
        #         prefix f is replaced by frequency
        #         Mag is replaced by Magnitude
        #         BodyBody is replaced by Body
        
        names(finalData)<-gsub("^t", "time", names(finalData))
        names(finalData)<-gsub("^f", "frequency", names(finalData))
        names(finalData)<-gsub("Acc", "Accelerometer", names(finalData))
        names(finalData)<-gsub("Gyro", "Gyroscope", names(finalData))
        names(finalData)<-gsub("Mag", "Magnitude", names(finalData))
        names(finalData)<-gsub("BodyBody", "Body", names(finalData))
        
        
        ## Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        library(plyr);
        
        tidyData <- aggregate(. ~subject + activity_names, finalData, mean)
        
        tidyData <- tidyData[order(tidyData$subject, tidyData$activity_names), ]
        
        write.table(tidyData, file = "tidydata.txt",row.name=FALSE)
        
        
        
}