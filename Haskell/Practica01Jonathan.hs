--Abrego Alvarez Jonathan
--jo.ab.al@ciencias.unam.mx
--308043305

data Nat = Cero | Suc Nat deriving Show

suma :: Nat ->Nat->Nat 
suma x Cero = x
suma x (Suc y)  = suma (Suc x) y

producto :: Nat -> Nat -> Nat
producto x Cero = Cero
producto x (Suc Cero) = x
producto x (Suc y) = suma x (producto x y)

potencia :: Nat -> Nat -> Nat
potencia x Cero = (Suc Cero)
potencia x (Suc Cero) = x
potencia x (Suc y ) = potencia (producto x x) y

factorial :: Nat -> Nat
factorial Cero = (Suc Cero)
factorial (Suc Cero) = (Suc Cero)
factorial  (Suc x)  =  producto (Suc x) (factorial x)

reversa :: [Nat] -> [Nat]
reversa [Cero] = [Cero]
reversa [Suc x] = [Suc x]
reversa (x:xs) = (reversa xs)++[x]

length1 :: [Nat]->Integer
length1 []=0
length1 (x:xs) = 1+(length1 xs)

minList:: [Nat]-> Nat
minList [Cero] = Cero
minList [Suc x] = Suc x
minList (x:xs) = if (menorIgual x (minList xs))==True 
					then x else minList(xs)

sumList :: [Nat]-> Nat
sumList []=Cero
sumList [Cero] = Cero
sumList [Suc x] = Suc x
sumList (x:xs) = suma x (sumList(xs))

ordena :: [Nat] -> [Nat]
ordena [] = []
ordena (x:xs) = insert x (ordena xs)


--Funciones Auxiliares
insert :: Nat->[Nat]->[Nat]
insert Cero []= [Cero]
insert (Suc e) [] = [Suc e]
insert e (x:xs)
				| menorIgual e x = e:x:xs				
				| otherwise = x:insert e xs

convierte :: Nat->Integer
convierte Cero = 0
convierte (Suc x) = 1 +convierte x

revierte :: Integer -> Nat
revierte 0 =Cero
revierte (n + 1) = Suc (revierte n)

menorIgual:: Nat -> Nat -> Bool
menorIgual Cero Cero= if (convierte Cero) == (convierte Cero) 
						then True else False
menorIgual Cero (Suc n)= if (convierte Cero) < (convierte (Suc n)) 
						then True else False
menorIgual (Suc n) Cero = if (convierte (Suc n)) < (convierte Cero)
						then True else False
menorIgual (Suc n) (Suc y) = if (convierte (Suc n)) <= (convierte (Suc y))
						then True else False						