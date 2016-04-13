/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minimax.ia;

import static java.lang.System.out;
import java.util.LinkedList;
import java.util.Scanner;

/**
 *
 * @author jon
 */
public class Minimax {
        
    static int MARCA1 = 1; 
    static int MARCA2 = 4; 
    
    int profundidad = 0;       // Profundidad a la que se ha expandido el árbol.
    int diametroMaximo = 1;    // Mayor número de estados expandidos a la misma profundidad.
    
    int anchoGato, altoGato;           // Dimensiones en pixeles del dibujo de cada gato.    
    boolean genera = false;            // Bandera para solicitar la expansión del siguiente nivel.
    
    Gato gatoRaiz;                     // Estado inicial
    LinkedList<Gato> listaAbierta = new LinkedList();  // Nodos en el nivel más profundo que no han sido expandidos.
    
    public Minimax(){
        
    }

    public class Gato {

        int[][] tablero = new int[3][3];     // Tablero del juego
        Gato padre;                          // Quién generó este estado.
        LinkedList<Gato> sucesores;          // Posibles jugadas desde este estado.
        boolean jugador1 = false;            // Jugador que tiró en este tablero.
        boolean hayGanador = false;          // Indica si la última tirada produjo un ganador.
        int tiradas = 0;                     // Número de casillas ocupadas.

        /**
         * Constructor del estado inicial.
         */
        public Gato() {
        }

        /**
         * Constructor que copia el tablero de otro gato y el número de tiradas
         */
        public Gato(Gato g) {
            for (int i = 0; i < 3; i++) {
                for (int j = 0; j < 3; j++) {
                    tablero[i][j] = g.tablero[i][j];
                }
            }
            tiradas = g.tiradas;
        }

        /**
         * Indica si este estado tiene sucesores expandidos.
         */
        public int getNumHijos() {
            if (sucesores != null) {
                return sucesores.size();
            } else {
                return 0;
            }
        }

        /* Función auxiliar.
         * Dada la última posición en la que se tiró y la marca del jugador
         * calcula si esta jugada produjo un ganador y actualiza el atributo correspondiente.
         * 
         * Esta función debe ser lo más eficiente posible para que la generación del árbol no sea demasiado lenta.
         */
        public void hayGanador(int x, int y, int marca) {
            // Horizontal
            if (tablero[y][(x + 1) % 3] == marca && tablero[y][(x + 2) % 3] == marca) {
                hayGanador = true;
                return;
            }
            // Vertical
            if (tablero[(y + 1) % 3][x] == marca && tablero[(y + 2) % 3][x] == marca) {
                hayGanador = true;
                return;
            }
            // Diagonal
            if ((x == 1 && y != 1) || (y == 1 && x != 1)) {
                return; // No pueden hacer diagonal
            }            // Centro y esquinas
            if (x == 1 && y == 1) {
                // Diagonal \
                if (tablero[0][0] == marca && tablero[2][2] == marca) {
                    hayGanador = true;
                    return;
                }
                if (tablero[2][0] == marca && tablero[0][2] == marca) {
                    hayGanador = true;
                    return;
                }
            } else if (x == y) {
                // Diagonal \
                if (tablero[(y + 1) % 3][(x + 1) % 3] == marca && tablero[(y + 2) % 3][(x + 2) % 3] == marca) {
                    hayGanador = true;
                    return;
                }
            } else // Diagonal /
            if (tablero[(y + 2) % 3][(x + 1) % 3] == marca && tablero[(y + 1) % 3][(x + 2) % 3] == marca) {
                hayGanador = true;
                return;
            }
        }

        /* Función auxiliar.
         * Coloca la marca del jugador en turno para este estado en las coordenadas indicadas.
         * Asume que la casilla está libre.
         * Coloca la marca correspondiente, verifica y asigna la variable si hay un ganador.
         */
        public void tiraEn(int x, int y) {
            tiradas++;
            int marca = (jugador1) ? MARCA1 : MARCA2;
            tablero[y][x] = marca;
            hayGanador(x, y, marca);
        }

        /**
         * Crea la lista sucesores y agrega a todos los estados que surjen de
         * tiradas válidas. Se consideran tiradas válidas a aquellas en una
         * casilla libre. Además, se optimiza el proceso no agregando estados
         * con jugadas simétricas. Los estados nuevos tendrán una tirada más y
         * el jugador en turno será el jugador contrario.
         */
        public LinkedList<Gato> generaSucesores() {
            if (hayGanador) {
                return null;
            }
            sucesores = new LinkedList<Gato>();
            for (int i = 0; i < 3; i++) {
                for (int j = 0; j < 3; j++) {
                    if (tablero[i][j] == 0) { //verificamos que la entrada i,j no tenga ya un X o O
                        Gato nuevo = new Gato(this);
                        if (jugador1 == false) {
                            nuevo.jugador1 = true;
                        } else {
                            nuevo.jugador1 = false;
                        }
                        nuevo.padre = this;
                        nuevo.tiraEn(j, i);
                        out.println(recorreListaGatos(sucesores, nuevo));
                        if (recorreListaGatos(sucesores, nuevo)) {
                            sucesores.add(nuevo);
                        }
                    }
                }
            }
            this.sucesores = sucesores;
            return sucesores;            
        }

        public boolean recorreListaGatos(LinkedList<Gato> gatos, Gato verificar) {
            for (Gato g : gatos) {
                if (verificar.equals(g)) {
                    return false;
                }
            }
            return true;
        }
        
        public boolean esIgual(Gato otro) {
            for (int i = 0; i < 3; i++) {
                for (int j = 0; j < 3; j++) {
                    if (tablero[i][j] != otro.tablero[i][j]) {
                        return false;
                    }
                }
            }
            return true;
        }

        public boolean esSimetricoDiagonalInvertida(Gato otro) {
            for (int i = 0; i < 3; i++) {
                for (int j = 0; j < 3; j++) {
                    if (this.tablero[i][j] != otro.tablero[j][i]) {
                        return false;
                    }
                }
            }
            return true;
        }

        public boolean esSimetricoDiagonal(Gato otro) {
            for (int i = 0; i < 3; i++) {
                for (int j = 0; j < 3; j++) {
                    if (this.tablero[i][j] != otro.tablero[2 - j][2 - i]) {
                        return false;
                    }
                }
            }
            return true;
        }

        public boolean esSimetricoVerticalmente(Gato otro) {            
            for (int i = 0; i < 3; i++) {
                for (int j = 0; j < 3; j++) {
                    if (this.tablero[i][j] != otro.tablero[i][2 - j]) {
                        return false;
                    }
                }
            }
            return true;
        }

        public boolean esSimetricoHorizontalmente(Gato otro) {
            for (int i = 0; i < 2; i++) {
                for (int j = 0; j < 3; j++) {
                    if (this.tablero[i][j] != otro.tablero[2 - i][j]) {
                        return false;
                    }
                }
            }
            return true;
        }

        public boolean esSimetrico90(Gato otro) {
            for (int i = 0; i < 3; i++) {
                for (int j = 0; j < 3; j++) {
                    if (this.tablero[i][j] != otro.tablero[j][2 - i]) {
                        return false;
                    }
                }
            }
            return true;
        }
        
        public boolean esSimetrico180(Gato otro) {
            for (int i = 0; i < 3; i++) {
                for (int j = 0; j < 3; j++) {
                    if (this.tablero[i][j] != otro.tablero[2 - i][2 - j]) {
                        return false;
                    }
                }
            }
            return true;
        }
        
        public boolean esSimetrico270(Gato otro) {
            for (int i = 0; i < 3; i++) {
                for (int j = 0; j < 3; j++) {
                    if (this.tablero[i][j] != otro.tablero[2 - j][i]) {
                        return false;
                    }
                }
            }
            return true;
        }
        
        @Override
        public boolean equals(Object o) {
            Gato otro = (Gato) o;
            if (esIgual(otro)) {
                return true;
            }

            if (esSimetricoDiagonalInvertida(otro)) {
                return true;
            }
            if (esSimetricoDiagonal(otro)) {
                return true;
            }
            if (esSimetricoVerticalmente(otro)) {
                return true;
            }
            if (esSimetricoHorizontalmente(otro)) {
                return true;
            }
            if (esSimetrico90(otro)) {
                return true;
            }
            if (esSimetrico180(otro)) {
                return true;
            }
            if (esSimetrico270(otro)) {
                return true;
            }

            return false;
        }

        @Override
        public String toString() {
            char simbolo = jugador1 ? 'o' : 'x';
            String gs = "";
            for (int i = 0; i < 3; i++) {
                for (int j = 0; j < 3; j++) {
                    gs += tablero[i][j] + " ";
                }
                gs += '\n';
            }
            return gs;
        }
    }
    
    public void pureba(){
        Gato g = new Gato();
        g.jugador1=true; 
        g.tiraEn(0, 0);
        out.println(g.tiradas);       
        out.println(g.toString());
        g.jugador1=false; 
        g.tiraEn(0, 2);
        out.println(g.toString());
    }
    
    public void generaSiguienteNivel() {
        // Si ya se alcanzó la profundidad máxima (9 jugadas) no hace nada.
        if (profundidad >= 9) {
            return;
        }
        // Genera sucesores.
        int numGatos = listaAbierta.size();
        for (int i = 0; i < numGatos; i++) {
            Gato actual = listaAbierta.remove();
            LinkedList<Gato> sucesores = actual.generaSucesores();
            if (sucesores != null) {
                listaAbierta.addAll(sucesores);
            }
        }
        // Actualiza variables de estado para saber en qué punto se encuentra el proceso
        // y si hay que hacer ajustes al lienzo de dibujo.
        profundidad++;
        numGatos = listaAbierta.size();
        if (numGatos > diametroMaximo) {
            diametroMaximo = numGatos;
        }
        genera = false;
    }
           
    public static void main(String[] args) {
        Minimax mm= new Minimax();
        Scanner scn = new Scanner(System.in);        
        System.out.println("Entrada: ");
        String cadena=scn.next();        
        mm.pureba();
    }

}
