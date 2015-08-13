corr <- function(completeData,thershold){
  #completeData<-complete()
  ind<-which(completeData$nobs>thershold)
  file_list <- list.files()
  corrVector<-numeric(length(ind))
  count = 1
  
  for (file in file_list[ind]){
    
    temp_dataset <-read.csv(file)
    temp_dataset<-temp_dataset[rowSums(is.na(temp_dataset))==0,]
    
    corrVector[count]=cor(temp_dataset$sulfate,temp_dataset$nitrate)
    count = count +1
  }
  corrVector
  
}