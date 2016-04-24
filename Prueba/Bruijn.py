#!/usr/bin/env python
from graphviz import Digraph
import sys

def de_bruijn(m , n):        
    #determinamos nuestro alfabeto 
    alfabeto = list(map(str, range(m))) 
    a = [0] * m * n
    secuencia = []
    def db(t, p):
        if t > n:
            if n % p == 0:
                secuencia.extend(a[1:p + 1])
        else:
            a[t] = a[t - p]
            db(t + 1, p)
            for j in range(a[t - p] + 1, m):                
                a[t] = j
                db(t + 1, t)
    db(1, 1)
    for j in range(0, n - 1):
        a[j] = 0
    #
    secuencia.extend(a[0:n - 1])
    #para la secuencia dada la unimos a una cadena vacia para
    #imprimirlo de una manera mas adecuada
    return "".join(alfabeto[i] for i in secuencia)

def lista_vertices(c, m , n):
    v=[]
    for i in range(0,m**n):
        if c[i:i+(n-1)] not in v and len(c[i:i+(n-1)])==(n-1):
            v.insert(i,c[i:i+(n-1)])
    return v            

def lista_aristas(c, m, n):
    e=[]    
    for i in range(0,m**n):
        if c[i:i+n] not in e and len(c[i:i+n])==n:
            e.insert(i,c[i:i+n])               
    return e

def grafica(c,m,n):
    dot = Digraph(format='pdf')
    ver=lista_vertices(c, m , n)
    for i in range(0,len(ver)):
        dot.node(ver[i],ver[i])          
    for i in range(0,len(ver)):
        elemento = ver[i]        
        for j in range(0,len(ver)):
            elemento2 = ver[j]
            #Desde aqui
            arista=elemento[0:1]+elemento2[0:(n-1)]            
            if arista[0:(n-1)]==elemento and arista[1:n]==elemento2:
                dot.edge(elemento,elemento2,label=arista)        
    dot.render(view=True)        

def main():
    #verifica que le pasen los parametros requeridos
    try: 
        m = sys.argv[1]
        n = sys.argv[2]
    except:
        print "Brujin necesita dos enteros un m y n positivos "        
        print "python "+ sys.argv[0] + " m:entero n:entero"
        print "Por ejmeplo:\npython "+ sys.argv[0] + " 2 3"
        quit()        
    #llamada de metodo para calcular la secuencia de G_{m,n}    
    print de_bruijn(int(m),int(n))    
    grafica(de_bruijn(int(m),int(n)),int(m),int(n))        

if __name__ == '__main__':
    main()