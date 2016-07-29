rankhospital <- function(state, outcome, rank ) {
    ## Read outcome data
    measures <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    ## Check that state and outcome are valid
    ## Valid outcome values are 11, 17 and 23
    measures[, outcome] <- as.numeric(measures[, outcome])
    sub.measures <- subset(measures, measures$State == state)
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    ##minimum <- which(sub.measures[,outcome] == min(na.omit(sub.measures[,outcome])))
    return_location <- sub.measures[rank,2:3]
    
    return_location
}