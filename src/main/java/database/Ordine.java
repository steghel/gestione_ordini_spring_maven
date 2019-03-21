/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.*;
import java.io.Serializable;
import java.io.*;
import java.util.*;

public class Ordine implements Serializable{
    private String idOrdine;
    private String importo_totale="0";//quantita di articoli x costo articolo
    private String importo_iva;//somma dell'iva di ogni articolo
    private String sconto_ordine;//sconto fatto su tutto l'ordine
    private String importo_ordine="0";//importo finale che deve pagare il cliente
    
    //variabili di articolo    
    private int costo;    
    private ArrayList<Articolo> vettoreArticoli = new ArrayList<Articolo>();   
    
    //variabili dell'associazione ord_art   
    private String iva;
    private String quantita;    
    private String sconto;
    
    //variabili per esportazione dati
    private String dati="";
    
    private String[][] tabella;
    private int maxRighe;
    private int maxColonne;
    
    
     /******************************************/
    /*metodi get*/
    /******************************************/
    
    public String getIdOrdine(){
        return idOrdine;
    }
    
    public String getImporto_totale(){
        return importo_totale;
    }
    
    public String getImporto_iva(){
        return importo_iva;
    }
    
    public String getSconto_ordine(){
        return sconto_ordine;
    }
    
    public String getImporto_ordine(){
        return importo_ordine;
    }
    
    public String[][] getTabella(){
         return tabella;
    } 
    
    public int getMaxRighe(){
         return maxRighe;
    } 
    
    public int getMaxColonne(){
         return maxColonne;
    }
    public String getDati(){
        return dati;
    }
    
    /******************************************/
    /*metodi set*/
    /******************************************/
    public void setIdOrdine(String idOrdine){
        this.idOrdine = idOrdine;
    }
    public void setImporto_totale(String importo_totale){
        this.importo_totale = importo_totale;
    }
    
    public void setImporto_iva(String importo_iva){
        this.importo_iva = importo_iva;
    }
    public void setSconto_ordine(String sconto_ordine){
        this.sconto_ordine = sconto_ordine;
    }
    
    public void setImporto_ordine(String importo_ordine){
        this.importo_ordine = importo_ordine;
    }
    
     /******************************************/
    /*metodi vari*/
    /******************************************/
    public void calcolaImportoOrdineSenzaSconto(ArrayList<Articolo> va)throws Exception{       
        importo_ordine="0";
        sconto="0";
        vettoreArticoli=va;
        //trasformo la stringa in double
        double imp_ord=Double.parseDouble(importo_ordine);
        //faccio la scansione di tutti gli elementi della lista
        for(Articolo tmp:vettoreArticoli){
            
            
            //dati prelevati da articolo
            
            quantita=tmp.getQuantita();
            //trasformo quantità in un intero
            int quant = Integer.parseInt(quantita);
            
            iva=tmp.getIva();
            int iv = Integer.parseInt(iva);
            
            
            costo=tmp.getCosto();
            
            
            
            double par1=costo*quant;
            double par2=costo*iv*quant;
            double par3=par2/100;
            
            //FORMULA: importo_ordine=[operaz ripetute per ogni articolo]
            //(costo di un oggetto x quantità) +  (costo x IVA)  
            // - (sconto x quantità)- sconto ordine
            //imp_ord=imp_ord+(costo*quant)+((double)costo*iv*(double)quant/100)-(sc*quant)- sc_or;
            imp_ord=imp_ord+par1+par3;
       }
       //trasformo il double in stringa 
       String st= Double.toString(imp_ord);
       importo_ordine=st;
    }
    
    
    public void calcolaImportoOrdine(ArrayList<Articolo> va)throws Exception{       
        importo_ordine="0";
        sconto="0";
        vettoreArticoli=va;
        //trasformo la stringa in double
        double imp_ord=Double.parseDouble(importo_ordine);
        //faccio la scansione di tutti gli elementi della lista
        for(Articolo tmp:vettoreArticoli){
            
            
            //dati prelevati da articolo
            
            quantita=tmp.getQuantita();
            //trasformo quantità in un intero
            int quant = Integer.parseInt(quantita);
            
            iva=tmp.getIva();
            int iv = Integer.parseInt(iva);
            
            sconto=tmp.getSconto();
            int sc=0;
            String str="no";
            if(!sconto.equals(str)){ //il metodo equals ritorna true se la stringa 
                                     //sconta vale no; '!' nega il true
                                     // e lo fa diventare un false cioè l'if 
                                     // è verificato se sconto diverso da 'no'
               sc = Integer.parseInt(sconto); 
            }
            costo=tmp.getCosto();
            
            
            int sc_or = Integer.parseInt(sconto_ordine);
            double par1=costo*quant;
            double par2=costo*iv*quant;
            double par3=par2/100;
            double par4=sc*quant;
            //FORMULA: importo_ordine=[operaz ripetute per ogni articolo]
            //(costo di un oggetto x quantità) +  (costo x IVA)  
            // - (sconto x quantità)- sconto ordine
            //imp_ord=imp_ord+(costo*quant)+((double)costo*iv*(double)quant/100)-(sc*quant)- sc_or;
            imp_ord=imp_ord+par1+par3+par4-sc_or;
       }
       //trasformo il double in stringa 
       String st= Double.toString(imp_ord);
       importo_ordine=st;
    }
    
    public void calcolaImportoTotale(ArrayList<Articolo> va)throws Exception{
        importo_totale="0";
        vettoreArticoli=va;
        double imp_tot=Double.parseDouble(importo_totale);
        //faccio la scansione di tutti gli elementi della lista
        for(Articolo tmp:vettoreArticoli){
            
            //dati prelevati da articolo            
            quantita=tmp.getQuantita();
            //trasformo quantità in un intero
            int quant = Integer.parseInt(quantita);               
            
            costo=tmp.getCosto();
            
            //FORMULA
            imp_tot=imp_tot+(costo*quant);            
       } 
       String st= Double.toString(imp_tot);
       importo_totale=st; 
    }
    
    public void calcolaImportoIva(ArrayList<Articolo> va)throws Exception{  
        importo_iva="0";
        vettoreArticoli=va;
        double imp_iv=Double.parseDouble(importo_iva);
        //faccio la scansione di tutti gli elementi della lista
        for(Articolo tmp:vettoreArticoli){
            
            //dati prelevati da articolo            
            quantita=tmp.getQuantita();
            //trasformo quantità in un intero
            int quant = Integer.parseInt(quantita);
            
            iva=tmp.getIva();
            //int iv = Integer.parseInt(iva);  
            double iv = Integer.parseInt(iva); 
            costo=tmp.getCosto();
            
            //FORMULA
            imp_iv=imp_iv+(costo*quant*iv/100);
       } 
       String st= Double.toString(imp_iv);
       importo_iva=st; 
    }
    
    public void inserisciDati()throws Exception{
         Connessione c = new Connessione();
         c.effettuaConnessione();
         String datoDaInserire = new String("insert into ordine"
                    + "(idordine,importo_totale,importo_iva,sconto_ordine,importo_ordine)"
                 + "values( ?,?,?,?,?)");
         
         try{
                PreparedStatement pst = c.getConnessione().prepareStatement(datoDaInserire);
                pst.setString(1, idOrdine);
                pst.setString(2, importo_totale);
                pst.setString(3, importo_iva);
                pst.setString(4, sconto_ordine);
                pst.setString(5, importo_ordine);
                
                //throw new Exception("stringa : " +  pst );
                pst.executeUpdate();
         }
         catch (SQLException se){
                Console.scriviStringa("SQL exception " +se.getMessage());
         }
    }
    
    public void leggiDatiEsportazione(){
         int numeroDiRiga;
         int max=0;
         
         //calcola da quante righe è formata la tabella
         Connessione c = new Connessione();
         c.effettuaConnessione();         
         try{             
            //scansione della tabella atleta
            Statement st = c.getConnessione().createStatement();
            ResultSet rs = st.executeQuery("select * from ordine");
            numeroDiRiga=0;            
            while(rs.next()) {
                numeroDiRiga++;
            }
            //Console.scriviStringa("numeroDiRiga: " + numeroDiRiga);
            max=numeroDiRiga;
         }
         catch (SQLException se){
            Console.scriviStringa(" SQL exception " +se.getMessage());
         } 
         
         //crea la tabella
         tabella=new String[max+1][5];
         
        
         //crea la riga intestazione della tabella
         tabella[0][0]="ID";
         tabella[0][1]="Importo totale"; 
         tabella[0][2]="Importo iva";
         tabella[0][3]="Sconto ordine";
         tabella[0][4]="Importo ordine";
         
         //inserisci la riga intestazione come prima riga dell'arraylist
        
         
         try{             
            //scansione della tabella atleta
            Statement st = c.getConnessione().createStatement();
            ResultSet rs = st.executeQuery("select * from ordine");
            numeroDiRiga=1;            
            while(rs.next()) { 
                //crea una riga di dati
                tabella[numeroDiRiga][0]=rs.getString("idOrdine");                
                tabella[numeroDiRiga][1]=rs.getString("importo_totale"); 
                tabella[numeroDiRiga][2]=rs.getString("importo_iva");
                tabella[numeroDiRiga][3]=rs.getString("sconto_ordine");                
                tabella[numeroDiRiga][4]=rs.getString("importo_ordine");
                
                //incrementa numeroDiRiga
                numeroDiRiga++; 
            }
            maxRighe=numeroDiRiga;
            maxColonne=5;
            
           
         }
       
         catch (SQLException se){
            Console.scriviStringa(" SQL exception " +se.getMessage());
         } 
         
        
        //throw new Exception("tabella : " +  dati );
     }
    
    public void resetVariabili(){
        importo_iva="";
        importo_totale="";
        importo_ordine="";
    }
    
    public void setDati(){
       dati ="ID:"+idOrdine+";&nbsp &nbsp &nbsp   IMPORTO IVA:"+importo_iva+";&nbsp &nbsp &nbsp IMPORTO_ORDINE:"+importo_ordine
            +";&nbsp &nbsp &nbsp IMPORTO TOTALE:  "+importo_totale+";"; 
    }
    
    public void leggiRiga(){
         Connessione c = new Connessione();
         c.effettuaConnessione();         
         try{             
            //scansione della tabella atleta
            Statement st = c.getConnessione().createStatement();
            ResultSet rs = st.executeQuery("select * from ordine where idordine=" + idOrdine);
                     
            while(rs.next()) {
                idOrdine="idordine";
                importo_totale="importo_totale"; 
                importo_iva="importo_iva";
                sconto_ordine="sconto_ordine";
                importo_ordine="importo_ordine";
            }
            
         }
         catch (SQLException se){
            Console.scriviStringa(" SQL exception " +se.getMessage());
         }
    }
    
}
