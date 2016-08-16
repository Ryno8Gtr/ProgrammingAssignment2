## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

function(x, ...) { 
    ## Return a matrix that is the inverse of 'x' 
    inv <- x$getinv()
    if(!is.null(inv)){
        message("getting cache inverse")
        return(inv)
    }
    mat <- x$get()
    ## matrix singularity not tested (supposed invertible)
    inv <- solve(mat)
    x$setinv(inv)
    inv
}
function(x = matrix()) { 
    ## initiate the inverse to null
    i <- NULL
    ## loads matrix from the parent environment
    set <- function(y){
        x <<- y
        ## initiate the inverse to null
        i <- NULL
    }
    ## returns the matrix
    get <- function() x
    # stores the inverse. Will return an error if the matrix is singular
    setinv <- function(solve) i<<-solve
    # returns the cached inverse. Will return NULL if cache empty
    getinv <- function() i
    list(set = set, get = get, setinv = setinv, getinv = getinv)
    
}

