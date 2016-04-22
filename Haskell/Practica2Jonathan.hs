--Abrego Alvarez Jonathan
--jo.ab.al@ciencias.unam.mx
--308043305

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
data BinTree a = BinLeaf a | BinNode a (BinTree a) (BinTree a) deriving (Show)
data NTree = NilT | NodeN Integer NTree NTree

--Recorrido de un arbol inorden
inorder :: BinTree a -> [a]
inorder (BinLeaf x) = [x]
inorder (BinNode x t1 t2) = inorder t1 ++ [x] ++ inorder t2

--Recorrido de un arbol preorder
preorder :: BinTree a -> [a]
preorder (BinLeaf x) = [x]
preorder (BinNode x t1 t2) = [x] ++ preorder t1 ++ preorder t2

--Recorrido de un arbol en postorden
postorder :: BinTree a -> [a]
postorder (BinLeaf x) = [x]
postorder (BinNode x t1 t2) =  postorder t1 ++ postorder t2 ++ [x]

--Altura de un arbol
heigth :: BinTree a -> Integer
heigth (BinLeaf a) = 0
heigth (BinNode x t1 t2) = 1 + max (heigth t1) (heigth t2)

--Numero de nodos de un arbol
size :: BinTree a ->Integer
size (BinLeaf x) = 1
size (BinNode x t1 t2)=  1 + size t1 + size t2

--Nos dice si un arbol esta balanceado
balanced :: BinTree a -> Bool
balanced (BinLeaf l) = True
balanced (BinNode x t1 t2) = balanced t1 && balanced t2 && (heigth t1 == heigth t2)

--Suma de los valos de los nodos, tomamos la primer definicion de arboles
--ya que si usaramos el generico podria darse el caso de que metieran un 
--arbol con cosas distintas de enteros
sumNodes :: BinTreeInt -> Integer
sumNodes Leaf = 0
sumNodes (Node x t1 t2) = x + sumNodes t1 + sumNodes t2

--A cada valor del nodo le aplicamos una funcion 
--lo ideal seria que los valores en los nodos fueran 
--enteros
mapTree :: (a -> b) -> BinTree a -> BinTree b
mapTree f (BinLeaf x) = BinLeaf (f x)
mapTree f (BinNode a (t1) (t2)) = (BinNode (f a)) (mapTree f t1) (mapTree f t2)

--Regresa la imagen espejo de un arbol
reflect :: BinTree a -> BinTree a
reflect (BinLeaf x) = BinLeaf x
reflect (BinNode n l r) = BinNode n (reflect r) (reflect l)

occurs :: NTree -> Integer -> Integer
occurs NilT p = 0
occurs (NodeN n t1 t2) p
  |n == p = 1 + occurs t1 p + occurs t2 p
  | otherwise = occurs t1 p + occurs t2 p