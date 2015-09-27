run_analysis <- function() {
    
    message("Function running...")
    actlabels <- read.table("UCI HAR Dataset/activity_labels.txt")  ##Reads in lookup table for activity #'s and their descriptions.    
    names(actlabels) <- c("Activity Number","Activity Description") ##assigns columns names.
    
    testX <- read.table("UCI HAR Dataset/test/X_test.txt") ##these four lines combine the test data into one data frame.
    testY <- read.table("UCI HAR Dataset/test/y_test.txt")
    testsubj <- read.table("UCI HAR Dataset/test/subject_test.txt")
    test <- cbind(testX, testY, testsubj)
    
    message("~30% done importing data.")
    
    trainX <- read.table("UCI HAR Dataset/train/X_train.txt") ##these four lines combine the train data into one data frame.
    trainY <- read.table("UCI HAR Dataset/train/y_train.txt")
    trainsubj <- read.table("UCI HAR Dataset/train/subject_train.txt")
    train <- cbind(trainX, trainY, trainsubj)

    totalset <- rbind(test,train) ##complete data set created from both test and train data.
    message("All data imported.")
    
    columnnamestable <- read.table("UCI HAR Dataset/features.txt") ##these four lines obtain and write column names for all data.
    columnnames <- columnnamestable[,2]
    names(totalset) <- columnnames
    names(totalset)[562:563] <- c("Activity","Subject")
    
    meanvector <- grep("mean()",columnnames) ##these 2 lines find any columnames that use mean or std in their description.
    stddevvector <- grep("std()",columnnames)
    combinedvector <- c(meanvector,stddevvector,ncol(totalset)-1,ncol(totalset)) ##creates vector for tidy data set, which includes mean, std, activity name, and subject.
    
    tidyset <- totalset[,sort(combinedvector)] ##creates tidy data set from the original large data set.
    message("Tidy data set created.")
    
    activity <- data.frame()    ##Creates blank data frame.
    activity <- actlabels[match(tidyset[,80],actlabels[,1]),2]  ##Matches activity # to activity name stored in actlabels. Writes to data frame
    tidyset$Activity <- activity ##overwrites previous activity #'s with descriptive names.
    
    tidymeanset <<- aggregate(tidyset[,1:79],tidyset[,80:81], mean) ##Creates means for all 79 variables, sorted by activity type and subject.
    write.table(tidymeanset, "courseproject.txt", row.names = FALSE) ##Writes output to a file.
    message("Calculations Complete!")
    message("Data saved to 'courseproject.txt' file.")
    message("Data also saved to R memory in 'tidymeanset'data frame.")
    }