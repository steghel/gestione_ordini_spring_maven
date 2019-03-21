
package database;
import java.sql.*;
import java.io.Serializable;
import java.io.*;
import java.util.ArrayList;
/**
 *
 * @author sgh
 */
public class Articolo implements Serializable{
    private String id;
    private String azienda_produttrice;
    private String nome_prodotto;
    private String informazione_prodotto;
    private int costo;
    private String quantita;
    private String iva;
    private String sconto;
    
    private String idNumeroArticolo;//inviato dal client per stabilire il numero
                                    //dell'articolo in un generico ordine
    private String dati="";
    
    private String[][] tabella;
    private int maxRighe;
    private int maxColonne;
    private String stringaErrore="";
    
    /*************************************************/
    /*vettore avente come componenti oggetti articolo*/
    /*************************************************/
    
    private ArrayList<Articolo> vettoreArticoli = new ArrayList<Articolo>();
    private String art; 
    private String lista="";
    
     /***********************************/
    /*METODI GET*/
    /***********************************/
    public String getStringaErrore(){
    return stringaErrore;
    }
   
    public String getId(){
       return id;
    }
    public String getAzienda_produttrice(){
       return azienda_produttrice;
    }
    public String getNome_prodotto(){
       return nome_prodotto;
    }
    public String getInformazione_prodotto(){
       return informazione_prodotto;
    }
    
    public int getCosto(){
       return costo;
    }
    
     public String getIdNumeroArticolo(){
       return idNumeroArticolo;
    }
    
    public String getDati(){
       return dati;
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
    
    public String getLista(){
       return lista;
    }
    
    public String getQuantita(){
       return quantita;
    }
    
    public String getIva(){
       return iva;
    }
    
    public String getSconto(){
       return sconto;
    }
    
    public ArrayList<Articolo> getVettoreArticoli(){
       return vettoreArticoli;
    }
     /***********************************/
    /*METODI SET*/
    /***********************************/
    public void setStringaErrore(String stringaErrore){
    this.stringaErrore = stringaErrore;
    }
    
    public void setId(String id){
       this.id = id;
    }
    public void setAzienda_produttrice(String azienda_produttrice){
       this.azienda_produttrice = azienda_produttrice;
    }
    public void setNome_prodotto(String nome_prodotto){
       this.nome_prodotto = nome_prodotto;
    }
    public void setInformazione_prodotto(String informazione_prodotto){
       this.informazione_prodotto = informazione_prodotto;
    }
    
    public void setCosto(int costo){
       this.costo = costo;
    }
    
    public void setDati(){
        this.dati="Codice:"+id +";&nbsp &nbsp Azienda produttrice:"+ azienda_produttrice+";&nbsp &nbsp    Informazioni sul prodotto:"+informazione_prodotto+";&nbsp &nbsp    Costo:"+costo;
    }
    
    public void setIdNumeroArticolo(String idNumeroArticolo){
        this.idNumeroArticolo=idNumeroArticolo;
    }
    public void setLista(String lista){
       this.lista = lista;
    }
    public void setQuantita(String quantita){
       this.quantita = quantita;
    }
    public void setIva(String iva){
       this.iva = iva;
    }
    
    public void setSconto(String sconto){
       this.sconto = sconto;
    }
    /***********************************/
    /*METODI*/
    /***********************************/
    
    public void resetVariabili(){
        id="";
        azienda_produttrice="";
        nome_prodotto="";
        informazione_prodotto="";
        costo=0;        
    }
    
    public void cancellaDati()throws Exception{
         stringaErrore="";
         //crea la connesione al database
         Connessione c = new Connessione();
         c.effettuaConnessione();
         try{       
            Statement st = c.getConnessione().createStatement();
            String str = new String("delete from articolo where id=? and azienda_produttrice=?");
            dati=str;
            PreparedStatement pst = c.getConnessione().prepareStatement(str);
            pst.setString(1,id);
            pst.setString(2,azienda_produttrice);
            pst.executeUpdate();
            //chiudi il prepared statement
            pst.close();
            //chiudi la connessione
            c.chiudiConnessione();
                     
        }
        catch (SQLException se){
            stringaErrore="impossibile cancellare o modificare questo articolo";
            Console.scriviStringa(" SQL exception " +se.getMessage());            
        }
    }
    
    /*public void ricaricaPagina(){
        String st = new String("<meta http-equiv=\"Refresh\" content="10; URL=indirizzo.com/dovetipare/">");
    }*/
    
    public void inserisciDati()throws Exception{
      if(id!=""){
         //crea la connesione al database
         Connessione c = new Connessione();
         c.effettuaConnessione();
         
         //cancella il vecchio dato
         try{       
            Statement st = c.getConnessione().createStatement();
            String str = new String("delete from articolo where id=? and azienda_produttrice=?");
            
            PreparedStatement pst = c.getConnessione().prepareStatement(str);
            pst.setString(1,id);
            pst.setString(2,azienda_produttrice);
            pst.executeUpdate();
            //chiudi il prepared statement
            pst.close();
            
                     
        }
        catch (SQLException se){
            Console.scriviStringa(" SQL exception " +se.getMessage());            
        }
         //inserisci il nuovo dato
         String datoDaInserire = new String("insert into articolo(id,azienda_produttrice,nome_prodotto,informazione_prodotto,costo)"
                 + "values( ?,?,?,?,?)");
         //throw new Exception("stringa : " +  datoDaInserire );
         try{
             //crea il prepared statement
                PreparedStatement pst = c.getConnessione().prepareStatement(datoDaInserire);
                pst.setString(1,id);
                pst.setString(2,azienda_produttrice);
                pst.setString(3,nome_prodotto);
                pst.setString(4,informazione_prodotto);
                pst.setInt(5,costo);
                pst.executeUpdate();
                //chiudi il prepared statement
                pst.close();
                //chiudi la connessione
                c.chiudiConnessione();
               
         }
         catch (SQLException se){
                Console.scriviStringa("SQL exception " +se.getMessage());
         }
         resetVariabili();
      }
    }
    
    
    
    public void modificaDati()throws Exception{
         stringaErrore="";
         //crea la connesione al database
         Connessione c = new Connessione();
         c.effettuaConnessione();
         
         //cancella il vecchio dato
         try{       
            Statement st = c.getConnessione().createStatement();
            String str = new String("delete from articolo where id=? and azienda_produttrice=?");
            
            PreparedStatement pst = c.getConnessione().prepareStatement(str);
            pst.setString(1,id);
            pst.setString(2,azienda_produttrice);
            pst.executeUpdate();
            //chiudi il prepared statement
            pst.close();
            
                     
        }
        catch (SQLException se){
            stringaErrore="impossibile cancellare o modificare questo cliente";
            Console.scriviStringa(" SQL exception " +se.getMessage());            
        }
         //inserisci il nuovo dato
         String datoDaInserire = new String("insert into articolo(id,azienda_produttrice,nome_prodotto,informazione_prodotto,costo)"
                 + "values( ?,?,?,?,?)");
         //throw new Exception("stringa : " +  datoDaInserire );
         try{
             //crea il prepared statement
                PreparedStatement pst = c.getConnessione().prepareStatement(datoDaInserire);
                pst.setString(1,id);
                pst.setString(2,azienda_produttrice);
                pst.setString(3,nome_prodotto);
                pst.setString(4,informazione_prodotto);
                pst.setInt(5,costo);
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
    
    
    public void leggiDatiEsportazione(){
         int numeroDiRiga;
         int max=0;
         
         //calcola da quante righe è formata la tabella
         Connessione c = new Connessione();
         c.effettuaConnessione();         
         try{             
            //scansione della tabella atleta
            Statement st = c.getConnessione().createStatement();
            ResultSet rs = st.executeQuery("select * from articolo");
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
         tabella[0][1]="Azienda produt."; 
         tabella[0][2]="Nome del prodotto";
         tabella[0][3]="Nota sul prodotto";
         tabella[0][4]="Costo in euro";
         
         //inserisci la riga intestazione come prima riga dell'arraylist
        
         
         try{             
            //scansione della tabella atleta
            Statement st = c.getConnessione().createStatement();
            ResultSet rs = st.executeQuery("select * from articolo");
            numeroDiRiga=1;            
            while(rs.next()) { 
                //crea una riga di dati
                tabella[numeroDiRiga][0]=rs.getString("id");                
                tabella[numeroDiRiga][1]=rs.getString("azienda_produttrice"); 
                tabella[numeroDiRiga][2]=rs.getString("nome_prodotto");
                tabella[numeroDiRiga][3]=rs.getString("informazione_prodotto");                
                tabella[numeroDiRiga][4]=rs.getString("costo");
                
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
    
    public void aggiungiArticoloAllaLista(){
        Articolo articolo=new Articolo();
        articolo.id=id;
        articolo.azienda_produttrice=azienda_produttrice;
        articolo.nome_prodotto=nome_prodotto;
        articolo.informazione_prodotto=informazione_prodotto;
        articolo.costo=costo;
        articolo.quantita=quantita;
        articolo.iva=iva;
        articolo.sconto=sconto;
        vettoreArticoli.add(articolo);
    }
    
    public void leggiArticolo(Articolo a){
        art="CODICE:"+a.id + ";&nbsp &nbsp &nbspAZIENDA PRODUTTRICE:" 
                +  a.azienda_produttrice + ";&nbsp &nbsp  &nbsp  NOME PRODOTTO:" 
                + a.nome_prodotto + ";<br>INFORMAZIONI SUL PRODOTTO:" 
                + a.informazione_prodotto + ";&nbsp &nbsp &nbsp COSTO:" 
                + a.costo+ ";<br> QUANTITA'" + a.quantita  
                + ";&nbsp &nbsp &nbsp IVA:" + a.iva 
                + ";&nbsp &nbsp &nbsp SCONTO:" + a.sconto + "<br>\n"; 
    }
    
     
    public void restituisciListaArticoli(){
        
        lista="";
        //uso il foreach:tmp rappresenta una componente della lista di array
        //vettore articolo
        for(Articolo tmp:vettoreArticoli){
            leggiArticolo(tmp);
            lista+=art + "<br>";
        }
    }
    
    public void cercaArticoli(ArrayList<Ord_art> oa){
        //svuota l'arraylist vettoreArticoli
        vettoreArticoli.clear();
        
        for(Ord_art tmp:oa){
            id = tmp.getArticolo_rif();
            azienda_produttrice = tmp.getArticolo_azienda_rif();
            quantita = tmp.getQuantita();
            iva= tmp.getIva();
            sconto=tmp.getSconto();
           
            //crea la connesione al database
            Connessione c = new Connessione();
            c.effettuaConnessione();

            //cancella il vecchio dato
            try{       
                Statement st = c.getConnessione().createStatement();
                String str = new String("select * from articolo where id=? and azienda_produttrice=?");

                PreparedStatement pst = c.getConnessione().prepareStatement(str);
                pst.setString(1,id);
                pst.setString(2,azienda_produttrice);
                ResultSet rs = pst.executeQuery();
                
                while(rs.next()){
                   // creo un oggetto di tipo Articolo 
                   Articolo a= new Articolo();
                   // inserisco nell'oggetto i dati dell'oggetto oa
                   a.id=id;
                   a.azienda_produttrice=azienda_produttrice;
                   a.quantita=quantita;
                   a.iva=iva;
                   a.sconto=sconto;
                   // inserisco nell'oggetto i dati del database 
                   a.nome_prodotto=rs.getString("nome_prodotto");
                   a.informazione_prodotto=rs.getString("informazione_prodotto");
                   a.costo=rs.getInt("costo");
                   //aggiungo l'oggetto a all'arrayList
                   vettoreArticoli.add(a);            
                   
                }
                pst.executeUpdate();
                //chiudi il prepared statement
                pst.close();


            }
            catch (SQLException se){
                Console.scriviStringa(" SQL exception " +se.getMessage());            
            }
        }
        
        
    }
    
    public void resetLista(){
        lista="";
    }
    
    public void cancellaVettoreArticoli(){
        vettoreArticoli.clear();
        dati="";
    }
    
}