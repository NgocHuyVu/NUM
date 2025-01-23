# Nelineární rovnice, iterpolační polynom a integrál

Najděte kořen nelineání rovnice, který označujeme jako $x_0$

$f(x)=x^3-4x+1$

Vypočítejte hodnoty funkce $g(x) = sin(x)+x^2$ pro $x = {x_0, x_0+0.5,x_0+1.0}$. Na základě těchto hodnot sestavte intepolační polynom $P(x)$ a určete přibližnou hodnotu $g(x_0 + 0.75)$.

Vypočítejte přibližnou hodnotu určitéjo integrálu

$I=\int_{x_0}^{x_0+1.0} P(x) dx$


```
bisekce <- function(a, b, epsilon) {
  if (f(a) * f(b) > 0) {
    stop("Na intervalu <a,b> neleží alespoň jeden kořen rovnice f(x) = 0!")
  }
  
  k <- 1
  while ((b - a) / 2^(k-1) > epsilon) {
    s <- (a + b) / 2  # Střed intervalu
    if (f(a) * f(s) < 0) {
      b <- s  # Kořen je v levé polovině
    } else {
      a <- s  # Kořen je v pravé polovině
    }
    k <- k + 1
  }
  
  return((a + b) / 2)  # Výsledek
}

f <- function(x) {
  return(x^3-4*x+1)
}
a <- -100  # Levý okraj intervalu
b <- 100  # Pravý okraj intervalu
epsilon <- 1e-3  # Požadovaná přesnost


# Zavolání metody bisekce
x0 <- bisekce(a, b, epsilon)
cat("x0 ", x0, "\n")


g <- function(x){
  return(sin(x)+x^2)
}


x <- seq(from = x0, to = x0+1, by=0.5)
y <- sapply(x, g)

t <- x0+0.75

Lagrange <- function(t, x, y, print_polynom = FALSE) {
  n <- length(x)
  soucet_Lx <- 0
  polynom <- ""
  
  for (i in 1:n) {
    soucin_li_x <- 1
    li <- ""
    for (j in 1:n) {
      if (j != i) {
        soucin_li_x <- soucin_li_x * (t - x[j]) / (x[i] - x[j])
        li <- paste0(li, "(x - ", x[j], ")/(", x[i], " - ", x[j], ")")
        if (j != n && j != i) {
          li <- paste0(li, " * ")
        }
      }
    }
    polynom <- paste0(polynom, ifelse(i == 1, "", " + "), y[i], " * (", li, ")")
    soucet_Lx <- soucet_Lx + y[i] * soucin_li_x
  }
  
  # Výpis polynomu, pouze pokud je print_polynom TRUE
  if (print_polynom) {
    cat("Předpis polynomu L(x):\n")
    cat(polynom, "\n")
  }
  
  return(soucet_Lx) # Vrátí interpolovanou hodnotu v bodě t
}

# Vypočítání interpolované hodnoty v bodě t
P_t <- Lagrange(t, x, y, print_polynom = TRUE)
cat("Hodnota polynomu v bodě t =", t, "je:", P_t, "\n")

# Vizualizace
plot(x, y, col = 'red', ylim = c(-10, 10), pch = 19, xlab = "x", ylab = "y", main = "Lagrange Interpolation")
t_seq <- seq(min(x), max(x), by = 0.01) # Hodnoty t pro vykreslení funkce
y_seq <- sapply(t_seq, Lagrange, x = x, y = y, print_polynom = FALSE) # Výpočet y pro všechny hodnoty t (bez výpisu polynomu)
lines(t_seq, y_seq, col = 'blue') # Vykreslení interpolační funkce

# Meze integrace
a <- x0
b <- x0+1

# Počet podintervalů
m <- 4
slozene_lichobeznikove_pravidlo <- function(f, a, b, m) {
  h <- (b - a) / m
  
  sum_result <- 0
  
  for (i in 1:(m-1)) {
    x_i <- a + i * h
    sum_result <- sum_result + f(x_i)
  }
  
  I_sl <- (h / 2) * (f(a) + 2 * sum_result + f(b))
  
  return(I_sl)
}

result_slozene_lichobeznikove_pravidlo <- slozene_lichobeznikove_pravidlo(P_t, a, b, m)
cat("Přibližná hodnota integrálu pomocí složeného lichoběžníkového pravidla je:", result_slozene_lichobeznikove_pravidlo, "\n")
``` 	

