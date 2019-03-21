package database;

import java.sql.*;
import java.io.Serializable;
import java.io.*;
import java.util.*;

/**
 *
 * @author sgh
 */
public class Ord_cli implements Serializable{
    private String ordine_rifer;
    private String cliente_rif;
    
    
    public String getOrdine_rifer(){
        return ordine_rifer;
    }
    public String getCliente_rif(){
        return cliente_rif;
    }
    public void setOrdine_rifer(String ordine_rifer){
        this.ordine_rifer = ordine_rifer;
    }
    public void setCliente_rif(String cliente_rif){
        this.cliente_rif = cliente_rif;
    }
    
    public void inserisciDati(String ordine,String cliente)throws Exception{
         ordine_rifer=ordine;
         cliente_rif=cliente;
         Connessione c = new Connessione();
         c.effettuaConnessione();
         String datoDaInserire = new String("insert into ord_cli"
                 + "(ordine_rifer,cliente_rif)"
                 + "values( ?,?)");
         
         try{
                PreparedStatement pst = c.getConnessione().prepareStatement(datoDaInserire);
                pst.setString(1, ordine_rifer);
                pst.setString(2, cliente_rif);
                
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
            // in SQL il valore di un attributo va messo tra apici cioè tra ' ' 
            String query = "select * from ord_cli where ordine_rifer = "+ "'" +ordine_rifer +"'";
            PreparedStatement ps = c.getConnessione().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
           
            while(rs.next()){
                cliente_rif = rs.getString("cliente_rif");
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
    }
    
    public boolean verificaPresenzaID (){
         boolean b=false;
        //crea la connesione al database
         Connessione c = new Connessione();
         c.effettuaConnessione();
        
         try{
            // in SQL il valore di un attributo va messo tra apici cioè tra ' ' 
            String query = "select * from ord_cli where ordine_rifer = "+ "'" +ordine_rifer +"'";
            PreparedStatement ps = c.getConnessione().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                cliente_rif = rs.getString("cliente_rif");
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
