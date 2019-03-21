package database;

import java.sql.*;
import java.io.Serializable;
import java.io.*;
import java.util.*;

/**
 *
 * @author sgh
 */
public class Ord_az implements Serializable{
    private String ordine_rif;
    private String azienda_rif;
    
    
    public String getOrdine_rif(){
        return ordine_rif;
    }
    public String getAzienda_rif(){
        return azienda_rif;
    }
    public void setOrdine_rif(String ordine_rif){
        this.ordine_rif = ordine_rif;
    }
    public void setAzienda_rif(String azienda_rif){
        this.azienda_rif = azienda_rif;
    }
    
    public void inserisciDati(String ordine,String azienda)throws Exception{
         ordine_rif=ordine;
         azienda_rif=azienda;
         Connessione c = new Connessione();
         c.effettuaConnessione();
         String datoDaInserire = new String("insert into ord_az"
                 + "(ordine_rif,azienda_rif)"
                 + "values( ?,?)");
         
         try{
                PreparedStatement pst = c.getConnessione().prepareStatement(datoDaInserire);
                pst.setString(1, ordine_rif);
                pst.setString(2, azienda_rif);
                
                //throw new Exception("stringa : " +  pst );
                pst.executeUpdate();
         }
         catch (SQLException se){
                Console.scriviStringa("SQL exception " +se.getMessage());
         }
    }
    
    public void cercaDato()throws Exception{
         //crea la connesione al database
         Connessione c = new Connessione();
         c.effettuaConnessione();
        
         try{
            // in SQL ilvalore di un attributo va messo tra apici cioè tra ' ' 
            String query = "select * from ord_az where ordine_rif = "+ "'" +ordine_rif +"'";
            PreparedStatement ps = c.getConnessione().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
           
            while(rs.next()){
                azienda_rif = rs.getString("azienda_rif");
            }
            
            /*Statement st = c.getConnessione().createStatement();
            ResultSet rs = st.executeQuery("select azienda_rif from ord_cli where ordine_rif=" + ordine_rif);
                        
            while(rs.next()) { 
                //crea una riga di dati
                azienda_rif=rs.getString("azienda_rif");
            }  */
            //chiudi il prepared statement
            ps.close();
            //chiudi la connessione
            c.chiudiConnessione();
            
                     
        }
        catch (SQLException se){
            Console.scriviStringa(" SQL exception " +se.getMessage());            
        }
    }
    
    public boolean verificaPresenzaID (){
         boolean b=false;
        //crea la connesione al database
         Connessione c = new Connessione();
         c.effettuaConnessione();
        
         try{
            // in SQL il valore di un attributo va messo tra apici cioè tra ' ' 
            String query = "select * from ord_az where ordine_rif = "+ "'" +ordine_rif +"'";
            PreparedStatement ps = c.getConnessione().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                azienda_rif = rs.getString("azienda_rif");
                b=true;
            }
            
            /*Statement st = c.getConnessione().createStatement();
            ResultSet rs = st.executeQuery("select cliente_rif from ord_cli where ordine_rifer=" + ordine_rifer);
                        
            while(rs.next()) { 
                //crea una riga di dati
                cliente_rif=rs.getString("cliente_rif");
            }  */
            //chiudi il prepared statement
            ps.close();
            //chiudi la connessione
            c.chiudiConnessione();
           
            
                     
        }
        catch (SQLException se){
            Console.scriviStringa(" SQL exception " +se.getMessage());            
        }
        return b; 
    }
         
}
