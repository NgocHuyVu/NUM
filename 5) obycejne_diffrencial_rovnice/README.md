# Numerické řešení obyčejných diferenciálních rovnic

## 1. Obyčejné diferenciální rovnice

Obyčejnou diferenciální rovnicí nazýváme rovnici, v níž se vyskytuje derivace neznáme jedné nezávisle proměnné.

Řádem diferenciální rovnice nazýváme řád nejvyšší derivace neznámé funkce v rovnici.
- $xy' = 2 - x^2 - y$ je prvního řádu
- $y'' + 2y' - 3y = 2 - x^2$ jke druhého řádu

Integrální křivka diferenciální rovnice je grafické znázornění některého řešení diferenciální rovnice.

Řešením nebo také integrálem diferenciální rovnice na intervalu I nazýváme každou funkci, které na intervalu I danou rovnici splňuje. 

Řešení diferenciálních rovnic dělíme do tří typů
- **Obecné řešení** rovnice prvního řádu tvoří každá funkce tvaru $\phi(x, y, C) = 0$, případně $y = \psi(x, C)$, která rovnici splňuje pro libovolnou konstantu C. Obecné řešení vždy obsahuje integrační konstantu (rovnici prvního řádu) nebo n konstant
  Př. Obecné řešení diferenciální rovnice $y'=2x$
  
  $int y' \, dx = \int 2x \, dx$
  
  $y = x^2 + C$
- **Partikulární řešení** je obsaženo v obecném řešení. Získáme ho z obecného řešení, když za integrační konstanty dosadíme konkrétní hodnoty, které zvolíme nebo vypočítáme z daných podmínek.

  Př. Partikulární řešení, pro které platí $y(2)=7$

  Podmínka y(2)=7 říká, že hodnotě x=2 odpovídá hodnota $y=7$, hledáme tedy takové řešení, které prochází bodem $P[2,7]$.

  Dosadíme tyto dvě hodnoty do obecného řešení: $7= x^2+C<=>C=3$

  Dosazením za C do obecného řešení získáme partikulární řešení: $y=x^2+3$
  
- **Výjimečné řešení** není obsaženo v obecném řešení. Vzniká jen u některých typů diferenciálních rovnic v průběhu jejich řešení.

  Př. Je zřejmé, že integrální křivka je parabola s vrcholem $V[0,3]$ a osou v ose $y$
  
  Integrální křivka $y=x^2+3$

  ![image](https://github.com/user-attachments/assets/76b291ef-6c12-4b3d-8d9c-bb12a4e9b52c)


## 2. Numerické řešení obyčejných diferenciálních rovnic

Budeme se zabývat numerickým výpočtem funkce $y=y(x)$, která na intervalu $<a,b>$ vyhovuje obyčejnou diferenciální rovnici prvního řádu

$y' (x)=f(x,y(x))$

Řešení je určeno až na jeden volitelný parametr. Řešení budeme požadovat splnění počáteční podmínky ve tvaru

$y(a)=c$

## 3. Eulerova metoda

Přiblížení řešení numerické metody se nekonstruuje jako spojitá funkce, ale postupně se generuje posloupnost uzlů $x_0=a,x_1,x_2,…$ a pro ně se stanoví čísla $y_0=c,y_1,y_2,…$ , která aproximují hodnoty přesného řešení $y(x_0 ),y(x_1 ),y(x_2 ),….$ Pro jednoduchost budeme předpokládat, že uzly jsou ekvidistantní s krokem $h$ a platí $x_n=b$, tj. $h=(b-a)/n a x_i=a+ih, i=0,1,2,…$
Rekurentní vzorce Eulerovy metody.

$y_0=c$

$y_{i+1}=y_i+hf(x_i, y_i), i=0, 1, ..., n-1$

```
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
  x^2 - 0.2 * y
}
# Počáteční podmínky
x0 <- -2
y0 <- -1
x_end <- 3

# Výpočet pro h = 1
h1 <- 1
result_h1 <- eulerova_metoda(f, x0, y0, h1, x_end)

cat("Výsledky pro h = 1:\n")
print(result_h1)


# Výpočet pro h = 0.5
h2 <- 0.5
result_h2 <- eulerova_metoda(f, x0, y0, h2, x_end)
cat("\nVýsledky pro h = 0.5:\n")
print(result_h2)

# Grafické zobrazení
plot(result_h1$x, result_h1$y, type = "o", col = "blue", pch = 16, lty = 1,
     xlab = "x", ylab = "y", main = "Eulerova metoda")
lines(result_h2$x, result_h2$y, type = "o", col = "red", pch = 16, lty = 2)
legend("topright", legend = c("h = 1", "h = 0.5"), col = c("blue", "red"), lty = 1:2, pch = 16)
```

## 4. Jednokrokové metody vyššího řádu

Heunova metoda a Rungeova-Kuttova metoda jsou jednokrokové metody, které dosahují vyššího řádu pomocí hodnot funkce f v bodech přibližného řešení z předchozích kroků. Při jejich použití dosáhneme srovnatelné přesnosti jako u Eulerovy metody při podstatně větším kroku h, tedy při výrazně menším celkovém objemu výpočtu.

### a. Heunova metoda

Heunova metoda, která je druhého řádu, je určena rekurentní vzorci

$y_0=c$

$k_1=hf(x_i,y_i)$

$k_2=hf(x_i+h,y_i+k_1)$

$y_{i+1} = y_i + \frac{1}{2} (k_1 + k_2), \quad i = 0, 1, 2, \dots, n-1$

```
heunova_metoda <- function(f, x0, y0, h, x_end) {
  n <- ceiling((x_end - x0) / h) # Počet kroků
  x <- seq(x0, x_end, by = h)    # Vektor hodnot x
  y <- numeric(length(x))        # Inicializace vektoru y
  y[1] <- y0                     # Počáteční podmínka
  
  for (i in 1:(length(x) - 1)) {
    k1 <- f(x[i], y[i])
    y_pred <- y[i] + h * k1
    k2 <- f(x[i + 1], y_pred)
    y[i + 1] <- y[i] + (h / 2) * (k1 + k2)
  }
  
  return(data.frame(x = x, y = y))
}

f <- function(x, y) {
  x^2 - 0.2 * y
}
x0 <- -2
y0 <- -1
x_end <- 3
h <- 1
result_heun <- heunova_metoda(f, x0, y0, h, x_end)
cat("Výsledky Heunovy metody:\n")
print(result_heun)

plot(result_heun$x, result_heun$y, type = "o", col = "blue", pch = 16, lty = 1,
     xlab = "x", ylab = "y", main = "Heunova metoda")
legend("topright", legend = c("Heunova metoda"), col = c("blue", "red"), lty = 1:2, pch = 16)
```
### b. Rungeova-Kuttova metoda čtvrtého řádu (RK4)

$y_0 = c$

$k_1 = h f(x_i, y_i)$

$k_2 = h f(x_i + \frac{1}{2} h, y_i + \frac{1}{2} k_1)$

$k_3 = h f(x_i + \frac{1}{2} h, y_i + \frac{1}{2} k_2)$

$k_4 = h f(x_i + h, y_i + k_3)$

$y_{i+1} = y_i + \frac{1}{6} (k_1 + 2k_2 + 2k_3 + k_4), \quad i = 0, 1, 2, \dots, n-1$

```
rungeova_kuttova_metoda <- function(f, x0, y0, h, x_end) {
  n <- ceiling((x_end - x0) / h) # Počet kroků
  x <- seq(x0, x_end, by = h)    # Vektor hodnot x
  y <- numeric(length(x))        # Inicializace vektoru y
  y[1] <- y0                     # Počáteční podmínka
  
  for (i in 1:(length(x) - 1)) {
    k1 <- h * f(x[i], y[i])
    k2 <- h * f(x[i] + h / 2, y[i] + k1 / 2)
    k3 <- h * f(x[i] + h / 2, y[i] + k2 / 2)
    k4 <- h * f(x[i] + h, y[i] + k3)
    y[i + 1] <- y[i] + (k1 + 2 * k2 + 2 * k3 + k4) / 6
  }
  
  return(data.frame(x = x, y = y))
}
f <- function(x, y) {
  x^2 - 0.2 * y
}
x0 <- -2
y0 <- -1
x_end <- 3
h <- 1
result_rk4 <- rungeova_kuttova_metoda(f, x0, y0, h, x_end)
cat("\nVýsledky Rungeova-kuttova metody:\n")
print(result_rk4)

plot(result_rk4$x, result_rk4$y, type = "o", col = "blue", pch = 16, lty = 1,
     xlab = "x", ylab = "y", main = "Rungeova-kuttova metoda")
legend("topright", legend = c("Rungeova-kuttova metoda"), col = c("blue", "red"), lty = 1:2, pch = 16)
```
