complete <- function(directory, id = 1:332) {
    pollutant_data <- data.frame()
    clean_pollutant_data <- data.frame()
    counts <- data.frame() 
    files_full_path <- list.files(directory, full.names = TRUE)
    for (i in id) {
        pollutant_data <- rbind(pollutant_data, read.csv(files_full_path[i]))
    }
    clean_pollutant_data <- na.omit(pollutant_data)
    counts <- data.frame(table(clean_pollutant_data$ID))
    colnames(counts) <- c("ID", "nobs")
    counts
}