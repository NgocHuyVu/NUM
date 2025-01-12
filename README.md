# Numerické metody

## 1. Numerické řešení nelineárních rovnic

Řešíme nelineární rovnice, která má jednu neznámou proměnnou.

Pokud zadaná rovnice $f(x)=0 $ je rovnice prvního stupeň, používáme **metodu bisekce = metodu půlení intervalu, metodu regula fasi, Newtonovou metodu = metodu tečen, metodu sečen**

Pokud zadaná rovnice je rovnice polynomu n-tého stupně $P_n(x)$, budeme použit **Honerovo-Newtonovou metodu.**

## 2. Numerické řešení sostavy lineárních rovnic

Řešíme soustava lineárních rovnice, která má dva neznamé proměnné. Sousatavu lineárních rovnic lze napsat pomocí matic následovně.

Máme 2 typy
- **Přímé metody (Gaussova eliminační metoda, LU rozklad)** poskytují **přesné řešení** v konečném počtu kroků, pokud během výpočtu nezaokrouhlujeme.
- **Nepřímé iterační metody (Gaussova-Seidelova metoda, Jacobiova metoda)** získáme pouze **aproximativní** řešení.


## 3. Interpolace a aproximace

Neznáme předem předpis funkce, máme pouze zadané funkční hodnoty v $n+1$ uzlových bodech (x_i, y_i). Snažíme hledat jednoudušší funkcim aby můžeme najít přbližnou hodnotu $y$ v bodech mezi hodnotami $x$, tkeré nejsou předem známy.

Lze rozlišovat na dvě úlohy
- **Interpolace**: Hledáme funkci $\phi$, pro niž je $\phi(x_i) = f_i, i = 0, 1, \dots, n$ Interpolační funkce **musí** procházet zadanými body.
- **Aproximace**: Hledáme funkci $\phi$, pro niž je $\phi(x_i) \approx f_i, i = 0, 1, \dots, n$, kde přibližná rovnost $\approx$ je určena tak, aby součet součet druhých mocnin odchylek mezi předepsanými hodnotami $f_i$ a předpokládávanými hodnotami $\phi(x_i)$ byl minimální. Aproximační funkce **nemusí** procházet zadanými body.

## 4. Derivace a integrál

### a. Derivace
Vypočítáme přibližně hodnoty derivací $f'(x)$ a $f'' (x)$ v určitém bodě ze známých funkčních hodnot $f(x-h),f(x)$ a $f(x+h)$
$h$ je kroková vzdálenost, která je malý rozdíl mezi hodnotami $x$.

K funkci $f$ sestavíme interpolační polynom $p_n$ a ten pak derivujeme místo $f$. Používáme Newtonův tvar interpolačního polynomu.

### b. Integrál
Snažíme nalézt hodnotu určítého integrálu, který je složitý a dokonce nemožným. Je dána spojitá funkce $f$ na intervalu $<a,b>$ a máme vypočítat určítého integrálu. Základní myšlenkou je rozdělit interval $[a,b]$ na menší podintervaly, a na těchto podintervalech aproximovat funkci pomocí polynomu.

$$
I = \int_a^b f(x) \, dx
$$

Z geometrického pohledu představuje číslo I velikost plochy obrazce, který je vymezen grafem funkce. Numerické metody jsou navrhovány tak, že počítají velikost plochy přibližného obrazce pomocí několika funkčních hodnot. 

K funkci $f$ sestavíme interpolační polynom k funkci $f$.
