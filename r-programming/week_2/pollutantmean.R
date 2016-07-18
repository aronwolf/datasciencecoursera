pollutantmean <- function(directory, pollutant, id = 1:332) {
    files_full_path <- list.files(directory, full.names = TRUE)
    pollutant_data <- data.frame() 
    for (i in id) {
        pollutant_data <- rbind(pollutant_data, read.csv(files_full_path[i])) 
    }
    mean(pollutant_data[, pollutant], na.rm = TRUE)
    
}