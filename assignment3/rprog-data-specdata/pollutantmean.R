pollutantmean <- function(directory, pollutant, id = 1:332){
  setwd(directory)
  
  
  file_list <- list.files()
  
  dataset <-data.frame()
  
  
  for (file in file_list[id]){
    
    temp_dataset <-read.csv(file)
    dataset<-rbind(dataset, temp_dataset)
    rm(temp_dataset)
    
    
  }
  
  setwd("../")
  
  data<-data.matrix(dataset[pollutant])
  mean(data,na.rm = TRUE)
}