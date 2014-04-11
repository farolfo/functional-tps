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
-- :t x = :t y = a
-- :t f1 = a -> a
-- :t f2 = a -> a
-- (a -> a, a -> a) -> a -> a -> (a, a)
-- PERO HASKEL DA pairFunc :: (a -> b,b -> a) -> b -> a -> (b,a) , por que ??

--5.
-- Tipado estatico: 



