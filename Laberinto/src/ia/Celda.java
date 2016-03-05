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

    int celdaX, celdaY;
    boolean visitada;
    boolean queda;
    boolean paredArriba = true;
    boolean paredAbajo = true;
    boolean paredIzq = true;
    boolean paredDer = true;

    public Celda(int celdaX, int celdaY, boolean visitada, boolean queda) {
        this.celdaX = celdaX;
        this.celdaY = celdaY;
        this.visitada = visitada;
        this.queda = queda;
    }
}
