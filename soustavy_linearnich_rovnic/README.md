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

  &nbsp;&nbsp;&nbsp;$m_{ik}^{(k-1)} = -\frac{a_{ik}^{(k-1)}}{a_{kk}^{(k-1)}}$

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pro $i = k+1, k+2, …, n$ přičteme $m_{ik}$-násobek k-tého řádku i-tému řádku

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      

  zpětný chod

## 4. LU rozklad

## 5
 








