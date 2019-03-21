/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.*;
import java.io.Serializable;
import java.io.*;
import java.util.*;

/**
 *
 * @author sgh
 */
public class Ord_art implements Serializable{
    private String ordine_rif;
    private String articolo_rif;
    private String iva;
    private String quantita;
    private String articolo_azienda_rif;
    private String sconto;
    
    //variabili di articolo
    private String id;
    private String azienda_produttrice;
    private String nome_prodotto;
    private String informazione_prodotto;
    private int costo;
    
    private ArrayList<Articolo> vettoreArticoli = new ArrayList<Articolo>();
    private String art; 
    private String lista;
    
    //variabili che memorizzano piu  oggetti ord_art
    private ArrayList<Ord_art> vettoreOrd_art = new ArrayList<Ord_art>();
    
    /******************************************/
    /*metodi get*/
    /******************************************/
    
    public String getOrdine_rif(){
    return ordine_rif;
    }
    public String getArticolo_rif(){
    return articolo_rif;
    }
    public String getIva(){
    return iva;
    }
    public String getQuantita(){
    return quantita;
    }
    public String getArticolo_azienda_rif(){
    return articolo_azienda_rif;
    }
    public String getSconto(){
    return sconto;
    }
    
    public ArrayList<Ord_art> getvettoreOrd_art(){
        return vettoreOrd_art;
    }
    /******************************************/
    /*metodi set*/
    /******************************************/
    
    public void setOrdine_rif(String ordine_rif){
    this.ordine_rif = ordine_rif;
    }
    public void setArticolo_rif(String articolo_rif){
    this.articolo_rif = articolo_rif;
    }
    public void setIva(String iva){
    this.iva = iva;
    }
    public void setQuantita(String quantita){
    this.quantita = quantita;
    }
    public void setArticolo_azienda_rif(String articolo_azienda_rif){
    this.articolo_azienda_rif = articolo_azienda_rif;
    }
    public void setSconto(String sconto){
    this.sconto = sconto;
    }
    
    /******************************************/
    /*metodi vari*/
    /******************************************/
    
    
    
    public void inserisciDati()throws Exception{
        //crea la connesione al database
         Connessione c = new Connessione();
         c.effettuaConnessione();
         
         
         //inserisci il nuovo dato
         String datoDaInserire = new String("insert into ord_art(ordine_rif,articolo_rif,"
                 + "iva,quantita,articolo_azienda_rif,sconto)"
                 + "values( ?,?,?,?,?,?)");
         //throw new Exception("stringa : " +  datoDaInserire );
         try{
             //crea il prepared statement
                PreparedStatement pst = c.getConnessione().prepareStatement(datoDaInserire);
                pst.setString(1,ordine_rif);
                pst.setString(2,articolo_rif);
                pst.setString(3,iva);
                pst.setString(4,quantita);
                pst.setString(5,articolo_azienda_rif);
                pst.setString(6,sconto);
                pst.executeUpdate();
                //chiudi il prepared statement
                pst.close();
                //chiudi la connessione
                c.chiudiConnessione();
               
         }
         catch (SQLException se){
                Console.scriviStringa("SQL exception " +se.getMessage());
         }
    }
    public void inserisciArrayDiDati(ArrayList<Articolo> va)throws Exception{
        /*Articolo a=new Articolo();
        ArrayList<Articolo> va;
        va=a.getVettoreArticoli();*/
        vettoreArticoli=va;
        //cl=cli;
        //faccio la scansione di tutti gli elementi della lista
        for(Articolo tmp:vettoreArticoli){
            //dati prelevati da articolo
            id=tmp.getId();
            azienda_produttrice=tmp.getAzienda_produttrice();
            
            quantita=tmp.getQuantita();
            iva=tmp.getIva();
            sconto=tmp.getSconto();
            //inserisco il dato nel database
            articolo_rif=id;
            articolo_azienda_rif=azienda_produttrice;
                        
            inserisciDati();
        }
        
            
    }
   
    public void inserisciListaDati(ArrayList<Articolo> va,String idOrdine)throws Exception{
        
        vettoreArticoli=va;
        
        //faccio la scansione di tutti gli elementi della lista
        for(Articolo tmp:vettoreArticoli){
            //dati prelevati da articolo
            id=tmp.getId();
            azienda_produttrice=tmp.getAzienda_produttrice();
            
            quantita=tmp.getQuantita();
            iva=tmp.getIva();
            sconto=tmp.getSconto();
            //inserisco il dato nel database
            articolo_rif=id;
            articolo_azienda_rif=azienda_produttrice;
            ordine_rif=idOrdine;
                        
            inserisciDati();
        }
    }
    
    public void cercaDato()throws Exception{
         //svuota vettoreOrd_art
         vettoreOrd_art.clear();
         //crea la connesione al database
         Connessione c = new Connessione();
         c.effettuaConnessione();        
        
         try{
            // in SQL ilvalore di un attributo va messo tra apici cioè tra ' ' 
            String query = "select * from ord_art where ordine_rif = ?";
            PreparedStatement ps = c.getConnessione().prepareStatement(query);
            ps.setString(1, ordine_rif);
            ResultSet rs = ps.executeQuery();
           
            while(rs.next()){
                // per ogni ciclo del while crea un oggetto di tipo Ord_art
                Ord_art oa = new Ord_art();
                oa.articolo_rif= rs.getString("articolo_rif");
                oa.articolo_azienda_rif = rs.getString("articolo_azienda_rif");
                oa.iva=rs.getString("iva");
                oa.quantita=rs.getString("quantita");
                oa.sconto=rs.getString("sconto");                
                vettoreOrd_art.add(oa);                
            }
            
            //chiudi il prepared statement
            ps.close();
            //chiudi la connessione
            c.chiudiConnessione();
            
                     
        }
        catch (SQLException se){
            Console.scriviStringa(" SQL exception " +se.getMessage());            
        }
    }
}
