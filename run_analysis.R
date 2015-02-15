library("plyr", lib.loc="D:/Program Files/R/R-3.1.2/library")

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_train  <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

X <- rbind(X_test, X_train)
y <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)

obs <- cbind(subject, y, X)
rm(X, X_test, X_train, y, y_test, y_train, subject, subject_test, subject_train)

obs$Activity[obs$Activity==1]<-"WALKING"
obs$Activity[obs$Activity==2]<-"WALKING_UPSTAIRS"
obs$Activity[obs$Activity==3]<-"WALKING_DOWNSTAIRS"
obs$Activity[obs$Activity==4]<-"SITTING"
obs$Activity[obs$Activity==5]<-"STANDING"
obs$Activity[obs$Activity==6]<-"LAYING"

features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)
names(obs)[1:2]<-paste(c("Subject","Activity"))
names(obs)[-1:-2]<-features$V2

obs1<-obs[c("Subject","Activity",features$V2[grep("mean|std",features$V2)])]

obs2<-ddply(obs1, .(Subject,Activity), numcolwise(mean))

write.table(obs2,"./UCI HAR Dataset/tidyDS.txt", row.name=FALSE)
