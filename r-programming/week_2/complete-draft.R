complete <- function(directory, id = 1:332) {
    files_full_path <- list.files(directory, full.names = TRUE)
    counts <- data.frame()
    for (i in id) {
        dataset <- read.csv(files_full_path[i])
        clean_dataset <- na.omit(dataset)
        nobs <- dim(clean_dataset)[1]
        counts <- cbind(id, nobs)
    }
    counts
}