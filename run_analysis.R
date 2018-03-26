library(dplyr)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
variable_names <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
# merging the training and test data
X <- rbind(X_train, X_test)
Y <- rbind(Y_train, Y_test)
Sub_total <- rbind(Sub_train, Sub_test)
selected_var <- variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
X <- X[,selected_var[,1]]
colnames(Y_total) <- "activity"
Y$activitylabel <- factor(Y$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y[,-1]
colnames(X) <- variable_names[selected_var[,1],2].
colnames(Sub_total) <- "subject"
total <- cbind(X, activitylabel, Sub_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
