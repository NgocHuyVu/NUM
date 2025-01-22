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

Neznáme předem předpis funkce, máme pouze zadané funkční hodnoty v $n+1$ uzlových bodech (x_i, y_i). Snažíme hledat jednoudušší funkci, aby můžeme najít přbližnou hodnotu $y$ v bodech mezi hodnotami $x$, které nejsou předem známy.

Lze rozlišovat na dvě úlohy
- **Interpolace**: Hledáme funkci $\phi$, pro niž je $\phi(x_i) = f_i, i = 0, 1, \dots, n$ Interpolační funkce **musí** procházet zadanými body.
- **Aproximace**: Hledáme funkci $\phi$, pro niž je $\phi(x_i) \approx f_i, i = 0, 1, \dots, n$, kde přibližná rovnost $\approx$ je určena tak, aby součet součet druhých mocnin odchylek mezi předepsanými hodnotami $f_i$ a předpokládánými hodnotami $\phi(x_i)$ byl minimální. Aproximační funkce **nemusí** procházet zadanými body.

## 4. Derivace a integrál

### a. Derivace
Vypočítáme přibližně hodnoty derivací $f'(x)$ a $f'' (x)$ v určitém bodě ze známých funkčních hodnot $f(x-h),f(x)$ a $f(x+h)$
$h$ je kroková vzdálenost, která je malý rozdíl mezi hodnotami $x$.

Geoemtricky derivace vyjadřuje směrnici tečny ke grafu funkce v bodě. Při numerické derivaci je tečna nahrazena sečnou vedenou zanámými body na grafu funkce. K funkci $f$ sestavíme interpolační polynom $p_n$ a ten pak derivujeme místo $f$. Používáme Newtonův tvar interpolačního polynomu. K funkci $f$ sestavíme interpolační polynom $p_n$ a ten pak derivujeme místo $f$. Používáme Newtonův tvar interpolačního polynomu.

### b. Integrál
Snažíme nalézt hodnotu určítého integrálu, který je složitý a dokonce nemožným. Je dána spojitá funkce $f$ na intervalu $<a,b>$ a máme vypočítat určítého integrálu. Základní myšlenkou je rozdělit interval $[a,b]$ na menší podintervaly, a na těchto podintervalech aproximovat funkci pomocí polynomu.

$$
I = \int_a^b f(x) \, dx
$$

Z geometrického pohledu představuje číslo I velikost plochy obrazce, který je vymezen grafem funkce. Numerické metody jsou navrhovány tak, že počítají velikost plochy přibližného obrazce pomocí několika funkčních hodnot. 

K funkci $f$ sestavíme interpolační polynom k funkci $f$.

## 5. Obyčejné diferenciální rovnice

Budeme se zabývat numerickým výpočtem funkce $y=y(x)$, která na intervalu $<a,b>$ vyhovuje obyčejnou diferenciální rovnici prvního řádu

$y' (x)=f(x,y(x))$

Řešení je určeno až na jeden volitelný parametr. Řešení budeme požadovat splnění počáteční podmínky ve tvaru

$y(a)=c$

Přiblížení řešení numerické metody se nekonstruuje jako spojitá funkce, ale postupně se generuje posloupnost uzlů $x_0=a,x_1,x_2,…$ a pro ně se stanoví čísla $y_0=c,y_1,y_2,…$ , která aproximují hodnoty přesného řešení $y(x_0 ),y(x_1 ),y(x_2 ),….$ Pro jednoduchost budeme předpokládat, že uzly jsou ekvidistantní s krokem $h$ a platí $x_n=b$, tj. $h=(b-a)/n$ a $x_i=a+ih, i=0,1,2,…$

Máme 3 metody 

- **Eulerova metoda**- metoda prvního řádu
- **Heunova metoda**- metoda druhého řádu
- **Rungeova-Kuttova metoda** - metoda čtvrtého řádu

