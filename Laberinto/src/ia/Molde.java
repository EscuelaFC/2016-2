/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ia;

import java.util.ArrayList;
import java.util.Random;

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
    Molde(int ancho, int alto, int tamanio) {
        this.ancho = ancho;
        this.alto = alto;
        this.tamanio = tamanio;
        mundo = new Celda[alto][ancho];
        for (int i = 0; i < alto; i++) {
            for (int j = 0; j < ancho; j++) {
                mundo[i][j] = new Celda(i, j, false);
            }
        }
        camino = new ArrayList<Camino>();
        camino.add(new Camino(rnd.nextInt(ancho), rnd.nextInt(alto), rnd.nextInt(4)));
        
    }
}
