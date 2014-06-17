## Writing a function to cache the inverse of a matrix.

## Code is divided into two parts


## 1) Function CacheMatrix that creates a special "matrix" object that can 
##   cache its inverse

makeCacheMatrix <- function(x = matrix()) {

# Creating a null Vector m
  m<-NULL

# Creating function y that assigns value to x in an environment different 
# from current environment  
  set<-function(y){
  x<<-y
  m<<-NULL
}
# Function to assign value to get
get<-function() x

# Function to solve the matrix  
setmatrix<-function(solve) m<<- solve

# Function to get the value of solvd matrix
getmatrix<-function() m

# Creating a list of vectors set,get,setmatrix & getmatrix
list(set=set, get=get,
   setmatrix=setmatrix,
   getmatrix=getmatrix)
}

## ENd of function makeCacheMatrix


## 2) Function cacheSolve that computes the inverse of the special "matrix" 
##   returned by makeCacheMatrix above. If the inverse has already been 
##   calculated (and the matrix has not changed), then the cachesolve should
##   retrieve the inverse from the cache.


cacheSolve <- function(x=matrix(), ...) {

# Getting value of getmatrix to vector m
    m<-x$getmatrix()
    
# Fetching value of vector m if it is not null    
    if(!is.null(m)){
      message("getting cached data")
      return(m)
    }
    
# If the matrix is not found in the cache , then it solves the
# new matrix and caches the inverse after calculating it.
    matrix<-x$get
    m<-solve(matrix, ...)
    x$setmatrix(m)
    m
}

## Return a matrix that is the inverse of 'x'



