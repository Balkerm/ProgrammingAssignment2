## Matrix inversion is usually a costly computation and there may be some benefit 
## to caching the inverse of a matrix rather than computing it repeatedl

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL 
    set <- function(y){
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setInverse <- function(v){
        inv <<- v
    }
    getInverse <- function() inv
    list(set = set,get = get, setInverse = setInverse,getInverse= getInverse)
}


##  This function computes the inverse of the special "matrix" returned by makeCacheMatrix
##  if the inverse has already been calculated (and the matrix has not changed), 
##  then cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getInverse()
    if(!is.null(inv)){
        message("getting cached data")
        return (inv)
    }
    m <- x$get()
    inv <- solve(m)
    x$setInverse(inv)
    inv
}
