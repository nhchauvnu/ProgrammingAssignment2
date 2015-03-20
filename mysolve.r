#
# I write this caching function to use regular
# data structure of a matrix. It's advantage is that
# we don't need to create a new data type that may not
# compatible with other R functions. It's disadvantage
# is that if the matrix changes very often, the cache
# is useless. This function can be improved, for example
# we can set bigger size of cache to store more than one matrix
# Please give your comments. Thanks a lot.
#
icache = NULL
mcache = NULL
mysolve <- function(x=matrix()) {
	# if icache is NULL, we should inverse the matrix
	if (is.null(icache)) {
		message('Inversion not calculated')
		icache <<- solve(x)
		mcache <<- x
		return(icache)
	}
	# if icache is not NULL, we check if 
	# the matrix inversion is calculated?
	else {
		if (sum(dim(mcache)-dim(x)) != 0) changed = TRUE
		else if (!is.null(mcache) & sum(mcache - x) == 0) changed = FALSE
		else changed = TRUE;

		if (!changed) {
			message('Matrix unchanged, getting data from cache.')
			return(icache)
		}
		else { # Matrix changed, recalculate
			message('Matrix changed, recalculate cache.')
			icache <<- solve(x)
			mcache <<- x
			return(icache)
		}
	}
}

