/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ia;

/**
 *
 * @author jon
 */
public class Camino {

    int posX;
    int posY;  // Coordenadas de la posicion de la termita        
    boolean pintada;  // True si está ya es parte de un camino
    int direccion;

    /**
     * Constructor de una termita
     *
     * @param posX Indica su posicion en el eje X
     * @param posX Indica su posicion en el eje Y
     * @param direccion Indica la direccion en la que mira. ----------- | | 1 ||
     * ----------- | 7 | | 3 | ----------- | | 5 | | -----------
     */
    Camino(int posX, int posY, int direccion) {
        this.posX = posX;
        this.posY = posY;
        this.direccion = direccion;
        this.pintada = false;
    }
}
