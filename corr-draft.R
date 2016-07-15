corr <- function(directory, threshold = 0) {

    complete_observations <- complete(directory)
    complete_observations_at_threshold <- complete_observations[which(complete_observations$nobs > threshold),]
    
    k <- data.frame(table(complete_observations_at_threshold$ID))
    
    ####################################   
##    for (j in k) {
##        observation_set <- read.csv(files_full_path[k])
##        clean_observation_set <- na.omit(observation_set)
##       x <- c(clean_observation_set[,2])
##        y <- c(clean_observation_set[,3])
##        z <- cor(x,y)
##        correlation_ccoefficients <- rbind(correlation_ccoefficients, z)
##    }
##    head(correlation_ccoefficients)
}

