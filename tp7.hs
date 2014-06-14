---1.

foldr :: ( a -> b -> b ) -> b -> [a] -> b
foldr f z [] = z
foldr f z (x:xs) = f x (foldr f z xs)

map :: (a -> b) -> [a] -> [b]
map f [] = []
map f (x:xs) = f x : map f xs

filter :: (a -> Bool) -> [a] -> [a]
filter f [] = []
filter f (x:xs) = if ( f x )
					then ( x : filter f xs )
					else filter f xs

sum = foldr (+) 0

any = foldr (&&) False

all = foldr (&&) True

codes = map toCode where toCode c = c ---toCode not implemented !

remainders n = foldr (\x l -> x `mod` n : l) []

sqares = map (\x -> x*x)

lengths = map length

order = filter (\(x1,x2) -> x1 < 3 * x2)

pairs = filter (\x -> x `mod` 2 == 0)

--- 2. //VER SI ESTE ESTA BIEN // TODO
pal [] = True
pal (x:xs) = if ( x == last xs)
				then pal (removeLast xs)
				else False

--- No lo pued hacer con esquemas de funciones recursivas //TODO Ver si esta bien

hs = foldr (\x l -> if (headOf x == 'h') then l + 1 else l) 0

--- No se puede con esquemas recursivos de funciones (avgLength: de nada me sirve para calclar el promedio tener el promedio de una subparte)
--- No se puede con esquemas recursivos de funciones (adjacents: De nada me sirve tener el adjacents de una subparte, pues pude haber perdido elementos)
--- Idem adjacents

remDups [] = []
remDups (x:xs) = if ( x == headOf xs)
					then remDups xs
					else (x : remDups xs)

--- No se puede hacer con foldr pues no tengo xs en f como para evaluar 'headOf xs'

--- primes TODO

---3.
f = foldr (:) []

foldr (:) [] :: [a] -> [a]

--- f ( 1 : ( 2 : ( 3 : [] ) ) ) =
--- foldr (:) [] ( 1 : ( 2 : ( 3 : [] ) ) ) =
--- (:) 1 (foldr (:) [] ( 2 : ( 3 : [] ) ) ) =
--- 1 : ( 2 : foldr (:) [] (3:[])) =
--- 1 : ( 2 : (3 : [] ) )

--- id

---4.
--- TODO , NI IDEA

---5.
takewhile f = foldr (\x l -> if (f x) then (x : l) else l) []
--- TODO ESTOY PERDIENDO F ACA ????

---6.
---???

---7.
--- Demos por induccion en la estructura de listas
---a)
map f (xs ++ ys) = map f xs ++ map f ys

caso base -> xs = []
> map f ([] ++ ys) = map f ys
> map f [] ++ map f ys = [] ++ map f ys = map f ys

caso inductivo -> xs = (x:xs) donde map f (xs++ys) = map f xs ++ map f ys
> map f ( x: xs ++ ys ) = map f ( x : (xs ++ ys)) = f x : map f (xs++ys) = f x : (map f xs ++ map f ys) = f x : map f xs ++ map f ys = map f (x:xs) ++ map f ys

---b)
map f . concat = concat . map (map f)

Por principio de extensionalidad vale...

caso base -> x' = []
> map f . concat [] = map f ( concat [] ) =  map f [] = []
> concat . map (map f) [] = concat ( map (map f) [] ) = concat [] = []

caso inductivo -> x' = x:xs donde map f . concat xs = concat . map (map f) xs
> map f . concat (x:xs) = map f (concat (x:xs)) = map f (x ++ concat xs) = map f x ++ map f (concat xs)
> concat . map (map f) (x:xs) = concat ( map (map f) (x:xs) ) = concat ( (map f) x : map (map f) xs ) = (map f) x ++ concat (map (map f) xs) = (map f) x ++ concat . map (map f) xs
= map f x ++ map f . concat xs
= map f x ++ map f (concat xs)

---c)
filter p (xs ++ ys) = filter p xs ++ filter p ys
caso base -> xs = []
> filter p ([] ++ ys) = filter p ys
> filter p [] ++ filter p [] = [] ++ filter p ys = filter p ys

caso inductivo -> xs = x:xss donde filter p (xss ++ ys) = filter p xss ++ filter p ys
> filter p ( (x:xss) ++ ys) = filter p ( x : xss ++ ys)
if p x == true ==> filter p (x : xss ++ ys) = x : filter p (xss ++ ys) = x : ( filter p xss ++ filter p ys ) = ( x : filter p xss ) ++ filter p ys = filter p (x:xss) ++ filter p ys
if p x == false ==> analogo

---d) // ver si esta esta bien
map (map f) . map (x:) = map ((f x):) . map (map f)

Utilizando el principio de extensionalidad vale que

map (map f) . map (x:) xs = map ((f x):) . map (map f) xs

caso base --> xs = []
> map (map f) . map (x:) [] --- def. de composicion
= map (map f) (map (x:) [] ) --- def. de map
= (map (map f) []) --- def. de map
= []
> map ((f x):) . map (map f) [] --- def. de composicion
= map ((f x):) (map (map f) []) --- def. de map
= map ((f x):) [] --- def. de map
= []

caso inductivo --> xs = x1:xss donde map (map f) . map (x:) xss= map ((f x):) . map (map f) xss
> map (map f) . map (x:) (x1:xss) --- def. de comp
= map (map f) (map (x:) (x1:xss)) --- def. de map
= map (map f) ( (x:x1) : map (x:) xss ) --- def. de map
= (map f) (x:x1) : map (map f) (map (x:) xss) --- def. de comp
= (map f) (x:x1) : map (map f) . map (x:) xss --- HI
= (map f) (x:x1) : ( map ((f x):) . map (map f) xss ) -- def. de comp
= (map f) (x:x1) : map ((f x):) (map (map f) xss) --- remuevo parentesis inescesarios
=  map f  (x:x1) : map ((f x):) (map (map f) xss) --- def. de map
= (f x : map f x1) : map ((f x):) (map (map f) xss) --- def. de :
= (((f x):) (map f x1) ) : map ((f x):) (map (map f) xss) --- def. de map
= map ((f x):) (map f x1 : map (map f) xss) --- def de map
= map ((f x):) (map (map f) (x1:xss)) --- def. de comp
= map ((f x):) . map (map f) (x1:xss) <


---e)
concat . map concat = concat . concat

Utilizando el principio de extensionalidad vale que:

( concat . map concat ) x' = (concat . concat) x' !!!!!!!!!!!!!!!!!!!!! byFidel

caso base --> x' = []
> (concat . map concat) [] --- def. de comp
= concat (map concat []) --- def. de map
= concat [] --- def. de concat
= []
> concat . concat [] --- def de comp
= concat (concat []) --- def. de concat x2
= []

caso inductivo --> x'=x:xs donde vale que concat . map concat xs = concat . concat xs
> concat . map concat (x:xs) --- def. de comp
= concat (map concat (x:xs)) --- def. de map
= concat (concat x : map concat xs) --- def. de concat


---rever class y recr !!!!!

---8. ver con fidel !
a)
insert y [] = []
insert y (x:xs) = if (x<y) then x:insert y xs else y:x:xs

foldr f z [] = z
foldr f z (x:xs) = f x (foldr f z xs)

No se puede pues no tengo acceso al xs en esta funcion, pues seria
insert y = foldr (\x t -> if (x<y) then x:t else y:x:xs) [] 
lo cual es incorrecto

b)
evenPos [] = []
evenPos [x] = [x]
evenPos (x:y:xs) = x:evenPos xs

Por como esta definido el esquema de foldr (en [] y en (x:xs)) no se puede definir evenPos con foldr


---9.
inits :: [a] -> [[a]]
inits []     = []
inits (x:xs) = [x] : map (x:) (inits xs)
---Demostrar que inits . map f = map (map f) . inits

---Lo demostramos por induccion en la estructura de listas
---Por el principio de extencionalidad vale que,

( inits . map f ) x = (map (map f) . inits) x

---Caso base, x = []
(inits . map f) [] = --- por def. de comp vale que
inits (map f []) = --- por def. de map
inits [] = --- por def. de init
[]

(map (map f) . inits) [] --- por def. de comp
map (map f) (inits []) --- por def. de init
map (map f) [] --- por def. de map
[]

---Caso inductivo, x = (x':xs) donde vale que (inits . map f) xs = (map (map f) . inits) xs
(inits . map f) (x':xs) = --- por def de comp
inits (map f (x':xs)) = --- por def. de map
inits (f x':map f xs) = --- por def. de inits
[f x'] : map (x':) (inits xs) --- por def. de comp
[f x'] : (map (x':) . inits ) xs

(map (map f) . inits) (x:xs) = --- def. de comp
map (map f) (inits (x: xs)) = --- def de inits
map (map f) ([x] : map (x:) (inits xs)) --- def. de map
map f [x] : map (map f) (map (x:) (inits xs)) --- def. de map
[f x'] : map (map f) (map (x:) (inits xs))

