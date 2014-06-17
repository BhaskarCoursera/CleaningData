run_analysis <- function(){
  
  ## creating data frame for the feature names
  df <- read.table("./features.txt",header=FALSE, sep=" ")
  ## select the features for mean
  medf <- df[grep("mean()",df[,2], fixed=TRUE),]
  ## select the features for std
  stddf <- df[grep("std()",df[,2], fixed=TRUE),]
  ## create data frame combining mean and std using rbind
  alldf <- rbind(medf,stddf)
  ## assign names to columns
  names(alldf) <- c("col","name")
  alldf <- alldf[with(alldf, order(col)),]
  
  ## read the activity ID and Labels
  alabdf <- read.table("./activity_labels.txt",header=FALSE, sep=" ")
  names(alabdf) <- c("col","activity")
  
  ## read test observation data
  dattestdf <- read.table("./test/X_test.txt",header=FALSE)
  ## read test subject data
  subtestdf <- read.table("./test/subject_test.txt",header=FALSE)
  
  ## read the Activity data
  analysistestdf <- read.table("./test/y_test.txt",header=FALSE)
  names(analysistestdf) <- c("col")
  ## add ID column to Activity data
  analysistestdf$id  <- 1:nrow(analysistestdf)
  ## Add Activity Labels to the Activity ID list using merge
  labeltestdf <- merge(analysistestdf, alabdf, by = "col")
  labeltestdf <- labeltestdf[order(labeltestdf$id), ]
  ## Add the Label column to the Data Data Set
  alltestdf <- cbind(labeltestdf[,"activity"],subtestdf,dattestdf)
  
  ##Perform similar processing for the train dataset
  dattrdf <- read.table("./train/X_train.txt",header=FALSE)
  subtrdf <- read.table("./train/subject_train.txt",header=FALSE)
  analysistrdf <- read.table("./train/y_train.txt",header=FALSE)  
  names(analysistrdf) <- c("col")
  ## replace Activity ID with Label
  analysistrdf$id  <- 1:nrow(analysistrdf)
  labeltrdf <- merge(analysistrdf, alabdf, by = "col")
  labeltrdf <- labeltrdf[order(labeltrdf$id), ]
  alltrdf <- cbind(labeltrdf[,"activity"],subtrdf,dattrdf)
  
  names(alltestdf) <- names(alltrdf)
  print(ncol(alltestdf))
  print(ncol(alltrdf))
  ## Merge the two datasets using rbind
  alldatadf <- rbind(alltestdf,alltrdf)
  
  ## adding 2 since I added 2 columns above
  alldf[,1] <- alldf[,1] + 2
  tmpdf <- data.frame(col=1:2,name=c("activity","subject"))
  newalldf <- rbind(tmpdf,alldf)
  ## select only the means and std deviations columns
  alldatadf <- alldatadf[,newalldf[,1]]
  ## Put descriptive names for the columns using the Feature Names dataframe
  names(alldatadf) <- newalldf[,2]
  ## Calculate the mean of each observation for each subject and activity
  aggrDF <- aggregate(. ~ subject+activity, alldatadf,mean)
}