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

Intervaly postupně půlíme a jejich středy tvořící posloupnost ${x^k}$ konvergující ke kořenu $\\overline{x}$.

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





