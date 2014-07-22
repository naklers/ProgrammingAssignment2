## makeCacheMatrix creates a list containing functions to
## 1. set the value of a matrix
## 2. get the value of a matrix
## 3. set the value of its inverse
## 4. get the value of its inverse

makeCacheMatrix <- function(x = matrix()) {
  i <<- matrix()
  set <- function(y){
    x <<- y
    i <<- matrix()
  }
  
  get <- function(){
    x
  }
  
  setinverse <- function(inv){
    i <<- inv
  }
    
  getinverse <- function(){
    i
  }
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Retrieves already-stored inverse matrix, if available, or else 
## calculates it and stores for further use

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  i <- x$getinverse()
  if(!is.na(i)) {
    message("getting cached inverse")
    return(i)
  }

  i <- solve(x$get())
  x$setinverse(i)
  i
}
