## The following R code performs inverse of a Matrix and stores it in a cache

## This function creates a special matrix object that can cache its inverse

makeCacheMatrix <- function(x = numeric()) {
        s <- NULL
        set <- function(y) {
          x <<- y
          s <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) s <<- solve
        getsolve <- function() s
        list(set = set, get = get, 
             setsolve = setsolve,
             getsolve = getsolve)
}

## This function computes the inverse of the special matrix returned by makeCacheMatrix above

cacheSolve <- function(x, ...) {
        s <- x$getsolve()
        if(!is.null(s)) {               
          
          message("getting cached data")  
          return(s)                       
          
        }
        data <- x$get()                 
        s <- solve(data, ...)            
        
        x$setsolve(s)                    
        s
}


