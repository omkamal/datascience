#
setwd("C:/Coursera/Getting and Cleaning Data/Project/UCI HAR Dataset")
rm(list=ls())


# reading column labels - without the subject and activity column (will be appended later)
col_labels <- read.table("./features.txt")
#str(col_labels)
#head(col_labels)

# Reading training data
train_data <- read.table("./train//X_train.txt",header=F)
train_subject <- read.table("./train/subject_train.txt",header=F)
train_y <- read.table("./train//y_train.txt",header=F)

# reading test data
test_data <- read.table("./test/X_test.txt",header=F)
test_subject <- read.table("./test//subject_test.txt",header=F)
test_y <- read.table("./test//y_test.txt",header=F)

# merging both the training data and the test data
training_data <- cbind(train_subject,train_y,train_data)
testing_data <- cbind(test_subject,test_y,test_data)
all_data <- rbind(training_data,testing_data)

#getting the index for columns with either mean or std in thier label
mean_index <- grep("mean|std",col_labels$V2)
# adding 2 to the index of the columns (since there are two columns subject and y) we need to contribute for
mean_index_p_2 <- mean_index + 2


#Extracts only the measurements on the mean and standard deviation for each measurement, in addition
# to the "subject" and "y" column.
subset_data <- all_data[,c(1,2,mean_index_p_2)]
#assigning the table labels 
colnames(subset_data) <- c("subject","y",as.character(col_labels[mean_index,2]))

#changing the subject column into factor instead of integer
subset_data$subject <- as.factor(subset_data$subject)

# reading activity labels from the activity_labels.text file
activity_labels <- read.table("./activity_labels.txt",header=F)

# After reading the activity labels - we add an activity label as a column 
subset_data$activity_label <- factor(subset_data$y,labels=activity_labels$V2)



require(reshape2)
# Melt the data with three ID columns - subject, activity_id, and activity_label - and the rest is treated as measures
melted_data <- melt(subset_data,id=c("subject","y","activity_label"),measure.vars=colnames(subset_data)[-c(1,2,82)])
#head(melted_data)
# cast the melted data with the ID  - subject, activity_id, and activity_label - 
#  and a mean summary statistics for the rest of the subset data
casted_data <- dcast(melted_data,subject+activity_label+y~variable,mean)

# ############ writing the table ######33
write.table(casted_data,file="./tidy_data.txt",col.names=T,row.names=F,sep="\t")
save(casted_data,file="./tidy_data.Rda")

test_tidy_data <- read.table("./tidy_data_tab_delimted.txt",header=T,sep="\t")
#colnames(test_tidy_data)
#str(test_tidy_data)
