# Matice a interpolace

## Zadání úlohy

Nechť $A$ je čtvercová matice řádu $n$ a $\vec{y}$ je vektor délky $n$, kde $n = 10$. Prvky matice $A$ a vektoru $\vec{y}$ jsou definovány následovně:

$A[i, j] = \cos((i - 1) j) - j$

$\vec{y}[i] = \sin(i)$

kde $i$ a $j$ jsou celá čísla od $1$ do $n$.

## Zadání dílčích úloh

1. Řešte soustavu lineárních rovnic $A \vec{x} = \vec{y}$, kde $A$ je matice definovaná výše, $\vec{x}$ je neznámý vektor a $\vec{y}$ je vektor definovaný výše.

2. Interpolujte polynomem $p(x)$ množinu bodů danou vektory $\vec{x}$ a $\vec{y}$.

    (a) Vykreslete $p(x)$ a určete, kde se graf $p(x)$ protíná s osou $y$.

    (b) Určete

    $/int_{x_{\text{MIN}}}^{x_{\text{MAX}}} p(x) dx$

    kde $x_{\text{MIN}}$ je nejmenší prvek vektoru $\vec{x}$ a $x_{\text{MAX}}$ je jeho největší prvek.

```
# Definice velikosti matice
n <- 10

# Vytvoření matice A podle zadaného vzorce
A <- matrix(0, n, n)
for (i in 1:n) {
  for (j in 1:n) {
    A[i, j] <- cos((i - 1) * j) - j
  }
}

# Vytvoření vektoru y podle zadaného vzorce
y <- sin(1:n)

# Výpis matice A a vektoru y
# print(A)
# print(y)
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



print("Řešení soustavy:")
x <- print(GEM_Pivot(A, y))

cat("Řešení soustavy:\n")
for (i in 1:length(x)) {
  cat(paste0("x", i, " = ", x[i], "\n"))
}
```
