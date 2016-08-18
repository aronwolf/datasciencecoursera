## run_analysis <- function () { 
    library(plyr)
    library(reshape)
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

    ## Note seperator below is changed from default in order to force combine
    ## variables with numbers to remove duplicate processing issue as noted
    ## here: http://stackoverflow.com/questions/28549045/dplyr-select-error-found-duplicated-column-name
    variables <- read.table("UCI\ HAR\ Dataset/features.txt")
    variables_names <- c("Subject", "Activity", as.character(unlist(variables$V2, use.names = FALSE)))
    #variables_names <- variables_names[ , !duplicated(colnames(variables_names))]
    names(combined_observations) <- variables_names
    
    ## Pulls out the columns we want
    mean_sd_observations <- combined_observations[, grepl("(Subject|Activity|mean\\(\\)|std\\(\\))", colnames(combined_observations))]
    
    ## Replaces numeric observations in Activities column with values from the key
    activities <- read.table("UCI\ HAR\ Dataset/activity_labels.txt")
    mean_sd_observations$Activity <- mapvalues(mean_sd_observations$Activity, from = c(1:length(activities$V2)), to = as.vector(activities$V2))
    
## }