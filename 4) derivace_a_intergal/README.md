# Numerické derivování a integrace

## Derivace

### 1. Derivace 

**Derivace funkce v daném bodě** udává, jak rychle se mění hodnota funkce v okolí tohoto bodu.

**Derivace funkce v bodě** představuje směrnici tečny v daném bodě. Tečna je přímka, která se daného grafu dotýká právě v jednom bodě.

**Derivace funkce ** je jiná funkce, která předpisuje směrnice pro obecný argument x.

**Značení derivaci:** f', y'

Derivace funkce  $f$ v bodě $x_0$ a označujeme ji $f'(x_0)$



### 2. Numerické derivování

Vypočítáme přibližně hodnoty derivací $f'(x)$ a $f'' (x)$ v určitém bodě ze známých funkčních hodnot $f(x-h),f(x)$ a $f(x+h)$
$h$ je kroková vzdálenost, která je malý rozdíl mezi hodnotami $x$.

K funkci $f$ sestavíme interpolační polynom $p_n$ a ten pak derivujeme místo $f$. Používáme Newtonův tvar interpolačního polynomu.
- Pomocí lineárního interpolačního polynomu (2 uzly)
  $f'(x) \approx \frac{f(x+h) - f(x-h)}{h}$

  ```
  vypocet_prvni_derivace_linearniho_interpolacniho_polynomu <- function(f, x, h){
  prvni_derivace <- (f(x + h) - f(x)) / h
  return(prvni_derivace)
  }

  f <- function(x) {
  return(sin(x))
  }
  x <- 1
  h <- 0.01
  prvni_derivace_linearni <- vypocet_prvni_derivace_linearniho_interpolacniho_polynomu(f, x, h)
  cat("Přibližná hodnota první derivace (lineární interpolační polynom):", prvni_derivace_linearni, "\n")
  ```
- Pomocí kvadratického interpolačního polynomu (3 uzly)
  $f'(x) \approx \frac{f(x+h) - f(x-h)}{2h}$
  
  $f''(x) \approx \frac{f(x+h) - 2f(x) + f(x-h)}{h^2}$
  
  ```
  vypocet_prvni_derivace <- function(f, x, h){
  prvni_derivace <- (f(x + h) - f(x - h)) / (2 * h)
  return(prvni_derivace)
  }

  vypocet_druhe_derivace <- function(f, x, h){
  druha_derivace <- (f(x + h) - 2 * f(x) + f(x - h)) / (h^2)
  return(druha_derivace)
  }

  f <- function(x) {
  return(sin(x))
  }

  x <- 1
  h <- 0.01
  prvni_derivace_kvadraticka <- vypocet_prvni_derivace(f, x, h)
  druha_derivace <- vypocet_druhe_derivace(f, x, h)
  cat("Přibližná hodnota první derivace (kvadratický interpolační polynom):", prvni_derivace_kvadraticka, "\n")
  cat("Přibližná hodnota druhé derivace:", druha_derivace, "\n")
  ```
## Integrál

### 1. Integrál

Nechť $f$ je funkce definovaná pro $x∈(a,b)$. Pak funkci $F$, pro kterou platí $F'(x)=f(x)$ pro všechna $x∈(a,b)$, nazýváme primitivní funkcí k funkci $f$ na intervalu $(a,b)$.

Množinu všech primitivních funkcí k funkci $f$ na intervalu $I$ nazýváme neurčitým integrálem funkce $f$ a značíme ji symbolem

$\int f(x) \, \mathrm{d}x = F(x) + C$

$f$ … integrand nebo integrovaná funkce

$F(x)$ … primitivní funkce

$ⅆx$ … diferenciál, který integruje vzhledem k proměnné $x$

$C$ … integrační konstanta

$x$ … integrační proměnná

**Integrováním** podle proměnné x znamená hledání podle takové primitivní funkce, která je po zderivování podle proměnné x rovna původní integrované funkci

![image](https://github.com/user-attachments/assets/41d69515-1a4c-4029-955d-f01a096b0865)

### 2. Numerické integrace

Snažíme nalézt hodnotu určítého integrálu, který je složitý a dokonce nemožným. Je dána spojitá funkce $f$ na intervalu $<a,b>$ a máme vypočítat určítého integrálu. Základní myšlenkou je rozdělit interval $[a,b]$ na menší podintervaly, a na těchto podintervalech aproximovat funkci pomocí polynomu.

$$
I = \int_a^b f(x) \, dx
$$

Z geometrického pohledu představuje číslo I velikost plochy obrazce, který je vymezen grafem funkce. Numerické metody jsou navrhovány tak, že počítají velikost plochy přibližného obrazce pomocí několika funkčních hodnot. 

K funkci $f$ sestavíme interpolační polynom k funkci $f$.


### 3. Otevřené Newtonovy-Cotesovy vzorce 

$$
\int_a^b f(x) \, dx \approx \sum_{i=0}^n w_i f(x_i)
$$

### 4. Newtonovy-Cotesovy vzorce - Obdélníkové pravidlo

Jejím principem je, že integrál (plocha pod grafem funkce $f(x)$ ) aproximuje na intervalu  $<a,b>$ součtem obdélníků, kde každý obdelník má šírku danou intervalem, na kterém integrujeme, a výšku danou hodnotou funkce na jednom bodě (obvykle na levém nebo pravém okraji intervalu = střední bod intervalu).

$I_{SO} = h \left[ f\left(\frac{x_0 + x_1}{2}\right) + f\left(\frac{x_1 + x_2}{2}\right) + \cdots + f\left(\frac{x_{m-1} + x_m}{2}\right) \right] = h \sum_{i=1}^m f\left(\frac{x_{i-1} + x_i}{2}\right)$

### 5. Newtonovy-Cotesovy vzorce - Lichoběžníkové pravidlo

Jejím principem je aproximace plochy pod grafem funkce $f(x)$ lichoběžníkem a použitím jeho plochy jako přibližné hodnoty určitého funkce $f(x)$ na intervalu $<a,b>$.

$I_{SL} = h \left[ \frac{1}{2} f(x_0) + f(x_1) + \cdots + f(x_{m-1}) + \frac{1}{2} f(x_m) \right] = \frac{1}{2} h \left[ f(x_0) + 2 \sum_{i=1}^{m-1} f(x_i) + f(x_m) \right]$

![image](https://github.com/user-attachments/assets/74aca3f2-ba49-42d8-a7c3-19f04911600e)

### 6. Newtonovy-Cotesovy vzorce - Simpsonovo pravidlo

Simpsonovo pravidlo aproximuje určitý integrál použitím kvadratické funkce, která prochází třemi body (dvě podintervaly), což vede k aproximaci pomocí polynomu druhého stupně. Tato parabola je použita k aproximaci plochy pod křivkou funkce, čímž poskytuje přesnější výsledek než obdélníkové nebo lichoběžníkové pravidlo.

![image](https://github.com/user-attachments/assets/9df3c242-1bc4-40f3-87ab-c35c640771b8)

### 7. Gaussův-Legendrův kvadraturní vzorec


### 8. Rombergova kvadratura 



