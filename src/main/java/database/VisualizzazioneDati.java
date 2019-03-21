/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.io.Serializable;
import java.sql.*;
import java.io.*;
import java.util.*;

/**
 *
 * @author sgh
 */
public class VisualizzazioneDati implements Serializable {
    private int maxRighe;
    private int maxColonne;
    private String dati;  
    private String[][] tabella;
    private String stringa="";
    
    public String getStringa(){
         return stringa;
    }
    
    public String getDati(){
         return dati;
    }
    
    public void setStringa(String st){
         
         stringa=st;
    }
    
    public void creaTabellaCliente(){
        // crea un oggetto cliente
        Cliente c = new Cliente();
        //leggi la tabella cliente del database
        c.leggiDatiEsportazione();
        //dimensioni della tabella
        maxRighe=c.getMaxRighe();
        maxColonne=c.getMaxColonne();
        //creo la tabella
        tabella=new String[maxRighe][maxColonne];
        tabella=c.getTabella();
        /*
        //test per verificare se i dati sono trasferiti a tabella
        for(int i=0;i<maxRighe;i++){
            for(int j=0;j<maxColonne;j++){
                //scansione 
                dati+=tabella[i][j];
            }                
        }
        * 
        */
    }
    
    public void creaTabellaAzienda(){
        // crea un oggetto cliente
        Azienda c = new Azienda();
        //leggi la tabella azienda del database
        c.leggiDatiEsportazione();
        //dimensioni della tabella
        maxRighe=c.getMaxRighe();
        maxColonne=c.getMaxColonne();
        //creo la tabella
        tabella=new String[maxRighe][maxColonne];
        tabella=c.getTabella();
        /*
        //test per verificare se i dati sono trasferiti a tabella
        for(int i=0;i<maxRighe;i++){
            for(int j=0;j<maxColonne;j++){
                //scansione 
                dati+=tabella[i][j];
            }                
        }
        * 
        */
    }
    
    public void creaTabellaArticolo(){
        // crea un oggetto cliente
        Articolo c = new Articolo();
        //leggi la tabella azienda del database
        c.leggiDatiEsportazione();
        //dimensioni della tabella
        maxRighe=c.getMaxRighe();
        maxColonne=c.getMaxColonne();
        //creo la tabella
        tabella=new String[maxRighe][maxColonne];
        tabella=c.getTabella();
        /*
        //test per verificare se i dati sono trasferiti a tabella
        for(int i=0;i<maxRighe;i++){
            for(int j=0;j<maxColonne;j++){
                //scansione 
                dati+=tabella[i][j];
            }                
        }
        * 
        */
    }
    
    public void creaTabellaOrdine(){
        // crea un oggetto cliente
        Ordine c = new Ordine();
        //leggi la tabella ordine del database
        c.leggiDatiEsportazione();
        //dimensioni della tabella
        maxRighe=c.getMaxRighe();
        maxColonne=c.getMaxColonne();
        //creo la tabella
        tabella=new String[maxRighe][maxColonne];
        tabella=c.getTabella();
        /*
        //test per verificare se i dati sono trasferiti a tabella
        for(int i=0;i<maxRighe;i++){
            for(int j=0;j<maxColonne;j++){
                //scansione 
                dati+=tabella[i][j];
            }                
        }
        * 
        */
    }
    
    
    public void visualizzaTabellaRiferimento(){
        //creo la tabella in HTML
        dati="<table><colgroup span=\"" + maxRighe + "\">";
        for(int i=0;i<maxRighe;i++){
            //scansione delle righe
            dati+="<tr>";
            for(int j=0;j<maxColonne;j++){
                //scansionedelle colonne                
                if(i==0){
                    dati+="<th>" + tabella[i][j] + "</th>";
                }
                else{
                    dati+="<td>" + tabella[i][j] + "</td>";
                }
            }
            dati+="</tr>";
        }
    }
    
    // METODO OBSOLETO ma serve per evitare il bloccaggio di glassfish
    public void visualizzaTabellaScrollabile()throws Exception{
        //creo la tabella in HTML
        dati="<table class=\"tabellauno\"><thead>";
        //scansione delle righe
        int i=0;
        dati+="<tr>";
        for(int j=0;j<maxColonne;j++){
            //scansionedelle colonne 
            int idcol=j+1;
            dati+="<th id=\"header" +  idcol + "\"><div class=\"divInternoCella\">" + tabella[i][j] + "</div></th>";
        }
        dati+="</tr></thead>";
        dati+=/*"<tfoot><tr><td colspan=\""+ maxColonne + "\">&nbsp;</td></tr></tfoot>"
            + */ "<tbody><tr><td colspan=\""+ maxColonne + "\">"
            + "<div class=\"divinterno\"><table class=\"tabelladue\">";
        for(i=1;i<maxRighe;i++){
            dati+="<tr class=\"riga\" id=\"" + i + "\" >";            
            for(int j=0;j<maxColonne;j++){
                int idcol=j+1;
                dati+="<td id=\"header" +  idcol + "\"><div class=\"divInternoCella\">" + tabella[i][j] + "</div></td>";
            }
            dati+="</tr>";
        }    
        dati+="</tr></tbody></table></div></td></tr></tbody></table>";
        //throw new Exception("stringa : " +  dati );
    }
    
    // IL METODO CHE USO
    public void visualizzaTabellaScrollabileProvaJS()throws Exception{
        //creo la tabella in HTML
        dati="<table class=\"tabellauno\" id=\"idTabellauno\"><thead>";
        //scansione delle righe
        int i=0;
        dati+="<tr>";
        for(int j=0;j<maxColonne;j++){
            //scansionedelle colonne 
            int idcol=j+1;
            dati+="<th id=\"header" +  idcol + "\"><div class=\"divInternoCella\">" + tabella[i][j] + "</div></th>";
        }
        dati+="</tr></thead>";
        dati+=/*"<tfoot><tr><td colspan=\""+ maxColonne + "\">&nbsp;</td></tr></tfoot>"
            + */ "<tbody><tr><td colspan=\""+ maxColonne + "\">"
            + "<div class=\"divinterno\"><table class=\"tabelladue\">";
        for(i=1;i<maxRighe;i++){
            dati+="<tr onclick=\"mostra(this)\" class=\"riga\" id=\"" + i + "\" >";            
            for(int j=0;j<maxColonne;j++){
                int idcol=j+1;
                dati+="<td id=\"header" +  idcol + "\"><div class=\"divInternoCella\">" + tabella[i][j] + "</div></td>";
            }
            dati+="</tr>";
        }    
        dati+="</tr></tbody></table></div></td></tr></tbody></table>";
        //throw new Exception("stringa : " +  dati );
    }
    
    public void visualizzaTabella1(){
        //creo la tabella in HTML i=> righe,j => colonne
        dati="<table><colgroup span=\"" + maxRighe + "\"><thead>";
        //creo la riga intestazione della tabella i=0 j che varia tra 0 e Max
        for(int j=0;j<maxColonne;j++){
            if(j==0){
                dati+="<tr>";
            }
            dati+="<th>" + tabella[0][j] + "</th>";
            if(j==maxColonne-1){
                dati+="</tr>";
            }
        }
        //chiudo la riga intestazione e creo il foot
        dati+="</thead><tfoot></tfoot>";
        //creo le righe restanti della tabella
        dati+="<tbody>";
        for(int i=1;i<maxRighe;i++){            
            for(int j=0;j<maxColonne;j++){
                if(j==0){
                    dati+="<tr>";
                }
                dati+="<td>" + tabella[i][j] + "</td>";
                if(j==maxColonne-1){
                    dati+="</tr>";
                }
            }
        }
        dati+="</tbody></table>";
    }
    
    public void resetStringa(){
        this.stringa=" ";
    }
}

