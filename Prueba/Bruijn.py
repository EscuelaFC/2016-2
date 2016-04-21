#!/usr/bin/env python
# try:
#     import matplotlib.pyplot as plt
# except:
#     raise
# import networkx as nx
# try:    
#     m=nx.drawing.write_dot.__module__
# except:      
#     raise
# import sys


# def debruijn(m, n):
#     v = [0 for _ in range(n)]
#     l = 1
#     r = []
#     while True:
#         if n % l == 0:
#           r.extend(v[0:l])
#         for i in range(l, n):
#             v[i] = v[i-l]
#         l = n
#         while l > 0 and v[l-1] >= m-1:
#            l-=1
#         if l == 0:
#             break
#         v[l-1] += 1
#     return r

# def grafica(m,n):    
    # num_vertices=(m**(n-1))
    # num_alfabeto=(n-1)
    # alfabeto = []
    # for i in range(0,num_alfabeto):
    #     alfabeto.append(i)        
    # G=nx.MultiDiGraph(loops=True)    
    # for i in range(0,m**(n-1)):
    #     G.add_node(i)           
    # pos=nx.spring_layout(G) # positions for all nodes
    # nx.draw_networkx_nodes(G,pos,node_size=700)
    # nx.draw_networkx_edges(G,pos)    
    # nx.draw_networkx_labels(G,pos,font_size=12)    
    # plt.axis('off')        
    # plt.savefig("weighted_graph.png") # save as png
    # plt.show() # display    

# def main():
#     try: #verifica que le pasen los parametros requeridos
#         m = sys.argv[1]
#         n = sys.argv[2]
#     except:
#         print "Brujin necesita dos enteros un m y n positivos "        
#         print "python "+ sys.argv[0] + " m:entero n:entero"
#         print "Por ejmeplo:\npython "+ sys.argv[0] + " 2 3"
#         quit()        
#     print debruijn(int(m),int(n))            
#     grafica(int(m),int(n))            

# if __name__ == '__main__':
#     main()
#!/usr/bin/env python
from graphviz import Digraph
dot = Digraph(comment='The Round Table')
dot.node('A', 'King Arthur')
dot.node('B', 'Sir Bedevere the Wise')
dot.node('L', 'Sir Lancelot the Brave')

dot.edges(['AA', 'AL'])
dot.edge('B', 'L', constraint='false')
dot.render('test-output/round-table.gv', view=True)
'test-output/round-table.gv.gpg'