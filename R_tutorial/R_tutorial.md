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
- $&$

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
 
