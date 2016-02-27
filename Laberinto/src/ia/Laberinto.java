/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ia;
import processing.core.PApplet;
import processing.core.PFont;


/**
 *
 * @author jon
 */
public class Laberinto extends PApplet {
    PFont fuente;
     
    int alto = 100;
    int ancho = 100;
    int celda = 6;        
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
                fill(50);                
                rect(j * modelo.tamanio, i * modelo.tamanio, modelo.tamanio, modelo.tamanio);
            }
        }
        
        // Pintar informacion del modelo en la parte inferior de la ventana.        
        rect(0, alto * celda, (ancho * celda), 32);
        fill(255);
        textFont(fuente, 10);
        text("Dimension:\n " + modelo.ancho + " X " + modelo.alto, 5, (alto * celda) + 12);                    
    }
    
    /**
     * Representación de cada celda de la cuadrícula.
     */
    class Celda {

        int celdaX, celdaY;
        
        /**
         * Constructor de una celda
         *
         * @param celdaX Coordenada en x
         * @param celdaY Coordenada en y       
         * 
         */
        Celda(int celdaX, int celdaY) {
            this.celdaX = celdaX;
            this.celdaY = celdaY;            
        }
    }

    class Molde {

        int ancho, alto;  // Tamaño de celdas a lo largo y ancho de la cuadrícula.
        int tamanio;  // Tamaño en pixeles de cada celda.        
        Celda[][] mundo;  // Mundo de celdas donde habitan las astillas.        

        /**
         * Constructor del modelo
         *
         * @param ancho Cantidad de celdas a lo ancho en la cuadricula.
         * @param ancho Cantidad de celdas a lo largo en la cuadricula.
         * @param tamanio Tamaño (en pixeles) de cada celda cuadrada que compone
         * la cuadricula.         
         */
        Molde(int ancho, int alto, int tamanio) {
            this.ancho = ancho;
            this.alto = alto;
            this.tamanio = tamanio;            
            mundo = new Celda[alto][ancho];
            for (int i = 0; i < alto; i++) {
                for (int j = 0; j < ancho; j++) {
                    mundo[i][j] = new Celda(i, j);
                }
            }                        
        }       
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        PApplet.main(new String[]{"ia.Laberinto"});                
    }
}