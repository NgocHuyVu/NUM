# Sousatavy  lineární rovnice, derivace a obyčejné diferenciální rovnice

Uvažujte soustavu lineárních rovnic:

$$
\begin{aligned}
2x + y - z &= 4, \\
-x + 3y + 2z &= 1, \\
x - y + 2z &= 3.
\end{aligned}
$$

Vyřešte tuto soustavu pomocí **Gaussovy eliminace**. Výsledné hodnoty označme jako $x_1, y_1$ a $z_1$.

Pro funkci $f(x)=x^2.sin(x)$ určete první derivaci $f'(x)$ a druhou derivaci $f''(x)$ v bodě $x_1$ s krokem $h=0.01$

Na základě získaného $x_1$ řešte počáteční úlohu pro diferenciální rovnici $y'(x)=x^2-y$, $y(x_1)=z_1$ v intervalu $<x_1,x_1+1>$ s krokem $h=0.01$

```
GEM_Pivot <- function(A, b){
  Ab <- cbind(A, b)
  n <- length(b)
  # přímý chod
  #od 1 do n-1 = pro každý sloupec
  for(k in 1:(n-1)){
    #najdeme pivot
    pivot <- which.max(abs(Ab[k:n,k])) + k - 1
    
    #pokud pivot není v akutálním řádku, prohodíme řádky, 
    #aby pivot byl v horní pozici
    if(pivot !=k){
      j <- k:(n+1)
      pom <- Ab[k,j]
      Ab[k,j] <- Ab[pivot,j]
      Ab[pivot,j] <- pom
    }
    
    
    for(i in (k+1):n){
      j <- (k+1):(n+1)
      nasobek <- - Ab[i,k]/Ab[k,k]
      Ab[i,j] <- Ab[i,j] + nasobek*Ab[k,j]
    }
  }
  # zpětný chod
  # začneme od posledního řádku a postupně počítáme hodnoty neznámých x
  x <- b
  x[n] <- Ab[n,n+1]/Ab[n,n]
  for(i in (n-1):1){
    j <- (i+1):n
    x[i] <- (Ab[i,n+1]-sum(Ab[i,j]*x[j]))/Ab[i,i]
  } 
  return(x)
}

A <- matrix(c(2, 1, -1,
              -1, 3,  2,
              1, -1,  2), byrow = TRUE, nrow = 3)
b <- c(4, 1, 3)

koreny <- print(GEM_Pivot(A, b))

x1 <- koreny[1]
y1 <- koreny[2]
z1 <- koreny[3]

cat("Řešení soustavy:\n")
cat(paste0("x1 = ", x1, "\n"))
cat(paste0("y1 = ", y1, "\n"))
cat(paste0("z1 = ", z1, "\n"))




vypocet_prvni_derivace <- function(f, x, h){
  prvni_derivace <- (f(x + h) - f(x - h)) / (2 * h)
  return(prvni_derivace)
}

vypocet_druhe_derivace <- function(f, x, h){
  druha_derivace <- (f(x + h) - 2 * f(x) + f(x - h)) / (h^2)
  return(druha_derivace)
}

f <- function(x) {
  return(x^2*sin(x))
}

h <- 0.01
prvni_derivace_kvadraticka <- vypocet_prvni_derivace(f, x1, h)
druha_derivace <- vypocet_druhe_derivace(f, x, h)
cat("Přibližná hodnota první derivace (kvadratický interpolační polynom):", prvni_derivace_kvadraticka, "\n")
cat("Přibližná hodnota druhé derivace:", druha_derivace, "\n")



# Eulerova metoda
eulerova_metoda <- function(f, x0, y0, h, x_end) {
  n <- ceiling((x_end - x0) / h) # Počet kroků
  x <- seq(x0, x_end, by = h)    # Vektor hodnot x
  y <- numeric(length(x))        # Inicializace vektoru y
  y[1] <- y0                     # Počáteční podmínka
  
  for (i in 1:(length(x) - 1)) {
    y[i + 1] <- y[i] + h * f(x[i], y[i])
  }
  
  return(data.frame(x = x, y = y))
}

# Definice funkce f(x, y)
f <- function(x, y) {
  x^2 - y
}


# Výpočet pro h = 1
h1 <- 0.1
result_h1 <- eulerova_metoda(f, x1, z1, h1, x1+1)

cat("Výsledky pro h = 0.1:\n")
print(result_h1)

# Grafické zobrazení
plot(result_h1$x, result_h1$y, type = "o", col = "blue", pch = 16, lty = 1,
     xlab = "x", ylab = "y", main = "Eulerova metoda")
```
