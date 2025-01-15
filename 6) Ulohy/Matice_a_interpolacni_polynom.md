# Matice a interpolace

## Zadání úlohy

Nechť $A$ je čtvercová matice řádu $n$ a $\vec{y}$ je vektor délky $n$, kde $n = 10$. Prvky matice $A$ a vektoru $\vec{y}$ jsou definovány následovně:

\[
A[i, j] = \cos((i - 1) j) - j,
\]

\[
\vec{y}[i] = \sin(i),
\]

kde $i$ a $j$ jsou celá čísla od 1 do $n$.

## Zadání dílčích úloh

1. Řešte soustavu lineárních rovnic $A \vec{x} = \vec{y}$, kde $A$ je matice definovaná výše, $\vec{x}$ je neznámý vektor a $\vec{y}$ je vektor definovaný výše.

2. Interpolujte polynomem $p(x)$ množinu bodů danou vektory $\vec{x}$ a $\vec{y}$.

    (a) Vykreslete $p(x)$ a určete, kde se graf $p(x)$ protíná s osou $y$.

    (b) Určete

    \[
    \int_{x_{\text{MIN}}}^{x_{\text{MAX}}} p(x) \, dx,
    \]

    kde $x_{\text{MIN}}$ je nejmenší prvek vektoru $\vec{x}$ a $x_{\text{MAX}}$ je jeho největší prvek.
