# See README.md for instructions on running the code and output from it
# The assignment states that running the code is not part of the grading 
# but I have the instructions anyway.

# makeCacheMatrix is a function that returns a list of functions
# Its puspose is to store a martix and a cached value of the inverse of the 
# matrix. Contains the following functions:
# * setMatrix      set the value of a matrix
# * getMatrix      get the value of a matrix
# * cacheInverse   get the cahced value (inverse of the matrix)
# * getInverse     get the cahced value (inverse of the matrix)
#
# Notes:
# not sure how the "x = numeric()" part works in the argument list of the 
# function, but it seems to be creating a variable "x" that is not reachable 
# from the global environment, but is available in the environment of the 
# makeCacheMatrix function
makeCacheMatrix <- function(x = numeric())
{
    cache_hold <- NULL

    setMatrix <- function(y)
    {
        x <<- y
        cache_hold<<- NULL
    }

    getMatrix <- function()
    {
       x
    }

    cacheInverse <- function(inverse)
    {
       cache_hold <<- inverse
    }

    getInverse <- function()
    {
         cache_hold
    } 

    list ( setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}

cacheSolve <- function(x,...)
{
    inv <- x$getInverse()
    if ( !is.null(inv))
    {
        message("getting cached data")
        return(inv)
    }
    data <- x$getMatrix()
    inv <- solve(data)
    x$cacheInverse(inv)
    inv
}
