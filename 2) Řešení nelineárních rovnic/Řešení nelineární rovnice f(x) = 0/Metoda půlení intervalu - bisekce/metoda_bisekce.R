
puleni_s_prenosti <- function (f, a, b, e) {
  plot(f,a,b)
  
  #počítáme střed intervalu
  s <- (a + b) / 2
  
  while (abs(b-a)/2 > e) {
    #počítáme střed intervalu
    s <- (a + b) / 2
    #pozice středu interval
    abline(v=s,col='red')
    
    #pokud střed rovná se a nebo rovná se b, pak f(h) := 0
    if(f(s) == 0) {
      break
    } else if (f(a) * f(s) < 0) { #pokud f(a) * f(s) < 0, pak a = a, b = s.
      b <- s
    } else {
      # f(s)*f(b) < 0, pak a = s. b = b
      a <- s
    }
    print(s)
  }
  abline(v=s,col='blue',lw=4)
  
  return(s)
}
f <- function(x) {
  return(x^3 - x^2 + 2)
}
print(puleni_s_prenosti(f, -10, 10, 0.01))

g<- function(x){
  return(10*cos(x-1)-x^2+2*x-1)
}
print(puleni_s_prenosti(g, 2.3, 2.4, 10^-3))




# Metoda bisekce
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
  return(x * atan(x) - 1)
}
a <- 0  # Levý okraj intervalu
b <- 2  # Pravý okraj intervalu
epsilon <- 1e-2  # Požadovaná přesnost

# Grafické zobrazení funkce pro odhad kořene
curve(f(x), from = -2, to = 2, col = "blue", lwd = 2, ylab = "f(x)", xlab = "x")
abline(h = 0, col = "red", lwd = 2)
abline(v = 0, col = "red", lwd = 2)

# Zavolání metody bisekce
kořen <- bisekce(a, b, epsilon)
cat("Kořen: ", kořen, "\n")

# Vstupní hodnoty
a <- 1
b <- 2
epsilon <- 10^(-2)

# Volání metody bisekce
root <- bisection_method(f, a, b, epsilon)
cat("Kořen přibližně:", root, "\n")

