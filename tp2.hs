-- TP2 - PROGRAMACION FUNCTIONAL (1 pregunta)

-- 1.

---a) Bool
--True

---b) (Int, Int) 
--(3,3)

---c) Char -> Int
--fun1_c a = if ( a == 'c' ) then 1 else 2

---d) (Int, Char) -> Bool
--fun1_d (3,'a') = True 

---e) (Int -> Int) -> Int 
fun1_e (2,2) = 2

---f) (Bool -> Bool, Int)
-- aux1 True = True 
-- (aux1, 3)

---g) a -> Bool
fun1_g x = True

---h) c -> c
-- id

-- 2.
-- Ahorra validaciones en el codgio, puedo asegurar si una expresions es correcta o no, si representa algun valor o no.

-- Segun la teorica:
--  * detección de errores comunes
--  * documentación
--  * especificación rudimentaria
--  * oportunidades de optimización en 
--  * compilación


-- 4.
--- a) 
first (x,y) = x
-- (a,b) -> a

--- b)
second (x,y) = y
-- (a,b) -> b

--- c)
const x y = x
-- a -> b -> a

--- d) 
compose f g = (\x -> f (g x))
-- :t g => a -> b
-- :t f => b -> c
-- (b->c) -> (a->b) -> (a -> c)

--- e) 
apply f x = f x
-- :t x = a
-- :t f = a -> b
-- (a->b) -> a -> b

--- f) 
subst f g x = f x (g x)
-- :t x = a
-- :t g = a -> b
-- :t f = a -> b -> c
-- (a -> b -> c) -> (a -> b) -> a -> c

--- g)
pairFunc (f1,f2) x y = (f1 (f2 x), f2 (f1 y))
-- :t x = a
-- :t y = b
-- :t f1 = b -> c
-- :t f2 = a -> d
-- b = d
-- a = c
-- =>
-- :t x = :t y = a #mal
-- :t f1 = a -> a
-- :t f2 = a -> a
-- (a -> a, a -> a) -> a -> a -> (a, a)
-- PERO HASKEL DA pairFunc :: (a -> b,b -> a) -> b -> a -> (b,a) , por que ??

--5.
---  El tipado estático nos obliga a definir desde el principio 
--- el tipo de una variable, ejemplos de lenguajes con tipado 
--- estatico son C, C++, Pascal, Java, Objetive-C, C#, entre 
--- otros, pero estos son los utilizamos en Qbit. Notese que C#
--- esta incluido aunque exista la palabra clave var, la cual 
--- nos permite ahorrarnos un poquito de código, pero una vez 
--- que el compilador define el tipo este ya no puede cambiarse.
--- 
---  El tipado dinamico nos da la facilidad de no definir los 
--- tipos al declarar una variable, algunos ejemplos son PHP, 
--- JavaScript, Grooby, Phyton, Perl, entre otros, estos son 
--- los que mas usamos aquí.

--6.

--- a) if (seven ’a’ < 1) then 5 else power4 2 
--- Error de tipo en seven 'a' por que no recibe tipo Char, error de tipo

--- b) if False then True
--- Falta else caluse, error sintactico

--- c) a := 4
--- Error de otro tipo

--- d) (1 < x && x < 100) || x == True || x == False 
--- Error de tipo pues x se usa compara con Booleans y tambien con Nums

--- e) False == (1 < 3)
--- Correcto

--- f) (1 < x < 2)
--- Error sintactico

--7.
--- Polimofismo
--- 

--8.
--- Pending

--9. 
--- a) a
--- True

--- b) Int -> a 
--- pending

--- c) a -> b
--- pending

--- d) Dar una expresi ́on de tipo c -> c, distinta de la identidad.
--- id . id

--10.
--- tom x = x x
--- :t x = Z
--- Z -> (Z -> Z)
--- Got infinite type error 


--11.
---a) smaller (x,y,z) | x <= y && x <= z = x
---                   | y <= x && y <= z = y
---                   | z <= x && z <= y = z

smaller :: (Ord a) => (a,a,a) -> a
smaller = \(x,y,z) -> if ( x <= y && x <= z ) then x else if ( y <= x && y <= z ) then y else if ( z <= x && z <= y ) then z else z

---b) second x = \x -> x
--- second x = \x -> x (TODO: PREGUNTAR A FIDEL)

---c)
--- andThen True y = y
--- andThen False y = False
andThen True = \y -> y
andThen False = \y -> False


--12.

--- a)
--- iff = \x -> \y -> if x then not y else y
--- iff x = \y -> if x then not y else y
--- iff x y = if x then not y else y

--- b)
--- alpha = \x -> \x -> x
--- alpha x = \x -> x
--- alpha x x = x (TODO FIDEL)


--13.

disc (a,b,c) = b * b - 4 * a * c

res (a,b,c) = ( ( -b ) + ( sqrt ( disc (a,b,c) ) ) ,b)---( ((-b) + sqrt (disc (a,b,c))) / (2 * a) , ((-b) - sqrt (disc (a,b,c))) / (2 * a))


