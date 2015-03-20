## makeCacheMatrix create a special matrix which is actually
## a list of four function:
## 1. set: Set value of the matrix
## 2. get: Get value of the matrix
## 3. setInv: Compute the inversion of the matrix and store in a variable
## 4. getInv: Return the inversion of the matrix stored in the variable

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y) {
		change = sum(x-y)
		if (change > 0) {
			x <<- y
			message('Matrix has changed')
			inv <<- NULL
		}
	}
	get <- function() x
	setInv <- function(inverse) inv <<- inverse
	getInv <- function() inv
	list(set=set, get=get, getInv=getInv, setInv=setInv)
}


## cacheSolve is a function that has argument as a special matrix
## created from makeCacheMatrix and return is inversion. If the inversion
## is already computed then this function return cached data

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	inv <- x$getInv()
	# if inverse matrix is already calculated
	if (!is.null(inv)) {
		message('getting cached inverse matrix')
		return(inv)
	}
	inv <- solve(x$get())
	x$setInv(inv)
	inv
}

