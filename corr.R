corr <- function(directory, threshold = 0) {
    
    pollutant_data <- data.frame()
    correlation_ccoefficients <- numeric(0)

    complete_observations <- complete(directory)
    complete_observations_at_threshold <- complete_observations[which(complete_observations$nobs > threshold),]
    
    k <- c(complete_observations_at_threshold$ID)
    
    files_full_path <- list.files(directory, full.names = TRUE)
    for (i in 332) {
        pollutant_data <- rbind(pollutant_data, read.csv(files_full_path[i]))
        }
      
    for (j in 1:length(k)) {
        file_to_iterate <- as.numeric(complete_observations_at_threshold[j,1])
        observation_set <- read.csv(files_full_path[file_to_iterate])
        clean_observation_set <- na.omit(observation_set)
        x <- c(clean_observation_set[,2])
        y <- c(clean_observation_set[,3])
        z <- cor(x,y)
        correlation_ccoefficients <- c(correlation_ccoefficients, z)
        final_correlation_ccoefficients <- na.omit(correlation_ccoefficients)
    }
    final_correlation_ccoefficients
}

