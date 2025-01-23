# Proměnné

Proměnné slouží pro ukládní hodnot.

R nemá příkaz pro deklaraci proměnné. Proměnná se vytvoří hned, kdy jí poprvé přířadíme hodnotu. K přiřažení hodnoty používáme znaménko <-

Pro výstup (tisk) hodnoty proměnné stačí napsat název proměnné.

```
name <- "John"
age <- 40

name   # output "John"
age    # output 40
print(name)
```

# Datové typy

- **numeric** - reálné číslo, př. 10.5, 55, 787
  - **integer** - celé číslo, u celách čísel se a konci píše L, aby bylo rozlišeno od reálných čísel, př. 1L, 55L, 100L
  - **double **- reálné číslo, př. 5.23675
   
- **complex** - komplexní číslo (př. 5+2i)
  ```
  x <- 10.5   # numeric
  y <- 10L    # integer
  z <- 1i     # complex
  ```
- **character** - řetězec
- **logical** - logická hodnota (TRUE nebo False)

# minx() a max()
```
max(5, 10, 15)
min(5, 10, 15)
```

# Operátory
- $==$
- $!=$
- $<$
- $>$
- $>=$
- $<=$
- $|$
- &

# If-Else

## if 

```
a <- 33
b <- 200

if (b > a) {
  print("b is greater than a")
}
```
## if-else
```
a <- 33
b <- 33

if (b > a) {
  print("b is greater than a")
} else if (a == b) {
  print ("a and b are equal")
}
```

## if-else-ele-...
```
a <- 200
b <- 33

if (b > a) {
  print("b is greater than a")
} else if (a == b) {
  print("a and b are equal")
} else {
  print("a is greater than b")
}
```

# While

Provede sadu příkazů, pokud je podmínka TRUE

```
i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
}
```

Pomocí příkazu **break** můžeme zastavit smyčku, i když je podmínka while TRUE:

```
i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
  if (i == 4) {
    break
  }
}
```
Pomocí příkazu **next**  můžeme přeskočit iteraci bez ukončení cyklu:

```
i <- 0
while (i < 6) {
  i <- i + 1
  if (i == 3) {
    next
  }
  print(i)
}
```

# For

Smyčka for se používá pro **iteraci sekvence**

```
for (x in 1:10) {
  print(x)
}
```

Pomocí příkazu **break** můžeme zastavit smyčku, i když je podmínka while TRUE:

```
fruits <- list("apple", "banana", "cherry")

for (x in fruits) {
  if (x == "cherry") {
    break
  }
  print(x)
}
```

Pomocí příkazu **next**  můžeme přeskočit iteraci bez ukončení cyklu:

```
fruits <- list("apple", "banana", "cherry")

for (x in fruits) {
  if (x == "banana") {
    next
  }
  print(x)
}
```

# Fuctions

Funkce je blok kódu, který se spustí pouze tehdy, když je zavolán.

Do funkce můžete předávat data, známá jako parametry.

Funkce může jako výsledek vrátit data.

## Vytvoření funkce

```
my_function <- function() { # create a function with the name my_function
  print("Hello World!")
}
```

## Volání funkce

```
my_function <- function() {
  print("Hello World!")
}

my_function() # call the function named my_function
```

## Argument 

```
my_function <- function(fname) {
  paste(fname, "Griffin")
}

my_function("Peter")
my_function("Lois")
my_function("Stewie")
```

# Vektory

Vektor je seznam položek, které jsou stejného typu.

Používáme funkci c() a odděleme položky čárkou

```
# Vector of strings
fruits <- c("banana", "apple", "orange")

# Print fruits
fruits
```

# List

List může obsahovat mnoho různých datových typů
# Matice

Matici lze vytvořit pomocí funkce matrix(). Chcete-li získat počet řádků a sloupců, zadejte parametry nrow a ncol

```
A <- matrix(c(1,2,3,4,5,6), nrow = 3, ncol = 2)
```

# Vizualizace

## Plot

Funkce plot() se používá ke kreslení bodů v diagramu.

Přebírá parametry pro specifikaci bodů v diagram:
- První parametr určuje body na ose x.
- Drudý parametr určuje body na ose y.

### Dvě čísla

```
plot(1,3)
```

### Vektory pro více bodů
```
plot(c(1, 8), c(3, 10))
```

### Pokud máme hodně bodů, tak můžeme použit proměnné
```
x <- c(1, 2, 3, 4, 5)
y <- c(3, 7, 8, 9, 12)

plot(x, y)
```

### Nakreslení čáry spojující všechny body v diagramu: type="l"
```
plot(1:10, type="l")
```

### Název grafu (main), název osy x (xlab), název osy y (ylab)

```
plot(1:10, main="My Graph", xlab="The x-axis", ylab="The y axis")
```

### Barva bodů (col)

```
plot(1:10, col="red")
```

### Velikosti bodů (cex) 

1 = default

0.5 = 50% menší

2 = 100% větší
```
plot(1:10, cex=2)
```

### Tvar bodů (pch)

Hodnota jsou od 0 do 25

```
plot(1:10, pch=25, cex=2)
```

## Line

### Barva čárky (col)

```
plot(1:10, type="l", col="blue")
```

### Šířka (lwd)

```
plot(1:10, type="l", lwd=2)
```

### Styl (lty)
- 0 odstraní čáru
- 1 zobrazuje plnou čáru
- 2 zobrazuje přerušovanou čáru
- 3 zobrazuje tečkovanou čáru
- 4 zobrazuje "tečkovanou" čáru
- 5 zobrazuje "dlouhou přerušovanou" čáru
- 6 zobrazuje "dvě čárkovanou" čáru

```
plot(1:10, type="l", lwd=5, lty=3)
```

### Více čárků

Pokud chceme v grafu zobrazit více než jeden řádek, tak používáme funkci plot() spolu s funkcí lines()

```
line1 <- c(1,2,3,4,5,10)
line2 <- c(2,5,7,8,9,10)

plot(line1, type = "l", col = "blue")
lines(line2, type="l", col = "red")
```

## Scatter plot

Rozptylový graf je typ grafu používaný k zobrazení vztahu mezi dvěma numerickými proměnnými a vykresluje jednu tečku pro každé pozorování.

Potřebume dva vektory stejné délky, jeden pro osu x (horizontální) a jeden pro osu y (vertikální)

```
x <- c(5,7,8,7,2,2,9,4,11,12,9,6)
y <- c(99,86,87,88,111,103,87,94,78,77,85,86)

plot(x, y, main="Observation of Cars", xlab="Car age", ylab="Car speed")
```

## Max a Min

Funkce **min()** a **max()** lze použít k nalezení nejnižší nebo nejvyšší hodnoty v sadě.

```
Data_Cars <- mtcars

max(Data_Cars$hp)
min(Data_Cars$hp)
```

Můžeme použít funkce **which.max()** a **which.min()** k nalezení pozice indexu maximální a minimální hodnoty.

```
Data_Cars <- mtcars

which.max(Data_Cars$hp)
which.min(Data_Cars$hp)
```

# Aplikace funkcí na růžné typy datových strukturu

## apply() = Aplikace funkcí na řádky nebo sloupce matice

apply(matice, 1(řádky) nebo 2(sloupce), funkce)

Výstup je matice

```
mat <- matrix(1:9, nrow = 3, byrow = TRUE)
apply(mat, 1, sum) # Součet hodnot v každém řádku
apply(mat, 2, mean) # Průměr hodnot v každém sloupci
```

## lapply() = Aplikace funckí na každý prvek seznamu nebo vektoru

lapply(seznam, funkce)

Výstup je seznam

```
vektor <- 1:5
lapply(vektor, function(x) x^2) # Druhá mocnina každého čísla
```

## saplly() = Podobně jako lappy(), ale výstup je lepší formát

lapply(seznam, funkce)

```
vektor <- 1:5
sapply(vektor, function(x) x^2) # Druhá mocnina každého čísla jako vektor

```
## tapply() = Aplikace funkcí na podskupiny vektoru, které jsou definovány faktory

taplly(vektor, vektor faktorů určující skupiny, funkce)

```
hodnoty <- c(10, 20, 30, 40, 50)
skupiny <- factor(c("A", "B", "A", "B", "A"))
tapply(hodnoty, skupiny, sum) # Součet hodnot ve skupinách A a B
```

# Sekvence hodnot = seq()

Funkce seq() slouží k vytvoření sekvence hodnot, vytvoří posloupnost čísel s určitým krokem, délkou nebo v určitém rozsahu.

seq(from = počateční hodnota sekvece, to = koncová hodnota sekvence, by = krok mezi jednotlivými hodnotami sekvenci)


```
seq(from = 1, to = 10, by = 2)
seq(10, 1, by = -2)
```

Další argumenty:

- length.out = počet určitých hodnot v sekvenci, ignoruje argument by
  
  ```
  seq(from = 1, to = 10, length.out = 5)
  ```
- along.with = vytvoří sekvenci stejné délky jako zadaný vektor


