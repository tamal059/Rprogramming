makeCacheMatrix <- function(x= numeric()){
  iMatrix <- NULL
  set <- function(y){
    x <<- y
    iMatrix <<- NULL
  }
  
  get <- function() x
  setInverseMatrix <- function(solve) iMatrix <<- solve
  getInverseMatrix <- function() iMatrix
  list(set = set, get = get, setInverseMatrix = setInverseMatrix , getInverseMatrix = getInverseMatrix)
  
}

cacheSolve <- function(x){
  iMatrix <- x$getInverseMatrix()
  if(!is.null(iMatrix)){
    message("getting cached data")
    return (m)
  }
  data <- x$get()
  iMatrix <- solve(data)
  x$setInverseMatrix(iMatrix)
}