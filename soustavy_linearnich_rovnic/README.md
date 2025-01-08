# Numerické řešení soustavy lineárích rovnic

## 1. Lineární rovnice a soustava lineárních rovnic

**Lineární rovnice** o $n$ neznámých $x_1, x_2, ..., x_n$ má tvar

$a_1x_1+a_2x_2+...+a_nx_n=b$

kde $a_1, a_2, ..., a_n$ jsou koeficienty a $b$ je absolutní člen.

Soustava lineárních rovnic má $m$ rovnic o $n$ neznámých x)$x_1, x_2, ..., x_n$

$a_{11}x_1 + a_{12}x_2 + \dots + a_{1n}x_n = b_1$
$a_{21}x_1 + a_{22}x_2 + \dots + a_{2n}x_n = b_2$
$   ...    +    ...    + \dots +     ...   = ...
$a_{m1}x_1 + a_{m2}x_2 + \dots + a_{mn}x_n = b_m$

Soustavu lineárních rovnic lze zapsat pomocí matic následovně

$\begin{bmatrix}a_11 &a_12 &... &a_1n\\a_21 & a_22 & a_2n\\... &... &... &...\\a_m1 & a_m2 &... &a_mn \end{bmatrix}$

Označíme-li matici a vektory pořadě A, x, b, dostáváme rovnici 

$A.x=b$

## 2. Numerické řešení soustavy lineárních rovnic

Najdeme řešení soustavy lineárních rovnic a k ní dospějeme při numerickém řešení parciálních diferenciálních rovnic.

Máme 2 typy metody

- **Přímé metody** (Gaussova eliminační metoda, LU rozklad) poskytují přesné řešení v konečném počtu kroků, pokud během výpočtu nezaokrouhlujeme.
- **Nepřímé iterační metody** (Gaussova-Seidelova metoda, Jacobiova metoda) získáme pouze aproximativní řešení.

## 3. Gaussova eliminační metoda 

Má dvě části:

- **Přímý chod** je úprava výchozí soustavy $Ax=b$ na soustavu $Ux=y$ s horní trojúhelníkovou schodovitou maticí $U$.
- **Zpětný chod** je výpočet řešení ze soustavy $Ux=y$.

Algoritmus:

- Vstup: $n, A = a_{ij}^0, \mathbf{b} = a_{i,n+1}^0$
  
  přímý chod

  &nbsp;&nbsp;&nbsp;pro $k =1, 2, ..., n-1$
  
  &nbsp;&nbsp;&nbsp; Pro každý řádek k odstraníme hodnoty pod hlavním prvkem (pivotem) na pozici (k,k). Upravený řádek i se získá přičtením m-násobku k-tého řádku.
  
  &nbsp;&nbsp;&nbsp; $m_{ik}^{(k-1)} = -\frac{\text{prvek pod pivotem}}{\text{pivot}} = -\frac{a_{ik}^{(k-1)}}{a_{kk}^{(k-1)}}$

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pro $i = k+1, k+2, …, n$ přičteme $m_{ik}$-násobek k-tého řádku i-tému řádku. Pro všechny řádky $i>k$ vynásobíme k-tý řádek vhodným násobkem $m$, aby platilo, že $A[i,k]=0$

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $a_{ij}^k = a_{ij}^{(k-1)} + m_{ik}^{(k-1)} a_{kj}^{(k-1)}$

  zpětný chod

  &nbsp;&nbsp;&nbsp;pro $i = n, n-1, …, 1$
  
  &nbsp;&nbsp;&nbsp;Začínáme od posledního řádku, kde máme pouze jednu neznámou $x_n$. Postupujeme výše k předchozím řádkům a pro každou neznámou použijeme již spočítané hodnoty $x_{i+1}, x_{i+2}$.
 
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $x_i = \frac{1}{a_{ii}^{(i-1)}} \left( a_{i,n+1}^{(i-1)} - \sum_{j=i+1}^{n} a_{ij}^{(i-1)} x_j \right)$

- Vystup: $\mathbf{x} = (x_1, x_2, \dots, x_n)$
```
GEM <- function(A, b){
  n <- length(b)
  # přímý chod
  Ab <- cbind(A, b)
  for(k in 1:(n-1)){
    for(i in (k+1):n){
      m <- -Ab[i,k]/Ab[k,k]
      j <- (k+1):(n+1)
      Ab[i, j] <- Ab[i, j] + m*Ab[k, j]
    }
  }
  # zpětný chod
  x <- b
  x[n] <- Ab[n, n+1]/Ab[n, n]
  for(i in (n-1):1){
    j <- (i+1):n
    x[i] <- (Ab[i, n+1] - sum(Ab[i,j]*x[j]))/Ab[i, i]
  }
  return(x)
}

A <- matrix(c(1, 2, -2,
              1, 1,  1,
              2, 2,  1), byrow = TRUE, nrow = 3)
b <- c(1, 3, 5)

print("Řešení soustavy:")
x <- print(GEM(A, b))

cat("Řešení soustavy:\n")
for (i in 1:length(x)) {
  cat(paste0("x", i, " = ", x[i], "\n"))
}
```
## 4. Gaussova eliminační metoda s výběrem hlavního prvku

Cílem je vybrat hlavní prvek, aby byl co největší v absolutní hodnotě, provede se eliminace ve všech zbývajících řádcích neobsahujících hlavní prvek. Lze snadno realizovat přehrazováním řádků.

V první fázi přímého chodu GEM se za hlavní prvek vybere v absolutní hodnotě největší číslo z prvního sloupce matice a eliminace se provedou ve všech řádcích neobsahujících hlavní prvek. V k-té fázi se celý výpočet omezí na řádky, v nichž dosud hlavní prvek nebyl vydán. Nejprve se jako hlavní prvek vybere v absolutní hodnotě největší z čísel ležících v k-tém sloupci a příslušných řádcích a pak se provedou eliminace ve zbývajících řádcích.  Při výběru pivotu je hledán maximální prvek v absolutní hodnotì ve sloupci od aktuálního řádku $k$ až do posledního řádku $(k:n)$. Pokud pivot není v aktuálním řádku $k$, prohodíme se aktuální řádek s řádkem, kde je pivot. 

Algoritmus:

- Vstup: $n, A = a_{ij}^0, \mathbf{b} = a_{i,n+1}^0$
  
  přímý chod

  &nbsp;&nbsp;&nbsp;pro $k =1, 2, ..., n-1$

  &nbsp;&nbsp;&nbsp; $m_{ik}^{(k-1)} = -\frac{a_{ik}^{(k-1)}}{a_{kk}^{(k-1)}}$

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pro $i = k+1, k+2, …, n$ přičteme $m_{ik}$-násobek k-tého řádku i-tému řádku

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $a_{ij}^k = a_{ij}^{(k-1)} + m_{ik}^{(k-1)} a_{kj}^{(k-1)}$

  zpětný chod

  &nbsp;&nbsp;&nbsp;pro $i = n, n-1, …, 1$

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $x_i = \frac{1}{a_{ii}^{(i-1)}} \left( a_{i,n+1}^{(i-1)} - \sum_{j=i+1}^{n} a_{ij}^{(i-1)} x_j \right)$

- Vystup: $\mathbf{x} = (x_1, x_2, \dots, x_n)$
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

A <- matrix(c(1, 1, 1,
              2, 4,  2,
              -1, 5,  -4), byrow = TRUE, nrow = 3)
b <- c(6, 16, -3)


print("Řešení soustavy:")
x <- print(GEM_Pivot(A, b))

cat("Řešení soustavy:\n")
for (i in 1:length(x)) {
  cat(paste0("x", i, " = ", x[i], "\n"))
}
```

## 5. LU rozklad

**Dolní trojúhelníková matice** je matice, která má nad hlavní diagonálou samé nuly.

**Horní trojúhelníková matice** je matice, která má pod hlavní diagonálou samé nuly.

K regulární čtvercové matici A budeme hledat **dolní trojúhelníkovou matici** L a **horní trojúhelníkovou matici** U tak aby platilo

$A=LU$

Algoritmus

- Vstup: $n, A=(a_nj)$
- Pro $j=1, 2, ..., n$
  
  &nbsp;&nbsp;&nbsp; pro $i=1, 2, ..., j$
  
  &nbsp;&nbsp;&nbsp; $u_{ij} = a_{ij} - \sum_{r=1}^{i-1} l_{ir} u_{rj}$

  &nbsp;&nbsp;&nbsp; $i = j+1, j+2, n$

  &nbsp;&nbsp;&nbsp; $l_{ij} = \frac{a_{ij} - \sum_{r=1}^{j-1} l_{ir} u_{rj}}{u_{ij}} \quad \text{(pokud } u_{ij} \neq 0 \text{)}$
  
- Výstup: $L=(l_ij), U=(u_ij)$
  
``` 
getLU <- function(A){
  n <- nrow(A)
  for(k in 1:(n-1)){
    for(i in (k+1):n){
      j <- (k+1):n
      nasobek <- A[i,k]/A[k,k]
      A[i,j] <- A[i,j] - nasobek*A[k,j]
      A[i,k] <- nasobek
    }
  } 
  return(A)
}
SolveLU <- function(LU, b){
  n <- length(b)
  # Ly = b
  y <- b
  for(i in 2:n){
    j <- 1:(i-1)
    y[i] <- b[i]-sum(LU[i,j]*y[j])
  }
  # Ux = y
  x <- y
  x[n] <- y[n]/LU[n,n]
  for(i in (n-1):1){
    j <- (i+1):n
    x[i] <- (y[i]-sum(LU[i,j]*x[j]))/LU[i,i]
  }
  return(x)
}
A <- matrix(c(1, 2, -2,
              1, 1,  1,
              2, 2,  1), byrow = TRUE, nrow = 3)
b <- c(1, 3, 5)
LU <- getLU(A)
print(SolveLU(LU,b))
```
## 6. Myšlenka iterační metody

Z každé rovnice soustavy $\mathbf{A} \vec{\mathbf{x}} = \vec{\mathbf{b}}$ vyjádříme právě jednu neznámou v závislosti na zbývajících neznámých.

Soustava $\mathbf{A} \vec{\mathbf{x}} = \vec{\mathbf{b}}$ tak přejde na tvar $\vec{\mathbf{x}} = H \vec{\mathbf{x}} + \vec{\mathbf{g}}$ 

Odtud získáme iterační formuli $\vec{x}^{(k+1)} = H \vec{x}^{(k)} + \vec{g}$

Vlastní iterační proces probíhá tak, že

- 	Zvolíme počáteční iteraci $\vec{x}^{(0)}$
- 	Prostřednictvím iterační formule $\vec{x}^{(k+1)} = H \vec{x}^{(k)} + \vec{g}$ určíme další vektory řešení $\( \vec{x}^{(k+1)} \), \( k = 0, 1, 2, \dots \)$
- 	Proces ukončíme buď po předem stanoveném počtu iterací, nebo když bude splněna zastavovací podmínka (aproximace dostatečně přesná, pak výpočet ukončíme)
  $|\vec{x}^{(k+1)} - \vec{x}^{(k)}| < \delta$ kde $\( \delta \)$ je přesnost, která určí řešení $\vec{x} \$

## 7. Jacobiova iterační metoda

Algoritmus
- Vstup: $\( n, A = \{ a_{ij} \}_{i,j=1}^{n}, \vec{b} = \{ b_i \}_{i=1}^{n}, \vec{x}^{(0)} = \{ x_i^{(0)} \}_{i=1}^{n}, m \)$
- pro $k=0, 1, 2, ..., m$
  
  &nbsp;&nbsp;&nbsp; $i=0, 1, 2, ..., n$
  
  &nbsp;&nbsp;&nbsp; $x_i^{(k+1)} = \frac{b_i - \sum_{j=1}^{i-1} a_{ij} x_j^{(k)} - \sum_{j=i+1}^{n} a_{ij} x_j^{(k)}}{a_{ii}}$
  
- Výstup: $\vec{x}^{(m)} = (x_1^{(m)}, x_2^{(m)}, \dots, x_n^{(m)})$

```
Jacobi<-function(A,b){
  n<-length(b)
  #x0<-rep(0,n)
  x0<-rep(1,n)
  x<-x0
  for(k in 1:100){
    for(i in 1:n){
      x[i]<-(b[i]-sum(A[i,]*x0)+A[i,i]*x[i])/A[i,i]
    }
    x0<-x
  }
  return(x)
}
A <- matrix(c(2, 1, 0,
              1, 4,  1,
              0, 1,  2), byrow = TRUE, nrow = 3)
b <- c(2, 0, -2)
print(Jacobi(A, b))
```

## 7. Gaussova-Seidelova

Algoritmus

- Vstup: $\( n, A = \{ a_{ij} \}_{i,j=1}^{n}, \vec{b} = \{ b_i \}_{i=1}^{n}, \vec{x}^{(0)} = \{ x_i^{(0)} \}_{i=1}^{n}, m \)$
- Pro $k=0, 1, ..., m$

  &nbsp;&nbsp;&nbsp; Pro $i=1, 2, ..., n$

  &nbsp;&nbsp;&nbsp; $x_i^{(k+1)} = \frac{b_i - \sum_{j=1}^{i-1} a_{ij} x_j^{(k+1)} - \sum_{j=i+1}^{n} a_{ij} x_j^{(k)}}{a_{ii}}$

- Výstup: $\vec{x}^{(m)} = (x_1^{(m)}, x_2^{(m)}, \dots, x_n^{(m)})$

```
GaussSeidel <- function(A, b, tol = 1e-4) {
  n <- nrow(A)
  x <- numeric(n)  # počáteční odhad (vektor nul)
  repeat {
    x_new <- x  # nový odhad
    for (i in 1:n) {
      x_new[i] <- (b[i] - sum(A[i, -i] * x_new[-i])) / A[i, i]
    }
    # Kontrola konvergence
    if (max(abs(x_new - x)) < tol) {
      cat("Konvergence dosažena.\n")
      return(x_new)
    }
    x <- x_new
  }
}

#Příklad 1
# Matice a vektor pravých stran
A <- matrix(c(11, 2, 1,
              1,  10, 2,
              2,  3, -8), byrow = TRUE, nrow = 3)
b <- c(15, 16, 1)

# Výpočet řešení
x <- GaussSeidel(A, b, tol = 1e-4)
cat("Řešení s přesností 10^-4:\n")
print(x)


# Příklad 2
# Matice a vektor pravých stran
A <- matrix(c(4, -1, 2,
              2,  5, 1,
              1,  1, -3), byrow = TRUE, nrow = 3)
b <- c(-12, 5, -4)

# Výpočet řešení
x <- GaussSeidel(A, b, tol = 1e-2)
cat("Řešení s přesností 10^-4:\n")
print(x)
```

  




