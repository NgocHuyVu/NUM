regula_fasi <- function(f, a, b, e) {
  plot(function(x) f(x), a, b, col = "blue", lwd = 2, main = "Regula Falsi Method")
  
  p <- a
  iteration <- 0
  
  print(paste("Starting interval: a =", a, "b =", b))
  
  while (abs(f(p)) > e) {
    p <- a - ((b - a) / (f(b) - f(a))) * f(a)
    
    iteration <- iteration + 1
    print(paste("Iteration", iteration, ": a =", a, "b =", b, "p =", p, "f(p) =", f(p)))
    
    if (f(a) * f(p) < 0) {
      b <- p
    } else {
      a <- p
    }
  }
  
  abline(v = p, col = 'blue', lwd = 4)
  
  return(paste("Kořen přibližně:", p))
}

f <- function(x) {
  return(x * atan(x) - 1)
}
print(regula_fasi(f, 1, 2, 1e-9))
