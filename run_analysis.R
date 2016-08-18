#Download all the files
	if(!file.exists("./data")){dir.create("./data")}
	fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

#Unzip the files
	unzip(zipfile="./data/Dataset.zip",exdir="./data")

#Get the list of the files 
	path_rf <- file.path("./data" , "UCI HAR Dataset")
	files<-list.files(path_rf, recursive=TRUE)
	files

#Read Y (activity) files
	dataActivityTest  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
	dataActivityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)

#read subject files
	dataSubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
	dataSubjectTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)

#read x (features) files
	dataFeaturesTest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
	dataFeaturesTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)

#Merge the train and test, creating one data set
	dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
	dataActivity<- rbind(dataActivityTrain, dataActivityTest)
	dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

#Name the variables
	names(dataSubject)<-c("subject")
	names(dataActivity)<- c("activity")
	dataFeaturesNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
	names(dataFeatures)<- dataFeaturesNames$V2

#merge colums to get one dataframe
	dataCombine <- cbind(dataSubject, dataActivity)
	Data <- cbind(dataFeatures, dataCombine)

	
	
	
#Get just mean and standart variation names
	dataFeaturesNamesMeanStd <- dataFeaturesNames[,2][grep("mean\\(\\)|std\\(\\)",dataFeaturesNames[,2])]
	selectedNames<-c(as.character(dataFeaturesNamesMeanStd), "subject", "activity" )
	Data<-Data[,selectedNames]

	
#Change activity numbers to labels
	activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)
	Data$activity<-factor(Data$activity, levels = activityLabels[,1], labels = activityLabels[,2])

#Replacing variables names
	names(Data)<-gsub("^t", "time", names(Data))
	names(Data)<-gsub("^f", "frequency", names(Data))
	names(Data)<-gsub("Acc", "Accelerometer", names(Data))
	names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
	names(Data)<-gsub("Mag", "Magnitude", names(Data))
	names(Data)<-gsub("BodyBody", "Body", names(Data))

	
#Creates a file with the average of each variable for each activity and each subject
	library(plyr)
	Data_averages<- ddply(Data, .(subject, activity), function(x) colMeans(x[, 1:66]))
	write.table(Data_averages, file = "tidydata.txt",row.name=FALSE)




	


