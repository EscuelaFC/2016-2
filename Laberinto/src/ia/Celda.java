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
public class Celda {

    int celdaX;
    int celdaY;
    boolean marcada;

    /**
     * Constructor de una celda
     *
     * @param celdaX Coordenada en x
     * @param celdaY Coordenada en y
     * @param marcada che
     *
     */
    Celda(int celdaX, int celdaY, boolean marcada) {
        this.celdaX = celdaX;
        this.celdaY = celdaY;
        this.marcada = marcada;
    }
}
