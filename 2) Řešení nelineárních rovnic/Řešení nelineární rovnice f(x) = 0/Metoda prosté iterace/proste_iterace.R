

# Prostá iterace
simple_iteration <- function(delta, x0, max_iter = 1000) {
  x_prev <- x0
  x_curr <- phi(x_prev)
  iter <- 1
  
  while (abs(x_curr - x_prev) >= delta && iter < max_iter) {
    x_prev <- x_curr
    x_curr <- phi(x_prev)
    iter <- iter + 1
  }
  
  # Vypočítat chybu aproximace
  q <- exp(-x_curr) # q = sup e^(-x)
  approx_error <- (q / (1 - q)) * abs(x_curr - x_prev)
  
  list(
    root = x_curr,
    iterations = iter,
    approx_error = approx_error
  )
}

# Parametry
delta <- 1e-5
x0 <- 1

# Definice funkce ϕ(x)
phi <- function(x) {
  exp(-x)
}
# Řešení
result <- simple_iteration(delta, x0)
print(result)
