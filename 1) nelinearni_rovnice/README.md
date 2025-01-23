# Numerické řešení nelineárních rovnic

## **1. Linerární rovnice a nelineární rovnice**

**Lineární rovnice** je rovnice, která lze ekvivalentními úpravami upravit na tvar $ax+b = 0$. Typicky obsahují členy, kde jsou proměnné v první mocnině a žádné násobky nebo složitější funkce. 

  Př. $y = 2x+3$

**Nelineární rovnice** je rovnice, která obsahuje složitější vztahy mezi proměnnými jako jsou kvadratické, exponenciální, logaritmické, ... 

  Př. $y=x^2 +x+5$

## **2. Numerické řešení nelineárních rovnic**
Zabývá se výpočtem reálných kořenů nelineární rovnice $f(x)=0$

**Myšlenka numerické řešení**: 
Je-li funkce $f$ spojitá na intervalu $<a,b>$ a plátí-li

<p align="center">$f(a).f(b)<0$</p>

pak v intervalu $<a,b>$ leží alespoň jeden kořen rovnice $f(x)=0$.

Používáme iterační metody, které počítají posloupnost ${x^k}$ konvergující pro $k→ ∞$ ke kořenu $\\overline{x}$ .

## **3. Metoda bisekce = metoda půlení intervalu**
Plátí-li $f(a).f(b)<0$ pak v intervalu $<a,b>$ leží alespoň jeden kořen rovnice $f(x)=0$.

Intervaly postupně půlíme a jejich středy tvořící posloupnost ${x^k}$ konvergující ke kořenu $\\overline{x}$. Výpočet ukončíme při dosazení zadané přesnosti ϵ

Algoritmus:

- Vstup: $f, a^0, b^0, ϵ>0$
- Podmínka: $f(x).f(b)<0$
- Pro $k=1, 2, ...$ opakujeme
  
  $x^{(k+1)} \coloneqq \frac{a^k + b^k}{2}$

  Je-li $f(x^k+1)=0$, potom skončíme a jdeme na Výstup
  
  Je-li $f(a^k)f(x^k+1)<0$, potom $a^k+1:= a^k, b^k+1:= x^k+1$
  
  Je-li $f(b^k)f(x^k+1)<0$, potom $a^k+1:= x^k+1, b^k+1:= b^k$
  
  dokud $\frac{b^{(k+1)} - a^{(k+1)}}{2}>ϵ$ nebo $\frac{b^{(k+1)} - a^{(k+1)}}{2^k}≤ϵ$

Výstup: poslední hodnota $x^k+1$

Př. Řešte nelineární rovnici $x \arctan(x) = 1$ s přeností $10^{-2}$
```
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
```

## **3. Metoda regula fasi**
Plátí-li $f(a).f(b)<0$ pak v intervalu $<a,b>$ leží alespoň jeden kořen rovnice $f(x)=0$.

Intervaly postupně zužujeme v průsečíku přímky, která spojuje body $(a,f(a)), (b, f(b))$ přímkou s osou x. Ten průsečík vypočítáme podle vzorce $p_k = a_k - \frac{(b_k - a_k)}{f(b_k) - f(a_k)} f(a_k)
    = b_k - \frac{(b_k - a_k)}{f(b_k) - f(a_k)} f(b_k)$



Výpočet ukončíme při dosazení zadané přesnosti ϵ.

Algoritmus:

- Vstup: $f, a^0, b^0, ϵ>0$
- Podmínka: $f(x).f(b)<0$
- $x_1 \coloneqq a$
- Pro $k=1, 2, ...$ opakujeme
  $p \coloneqq a - \frac{(b-a)}{f(b)-f(a)} \cdot f(a)$
  
  $x_k \coloneqq p$
  
  Je-li $f(a)*f(b)=0$, potom skončíme a jdeme na Výstup
  
  Je-li $f(a)f(p)<0$, potom $a:= a, b:= p$
  
  Je-li $f(b)f(p)<0$, potom $a:= p, b:= b$
  
  dokud $f(x)$

Výstup: poslední hodnota $x^k$

```
regula_fasi <- function(f, a, b, e) {
  plot(function(x) f(x), a, b, col = "blue", lwd = 2, main = "Regula Falsi Method")
  
  p <- a
  iteration <- 0
  
  print(paste("Starting interval: a =", a, "b =", b))
  
  while (abs(f(p)) > e) {
    p <- a - ((b - a) / (f(b) - f(a))) * f(a)
    
    iteration <- iteration + 1
    print(paste("Iteration", iteration, ": a =", a, "b =", b, "p =", p, "f(p) =", f(p)))
    
    if (f(a) * f(p) < 0) {
      b <- p
    } else {
      a <- p
    }
  }
  
  abline(v = p, col = 'blue', lwd = 4)
  
  return(paste("Kořen přibližně:", p))
}

f <- function(x) {
  return(x * atan(x) - 1)
}
print(regula_fasi(f, 1, 2, 1e-9))
```
## **4. Newtonova metoda = Metoda tečen** 
Je založena na použití tečny k aproximaci funkce. Výpočet iterativně využívá derivace funkce $f(x)$, která určuje sklon tečny v bodě aktuálního odhadu kořene. Nahradíme levou stranu rovnice $f(x) = 0$ Taylorovým polynomem 1. stupně. Obdržíme $f(x_0) + f'(x_0)(x - x_0) = 0$.

Když odtud spočteme $x$ a přípojíme indexy, obdržíme Newtonovu iterační formuli

$x_k = x_{k-1} - \frac{f(x_{k-1})}{f'(x_{k-1})}$

Algoritmus
- Vstup: $a, b, f(x),x_0, ϵ>0$
- Pro $k=1, 2, ...$
  
  $f'(x_{k-1})$

  $x_k = x_{k-1} - \frac{f(x_{k-1})}{f'(x_{k-1})}$
  
  dokud $|x_k - x_{k-1}| > \epsilon \$
- Výstup: $x_k$

```
newton_method <- function(f, f_prime, x0, epsilon) {
  x_prev <- x0
  print(paste("Aktuální aproximace:", x_prev ))
  repeat {
    x_next <- x_prev - f(x_prev) / f_prime(x_prev)
    if (abs(x_next - x_prev) < epsilon) {
      break
    }
    x_prev <- x_next
    print(paste("Aktuální aproximace:", x_next))
  }
  
  return(paste("Kořen přibližně:", x_next))
}

f <- function(x) {
  return(x - exp(-x))
}

f_derivace <- function(x) {
  return(1 + exp(-x))
}

result <- newton_method(f, f_derivace, 1, 10^(-4))
print(result)
```

## **5. Metoda sečen**

Je variace Newtonovy metody pro funkce $f$, které nejsou diferencovatelné, tedy pro které nemáme možnost počítat derivaci. Derivaci v ní nahradíme poměrnou diferencí.

Sestrojíme sečnu grafu funkce f procházející body $(x_(k-1),f(x_(k-1) ))$  a $(x_k,f(x_k ))$. Tato přímka je dána rovnicí $y= \frac{f(b_0) - f(a_0)}{b_0 - a_0}(x - b_0) + f(b_0)$

Průsečíkem této přímky s osou x je bod $(c, 0)$, kde $c = b_0 - \frac{(b_0 - a_0)}{f(b_0) - f(a_0)} \cdot f(b_0)$.

Položíme $b_1 \coloneqq c$ a $a_1 \coloneqq b_0$.

Algoritmus
- Vstup: $a, b, f(x),x_0, x_1 ϵ>0$
- Pro $k=1, 2, ...$
  
  $x_{k+1} = x_k - f(x_k) \cdot \frac{x_k - x_{k-1}}{f(x_k) - f(x_{k-1})}$
  
  dokud $|x_{k+1} - x_k| > \epsilon \$
  
- Výstup: $x_k+1$
  
```
metoda_secen <- function(f, x0, x1, delta) {
  k <- 1
  results <- c(x0, x1)
  
  while (TRUE) {
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
```
# Numerické řešení algebraické rovnic polynomu n-tého stupně $P_n(x)=0$

## 1. Mnohočleny $P_n(x)=0$

**Polynom = mnohočlen** je matematický výraz složený z proměnné, konstant a operací sčítání, odčítání a násobení.

Výraz ve obecném tvaru $a_n x^n + a_{n-1} x^{n-1} + \cdots + a_2 x^2 + a_1 x + a_0$ nazýváme mnohočlenem (polynomem) n-tého stupně s jednou proměnnou $x \in \mathbb{R}$

$a_n, a_{n-1}, ..., a_0$ jsou koeficienty mnohočlenu
    
Kořenem mnohočlenu $P_n(x)$ je takové číslo $b \in \mathbb{R}$

Stupeň polynomu $P_n(x)$ je nejvyšší mocnina proměnné x u níž je nenulový koeficient. Udává, jak moc je polynom "roztačen" ve směru proměnné

## 2. Numerické řešení nelineárních rovnic polynomu n-tého stupně

Zadání je polynom n-tého stupně $P_n(x)=0$

$a_n x^n + a_{n-1} x^{n-1} + \cdots + a_2 x^2 + a_1 x + a_0 = 0$

Nalezeme aproximace kořenů.

## 3. Honerovo-Newtonova metoda
Kombinuje dvě metody
- **Hornerovo schéma** vypočítá hodnotu polynomu $P(x)$ a jeho derivaci $P'(x)$ v určítém bodě x. Díky tomu minimalizuje počet násobení a sčítání potřebných k výpočtu.
- **Newtonova metoda** využívá derivace funkce k aproximaci kořene.

Postup Horner-Newtonovy metody 
- Používáme Hornerovo schéma k výpočtu hodnoty polynomu $P(x)$ a hodnoty derivace $P'(x)$ v aktuálním bodě x.
  
  Obecný polynom můžeme vyjádřit jako

  $P(x) = a_n x^n + a_{n-1} x^{n-1} + \cdots + a_1 x + a_0$

  Hornerovo schéma přepisuje tento polynom do rekurzivní podoby:

  $P(x) = (((a_n x + a_{n-1})x + a_{n-2})x + \cdots + a_1)x + a_0$

  Shrnuje postupně jednotlivé členy polynomu, začíná od nejvyšší mocniny a pokračuje k nižším mocninám:

  $b_n=a_n$
  
  Iterativně vypočítáme
  
  $b_{i-1}=b_i.x+a_{i-1}$ pro $i = ,n , n-1, ...,1

  Konečná hodnota $b_0$ je P(x)

  Potom iterativně vypočítáme hodnotu derivaci $P'(x)$

  $c_{i-1} = c_i.x+b_{i-1}$ pro $i=n-1, n-2, ..., 1$

  kde $c_{i-1}=b_n$
- Aplikujme do Newtonovy vzorce
  
  $x_k = x_{k-1} - \frac{P(x)}{P'(x)}$
- Opakujeme, dokud $x_k$ není menší než požadovaná přenost

Např. 

$P(x) = 2x^3 - 6x^2 + 2x - 1$

Pro x = 3:

Výpočet P(x):

$b_3=a_3=2, b_2= b_3.x-a_{3-2}=2.3-6=0, b_1=2, b_0=5$

P(3) = 5

Výpočet $P'(x)$:

$c_2=b_3=2, c_1=c_2.3+b_2=6, c_0=c_1.3+b_1=20$

$P'(3)=20$

Př. Nalezněte kořenů polynomu $P(x)=x^5 - 8x^4 - 72x^3 + 382^2 +727x +2310$
```
NewtonHorner <- function(a, xstart, acc=0.0000001){
  n <- length(a)
  x <- xstart
  citac <- 0
  repeat{
    citac <- citac + 1
    y <- a[n]
    yd <- y
    for(i in (n-1):2){
      y <- y*x+a[i]
      yd <- yd*x+y
    }
    y <- y*x+a[1]
    
    # Výpočet korekce Newtonovou metodou
    x <- x-(y/yd)
    
    cat(citac, ": x =", x, ", P(x) =", y, ", P'(x) =", yd, "\n")
    
    if(abs(dx) < acc) {
      print(citac)
      return(x)
    }
  }
}
NewtonHorner(c(1,-8,-72,382, 727, 2310), 1)
```


