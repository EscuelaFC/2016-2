--Abrego Alvarez Jonathan
--jo.ab.al@ciencias.unam.mx
--308043305

--declaracion de nuetro tipo de dato
data Nat = O | S Nat deriving Show

--la suma de nuestros Nat donde se suma las dos primeras 
--entradas y te devuele un Nat
suma :: Nat ->Nat->Nat 
suma x O = x
suma x (S y)  = suma (S x) y

--el producto de nuestros Nat donde hace el producto de 
-- las dos primeras entradas y te devuele un Nat
producto :: Nat -> Nat -> Nat
producto x O = O
producto x (S O) = x
producto x (S y) = suma x (producto x y)

--Potencia de un Nat elevado a otro Nat
--Donde el primer Nat sera, nuestro numero
--y el segundo sera nuestra potencia a elevar
potencia :: Nat -> Nat -> Nat
potencia x O = (S O)
potencia x (S O) = x
potencia x (S y ) = potencia (producto x x) y

--Devolvemos el factoria de la entrada Nat dada
factorial :: Nat -> Nat
factorial O = (S O)
factorial (S O) = (S O)
factorial  (S x)  =  producto (S x) (factorial x)

--Devolvemos la reversa de una lista con elementos
--Nat
reversa :: [Nat] -> [Nat]
reversa [O] = [O]
reversa [S x] = [S x]
reversa (x:xs) = (reversa xs)++[x]

--Devolvemos el largo de una lista con elementos
--Nat
length1 :: [Nat]->Integer
length1 []=0
length1 (x:xs) = 1+(length1 xs)

--Buscamos en elemento menor en una lista de elementos Nat
minList:: [Nat]-> Nat
minList [O] = O
minList [S x] = S x
minList (x:xs) = if (menorIgual x (minList xs))==True 
					then x else minList(xs)

--Sumamos las entradas presentes en nuestra lista
sumList :: [Nat]-> Nat
sumList []=O
sumList [O] = O
sumList [S x] = S x
sumList (x:xs) = suma x (sumList(xs))

--Ordenamos nuestra lista de elementos Nat 
ordena :: [Nat] -> [Nat]
ordena [] = []
ordena (x:xs) = insert x (ordena xs)

--Funciones Auxiliares

--Usada para poder hacer la ordenacion de nuestra lista
insert :: Nat->[Nat]->[Nat]
insert O []= [O]
insert (S e) [] = [S e]
insert e (x:xs)
				| menorIgual e x = e:x:xs				
				| otherwise = x:insert e xs

--Empleada para poder tener una manipulacion mas facil
--de los elementos para poder despues compararlos 
convierte :: Nat->Integer
convierte O = 0
convierte (S x) = 1 +convierte x

--Podemos pasar un Integer a nuestra tipo de dato Nat y así ver
--su representacion 
revierte :: Integer -> Nat
revierte 0 =O
revierte (n + 1) = S (revierte n)

--Para comparar nuestros elementos de tipo Nat
--Solo tomamos el caso de que 2 elementos sean menores o iguales
--ya que es el caso que nos importara en las otras funciones
menorIgual:: Nat -> Nat -> Bool
menorIgual O O= if (convierte O) == (convierte O) 
						then True else False
menorIgual O (S n)= if (convierte O) < (convierte (S n)) 
						then True else False
menorIgual (S n) O = if (convierte (S n)) < (convierte O)
						then True else False
menorIgual (S n) (S y) = if (convierte (S n)) <= (convierte (S y))
						then True else False						