import Data.Char (ord)

---2.
sumList :: [Int] -> Int
sumList [] = 0
sumList (x:xs) = x + sumList xs

any1 :: [Bool] -> Bool
any1 [] = False
any1 (x:xs) = if ( x ) 
				then True
				else any1 xs

all1 :: [Bool] -> Bool
all1 [] = True
all1 (x:xs) = if ( x && all1 xs ) then True else False

codes :: [Char] -> [Int]
codes [] = []
codes (x:xs) = ord x : codes xs

remainders :: [Int] -> Int -> [Int]
remainders [] n = []
remainders (x:xs) n = ( x `mod` n ) : ( remainders xs n )

squares :: [Int] -> [Int]
squares [] = []
squares (x:xs) = ( x * x ) : (squares xs)

length' :: [a] -> Int
length' [] = 0
length' (x:xs) = 1 + length' xs

lengths :: [[a]] -> [Int]
lengths [[]] = []
lengths (x:xs) = ( length' x ) : ( lengths xs )

order :: [(Int, Int)] -> [(Int, Int)]
order [] = []
order ( (x,y) : xs ) = if ( x < ( 3 * y) ) 
						then (x,y) : order xs
						else order xs

pairs :: [Int] -> [Int]
pairs [] = []
pairs (x:xs) = if ( x `mod` 2 == 0 ) 
				then x : pairs xs
				else pairs xs

moreThan :: [[a]] -> Int -> [[a]]
moreThan [] n = []
moreThan ( x : xs ) n = if ( length' x > n ) 
							then x : moreThan xs n
							else moreThan xs n

--- 3. Si terminan, por construccion de las funciones en induccion estructural


