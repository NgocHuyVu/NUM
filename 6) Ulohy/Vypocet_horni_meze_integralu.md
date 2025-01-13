# Výpočet horní meze integrálu

Zadání

Určete $p$, pro které platí:

$\int_0^p \left( \int_0^{2\pi} e^{-\alpha x} \sin x \, dx \right) d\alpha = 1.31848$

Úkol zahrnuje výpočet dvojitého integrálu:
- Vnitřní integrál je vypočet podle $x$ v mezích $0$ až $2\pi$
- Vnější integrál je výpočet pdole $\alpha$ v mezích $0$ až p

K nalezení hodnoty p, která danou rovnost, používámne
- **Složené lichoběžníkové pravidlo** pro numerické řešení integrálů
  - Vnitřní integrál
    
    $\int_0^{2\pi} e^{-\alpha x} \sin(x) \ dx$
  - Vnější integrál

    $\int_0^{p} \text{výsledek vnitřního integrálu} \ d\alpha$
    
- **Metodu bisekce** k numerickému hledání kořene $f(p)=0$, kde $f(p)=\int_0^p \left( \int_0^{2\pi} e^{-\alpha x} \sin x \, dx \right) d\alpha - 1.3184$
  
  tedy řešíme nelineární rovnice, která má jednu proměnnou $p$:

  $\int_0^p \left( \int_0^{2\pi} e^{-\alpha x} \sin x \, dx \right) d\alpha - 1.3184 = 0$
  
```
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

bisekce <- function(f, a, b, epsilon) {
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


vnitrni_integral <- function(alpha){
  f_x <- function(x){
    return(exp(-alpha * x) * sin(x))
  }
  return(slozene_lichobeznikove_pravidlo(f_x, 0, 2*pi, 1000))
}

vnejsi_integral <- function(p){
  f_alpha <- function(alpha){
    return(vnitrni_integral(alpha))
  }
  return(slozene_lichobeznikove_pravidlo(f_alpha, 0, p, 1000))
}

f <- function(p)
{
  return(vnejsi_integral(p) - 1.31848)
}

a <- 0
b <- 20
epsilon <-  1e-6

kořen <- bisekce(f, a, b, epsilon)
cat("Kořen: ", kořen, "\n")


# Vykreslení grafu funkce f(p)
p_values <- seq(a, b, length.out = 500)  # Vytvoření vektoru hodnot p
f_values <- sapply(p_values, f)  # Spočítání hodnot f(p)

# Vykreslení grafu
plot(p_values, f_values, type = "l", col = "blue", lwd = 2, xlab = "p", ylab = "f(p)", main = "Graf funkce f(p)")
abline(h = 0, col = "red", lty = 2)  # Červená horizontální čára (f(p) = 0)

# Zobrazení nalezeného kořene
points(kořen, f(kořen), col = "green", pch = 19)  # Kořen je zobrazen zeleným bodem
text(kořen, f(kořen), labels = paste("Kořen:", round(kořen, 5)), pos = 4, col = "green")

```
