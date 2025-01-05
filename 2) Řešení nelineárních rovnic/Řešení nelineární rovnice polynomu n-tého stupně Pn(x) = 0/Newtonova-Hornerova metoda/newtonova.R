newton_method <- function(f, f_prime, x0, epsilon) {
  x_prev <- x0
  print(paste("Aktuální aproximace:", x_prev ))
  repeat {
    x_next <- x_prev - f(x_prev) / f_prime(x_prev)
    if (abs(x_next - x_prev) < epsilon) {
      break
    }
    x_prev <- x_next
    print(paste("Aktuální aproximace:", x_next))
  }
  
  return(paste("Kořen přibližně:", x_next))
}

f <- function(x) {
  return(x - exp(-x))
}

f_derivace <- function(x) {
  return(1 + exp(-x))
}

result <- newton_method(f, f_derivace, 1, 10^(-4))
print(result)
