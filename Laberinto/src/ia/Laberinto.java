/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ia;

import java.util.Random;
import processing.core.PApplet;
import processing.core.PFont;

/**
 *
 * @author jon
 */
public class Laberinto extends PApplet {

    PFont fuente;
    Random rnd=new Random();
    int alto = 50;
    int ancho = 50;
    int celda = 10;
    Molde modelo;

    public void settings() {
        size(ancho * celda, (alto * celda) + 32);
    }

    @Override
    public void setup() {
        background(50);
        fuente = createFont("Arial", 14, true);
        modelo = new Molde(ancho, alto, celda);
    }

    @Override
    public void draw() {
        for (int i = 0; i < alto; i++) {
            for (int j = 0; j < ancho; j++) {
                if (modelo.posX == j && modelo.posY == i) {
                    fill(255, 67, 88);                                        
                } else if (modelo.mundo[i][j].queda) {
                    fill(255);
                } else if (modelo.mundo[i][j].visitada) {
                    fill(255, 210, 0);
                } else {
                    fill(200);
                }
                rect(j * modelo.tamanio, i * modelo.tamanio, modelo.tamanio, modelo.tamanio);
                if (modelo.mundo[i][j].paredIzq) {
                    stroke(0);
                    //if (i == 0) line(j*modelo.tamanio, i*modelo.tamanio, j*modelo.tamanio, modelo.tamanio);
                    line(j * modelo.tamanio, i * modelo.tamanio, j * modelo.tamanio, ((i + 1) * modelo.tamanio));
                }
                if (modelo.mundo[i][j].paredArriba) {
                    stroke(0);
                    //if (j == 0) line(j*modelo.tamanio, i*modelo.tamanio, modelo.tamanio, i*modelo.tamanio);
                    line(j * modelo.tamanio, i * modelo.tamanio, ((j + 1) * modelo.tamanio), i * modelo.tamanio);
                }
                if (modelo.mundo[i][j].paredDer) {
                    stroke(0);
                    //if (i == 0) line((j*modelo.tamanio) + modelo.tamanio, i*modelo.tamanio, (j*modelo.tamanio) + modelo.tamanio, modelo.tamanio);
                    line((j * modelo.tamanio) + modelo.tamanio, i * modelo.tamanio, (j + 1) * modelo.tamanio, (((i + 1) * modelo.tamanio)));
                }
                if (modelo.mundo[i][j].paredAbajo) {
                    stroke(0);
                    //if (j == 0) line(j*modelo.tamanio, (i*modelo.tamanio) + modelo.tamanio, modelo.tamanio, i*modelo.tamanio);
                    line(j * modelo.tamanio, (i * modelo.tamanio) + modelo.tamanio, ((j + 1) * modelo.tamanio), ((i + 1) * modelo.tamanio));
                }
                stroke(255);
            }
        }
        
        fill(50);
        rect(0, alto * celda, (ancho * celda), 32);
        fill(255);
        textFont(fuente, 10);
        text("Cuadricula: " + modelo.ancho + " x " + modelo.alto, 5, (alto * celda) + 12);
        text("Generacion " + modelo.generacion, 128, (alto * celda) + 12);                                
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        PApplet.main(new String[]{"ia.Laberinto"});                
    }
}