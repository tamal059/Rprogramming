rankhospital <- function(state, outcome, num="best"){
  dataset <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  name.dataset<- tolower(names(dataset))
  searchColumn<-gsub(" ",".",outcome)
  searchColumn<-paste("Hospital.30.Day.Death..Mortality..Rates.from.",searchColumn,sep="")
  searchColumn<-tolower(searchColumn)
  index_hospital<-which(name.dataset=="hospital.name")
  index_morality<-which(name.dataset==searchColumn)
  
    dataset.sub<- subset(dataset,State==state,select = c(index_hospital,index_morality))
    dataset.sub[,2]<-as.numeric(dataset.sub[,2])
    dataset.sub<-dataset.sub[rowSums(is.na(dataset.sub))==0,]
    best_hospital_index=which(dataset.sub[2]==min(dataset.sub[2]))
    dataset.sub<-dataset.sub[order(dataset.sub[,2]),]
    
    if(is.numeric(num) && num<length(dataset.sub$Hospital.Name)){
      returnMsg<-dataset.sub$Hospital.Name[num]
    }else if(is.character(num)){
      if(identical(num,"worst")){
        returnMsg<-dataset.sub$Hospital.Name[length(dataset.sub$Hospital.Name)]
      }
      else if(identical(num,"best")){
        returnMsg<-dataset.sub$Hospital.Name[1]
      }else{
        returnMsg<-"Invalid Num Input"
      }
    }else{
      returnMsg<-"Invalid Num Input"
    }
    
    returnMsg
}