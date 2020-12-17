data AGTree a = Node a [AGTree a] deriving Show
ponerProfs n (Node x xs) = Node n (map (ponerProfs (n + 1)) xs)


alturaAGT :: AGTree a -> Int
alturaAGT (Node x []) = 1
alturaAGT (Node x xs) = 1 + maximum (map alturaAGT xs)

maxAGT :: Ord a => AGTree a -> a
maxAGT (Node x []) = x
maxAGT (Node x xs) = maximum $ x:(map maxAGT xs)

t = Node 0 [(Node 1 [(Node 20 []), (Node 2 [(Node 3 [])])]), (Node 1 [])]