package database;

import java.sql.*;
import java.util.*;
import java.sql.*;
import java.io.Serializable;

public class Connessione implements Serializable{
    private String url = null;
    private Connection con = null;
    private String visualizza;
    
    public void effettuaConnessione() {    
        try {
            Class.forName("org.postgresql.Driver");
            Console.scriviStringa("Driver postgre caricato");
            url = "jdbc:postgresql://localhost:5432/agenzia0";
            Properties props = new Properties();
            props.setProperty("user","postgres");
            props.setProperty("password","paperino");
            Console.scriviStringa("in attesa della connessione al database");
            visualizza = "in attesa della connessione al database";
            con = DriverManager.getConnection(url,props);
            Console.scriviStringa("Connesso al database");
            visualizza = "Connesso al database";
        } 
        catch (ClassNotFoundException cnfe) {
            System.out.println("Class not found exception: " + cnfe.getMessage());
	}
        catch (SQLException se) {
            System.out.println("SQL exception: "+ se.getMessage());
        }
    }
        
    public Connection getConnessione(){
            return con;
        }
    
    public String getVisualizza(){
            return visualizza;
        } 
    public void chiudiConnessione(){
        try{
            con.close();
        }
        catch (SQLException se) {
            System.out.println("SQL exception: "+ se.getMessage());
        }
    } 
}
