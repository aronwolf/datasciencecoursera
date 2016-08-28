activity <- read.csv("activity.csv")

activity$date <- as.Date(activity$date)

plot(activity$date, activity$steps, type = "l")


