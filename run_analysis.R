


#Downloading and unzipping
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="compressed.data.zip",method="curl")
unzip("compressed.data.zip",unzip="internal")

#Reading all the tables

setwd("UCI HAR Dataset")

activity_labels <-read.table("activity_labels.txt")
features <-read.table("features.txt")

setwd("train")
subject_train <-read.table("subject_train.txt")
y_train <-read.table("y_train.txt")
X_train <-read.table("X_train.txt")

setwd("../test")
subject_test <-read.table("subject_test.txt")
y_test <-read.table("y_test.txt")
X_test <-read.table("X_test.txt")

#Joining the tables
table1 <- rbind(X_train,X_test)
table_subjects <- rbind(subject_train,subject_test)
table_y <- rbind(y_train,y_test)

big.table<-cbind(table1,table_subjects,table_y)

features.names<-as.character(features[,2])


#Changing the names of the two tables left to join.

names(big.table) <-c(features.names,"subject","activity")

names(activity_labels)<-c("activity","label")

#Loading the package (very cool and user-friendly functions)
library(dplyr)

#Joining the two tables remaining by the "activity" column
great.table<-left_join(big.table,activity_labels,by="activity")
#great.table<-merge(big.table,activity_labels,by="activity",all.x=T,all.y=F) would be the same


#adds some text to some variable names to avoid duplicates
names(great.table)<-make.names(names(great.table),unique=T) 

#I select only the variables that I'm asked for, plus the activity and its label
columns_to_select <-c("subject","activity","label",grep("mean\\.{2}|std\\.{2}",names(great.table),value=T))
only.mean.and.sd <-great.table[,columns_to_select]

#Some cleaning of the variable names, that have too many dots on them
names(only.mean.and.sd)<-sub("\\.{2}$","",names(only.mean.and.sd))
names(only.mean.and.sd)<-sub("\\.{3}",".",names(only.mean.and.sd))

#More descriptive names of the variables, only to please the instructors/reviewers (I personally like short names)
names(only.mean.and.sd) <- sub("^f","frequency",names(only.mean.and.sd))
names(only.mean.and.sd) <- sub("^t","time",names(only.mean.and.sd))

#Creating an almost definitive dataframe, grouping by subject and activity label and summarising means
almost<-only.mean.and.sd %>% group_by(subject,label) %>% summarise_each(funs(mean))

#A small final change in the name of the variable "label", to "activity.label", whichs is clearer
names(almost)[2] <- "activity.label" #change the name of this variable. It's a factor.

#Changing the table (which is a dataframe, but also a dplyr table) to a normal dataframe, to avoid problems
result<-as.data.frame(almost)

#Returning to the original directory and writing to a file
setwd("../../")
write.table(result,file="Final_table.txt",row.names=F)




