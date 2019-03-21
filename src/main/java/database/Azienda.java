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
public class Azienda implements Serializable{
    private String nome1;
    private String nome2;
    private String nome3;
    private String partita_iva;
    private String indirizzo;
    private String citta;
    private String provincia;
    private String telefono;
    private String fax;
    private String email;
    private String cap;
    private String tipo_di_azienda;
    private String dati;  
    private String[][] tabella;
    private int maxRighe;
    private int maxColonne;
    private String stringaErrore="";
    
    public String getStringaErrore(){
    return stringaErrore;
    }
    
    public String getNome1(){
    return nome1;
    }

    public String getNome2(){
    return nome2;
    }

    public String getNome3(){
    return nome3;
    }

    public String getPartita_iva(){
    return partita_iva;
    }

    public String getIndirizzo(){
    return indirizzo;
    }

    public String getCitta(){
    return citta;
    }

    public String getProvincia(){
    return provincia;
    }

    public String getTelefono(){
    return telefono;
    }
    
    public String getFax(){
    return fax;
    }

    public String getEmail(){
    return email;
    }

    public String getCap(){
    return cap;
    }    
    
    public String getTipo_di_azienda(){
    return tipo_di_azienda;
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
    
    public void setStringaErrore(String stringaErrore){
    this.stringaErrore = stringaErrore;
    }
    
    public void setNome1(String nome1){
    this.nome1 = nome1;
    }
    
    public void setNome2(String nome2){
    this.nome2 = nome2;
    }
    
    public void setNome3(String nome3){
    this.nome3 = nome3;
    }
    
    public void setPartita_iva(String partita_iva){
    this.partita_iva = partita_iva;
    }
    
    public void setIndirizzo(String indirizzo){
    this.indirizzo = indirizzo;
    }
    
    public void setCitta(String citta){
    this.citta = citta;
    }
    
    public void setProvincia(String provincia){
    this.provincia = provincia;
    }
    
    public void setTelefono(String telefono){
    this.telefono = telefono;
    }
    
    public void setFax(String fax){
    this.fax = fax;
    }
    
    public void setEmail(String email){
    this.email = email;
    }
    
    public void setCap(String cap){
    this.cap = cap;
    }

    public void setTipo_di_azienda(String tipo_di_azienda){
    this.tipo_di_azienda = tipo_di_azienda;
    } 
    
    public void setDati(){
        this.dati ="NOME1:"+nome1+";&nbsp &nbsp    NOME2:"+nome2+";&nbsp &nbsp   NOME3:"+nome3
            +";&nbsp &nbsp  PARTITA IVA:  "+partita_iva+";<br> INDIRIZZO:  "+indirizzo
            +";&nbsp &nbsp  CITTA':  "+citta+";&nbsp &nbsp  PROVINCIA:  "+provincia+";&nbsp &nbsp  CAP:  "+cap+";<br> TELEFONO:  "
            +telefono+";&nbsp &nbsp  FAX:  "+fax+";&nbsp &nbsp  EMAIL:  "+email
            +";&nbsp &nbsp  TIPO DI AZIENDA:  "+ tipo_di_azienda;
    } 
    
    public void resetDati(){
        this.dati ="";
    }
    
    public void inserisciDati()throws Exception{
         Connessione c = new Connessione();
         c.effettuaConnessione();
         String datoDaInserire = new String("insert into azienda"
                    + "(nome1,nome2,nome3,partita_iva,indirizzo,"
                 + "citta,provincia,telefono,fax,email,cap,tipo_di_azienda)"
                 + "values( ?,?,?,?,?,?,?,?,?,?,?,?)");
         
         try{
                PreparedStatement pst = c.getConnessione().prepareStatement(datoDaInserire);
                pst.setString(1, nome1);
                pst.setString(2, nome2);
                pst.setString(3, nome3);
                pst.setString(4, partita_iva);
                pst.setString(5, indirizzo);
                pst.setString(6, citta);
                pst.setString(7, provincia);
                pst.setString(8, telefono);
                pst.setString(9, fax);
                pst.setString(10, email);
                pst.setString(11, cap);
                pst.setString(12, tipo_di_azienda);
                //throw new Exception("stringa : " +  pst );
                pst.executeUpdate();
                c.chiudiConnessione();
         }
         catch (SQLException se){
                Console.scriviStringa("SQL exception " +se.getMessage());
         }
         resetVariabili();
         
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
            ResultSet rs = st.executeQuery("select * from azienda");
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
         tabella=new String[max+1][12];
         
        
         //crea la riga intestazione della tabella
         tabella[0][0]="Nome1";
         tabella[0][1]="Nome2"; 
         tabella[0][2]="Nome3";
         tabella[0][3]="Partita iva";
         tabella[0][4]="Indir.";
         tabella[0][5]="Citta'";
         tabella[0][6]="Prov.";
         tabella[0][7]="Tel.";
         tabella[0][8]="Fax";
         tabella[0][9]="Email";
         tabella[0][10]="Cap"; 
         tabella[0][11]="Tipo di azienda"; 
         //inserisci la riga intestazione come prima riga dell'arraylist
        
         
         try{             
            //scansione della tabella atleta
            Statement st = c.getConnessione().createStatement();
            ResultSet rs = st.executeQuery("select * from azienda");
            numeroDiRiga=1;            
            while(rs.next()) { 
                //crea una riga di dati
                tabella[numeroDiRiga][0]=rs.getString("nome1");                
                tabella[numeroDiRiga][1]=rs.getString("nome2"); 
                tabella[numeroDiRiga][2]=rs.getString("nome3");
                tabella[numeroDiRiga][3]=rs.getString("partita_iva");
                tabella[numeroDiRiga][4]=rs.getString("indirizzo");
                tabella[numeroDiRiga][5]=rs.getString("citta");
                tabella[numeroDiRiga][6]=rs.getString("provincia");
                tabella[numeroDiRiga][7]=rs.getString("telefono");
                tabella[numeroDiRiga][8]=rs.getString("fax");
                tabella[numeroDiRiga][9]=rs.getString("email");
                tabella[numeroDiRiga][10]=rs.getString("cap");
                tabella[numeroDiRiga][11]=rs.getString("tipo_di_azienda");
                //incrementa numeroDiRiga
                numeroDiRiga++; 
            }
            maxRighe=numeroDiRiga;
            maxColonne=12;
            
           
         }
       
         catch (SQLException se){
            Console.scriviStringa(" SQL exception " +se.getMessage());
         } 
         
        
        //throw new Exception("tabella : " +  dati );
     }
     
   public void leggiDatiTabellaScrollabile()throws Exception{
         dati=" ";
         //int cont=0;
         Connessione c = new Connessione();
         c.effettuaConnessione();
         try{
            //scansione della tabella atleta
            Statement st = c.getConnessione().createStatement();
            ResultSet rs = st.executeQuery("select * from azienda");
            
            dati+=" <table id='table' class='scrollable'> <thead> <tr> "
                    + " <td>Nome1</td> <td>Nome2</td>  <td>Nome3</td> "
                    + " <td>Partita IVA</td> <td>Indirizzo</td>  <td>Citt&agrave;</td> "
                    + " <td>Provincia</td> <td>Telefono</td>  <td>FAX</td> "
                    + " <td>Email</td> <td>CAP</td><td>Tipo di azienda</td> "
                    + "</thead><tbody>";
            while(rs.next()) { 
                //cont++;
                String str1=rs.getString("nome1");
                String str2=rs.getString("nome2"); 
                String str3=rs.getString("nome3");
                String str4=rs.getString("partita_iva");
                String str5=rs.getString("indirizzo");
                String str6=rs.getString("citta");
                String str7=rs.getString("provincia");
                String str8=rs.getString("telefono");
                String str9=rs.getString("fax");
                String str10=rs.getString("email");
                String str11=rs.getString("cap");
                String str12=rs.getString("tipo_di_azienda");
                dati+= "<tr>";
                dati+= "<td>" + str1 + "</td>";
                dati+= "<td>" + str2 + "</td>";
                dati+= "<td>" + str3 + "</td>";
                dati+= "<td>" + str4 + "</td>";
                dati+= "<td>" + str5 + "</td>";
                dati+= "<td>" + str6 + "</td>";
                dati+= "<td>" + str7 + "</td>";
                dati+= "<td>" + str8 + "</td>";
                dati+= "<td>" + str9 + "</td>";
                dati+= "<td>" + str10 + "</td>";
                dati+= "<td>" + str11 + "</td>";
                dati+= "<td>" + str12 + "</td>";
                dati+= "</tr>";
           }
           dati+= "</tbody>";
         }
       
         catch (SQLException se){
            Console.scriviStringa(" SQL exception " +se.getMessage());
        }
         
         //throw new Exception("tabella : " +  dati + cont );
     }
   
     public void cancellaDati()throws Exception{
         stringaErrore="";
         //crea la connesione al database
         Connessione c = new Connessione();
         c.effettuaConnessione();
         try{       
            Statement st = c.getConnessione().createStatement();
            String str = new String("delete from azienda where partita_iva=?");
            dati=str;
            //throw new Exception("tabella : " +  dati );
            PreparedStatement pst = c.getConnessione().prepareStatement(str);
            pst.setString(1,partita_iva);
            
            pst.executeUpdate();
            //chiudi il prepared statement
            pst.close();
            //chiudi la connessione
            c.chiudiConnessione();
                     
        }
        catch (SQLException se){
            stringaErrore="impossibile cancellare o modificare questo cliente";
            Console.scriviStringa(" SQL exception " +se.getMessage());            
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
            String str = new String("delete from azienda where partita_iva=?");
            
            PreparedStatement pst = c.getConnessione().prepareStatement(str);
            pst.setString(1,partita_iva);
           
            pst.executeUpdate();
            //chiudi il prepared statement
            pst.close();
            
                     
        }
        catch (SQLException se){
            stringaErrore="impossibile cancellare o modificare questo cliente";
            Console.scriviStringa(" SQL exception " +se.getMessage());            
        }
         //inserisci il nuovo dato
         String datoDaInserire = new String("insert into azienda(nome1,nome2,"
                 + "nome3,partita_iva,indirizzo,citta,provincia,telefono,"
                 + "fax,email,cap,tipo_di_azienda)"
                 + "values( ?,?,?,?,?,?,?,?,?,?,?,?)");
         //throw new Exception("stringa : " +  datoDaInserire );
         try{
             //crea il prepared statement
                PreparedStatement pst = c.getConnessione().prepareStatement(datoDaInserire);
                pst.setString(1,nome1);
                pst.setString(2,nome2);
                pst.setString(3,nome3);
                pst.setString(4,partita_iva);
                pst.setString(5,indirizzo);
                pst.setString(6,citta);
                pst.setString(7,provincia);
                pst.setString(8,telefono);
                pst.setString(9,fax);
                pst.setString(10,email);
                pst.setString(11,cap);
                pst.setString(12,tipo_di_azienda);
            
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
    
    public void cercaDato(String cf)throws Exception{
         //crea la connesione al database
         partita_iva=cf;
         Connessione c = new Connessione();
         c.effettuaConnessione();
         try{       
            Statement st = c.getConnessione().createStatement();
            ResultSet rs = st.executeQuery("select * from azienda where partita_iva = " + "'" + cf +"'");
            
            
            while(rs.next()) { 
                //cont++;
                nome1=rs.getString("nome1");
                nome2=rs.getString("nome2"); 
                nome3=rs.getString("nome3");
                partita_iva=rs.getString("partita_iva");
                indirizzo=rs.getString("indirizzo");
                citta=rs.getString("citta");
                provincia=rs.getString("provincia");
                telefono=rs.getString("telefono");
                fax=rs.getString("fax");
                email=rs.getString("email");
                cap=rs.getString("cap");
                tipo_di_azienda=rs.getString("tipo_di_azienda");
            }
            st.close();
            //chiudi la connessione
            c.chiudiConnessione();
            
                     
        }
        catch (SQLException se){
            Console.scriviStringa(" SQL exception " +se.getMessage());            
        }
    }
    
    public void resetVariabili(){
        nome1="";
        nome2="";
        nome3="";
        partita_iva="";
        indirizzo="";
        citta="";
        provincia="";
        telefono="";
        fax="";
        email="";
        cap="";
        tipo_di_azienda="";
        dati="";  
    }
}
