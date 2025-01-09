# Interpolace a aproximace funkcí
  
## 1. Úvod

Častokrát máme co do činění s funkcemi, které jsme získali jako výsledky laboratorních měření a u kterých, proto máme k dispozici jen jejich hodnoty v diskrétních bodech, popřípadě s funkcemi, které jsou příliš složité a obtížné se s nimi pracuje. V takových případech je potřeba složitou funkci f jinou, jednodušší funkcí φ. 

Lze rozlišovat na dvě úlohy
- **Interpolace**: Hledáme funkci $\phi$, pro niž je $\phi(x_i) = f_i, i = 0, 1, \dots, n$
- **Aproximace**: Hledáme funkci $\phi$, pro niž je $\phi(x_i) \approx f_i, i = 0, 1, \dots, n$, kde přibližná rovnost $\approx$ je určena tak, aby součet součet druhých mocnin odchylek mezi předepsanými hodnotami $f_i$ a předpokládávanými hodnotami $\phi(x_i)$ byl miniální.
  
## 2. Interpolace

### a. Zadání

Řešíme funkce, které jsme získali jako výsledky laboratorních měření, proto se nejedná o spojitou funkci, ale o diskrétní funkci. Neznáme předem předpis funkce, známe pouze některé hodnoty $y_i$ v daných bodech $x_i$. 

Máme $x_0< x_1< x_2<⋯< x_n$, což jsou body, které mohou, ale nemusí být rovnoměrně rozloženy. 

Cílem interpolace je najít přibližnou hodnotu y v bodech mezi hodnotami x, které nejsou předem známy. 

Nechť tedy funkce, kterou chceme aproximovat, je zadaná funkčními hodnotami v n + 1 uzlových bodech:

| $x_0$ | $x_1$ | ... | $x_{n-1}$ | $x_n$ |
|--------|---------|-----------|-------------|---------|
| $f_0$ | $f_1$ | ... | $f_{n-1}$ | $f_n$ |

Funkční hodnota v bodě $x_i$ je v tabulce označena jako $f_i$. Dále označíme $P_n$ množinu všech polynomů n-tého stupně. Bázi tohoto prostoru tvoří polynomy ${1,x,x^2,…,x^n}$. Naším cílem bude zkonstruovat interpolační polynom $p(x)∈P_n$.

### b. Lagrangeův interpolační polynom

Když je dáno $n+1$ uzlových bodů $x_0, x_1, \dots, x_n \in \langle a, b \rangle$ a $n+1$ funkčních hodnot $f_0, f_1, ..., f_n \in  R$, pak existuje právě jden polynom $p \in P_n$ tak, že $p(x_i)=f_i$. V Lagrangeově reprezentaci má tento polynom tvar

$L(x) = \sum_{i=0}^{n} l_i(x) f_i$

kde

$l_i(x) = \prod_{j=0, j \neq i}^{n} \frac{x - x_j}{x_i - x_j}$

Např. 

$P(1)=1. P(2) = 1, P(3)=2, P(4)=3, P(5)=5$

$P(x) = \frac{(x - 2)(x - 3)(x - 4)(x - 5)}{(1 - 2)(1 - 3)(1 - 4)(1 - 5)}  + 4 \frac{(x - 1)(x - 3)(x - 4)(x - 5)}{(2 - 1)(2 - 3)(2 - 4)(2 - 5)} \\ + 9 \frac{(x - 1)(x - 2)(x - 4)(x - 5)}{(3 - 1)(3 - 2)(3 - 4)(3 - 5)} + 16 \frac{(x - 1)(x - 2)(x - 3)(x - 5)}{(4 - 1)(4 - 2)(4 - 3)(4 - 5)} \\ + 25 \frac{(x - 1)(x - 2)(x - 3)(x - 4)}{(5 - 1)(5 - 2)(5 - 3)(5 - 4)}$

Algoritmus
- Vstup
- Pro $i =0, 1, ..., n$
  
  &nbsp;&nbsp;&nbsp; $l_i(x) = \prod_{j=0, j \neq i}^{n} \frac{x - x_j}{x_i - x_j}$
  
   &nbsp;&nbsp;&nbsp; $L(x) = \sum_{i=0}^{n} l_i(x) f_i$
- Výstup: $L(x)$

```
Lagrange<-function(t,x,y){
  n<-length(x)
  soucet_Lx <-0
  for(i in 1:n){
    soucin_li_x<-1
    for(j in 1:n){
      if(j!=i){ 
        soucin_li_x<-soucin_li_x*(t-x[j])/(x[i]-x[j])
      }
    }
    soucet_Lx<-soucet_Lx+y[i]*soucin_li_x
  }
  # Vrátí interpolovanou hodnotu v bodě t
  return(soucet_Lx)
}

# Zadané hodnoty z tabulky
x <- c(0, 1.5, 2)
y <- c(0.000, 0.682, 0.841)

#Bod, pro který chceme vypočítat přibližnou hodnotu y
t <- 1

P_t <- Lagrange(t, x, y)
print(P_t)

# Vizualizace
# červené body = počáteční hodnoty
# modrá čára znázorňuje interpolovanou funkci, spojuje všechny body, 
# které jsou výsledkem aplikace Lagrageova polynomu na růžné hodnoty t
plot(x, y, col='red', ylim=c(-1,1))
# t <- seq(0,2*pi, by=0.001)
lines(t, Lagrange(t, x, y), col='blue')
```

### c. Newtonův interpolační polynom

Pomocí Newtonova interpolační polynomu, pokud přídáme se další uzlový bod, pak nemusíme znovu přepočítat všechny polynomy $l_i(x)$

Tvar Newtonova interpolačního polynomu

$N(x)=a_0+a_1(x-x_0)+a_2(x-x_0)(x-x_1)+...+a_n(x-x_0)(x-x_1)...(x-x_{n-1}$

Koeficeinty $a_0, a_1, a_n$ lze vypočítat pomocí **poměrných diferencí**.

např. 
Hledáme polynom procházející body: $[-2, -39], [0,3], [1,6], [3,36]$
| $ x_i$        | $f(x_i)$       | Diference 1. řádu  | Diference 2. řádu   | Diference 3. řádu   |
|------------------|---------------------|-------------------------|------------------------|------------------------|
| $x_0 = -2$   | $f(x_0) = -39 = a_0$ |                         |                        |                        |
| $ x_1 = 0$   |$f(x_1) = 3$   |$\frac{3 - (-39)}{0 - (-2)} = 21 = a_1$|                        |                        |
| $x_2 = 1$    |$f(x_2) = 6$   |$\frac{6 - 3}{1 - 0} = 3$  |$\frac{3 - 21}{1 - (-2)} = -6 = a_2$|                        |
| $x_3 = 3$    |$f(x_3) = 36$  |$\frac{36 - 6}{3 - 1} = 15$ |$\frac{15 - 3}{3 - 0} = 4$ | $\frac{4 - (-6)}{3 - (-2)} = 2 = a_3$|

$P_3(x)=a_0+a_1(x-x_0)+a_2(x-x_0)(x-x_1)+a_3(x-x_0)(x-x_1)(x-x_2)$

$P_3(x)=-39+21(x+2)-6(x+2)(x-0)+2(x+2)(x-0)(x-1)$

Algoritmus:
- Vstup:
- Pro $i = 0, 1, ..., n$
  $D_i^0 = f_i$
- Pro $k = 1, 2, ..., n$
  
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pro $i=k, k+1, ..., n$
  
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $D_i^k = \frac{D_i^{k-1} - D_{i-1}^{k-1}}{x_i - x_{i-k}}$
  
- Výstup: $a_0=D_0^0$
  
```
# Vypočítá koeficienty Newtonova interpolovaného polynomu 
# na základě dvou vektorů x a y, které obsahují hodnoty x a y daných bodů.
# suma = N(xi) suma všech členů polynomu již vypočtených v předchozích iteracích
# nasobic = (xi-xj) násobí postupně  všechny rozdíly,které odpovídájí jedbnotlivým kořenům v členech polynomu
NewtonPolCoef <- function(x, y){
  n <- length(x)
  coef <- numeric(n)
  coef[1] <- y[1]
  if(n > 1){
    for(i in 2:n){
      suma <- 0
      nasobic <- 1
      for(j in 1:(i-1)){
        suma <- suma + coef[j]*nasobic
        nasobic <- nasobic*(x[i]-x[j])
      }
      coef[i] <- (y[i]-suma)/nasobic
    }
  }
  return(coef)
}
# Vypočítá hodnotu Newtonova interpolovaného polynomu v bodě t
NewtonPolValue <- function(t, x, coef){
  n <- length(coef)
  res <- coef[n]
  for(i in (n-1):1) res <- res*(t-x[i])+coef[i]
  return(res)
}


# Zadané hodnoty z tabulky
x <- c(-1, 0, 1, 3)
y <- c(2, 1, 2, 0)

# Výpočet koeficientů Newtonova polynomu
coef <- NewtonPolCoef(x, y)
print("Koeficienty Newtonova polynomu:")
print(coef)

# Výpočet hodnoty interpolovaného polynomu v bodě α = 2
#alpha <- 2
P_alpha <- NewtonPolValue(alpha, x, coef)
print(paste("Hodnota interpolovaného polynomu v bodě α =", alpha, "je:", P_alpha))

plot(x, y, col='red', ylim=c(-1,1))
alpha <- seq(0,2*pi, by=0.001)
lines(t, NewtonPolValue(t, x, NewtonPolCoef(x, y)), col='orange')
```
## 3. Aproximace metodou nejmenších čtverců

Najděme funkci $y=f(x)$ aby součet druhých mocnin odchylek mezi známými hodnotami $y_i$ a hodnotami funkce $f(x_i)$ byl co nejmenší. 

# Původní data
p <- c(0.1, 0.2, 0.28, 0.41, 0.98, 1.39, 1.93, 2.75, 3.01, 3.51)
a <- c(0.089, 0.127, 0.144, 0.163, 0.189, 0.198, 0.206, 0.208, 0.209, 0.210)

# Definice modelu
model <- function(p, am, b) {
  am / (1 + b * p)
}

# Vytvoření funkce pro nelineární regresi
nll <- function(pars, p, a) {
  am <- pars[1]
  b <- pars[2]
  sum((a - model(p, am, b))^2)
}

# Počáteční odhady pro am a b
start_vals <- c(0.1, 0.1)

# Optimalizace parametru pomocí nelineární regrese
fit <- optim(start_vals, nll, p = p, a = a)

# Odhadnuté hodnoty parametrů
am_est <- fit$par[1]
b_est <- fit$par[2]

# Vykreslení původních dat, modelu a interpolačního polynomu
plot(p, a, col = "red", pch = 16, xlab = "p [MPa]", ylab = "a")
lines(p, model(p, am_est, b_est), col = "blue", lwd = 2)

# Interpolace polynomem
polynomial <- lm(a ~ poly(p, 2))
lines(p, predict(polynomial), col = "green", lwd = 2)

# Zobrazení průsečíku modelu a interpolačního polynomu
intersection <- uniroot(function(x) model(x, am_est, b_est) - predict(polynomial, data.frame(p = x)), c(0, 4))$root
abline(h = model(intersection, am_est, b_est), col = "purple", lty = 2)
abline(v = intersection, col = "purple", lty = 2)

# Výsledek
intersection

