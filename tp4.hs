--- TP4
--- 1.

--- a) nextDiv, toma dos numeros x, y y devuelve el primer divisor de y mayor que x.
dividesTo x y = x `mod` y == 0
nextDiv x y = if ( dividesTo (x + 1) y ) then x + 1 else nextDiv (x+1) y

---b) sumDivs, toma un nuumero y devuelve la suma de sus divisores.
sumDivsRec x i 
	| i <= 0 = 0
	| i > 0  = if ( dividesTo i x ) then i + sumDivsRec x (i-1) else sumDivsRec x (i-1)

sumDivs x  
    | x >= 0       = sumDivsRec x x
    | otherwise   = error "wrong typing"  

---c) power, que toma un numero y un natural, y devuelve el resultado de elevar el primero a la potencia dada por el segundo.
power b p 
	| p == 0 = 1
	| p > 0  = b * (power b (p-1))

---d)
---dividesTo x y = x % y == 0

---e) sum

sum' f i j = if (i >= j)
			then 0
			else (f i)  + sum' f (i+1) j 
---f)
prime x = primeRec x (x-1)

primeRec x i 
	| i == 1 = True
	| i > 1  = if ( dividesTo i x ) then False else primeRec x (i - 1)

---g) phi, que toma un entero i y devuelve el i-esimo numero primo.
---   la idea es hacer nextPrime( nextPrime( nextPrime(...) ) ) i veces desde el primer primo, 1.

nextPrime x
	| prime (x+1) = x + 1
	| otherwise   = nextPrime (x + 1)

phi i
	| i == 1 = 1
	| i > 1  = nextPrime ( phi ( i - 1) )


--2.
--- a)// TODO -- definition of swap y flip
--- flip (curry f) = curry (f . swap)

 --- b) sum f i j + sum f (j+1) k = sum f i k con i <= j <= k
--- sum f i j + sum f (j+1) k
--- ver todos los casos.

--3.
--- Propiedades de los conjuntos definidos por induccion estructural
--- * Tiene infinitos elementos.
--- * Todos sus elementos, o bien satisfacen una regla base, o bien satisfacen una regla inductiva.
--- * Todos sus elementos son finitos.
--- * El orden basado en ''es parte de'' es bien fundado (o sea, toda cadena descendente es finita).
---   (Ej.: Z es parte de SZ, SZ es parte de SSZ, etc.)

--4.

--5.
hailstone n = if (n<=1)
              then 0
              else if (n `mod` 2 == 0) 
              	then (n `div` 2)
                else (3*n+1)

hail n = hailRec n 1

hailRec n i = if ( hailstone n == 0 ) 
			  then i
			  else hailRec (hailstone n) (i+1)

--6.









