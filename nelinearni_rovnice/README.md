# Numerické řešení nelineárních rovnic

## **1. Linerární rovnice a nelineární rovnice**

**Lineární rovnice** je rovnice, která lze ekvivaletními úpravami upravit na tvar $ax+b = 0$. Typicky obsahují členy. kde jsou proměnné v první mocnině a žádné násobky nebo složitější funkce. 

  Př. $y = 2x+3$

**Nelineární rovnice** je rovnice, která obsahuje složitější vztahy mezi proměnnými jako jsou kvadratické, exponenciální, logaritmické, ... 

  Př. $y = $x^2 +x+5

## **2. Numerické řešení nelineárních rovnic**
Zabývá se výpočtem reálných kořenů neliární rovnice $f(x)=0$

**Myšlenka numerické řešení**: 
Je-li funkce $f$ spojitá na intervalu $<a,b>$ a plátí-li

<p align="center">$f(a).f(b)<0$</p>

pak v intervalu $<a,b>$ leží alespoň jeden kořen rovnice $f(x)=0$.

Používáme iteraèní metody, které počítají posloupnost ${x^k}$ konvergující pro $k→ ∞$ ke kořenu $\\overline{x}$ .

## **3. Metoda bisekce = metoda půlení intervalu**
Plátí-li <p align="center">$f(a).f(b)<0$</p> pak v intervalu $<a,b>$ leží alespoň jeden kořen rovnice $f(x)=0$.

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

# Volání metody bisekce
root <- bisection_method(f, a, b, epsilon)
cat("Kořen přibližně:", root, "\n")

```

## **3. Metoda regula fasi**
Plátí-li <p align="center">$f(a).f(b)<0$</p> pak v intervalu $<a,b>$ leží alespoň jeden kořen rovnice $f(x)=0$.

Intervaly postupně zužujeme v průsečéku přímky, která spojuje body $(a,f(a)), (b, f(b))$ přímkou s osou x. Ten průsečík vypočítáme pdole vzorce $p_k = a_k - \frac{(b_k - a_k)}{f(b_k) - f(a_k)} f(a_k)
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
## **4. Newtonova metoda = Metoda sečen** 
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

Sestrojíme sečnu grafu funkce f procházející body (x_(k-1),f(x_(k-1) ))  a (x_k,f(x_k )). Tato přímka je dána rovnicí $y= \frac{f(b_0) - f(a_0)}{b_0 - a_0}(x - b_0) + f(b_0)$

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
