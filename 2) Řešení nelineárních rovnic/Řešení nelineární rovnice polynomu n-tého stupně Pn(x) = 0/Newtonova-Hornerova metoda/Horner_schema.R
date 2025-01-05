#Vrátí hodnotu polynomu P(x)
Horner <- function(a, x) {
  n <- length(a)       
  res <- a[1]          
  cat("Iterace: 1 - Koeficient:", a[1], ", res =", res, "\n")  
  
  for (i in 2:n) { 
    res <- res * x + a[i]
    cat("Iterace:", i, "- Koeficient:", a[i], ", res =", res, "\n")  # Tisk aktuálního stavu
  }
  return(res)         
}

# Koeficienty a hodnota x
a <- c(2, -3, -1, -2) 
x <- 2                 

# Spuštění
result <- Horner(a, x)
cat("Konečný výsledek P(x):", result, "\n")


Horner <- function(a, x){
  n <- length(a)
  y <- a[n]
  yd <- y
  for(i in (n-1):2){
    y <- y*x+a[i]
    yd <- yd*x+y
  }
  y <- y*x+a[1]
  return(c(y, yd))
}

                
Horner(c(1,-8,-72,382, 727, 2310), 0)


a <- c (2, -3, -1, -2)
n <- length (a)
alpha <- 2
b <- a[n]
c <- b
for (i in (n -1) :2) {
  b <- b * alpha +a [i]
  c <- c * alpha +b
  }
b <- b* alpha + a [1]
cat ("p( alpha ) =",b ,"\n")
cat ("p ’( alpha ) =",c)




NewtonHorner <- function(a, xstart, acc=0.0000001){
  n <- length(a)
  x <- xstart
  citac <- 0
  repeat{
    citac <- citac + 1
    
    # Výpočet P(x) a P'(x) pomocí Hornerovy metody
    
    #Hodnocení polynomu P(x) na bodě x:
    #začínáme od nejvýššího stupně polynomu a[n], 
    #pak pro každý prvek a[i] od n-1 do 2: y = y*x+a[i] 
    #a postupně přídvá se další člen polynomu
    
    #Výpočet derivace P'(x):
    #začínáme od nejvýššího stupně polynomu derivace a[n], 
    #pak pro každý prvek a[i] od n-1 do 2: yd = yd*x+a[i] 
    #a postupně přídvá se další člen polynomu derivace
    
    y <- a[n]
    yd <- y
    for(i in (n-1):2){
      y <- y*x+a[i]
      yd <- yd*x+y
    }
    y <- y*x+a[1]
    
    # Výpočet korekce Newtonovou metodou
    dx <- y/yd
    x <- x-dx
    
    cat(citac, ": x =", x, ", P(x) =", y, ", P'(x) =", yd, "\n")
    
    if(abs(dx) < acc) {
      print(citac)
      return(x)
    }
  }
}


NewtonHorner(c(1,-8,-72,382, 727, 2310), 1)



