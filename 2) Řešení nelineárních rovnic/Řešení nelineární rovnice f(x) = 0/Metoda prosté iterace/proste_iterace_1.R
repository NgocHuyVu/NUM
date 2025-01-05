g <- function(x){return(0.5*(x+2)/x)}

x <- seq(0, 2, 0.01)
plot(x, g(x), ylim = c(0,2), type = 'l', col = 'blue')
abline(a=0, b =1, col = 'red')

x <- 0.5
for(i in 1:10){
  y <- g(x)
  segments(x, x, x, y, col = 'green')
  segments(x, y, y, y, col = 'green')
  x <- y
  print(x)
}

#Model SIR
beta <- 1
nu <- 1
f <- function(y){
  ds <- beta*y[1]*y[2]
  dI <- nu*y[2]
  return(c(-ds, ds-dI, dI))
}
g <- function(h,f,y0){
  y1 <- y0+h*f(y)
  y1 <- y0+0.5*h*(f(y0)+f(y1))
  y1 <- y0+0.5*h*(f(y0)+f(y1))
  y1 <- y0+0.5*h*(f(y0)+f(y1))
  y1 <- y0+0.5*h*(f(y0)+f(y1))
  return(y1)
}
nrow <- 2000
ncol <- 3
SIR <- matrix(0, nrow, ncol)
SIR [1, ] <- c(999, 1, 0)
beta <- 1
nu <- 1
h <- 0.001
for (i in 2:nrow) SIR [i, ] <- g(h, f, SIR[i-1,])
i <- 1:nrow()
plot(I, SIR[,1], ylim =c(0, 1000), col = 'red')
point(i, SIR[,2], col ='blue')
points(i, SIR[,3], col ='green')
SIR[2, ]