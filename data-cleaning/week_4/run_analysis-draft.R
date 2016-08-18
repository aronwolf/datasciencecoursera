## run_analysis <- function () { 
    library(plyr)
    library(reshape)
    library(reshape2)
    library(dplyr)
    
    #download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI HAR Dataset.zip", method = "curl")
    #unzip("UCI\ HAR\ Dataset.zip", overwrite = TRUE)
    
    #Reads data from test dir and collates into combined test data frame
    X_test <- read.table("UCI\ HAR\ Dataset/test/X_test.txt")
    y_test <- read.table("UCI\ HAR\ Dataset/test/y_test.txt")
    subject_test <- read.table("UCI\ HAR\ Dataset/test/subject_test.txt")
    observations_test <- cbind(subject_test, y_test, X_test)

    #Reads data from train dir and collates into combined train data frame
    X_train <- read.table("UCI\ HAR\ Dataset/train/X_train.txt")
    y_train <- read.table("UCI\ HAR\ Dataset/train/y_train.txt")
    subject_train <- read.table("UCI\ HAR\ Dataset/train/subject_train.txt")
    observations_train <- cbind(subject_train, y_train, X_train)

    #Combines test and train data frames together
    combined_observations <-rbind(observations_test, observations_train)

    ## Rename variables
    variables <- read.table("UCI\ HAR\ Dataset/features.txt")
    variables_names <- c("Subject", "Activity", as.character(unlist(variables$V2, use.names = FALSE)))
    names(combined_observations) <- variables_names
    
    ## Pulls out the columns we want
    mean_sd_observations <- combined_observations[, grepl("(Subject|Activity|mean\\(\\)|std\\(\\))", colnames(combined_observations))]
    
    ## Replaces numeric observations in Activities column with values from the key
    activities <- read.table("UCI\ HAR\ Dataset/activity_labels.txt")
    mean_sd_observations$Activity <- mapvalues(mean_sd_observations$Activity, from = c(1:length(activities$V2)), to = as.vector(activities$V2))
    
    x <- names(mean_sd_observations[-c(1,2)])
    final_write <- data.frame(as.vector(mean_sd_observations[1]), as.vector(mean_sd_observations[2]))
    
    y <- length(x)
    for (z in 1:y) {
        write <- dcast(mean_sd_observations, Subject + Activity ~., mean, value.var = x[z])
        final_write <- cbind(final_write, write)
    }
    final_write
## }