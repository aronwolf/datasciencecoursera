## Data analysis process for UCI HAR Dataset
1 Downlad and unzip file. Overwite if file exists to ensure the most up to date data possible
2a Reads data from test dir and collates into combined test data frame
2b Reads data from train dir and collates into combined train data frame
3 Combines test and train data frames together
4 Rename variables
5 Grep for the columns we want
6 Replaces numeric observations in Activities column with the proper key
7 Isolate the numeric variables from the factor variables
8 Create the empty data frame. 30 subjects * 6 activities
9 Loop over each variable and cast the data with the mean function
10 Tidying the data set by removing interim duplicated columns and the initial numeric vector used in the creation of the data frame
11 Melt data frame from "wide" to "long" format
12 Write tidy csv file out
