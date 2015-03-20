### Sample runs of cachematrix.R
```
R> source('cachematrix.R')
R> ma=matrix(c(1,2,3,4),nrow=2)
R> mb=matrix(c(5,6,7,8),nrow=2)
R> m1=makeCacheMatrix(ma)
R> m2=makeCacheMatrix(mb)
R> cacheSolve(m1)
[,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
R> cacheSolve(m1)
getting cached inverse matrix
[,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
R> cacheSolve(m2)
[,1] [,2]
[1,]   -4  3.5
[2,]    3 -2.5
R> cacheSolve(m2)
getting cached inverse matrix
[,1] [,2]
[1,]   -4  3.5
[2,]    3 -2.5
```

### Remarks
I wrote another way of caching matrix inversion in mysolve.r. Please
look at its content for details. If you have time please critique.
Thanks in advance.

### Sample runs of mysolve.r
```
R> source('mysolve.r')
R> ma=matrix(c(1,2,3,4),nrow=2)
R> mb=matrix(c(5,6,7,8),nrow=2)
R> mc=matrix(c(1,2,3,4,5,6,-2,-3,-1),nrow=3)

R> mysolve(ma)
Inversion not calculated
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
R> mysolve(ma)
Matrix unchanged, getting data from cache.
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
R> mysolve(mb)
Matrix changed, recalculate cache.
     [,1] [,2]
[1,]   -4  3.5
[2,]    3 -2.5
R> mysolve(mb)
Matrix unchanged, getting data from cache.
     [,1] [,2]
[1,]   -4  3.5
[2,]    3 -2.5
R> mysolve(mc)
Matrix changed, recalculate cache.
           [,1]       [,2]      [,3]
[1,] -1.4444444  0.8888889 0.2222222
[2,]  0.7777778 -0.5555556 0.1111111
[3,]  0.3333333 -0.6666667 0.3333333
R> mysolve(mc)
Matrix unchanged, getting data from cache.
           [,1]       [,2]      [,3]
[1,] -1.4444444  0.8888889 0.2222222
[2,]  0.7777778 -0.5555556 0.1111111
[3,]  0.3333333 -0.6666667 0.3333333
```
