run_analysis <- function(){
  
  ## creating data frame for the feature names
  df <- read.table("./features.txt",header=FALSE, sep=" ")
  medf <- df[grep("mean()",df[,2], fixed=TRUE),]
  stddf <- df[grep("std()",df[,2], fixed=TRUE),]
  alldf <- rbind(medf,stddf)
  names(alldf) <- c("col","name")
  alldf <- alldf[with(alldf, order(col)),]
  alabdf <- read.table("./activity_labels.txt",header=FALSE, sep=" ")
  names(alabdf) <- c("col","activity")
  
  dattestdf <- read.table("./test/X_test.txt",header=FALSE)
  subtestdf <- read.table("./test/subject_test.txt",header=FALSE)
  analysistestdf <- read.table("./test/y_test.txt",header=FALSE)
  names(analysistestdf) <- c("col")
  ## replace Analysis ID with Label
  analysistestdf$id  <- 1:nrow(analysistestdf)
  labeltestdf <- merge(analysistestdf, alabdf, by = "col")
  labeltestdf <- labeltestdf[order(labeltestdf$id), ]
  alltestdf <- cbind(labeltestdf[,"activity"],subtestdf,dattestdf)
  
  dattrdf <- read.table("./train/X_train.txt",header=FALSE)
  subtrdf <- read.table("./train/subject_train.txt",header=FALSE)
  analysistrdf <- read.table("./train/y_train.txt",header=FALSE)  
  names(analysistrdf) <- c("col")
  ## replace Analysis ID with Label
  analysistrdf$id  <- 1:nrow(analysistrdf)
  labeltrdf <- merge(analysistrdf, alabdf, by = "col")
  labeltrdf <- labeltrdf[order(labeltrdf$id), ]
  alltrdf <- cbind(labeltrdf[,"activity"],subtrdf,dattrdf)
  
  names(alltestdf) <- names(alltrdf)
  print(ncol(alltestdf))
  print(ncol(alltrdf))
  alldatadf <- rbind(alltestdf,alltrdf)
  ## adding 2 since I added 2 columns above
  alldf[,1] <- alldf[,1] + 2
  tmpdf <- data.frame(col=1:2,name=c("analysis","subject"))
  newalldf <- rbind(tmpdf,alldf)
  ## select only the means and std deviations
  alldatadf <- alldatadf[,newalldf[,1]]
  names(alldatadf) <- newalldf[,2]
  aggrDF <- aggregate(. ~ subject+analysis, alldatadf,mean)
}