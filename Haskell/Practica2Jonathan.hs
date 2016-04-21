data AE =  Num Integer | Plus AE AE | Minus AE AE | Times AE AE deriving (Eq, Show)  
data Value = Val Integer deriving(Eq, Show)
  
  
eval :: AE -> Value
eval (Num n) = Val n
eval (Plus e1 e2) = case (eval e1) of
                    Val n1 -> case (eval e2) of
                              Val n2 -> Val (n1 + n2)
eval (Minus e1 e2) = case (eval e1) of
                    Val n1 -> case (eval e2) of
                              Val n2 -> Val (n1 - n2)
eval (Times e1 e2) = case (eval e1) of
                    Val n1 -> case (eval e2) of
                              Val n2 -> Val (n1 * n2)                           

evalalt :: AE -> Integer
evalalt (Num n) = n
evalalt (Plus e1 e2) = (evalalt e1) + (evalalt e2)
evalalt (Minus e1 e2) = (evalalt e1) - (evalalt e2)
evalalt (Times e1 e2) = (evalalt e1) * (evalalt e2)

data BinTreeInt = Leaf| Node Integer BinTreeInt BinTreeInt deriving (Show)  

size :: BinTreeInt -> Int
size Leaf = 0
size (Node x t1 t2) = 1 + size t1 + size t2

sumNodes :: BinTreeInt -> Integer
sumNodes Leaf = 0
sumNodes (Node x t1 t2) = x + sumNodes t1 + sumNodes t2

data BinTree a = BinLeaf | BinNode a (BinTree a) (BinTree a) deriving (Show)

mapTree :: (a -> b) -> BinTree a -> BinTree b
mapTree f (BinLeaf) = BinLeaf
mapTree f (BinNode a (t1) (t2)) = (BinNode (f a)) (mapTree f t1) (mapTree f t2)

inorder :: BinTree a -> [a]
inorder BinLeaf = []
inorder (BinNode x t1 t2) = inorder t1 ++ [x] ++ inorder t2

preorder :: BinTree a -> [a]
preorder BinLeaf = []
preorder (BinNode x t1 t2) = [x] ++ preorder t1 ++ preorder t2

postorder :: BinTree a -> [a]
postorder BinLeaf = []
postorder (BinNode x t1 t2) =  postorder t1 ++ postorder t2 ++ [x]

reflect :: BinTree a -> BinTree a
reflect BinLeaf = BinLeaf
reflect (BinNode n l r) = BinNode n (reflect r) (reflect l)

heigth :: BinTree a -> Integer
heigth BinLeaf = 0
heigth (BinNode x t1 t2) = 1 + max (heigth t1) (heigth t2)

balanced :: BinTree a -> Bool
balanced BinLeaf = True
balanced (BinNode x t1 t2) = balanced t1 && balanced t2 && (heigth t1 == heigth t2)

data NTree = NilT | NodeN Integer NTree NTree

occurs :: NTree -> Integer -> Integer
occurs NilT p = 0
occurs (NodeN n t1 t2) p
  |n == p = 1 + occurs t1 p + occurs t2 p
  | otherwise = occurs t1 p + occurs t2 p