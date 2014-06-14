---TP 8

---1)
---a)

isBalancedS s = isBalancedRec s == 0

isBalancedRec emptyS = 0
isBalancedRec (pushS e s) = if (e == '(') 
								then isBalancedRec s + 1
								else if (e == ')')
									then isBalancedRec s - 1
									else isBalancedRec s

---b)

isBalancedS s = isBalancedRec s == 0

isBalancedRec emptyS = 0
isBalancedRec (pushS e s) = if (e == '[') 
								then isBalancedRec s + 1
								else if (e == ')')
									then isBalancedRec s - 1
									else isBalancedRec s


---2.

resort f (buildSL g) = buildSL f
resort f (insertSL a l) = insertSL a (resort f l)

sizeSL (buildSL f) = 0
sizeSL (insertSL a l) = 1 + sizeSL l

list2SL f [] = buildSL f 
list2SL f (x:xs) = insertSL x (list2SL f xs)

sl2list (buildSL f) = []
sl2list (insertSL a l) = a : sl2list l

sortIntSL l = sl2list (list2sl (>) l) 

sortBySL f l = sl2list (list2sl f l)


6.
type Col = Min
type Min = Maybe Int

empty :: Col
empty = Nothing 

insert :: Int -> Col -> Col
insert n Nothing = Just n
insert n Just m = if ( n < m ) 
						then Just n
						else Just m

lookMin :: Col -> Int
lookMin Nothing = error 'No tenemos un minimo'
lookMin Just n = n








