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
  
  dokud $\frac{b^{(k+1)} - a^{(k+1)}}{2}>ϵ$ nebo $\frac{b^{(k+1)} - a^{(k+1)}}{2^k}≤ϵ

Výstup: poslední hodnota $x^k+1$





