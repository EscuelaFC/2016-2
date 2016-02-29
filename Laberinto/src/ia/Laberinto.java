/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ia;
import static java.lang.System.out;
import processing.core.PApplet;
import processing.core.PFont;


/**
 *
 * @author jon
 */
public class Laberinto extends PApplet {
    PFont fuente;
     
    int alto = 10;
    int ancho = 10;
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
                    fill(50);                
                    rect(j * modelo.tamanio, i * modelo.tamanio, modelo.tamanio, modelo.tamanio);
            }
        }                
        for(Camino c : modelo.camino){            
            if (c.pintada) {
                fill(255, 30, 40);
                rect(c.posX * modelo.tamanio, c.posY * modelo.tamanio, modelo.tamanio, modelo.tamanio);                
            } else {
                fill(50);
                rect(c.posX * modelo.tamanio, c.posY * modelo.tamanio, modelo.tamanio, modelo.tamanio);
            }
//            modelo.moverCamino(c, c.direccion);
        }
        //stroke(0,0,0,0);        
        fill(50);
        rect(0, alto * celda, (ancho * celda), 32);
        fill(255);
        textFont(fuente, 10);
        text("Dimension:\n " + modelo.ancho + " X " + modelo.alto, 5, (alto * celda) + 12);                
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        PApplet.main(new String[]{"ia.Laberinto"});                
    }
}