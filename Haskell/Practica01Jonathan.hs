--Abrego Alvarez Jonathan
--jo.ab.al@ciencias.unam.mx
--308043305

data Nat = O | S Nat deriving Show

suma :: Nat ->Nat->Nat 
suma x O = x
suma x (S y)  = suma (S x) y

producto :: Nat -> Nat -> Nat
producto x O = O
producto x (S O) = x
producto x (S y) = suma x (producto x y)

potencia :: Nat -> Nat -> Nat
potencia x O = (S O)
potencia x (S O) = x
potencia x (S y ) = potencia (producto x x) y

factorial :: Nat -> Nat
factorial O = (S O)
factorial (S O) = (S O)
factorial  (S x)  =  producto (S x) (factorial x)

reversa :: [Nat] -> [Nat]
reversa [O] = [O]
reversa [S x] = [S x]
reversa (x:xs) = (reversa xs)++[x]

length1 :: [Nat]->Integer
length1 []=0
length1 (x:xs) = 1+(length1 xs)

minList:: [Nat]-> Nat
minList [O] = O
minList [S x] = S x
minList (x:xs) = if (menorIgual x (minList xs))==True 
					then x else minList(xs)

sumList :: [Nat]-> Nat
sumList []=O
sumList [O] = O
sumList [S x] = S x
sumList (x:xs) = suma x (sumList(xs))

ordena :: [Nat] -> [Nat]
ordena [] = []
ordena (x:xs) = insert x (ordena xs)


--Funciones Auxiliares
insert :: Nat->[Nat]->[Nat]
insert O []= [O]
insert (S e) [] = [S e]
insert e (x:xs)
				| menorIgual e x = e:x:xs				
				| otherwise = x:insert e xs

convierte :: Nat->Integer
convierte O = 0
convierte (S x) = 1 +convierte x

revierte :: Integer -> Nat
revierte 0 =O
revierte (n + 1) = S (revierte n)

menorIgual:: Nat -> Nat -> Bool
menorIgual O O= if (convierte O) == (convierte O) 
						then True else False
menorIgual O (S n)= if (convierte O) < (convierte (S n)) 
						then True else False
menorIgual (S n) O = if (convierte (S n)) < (convierte O)
						then True else False
menorIgual (S n) (S y) = if (convierte (S n)) <= (convierte (S y))
						then True else False						