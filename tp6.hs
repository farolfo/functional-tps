--- tp4

--- 2.
data Maybe a = a | Nothing
data TipTree a = Tip a | Join (TipTree a) (TipTree a)

heightTip :: TipTree a -> Int
heightTip Tip x = 0
heightTip Join t1 t2 = 1 + max (heightTip t1) (heightTip t2)

leaves :: TipTree a -> Int
leaves Tip x = 1
leaves Join t1 t2 = (leaves t1) + (leaves t2)

nodes :: TipTree a -> Int
nodes Tip x = 0
nodes Join t1 t2 = 1 + nodes t1 + nodes t2

walkover :: TipTree a -> [Tip a]
walkover Tip a = [a]
walkover Join t1 t2 = walkover t1 ++ walkover t2

mirrorTip :: TipTree a -> TipTree a
mirrorTip Tip a = Tip a
mirrorTip Join t1 t2 = Join t2 t1

mapTip :: f -> TipTree a -> TipTree b
mapTip Tip a = Tip (f a)
mapTip Join t1 t2 = Join (mapTip t1) (mapTip t2)

---3.
//TODO

---4.
data Seq a = Nil | Unit a | Cat (Seq a) (Seq a)

appSeq :: Seq a -> Seq  a ->  Seq a
appSeq s1 s2 = Cat s1 s2

conSeq :: a -> Seq a -> Seq a
conSeq x s = Cat (Unit x) s

lenSeq :: Seq a -> Int
lenSeq Nil = 0
lenSeq Unit a = 1
lenSeq Cat s1 s2 = lenSeq s1 + lenSeq s2

revSeq :: Seq a ->  Seq a
revSeq Nil = Nil
revSeq Unit a = Unit a
revSeq Cat s1 s2 = Cat (revSeq s2) (revSeq s1)

--- //TODO ESTO ESTA BIEN ?
headSeq :: Seq a -> Maybe a
headSeq Nil = Nothing
headSeq Unit a = a
headSeq Cat s1 s2 = if ( (headSeq s1) == Nothing ) 
						then headSeq s2
						else headSeq s1

--- //TODO ESTO ESTA BIEN ?
tailSeq :: Seq a -> Seq a
headSeq Nil = Nil
headSeq Unit a = Nil
headSeq Cat s1 s2 = if ( headSeq s1 == Nothing )
						then Cat s1 (headSeq s2)
						else Cat (headSeq s1) s2

--- //TODO ESTO ESTA BIEN ?
normSeq :: Seq a -> Seq a
normSeq Nil = Nil
normSeq Unit a = Unit a
normSeq Cat s1 s2 = if ( normSeq s1 == Nil )
						then normSeq s2
						else if ( normSeq s2 == Nil )
							then normSeq s1
							else Cat (normSeq s1) (normSeq s2)

--- //TODO ESTO ESTA BIEN ?
eqSeq :: Seq a -> Seq a -> Bool

eqSeq s1 s2 = eqSeq' (normSeq s1) (normSeq s2)

eqSeq' Nil Nil = True
eqSeq' (Unit a) (Unit b) = a == b 
eqSeq' (Cat s1 s2) (Cat s3 s4) = (eqSeq' s1) == (eqSeq' s3) && (eqSeq' s2) == (eqSeq' s4)
eqSeq' s1 s2 = False


seq2List :: Seq a -> [a]
seq2List Nil = []
seq2List Unit a = [a]
seq2List Cat s1 s2 = seq2List s1 ++ seq2List s2

--- b) NIIDEA !







