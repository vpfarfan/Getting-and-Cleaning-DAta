library(dplyr)

# Load train data
X_train <- read.table("./data/train/X_train.txt")
y_train <- read.table("./data/train/y_train.txt")

# Load test data
X_test <- read.table("./data/test/X_test.txt")
y_test <- read.table("./data/test/y_test.txt")

# Load labels
features <- read.table("./data/features.txt")
activity_labels <- read.table("./data/activity_labels.txt")

# Load subjects
subject_train <- read.table("./data/train/subject_train.txt")
subject_test <- read.table("./data/test/subject_test.txt")

# Merge data
train <- cbind(X_train, y_train)
test <- cbind(X_test, y_test)
merged <- rbind(train, test)

# Column labels
names(merged) <- features$V2
colnames(merged)[562] <- "activity"

# Look for columns of mean and std dev
selcolumns <- features[grep("mean|std", features$V2),1]
selcolumns <- c(selcolumns, 562)
merged2 <- merged[,selcolumns]
length(levels(factor(names(merged2))))

# Name the activities
names(activity_labels) <- c("activity", "activity_label")
joined <- inner_join(merged2, activity_labels, by="activity")
joined$activity <- NULL

# Avg of each var for each activity and each subject
# Add subject
subject <- rbind(subject_train, subject_test)
complete <- cbind(subject, joined)
colnames(complete)[1] <- "subject"

# Calculate mean
avgData <- aggregate(.~activity_label + subject, complete, mean)

# Write the tidy dataset into a text file
write.table(x=avgData, "tidy.txt", row.name=FALSE)
