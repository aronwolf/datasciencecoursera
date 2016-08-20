## Data analysis process for UCI HAR Dataset
1. Downlad and unzip file. Overwite if file exists to ensure the most up to date data possible
2. Reads data from test dir and collates into combined test data frame
3. Reads data from train dir and collates into combined train data frame
4. Combines test and train data frames together
5. Rename variables
6. Grep for the columns we want
7. Replaces numeric observations in Activities column with the proper key
8. Isolate the numeric variables from the factor variables
9. Create the empty data frame. 30 subjects * 6 activities
10. Loop over each variable and cast the data with the mean function
11. Tidying the data set by removing interim duplicated columns and the initial numeric vector used in the creation of the data frame
12. Melt data frame from "wide" to "long" format
13. Write tidy csv file out
