## Package Presets
require(tools)         ## needed for md5 checksums

## Variable Presets
r_version <- R.Version()
pkg_status <- packageStatus()
## relative_base_directory not needed in final submission
## relative_base_directory <- "./Dropbox/DataScience/3 - GettingAndCleaningData/coursera"
target_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
target_localfile <- "DS.zip"
## target_localsubdirectory <- "proj"

## Start in the base_directory
## setwd(relative_base_directory)

## Create localsubdirectory, if needed, and go there
## if (file.exists(target_localsubdirectory)){
##         setwd(file.path("./", target_localsubdirectory))
## } else {
##         dir.create(file.path("./", target_localsubdirectory))
##         setwd(file.path("./", target_localsubdirectory))
## }

## Document R environment in a new, current file
if (file.exists("r_environment.txt")) {
        remove("r_environment.txt")
}
sink("r_environment.txt")           ## divert output to file
print("Execution date:")
print(Sys.time() )
print("R Platform and OS:")
print(r_version$platform)
print(r_version$os)
print("Installed Packages")
print(pkg_status$inst[,c("Package", "Version")])
sink()

## Download target_localfile from target_url
if (!file.exists(target_localfile)) {
        download.file(target_url, target_localfile, method = "curl")
        sink("download_metadata.txt")           ## divert output to file
        print("Download date:")
        print(Sys.time() )
        print("Download URL:")
        print(target_url)
        print("Downloaded file Information")
        print(t(file.info(target_localfile)))
        print("Downloaded file md5 Checksum")
        print(md5sum(target_localfile))
        sink()
}

## Unzip contents of data file
unzip(target_localfile)

## Merges the training and the test sets to create one data set.
##      set working directory to the unzipped data
setwd("UCI HAR Dataset")

##      to merge the datasets to answer the rest of this project, we need:
##        the feature vector to name the existing variables (train and test)
##        the combined cases (called 'x_') from test and train
##        a subjects vector from test and train to add a Subject variable
##        an activity vector (called 'y_') for test and train to add an Activity variable
##        the subjects involved in test and train data
##      we do not need any of the inertial data since they have no columns
##        with mean or standard deviation information

##      read in data files (named x_...)
train_data <- read.table("train/x_train.txt")
test_data <- read.table("test/x_test.txt")

##      Check for complete data in all rows
if(nrow(train_data) != sum(complete.cases(train_data))) {
        stop("Error, missing data in train_data")
}
if(nrow(test_data) != sum(complete.cases(test_data))) {
        stop("Error, missing data in test_data")
}
##      ...and that the column counts are equal to prevent 'recycling' data
if(ncol(train_data) != ncol(test_data)) {
        stop("Error, unequal column counts in Train and Test data")
}

##      Combine Training and Test data (stacked w/o addional variables)
combined_data <- rbind(train_data, test_data)

##      Add a subject identity column from the subject*.txt files
##      ... Read in data (no headers)
train_subj <- read.csv("train/subject_train.txt", header = FALSE)
test_subj <- read.csv("test/subject_test.txt", header = FALSE)
##      ... check rowcounts
if(nrow(train_subj) != sum(complete.cases(train_subj))) {
        stop("Error, missing data in train_subj")
}
if(nrow(test_subj) != sum(complete.cases(test_subj))) {
        stop("Error, missing data in test_subj")
}
if((nrow(train_subj) != nrow(train_data)) & (nrow(test_subj) != nrow(test_data))) {
        stop("Error, subject and data rows do not match")
}
##      ...and that the column counts are equal to 1
if((ncol(train_subj) != 1) | (ncol(test_subj) != 1) ) {
        stop("Error, column counts in Train and Test subj not = 1")
}
##      ...Combine Training and Test data (stacked w/o addional variables)
combined_subj <- rbind(train_subj, test_subj)
##      ...add combined subject column on right side of combined_data
combined_data <- cbind(combined_data, combined_subj)

## Uses descriptive activity names to name the activities in the data set
##      Add an activity column from the y_*.txt files
##      ... Read in data (no headers)
train_actv <- read.csv("train/y_train.txt", header = FALSE)
test_actv <- read.csv("test/y_test.txt", header = FALSE)
##      ... check rowcounts
if(nrow(train_actv) != sum(complete.cases(train_actv))) {
        stop("Error, missing data in train_actv")
}
if(nrow(test_actv) != sum(complete.cases(test_actv))) {
        stop("Error, missing data in test_actv")
}
if((nrow(train_actv) != nrow(train_data)) & (nrow(test_actv) != nrow(test_data))) {
        stop("Error, subject and data rows do not match")
}
##      ...and that the column counts are equal to 1
if((ncol(train_actv) != 1) | (ncol(test_actv) != 1) ) {
        stop("Error, column counts in Train and Test actv not = 1")
}
##      ...Combine Training and Test activity (stacked w/o addional variables)
combined_actv <- rbind(train_actv, test_actv)
##      ...read in activity labels to create factor
activity_labl <- read.table("activity_labels.txt")
##      ...convert combined_actv to factor
combined_actv <- factor(sapply(combined_actv, function(x) x=as.character(x)))
levels(combined_actv) <- activity_labl$V2
##      ...add combined activity column on right side of combined_data
combined_data <- cbind(combined_data, combined_actv)

## Appropriately labels the data set with descriptive variable names. 
##      ...add meaningful variable names from features.txt plus the added columns
##      ... Read in features (no headers)
data_feat <- read.table("features.txt", header = FALSE)
##      ... add on names for our added columns 
data_feat <- c(as.character(data_feat$V2), "subjects", "activities")
data_feat <- as.factor(data_feat)
##      ... add these expanded names onto the combined data
names(combined_data) <- data_feat

## Extracts only the measurements on the mean and standard deviation for each measurement. 
##   match the means and standard deviation measurement names
means <- grep( "mean[(][)]", data_feat)
stds <- grep( "std[(][)]", data_feat)
##   keep the subjects and activity columns too
extras <- c(length(names(combined_data))-1, length(names(combined_data)))
means_stds <- combined_data[, sort(c(means, stds, extras))]

## Save the means_stds data.frame
write.table(means_stds, file="../tidy2.RData.txt", row.name=FALSE)
##save(means_stds, ascii = TRUE, file = "means_stds.RData.txt")

## Creates a second, independent tidy data set with the
##   average of each variable for each activity and each subject.
##      Create the data.frame by aggregatting means_stds by the subject
##        and activity.  This will add two columns at the front but not
##        remove the original columns.
tidy2 <- aggregate(means_stds, by=list(means_stds$subjects,means_stds$activities), FUN=mean, na.rm=TRUE)
##      Drop the original subjects and activites columns
tidy2$activities <- NULL
tidy2$subjects <- NULL
##      Prepend "Mean of " to existing meaningful variable names
names(tidy2) <- sapply(names(tidy2), function(x) paste("Mean of ", x))
##      Fix the new subjects and activities columns (Group.1 & Group.2)
names(tidy2)[1] <- "subjects"
names(tidy2)[2] <- "activities"

## Save the tidy2 data.frame for submission
write.table(tidy2, file="../tidy2.RData.txt", row.name=FALSE)
## save(tidy2, ascii = TRUE, file = "tidy2.RData.txt")
