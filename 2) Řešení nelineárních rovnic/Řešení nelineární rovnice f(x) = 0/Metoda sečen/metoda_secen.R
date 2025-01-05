

# Implementace metody sečen
metoda_secen <- function(f, x0, x1, delta) {
  k <- 1
  results <- c(x0, x1)
  
  while (TRUE) {
    # Vypočítat další aproximaci
    fx0 <- f(x0)
    fx1 <- f(x1)
    x_next <- x1 - fx1 * (x1 - x0) / (fx1 - fx0)
    
    # Uložit aktuální iteraci
    results <- c(results, x_next)
    
    # Kontrola konvergence
    if (abs(x_next - x1) < delta) {
      break
    }
    
    # Aktualizace proměnných pro další iteraci
    x0 <- x1
    x1 <- x_next
    k <- k + 1
  }
  
  return(results[-c(1, 2)])  # Vrátí hodnoty od x2 dál
}

f <- function(x) {
  x - exp(-x)
}
x0 <- 2
x1 <- 1
delta <- 10^-4

# Řešení metodou sečen
results <- metoda_secen(f, x0, x1, delta)

# Výstup iterací
for (i in seq_along(results)) {
  print(sprintf("x%d: %.10f", i+1, results[i]))
}
