--1.
--- Para todo n definido, la expresion (succ n) esta definida
---    -> La funcion succ es TOTAL
--- La expresion (recip n) no esta definida para n=0
---    -> La funcion recip es PARCIAL
---
---a) totales
--- 1) Bool -> Bool -> Bool				and / or
--- 2) a -> b -> a 						fun a b = a / fun a = /y -> a
--- 3) (a->b)->(a->c)->a->(b,c)			fun x y z = (x z, y z) / otra opcion es las funciones particulares
--- 4) Int -> Int -> Int				fun a b = a+b / fun a b = a - b				
--- 5) (Int -> Int) -> Int -> Int 		fun succ y = y+1 / fun x y = (x (y + 1)) + 1 
--- 6) (a -> b -> c) -> b -> a -> c		fun x y z = x z y 
---
---b) parciales (
//TODO)
--- 1) Bool -> Bool -> Bool
--- 2) a -> b -> a
--- 3) (a->b)->(a->c)->a->(b,c)
--- 4) Int -> Int -> Int
--- 5) (Int -> Int) -> Int -> Int 
--- 6) (a -> b -> c) -> b -> a -> c

--2.
--- Funcion de alto orden:
--- una funcion que recibe otra funcion como argumento, o la retorna como resultado
---
--- a)
--- fUno :: ((Int,Int)->Int)->Int->Int->Int
--- fUno f x y = f (x,y)
--- Es de alto orden y no esta currificada (currificada seria fUno f x = \y -> f (x,y)) (
	//TODO OK?)
---
--- b)
--- fDos :: (Char->Char->Bool)->(Char->Char)->(Int->Char)->Char->Int->Bool
--- fDos f1 f2 f3 a b = f1 (f2 a) (f3 b)
--- Es de alto orden y sin currificar
---
--- c) 1) fTres :: (Char,Char,Char) -> Bool
---       fTres (c1,c2,c3) = (c1==c2) && (c2==c3)
---       No es de alto orden y sin currificar
---
---    2) ¿Que sucede con la funci on anterior si definimos
---       type Pers=(Char,Char,Char) y fTres :: Pers -> Bool?
---       
//TODO, Ni idea

--3. 
--- fun = \a -> a ## x (con x literal)

--4. Ordenes
--- Orden Aplicativo     -> Primero los redex internos
--- Orden normal         -> Primero los redex externos
--- En ambos casos si hay mas de uno al mismo nivel se toma el de la izq.

--- Funcion estricta     -> Cuando recibe ⊥, retorna ⊥
--- Funcion no estricta  ->cuando recibe ⊥, puede retornar un valor definido (≠⊥) 
--- 
--- Si la funcion precisa el valor para dar el resultado, entonces es estricta.
--- Pero si no lo precisa, podemos elegir...

--- En el orden APLICATIVO -> Todas las funciones son estrictas (Si reciben un ⊥, retornan un ⊥)
--- En el orden NORMAL     -> Hay funciones estrictas y no estrictas (no esctrictas las que no precisen su argumento)

--5.
--- a) twice f x = f (f x) 
twice = \f -> \x -> f (f x)
--- b) flip f x y = f y x 
flip = \f -> \x -> \y -> f y x
--- c) inc = (+1)
inc = \x -> x + 1

--6.
--- a) fix, donde
---    fix f x = f (fix f) x
---    t: fix = ( A -> B -> C ) -> B -> C
---    Como f (fix f) x ==>  t:A = t:(fix f) = B -> C
---    t: fix = ( (B -> C) -> B -> C ) -> B -> C   
fix f x = f (fix f) x

--- b) fork (fork,fork) (fork,fork), donde fork (f,g) x = (f x,g x)
--- :t fork = ( A -> B , A -> C ) -> A -> ( B, C)
--- :t fork (fork, fork) (fork, fork) = (Z,Z) donde Z = t:(fork (fork, fork)) = ( A -> B , A -> C ) -> ( A -> ( B, C), A -> ( B, C))
--- :t fork (fork, fork) (fork, fork) = (( A -> B , A -> C ) -> ( A -> ( B, C), A -> ( B, C)), ( A -> B , A -> C ) -> ( A -> ( B, C), A -> ( B, C)))
fork (f,g) x = (f x,g x)
totest = fork (fork,fork) (fork,fork)

--- c) apply apply apply, donde apply f x = f x => apply f = \x -> f x
--- :t apply = ( A -> B ) -> A -> B
--- apply apply apply = apply apply = \x -> apply x = \x -> \y -> x y
--- :t apply apply apply = :t \x -> \y -> x y = ( A -> B ) -> A -> B
apply f x = f x
totest2 = apply apply apply

--- d) curry, donde
---    curry f x y = f (x,y)
---    curry = \f -> \x -> \y -> f (x,y)
---    :t curry = ( ( A, B) -> C ) -> A -> B -> C
curry f x y = f (x,y)


--7.
--- Reducir
--- a) square (square (3+7)) donde square x = x * x con orden normal
square ( square (3+7) )
square (3+7) * square (3+7)
( (3+7) * (3+7) ) * square (3+7)
( 10 * (3+7) ) * square (3+7)
( 10 * 10 ) * square (3+7)
100 * square (3+7)
100 * ( (3+7) * (3+7) )
100 * ( 10 * (3+7) )
100 * ( 10 * 10 )
100 * 100
10000

--- b) apply first (const 3 4, (/0) (seven seven)) orden normal
first (const 3 4, (/0) (seven seven))
const 3 4
--- que es const x y ?

--8.
--- A menos que este mal la sintaxis por que el -2 no tiene parentesis, esto seria (+ -2) = \x -> x - 2

--9.
fun9 :: Int -> Int
bottom = bottom
fun x -> x * bottom

--10.
--- Dado h x y = f (g x y). Decidir cuales de las siguientes afirmaciones son verdaderas:

--- a) h = f . g
--- h = f . g = \x -> f ( g x ) 

--- h x = f g x y
--- h = \y -> f g x y

--- No son iguales 
//TODO COMO FUNDAMENTAR 

--- b) h x = f . (g x)

--- c) h x y = (f . g) x y

--11.
--- Definir sumDigit :: Char -> Int -> Int, que suma un dıgito con un entero, utilizando la funcion compose.
--- Por ejemplo sumDigit ’8’ 1 = 9..
import Data.Char (ord)
sumDigit c n = ( ord c ) + n
//TODO VER !





