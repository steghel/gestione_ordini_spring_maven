/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.io.Serializable;

/**
 *
 * @author sgh
 */
public class Semaforo1 implements Serializable{
    private boolean passa=true;
    
    public boolean getPassa(){
        return passa;
    }
    
    public void setPassa(){
        passa=true;
    }
    
    public void bloccaSemaforo(){
        passa=false;
    }
}
