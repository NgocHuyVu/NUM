# Numerické derivování a integrace

## Derivace

### 1. Derivace 

**Derivace funkce v daném bodě** udává, jak rychle se mění hodnota funkce v okolí tohoto bodu.

**Derivace funkce v bodě** představuje směrnici tečny v daném bodě. Tečna je přímka, která se daného grafu dotýká právě v jednom bodě.

**Derivace funkce ** je jiná funkce, která předpisuje směrnice pro obecný argument x.

**Značení derivaci:** f', \, y'

Derivace funkce  $f$ v bodě $x_0$ a označujeme ji $f'(x_0)$

### 2. Numerické derivování

Snažíme nalézt hodnotu určítého integrálu, který je složitý a dokonce nemožným. Je dána spojitá funkce $f$ na intervalu $<a,b>$ a máme vypočítat určítého integrálu

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

I_{SL} = h \left[ \frac{1}{2} f(x_0) + f(x_1) + \cdots + f(x_{m-1}) + \frac{1}{2} f(x_m) \right] = \frac{1}{2} h \left[ f(x_0) + 2 \sum_{i=1}^{m-1} f(x_i) + f(x_m) \right]

![image](https://github.com/user-attachments/assets/74aca3f2-ba49-42d8-a7c3-19f04911600e)

### 6. Newtonovy-Cotesovy vzorce - Simpsonovo pravidlo

Simpsonovo pravidlo aproximuje určitý integrál použitím kvadratické funkce, která prochází třemi body (dvě podintervaly), což vede k aproximaci pomocí polynomu druhého stupně. Tato parabola je použita k aproximaci plochy pod křivkou funkce, čímž poskytuje přesnější výsledek než obdélníkové nebo lichoběžníkové pravidlo.

![image](https://github.com/user-attachments/assets/d475e539-6e31-452e-a07a-748ce43ab87b)

### 7. Gaussův-Legendrův kvadraturní vzorec

### 8. Rombergova kvadratura 

## Integrál

