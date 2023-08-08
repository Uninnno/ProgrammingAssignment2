## cache the inverse of a matrix

# Function to create a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x) {
  # Initialize a list to store the matrix and its inverse
  mat <- NULL
  
  # Function to set the matrix value
  set <- function(matrix) {
    mat <<- matrix
    cache <<- NULL
  }
  
  # Function to get the matrix value
  get <- function() {
    mat
  }
  
  # Function to set the cached inverse
  setInverse <- function(inverse) {
    cache <<- inverse
  }
  
  # Function to get the cached inverse
  getInverse <- function() {
    cache
  }
  
  # Return a list of functions
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

# Function to compute the inverse of the special "matrix"
cacheSolve <- function(cacheMatrix) {
  # Get the matrix
  matrix <- cacheMatrix$get()
  
  # Check if the cached inverse exists
  cachedInverse <- cacheMatrix$getInverse()
  if (!is.null(cachedInverse)) {
    message("Getting cached inverse")
    return(cachedInverse)
  }
  
  # Compute the inverse using solve
  inverse <- solve(matrix)
  
  # Cache the computed inverse
  cacheMatrix$setInverse(inverse)
  
  inverse
}
