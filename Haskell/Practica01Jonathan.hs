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

--MinList
minList:: [Nat]-> Nat
minList [Cero] = Cero
minList [Suc x] = Suc x


sumList :: [Nat]-> Nat
sumList []=Cero
sumList [Cero] = Cero
sumList [Suc x] = Suc x
sumList (x:xs) = suma x (sumList(xs))

--Ordenar



--Funciones Auxiliares
convierte :: Nat->Integer
convierte Cero = 0
convierte (Suc x) = 1 +convierte x

revierte :: Integer -> Nat
revierte 0 =Cero
revierte (n + 1) = Suc (revierte n)

menor:: Nat -> Nat -> Bool
menor Cero (Suc n)= if (convierte Cero) < (convierte (Suc n)) 
						then True else False
menor (Suc n) Cero = if (convierte (Suc n)) <(convierte Cero)
						then True else False
menor (Suc n) (Suc y) = if (convierte (Suc n)) < (convierte (Suc y))
						then True else False						

mayor:: Nat -> Nat -> Bool
mayor Cero (Suc n) = if (convierte Cero) > (convierte (Suc n))
						then True else False
mayor (Suc n) Cero = if (convierte (Suc n)) > (convierte Cero) 
						then True else False
mayor (Suc n) (Suc y) = if (convierte (Suc n)) > (convierte (Suc y)) 
						then True else False

igual :: Nat->Nat->Bool												
igual Cero Cero = if (convierte Cero)==(convierte Cero) 
					then True else False
igual (Suc x)(Suc y)= if (convierte (Suc x)) == (convierte (Suc y))
						then True else False