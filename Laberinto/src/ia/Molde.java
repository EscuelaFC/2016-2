/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ia;

import static java.lang.System.out;
import java.util.ArrayList;
import java.util.Random;
import java.util.Stack;

/**
 *
 * @author jon
 */
public class Molde {

    int ancho, alto;  // Tamaño de celdas a lo largo y ancho de la cuadrícula.
    int tamanio;  // Tamaño en pixeles de cada celda.      
    Celda[][] mundo;  // Mundo de celdas donde habitan las astillas.        
    ArrayList<Camino> camino;
    Random rnd=new Random();

    /**
     * Constructor del modelo
     *
     * @param ancho Cantidad de celdas a lo ancho en la cuadricula.
     * @param ancho Cantidad de celdas a lo largo en la cuadricula.
     * @param tamanio Tamaño (en pixeles) de cada celda cuadrada que compone la
     * cuadricula.
     */
    public Molde(int ancho, int alto, int tamanio) {
        this.ancho = ancho;
        this.alto = alto;
        this.tamanio = tamanio;
        mundo = new Celda[alto][ancho];
        camino = new ArrayList<>();
        for (int i = 0; i < alto; i++) {
            for (int j = 0; j < ancho; j++) {
                mundo[i][j] = new Celda(i, j, false);
                camino.add(new Camino(i,j,rnd.nextInt(4)));
            }
        }
        camino.get(rnd.nextInt(camino.size())).pintada=true;
        //camino.add(new Camino(rnd.nextInt(ancho), rnd.nextInt(alto), rnd.nextInt(4)));        
    }
    
    public void moverCamino(Camino c, int direccion) {
            switch (direccion) {
                case 0:
                    c.posX = (c.posX );
                    c.posY = (c.posY-1);
                    c.direccion = direccion;
                    break;
                case 1:
                    c.posX = (c.posX+1);
                    c.posY = (c.posY );
                    c.direccion = direccion;
                    break;
                case 2:
                    c.posX = (c.posX);
                    c.posY = (c.posY +1);
                    c.direccion = direccion;
                    break;
                case 3:
                    c.posX = (c.posX-1);
                    c.posY = (c.posY);
                    c.direccion = direccion;                    
                    break;
        }
    }        
}