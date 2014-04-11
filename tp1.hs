-- TP1 - PROGRAMACION FUNCTIONAL (3 pending)

-- 1.

seven x = 7

signo x = if x < 0 then (-1) else if x == 0 then 0 else 1

signo' x
	|	x < 0   = (-1)
	|	x == 0  = 0
	|	x > 0	= 1

absolute x = if (signo x) == (-1) then x * (-1) else x

absolute' x = if (x > 0) then x else x * (-1)

and' (x, y) = if ((x == True) && (y == True)) then True else False

or' (x, y) = if ((x == True) || (y == True)) then True else False

not' True = False
not' False = True

xor' (x,y) = or' ((and' (x, (not' y))), (and' (y, (not' x))))

dividesTo (x, y) = if ( (mod y x) == 0 ) then True else False

isMultiple (x, y) = dividesTo (y, x)

--pending isCommonDivisor and isCommonMult

swap (x,y) = (y,x)

--2

--- a) f x = let (y,z) = (x,x) in y
fun2a x = x

--- b) greaterThan (x,y) = if x > y then True else False
greaterThan (x,y) 
	| x > y = True
	| x < y = False
	| x == y = False

--- c) f (x,y) = let z = x + y in g (z,y) where g (a,b) = a - b
--- f (x,y) = g (x+y,y) where g (a,b) = a - b
--- f (x,y) = ( x + y ) - y
--- f (x,y) = x
fun2c (x,y) = x

--3
--- power4 x = let sqr y = y * y in sqr (sqr x)
power4_1 x = x * x * x * x

twice fun = fun . fun
sqr y = y * y
power4_2 x = (twice sqr) x 

--4
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

--5 
--Propiedades deseabled en los programas
-- * Correccion
-- * Eficiencia
-- * Claridad
-- * Modificabilidad
-- * Terminacion
-- * EQUIVALENCIA
-- * Generalidad
-- * SIMPLICIDAD

--6
-- La transparencia referencial
--
--  "El valor de una expresión depende sólo 
--  de los elementos que la constituyen."
-- 
-- es decir que cada ejecucion de codigo es independeinte del contexto
--
-- Un lenguaje funcional puro es
-- 
--  "Lenguaje de expresiones con transparencia 
--   referencial y funciones de alto orden, cuyo 
--   modelo de cómputo es la reducción 
--   realizada mediante el reemplazo de 
--   iguales por iguales."

--9
isSauronicYear x
	| ((dividesTo (4, x)) && (not' (dividesTo (100,x)))) 	= True
	| (dividesTo (400, x)) 									= True
	| otherwise												= False

--10
sort2 (x,y)
	| x <= y 	= (x,y)
	| otherwise = (y,x)

sort3_1 (x,y,z) = 
	if x <= y && x <= z
		then let (u1,v1) = sort2 (y,z) in (x, u1, v1)
		else if y <= x && y <= z
			then let (u1,v1) = sort2 (x,z) in (y, u1, v1)
			else if z <= x && z <= y
				then let (u1,v1) = sort2 (x,y) in (z, u1, v1)
				else (x,y,z)

sort3_2 (x,y,z) = 
	if x <= y && x <= z
		then ((x, u1, v1) where (u1,v1) = sort2 (y,z))
		else if y <= x && y <= z
			then ((y, u1, v1) where (u1,v1) = sort2 (x,z))
			else if z <= x && z <= y
				then ((z, u1, v1) where (u1,v1) = sort2 (y,x))
				else (x,y,z)

--pending sort3_3


