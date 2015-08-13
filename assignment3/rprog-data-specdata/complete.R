complete <- function(directory, id = 1:332){
  setwd(directory)
  
  
  file_list <- list.files()
  
  len=length(id)
  
  dataset <-data.frame("id"=numeric(len),"nobs"=numeric(len))
  
  
  count=1
  
  
  for (file in file_list[id]){
    
    temp_dataset <-read.csv(file)
    nobs <- nrow(temp_dataset[rowSums(is.na(temp_dataset))==0,])
    dataset$id[count]<-id[count]  
    dataset$nobs[count]<-nobs
    count=count+1
  }
  
  setwd("../")
  
  dataset
}