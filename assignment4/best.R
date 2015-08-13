best <- function(state, outcome){
  dataset <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  name.dataset<- tolower(names(dataset))
  searchColumn<-gsub(" ",".",outcome)
  searchColumn<-paste("Hospital.30.Day.Death..Mortality..Rates.from.",searchColumn,sep="")
  searchColumn<-tolower(searchColumn)
  index_hospital<-which(name.dataset=="hospital.name")
  index_morality<-which(name.dataset==searchColumn)
  if(length(index_morality)==0){
    returnMsg<-"Invalid Outcome"
    
  }else{
    dataset.sub<- subset(dataset,State==state,select = c(index_hospital,index_morality))
    if(nrow(dataset.sub)==0){
      returnMsg<-"Invalid State"
    }    
  }
  
  if(!exists("returnMsg")){
    
    dataset.sub[,2]<-as.numeric(dataset.sub[,2])
    dataset.sub<-dataset.sub[rowSums(is.na(dataset.sub))==0,]
    best_hospital_index=which(dataset.sub[2]==min(dataset.sub[2]))
    returnMsg<-dataset.sub$Hospital.Name[best_hospital_index]  
  }
  
  returnMsg
  
}