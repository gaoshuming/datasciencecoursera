rm(list = ls())

#set your directory 
setwd("C:/Users/Administrator/Desktop/Coursera/data/UCI HAR Dataset")

run_analysis = function()	
{
# Label
	activity_label <- read.table("activity_labels.txt")
	features = read.table("features.txt")
	
# train
	subject_train <- read.table("./train/subject_train.txt")
	X_train <- read.table("./train/X_train.txt")
	Y_train <- read.table("./train/Y_train.txt")
# test
	subject_test <- read.table("./test/subject_test.txt")
	X_test <- read.table("./test/X_test.txt")
	Y_test <- read.table("./test/Y_test.txt")
	
#	train <- cbind(merge_Subject,activity,merge_X)
#	colnames(train) = varnames
#	dat <- rbind(train,test)

# merge
	#merge_Subject = merge(subject_train,subject_test,all = TRUE)
	#merge_X = merge(X_train, X_test,all = TRUE)	#by.x = "subject_X",by.y = "activity_X",
	#merge_Y = merge(Y_train, Y_test,all = TRUE)	#by.x = "subject_Y",by.y = "activity_Y",z
	
	#write.table(merge_Data, "./data/UCI HAR Dataset/result.txt",row.name=TRUE)
	#train <- cbind(merge_Subject,activity,merge_X)
	
	#colnames(train) = varnames
	#dat <- rbind(train,test)
	activity_test = factor(as.numeric(Y_test[,1]), labels = activity_label[,2])
	activity_train = factor(as.numeric(Y_train[,1]), labels = activity_label[,2])

	test <- cbind(subject_test,activity_test,X_test)
	varnames <- gsub("\\()","",c("subject","activity",as.character(features[,2])))
	train = cbind(subject_train,activity_train,X_train)
	colnames(test) = varnames
	colnames(train) = varnames
#bind train  test data
	dat = rbind(train,test)

	index1 = grep("mean",varnames)
	index2 = grep("std",varnames)
	subdata = dat[,c(1,2,index1,index2)]
# tidy data
	num = ncol(subdata)
	attach(subdata)
	tidydata = aggregate(subdata[,3:num],by=list(subject,activity),mean)
	colnames(tidydata)[1:2] = c("subject","activity")
# write to text
	write.table(tidydata, "tidydata.txt",row.names = FALSE)

}
#	write.table()
#	row.name = FALSE


