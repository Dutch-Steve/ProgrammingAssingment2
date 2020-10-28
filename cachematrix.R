setwd('C:/Users/Steven/Documents/R.Studio/Bestanden - RStudio/Programming.R_ assingment2_LexicalScoping')

## Just toke a sample from the matrix named 'x'
## then set the solved value 'i' as null.
## After that, the value is changed 'mean' to 'inverse'

makeCacheMatrix <- function(x = matrix(sample(1:250),5,5)) {
  i <- NULL
  set <- function(y){
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinv <- function(inverse) i <<- inverse
  getinv <- function() i
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## Changed 'mean' to 'inverse' and 'm' to 'i'

cacheSolve <- function(x, ...) {
  i <- x$getinv()
  if(!is.null(i)){
    message("getting inverse data")
    return(i)
  }
  data <- x$get()
  i <- inverse(data, ...)
  x$setinv(i)
  i
}