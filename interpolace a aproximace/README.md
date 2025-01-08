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

### c. Newtonův interpolační polynom

## 3. Aproximace metodou nejmenších čtverců
