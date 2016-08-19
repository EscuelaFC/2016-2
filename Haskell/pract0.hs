{-
Lógica computacional 2017-1
         Noé Salomón Hernández Sánchez
         Albert M. Orozco Camacho
         C. Moisés Vázquez Reyes
         Diego Murillo
-}
import Data.List

data Nat = Cero | S Nat deriving Show

suma:: Nat -> Nat -> Nat
suma Cero n = n
suma (S m) n = S (suma n m)

prod::Nat->Nat->Nat
prod Cero _ = Cero
prod x (S Cero) = x
prod x (S y) = suma x (prod x y)

mayorQue::Nat->Nat->Bool
mayorQue Cero Cero = False
mayorQue (S _) Cero = True
mayorQue Cero (S _) = False
mayorQue (S m) (S n) = if igual m n == True then  False
                        else mayorQue m n
igual::Nat->Nat->Bool
igual Cero Cero = True
igual (S _) Cero = False 
igual Cero (S _) = False
igual (S m) (S n) = igual m n

power::Int->Int->Int
power x y
        | y == 0 = 1
        | otherwise = x * power x (y -1)

--power2::Int->Int->Int
--power2 = error "Te toca"

reversa :: [a] -> [a]
reversa [] = []
reversa (x:xs) = (reversa xs)++[x]

sumal::[Int]->Int
sumal [] = error "Caso no valido"
sumal [x]=x
sumal (x:xs) = x + (sumal(xs))

toma::Int->[a]->[a]
toma _ [] = []
toma n _
        | n <= 0 = []
toma n (x:xs) = x : toma (n-1) xs

tira::Int->[a]->[a]
tira _ [] = []
tira n xs
         | n <= 0 = xs
tira n (_:xs) = tira (n-1) xs

cuantas::Eq a=>a->[a]->Int
cuantas _ []= 0
cuantas n (x:xs)
               | n == x = 1 + (cuantas n xs)
               | otherwise = (cuantas n xs)

frec::Eq a=>[a]->[(a, Int)]
frec [] = []
frec ls = nub [(x,cuantas x ls)| x<-ls]

unaVez::Eq a=>[a]->[a]
unaVez [] = []
unaVez ls = [x |x<-ls , cuantas x ls == 1]

--compress1::String->String
--compress1 = error "Te toca"

--compress2::String->String
--compress2 = error "Te toca"

--juego::(Int,Int)->(Int,Int)
--juego = error "Te toca"