<%-- 
    Document   : inserimento_dati_cliente
    Created on : 27-dic-2011, 11.58.18
    Author     : sgh
--%>
<%@page errorPage = "../jspErrore/errore.jsp"%>
<%@include file="/WEB-INF/jspf/preamboloAutenticazione.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../CSS/form.css" />
        <link rel="stylesheet" type="text/css" href="../CSS/layout.css" />
        <link rel="stylesheet" type="text/css" href="../CSS/tabella.css" /> 

        <jsp:useBean id="azienda" scope="session" class="database.Azienda" />


    </head>    
    <body>        
        <jsp:setProperty name="azienda" property="*" />       
        <div id="banner"></div>
        <div id="content">
            <form> 
                <h1>MEMORIZZAZIONE DATI AZIENDA</h1>
                <fieldset>

                    <div>
                        <label for="nome1"> Nome1:</label>
                        <input type="text" name="nome1" class ="txt"/>
                    </div>
                    <div>
                        <label for="nome2"> Nome2:</label>
                        <input type="text" name="nome2" class ="txt"/>
                    </div>
                    <div>
                        <label for="nome3"> Nome3:</label>
                        <input type="text" name="nome3" class ="txt"/>
                    </div>
                </fieldset>
                <fieldset>
                    <div>
                        <label for="partita_iva"> Partita IVA:</label>
                        <input type="text" name="partita_iva" class ="txt" />
                    </div>
                </fieldset>
                <fieldset>   
                    <div>
                        <label for="indirizzo"> Indirizzo:</label>
                        <input type="text" name="indirizzo" class ="txt"/>
                    </div>
                    <div>
                        <label for="cap">CAP:</label>
                        <input type="text" name="cap" class ="txt"/>
                    </div>
                    <div>
                        <label for="citta"> Citt&agrave;:</label>
                        <input type="text" name="nome3" class ="txt"/>
                    </div>
                    <div>
                        <label for="provincia"> Provincia:</label>
                        <input type="text" name="provincia" class ="txt" />
                    </div>
                </fieldset>
                <fieldset>    
                    <div>
                        <label for="telefono"> Telefono:</label>
                        <input type="text" name="telefono" class ="txt" />
                    </div>
                    <div>
                        <label for="fax"> Fax:</label>
                        <input type="text" name="fax" class ="txt" />
                    </div>
                    <div>
                        <label for="email"> Email:</label>
                        <input type="text" name="email" class ="txt" />
                    </div>
                </fieldset>
                <fieldset>   
                    <div>
                        <label for="tipo_di_azienda"> Tipo di azienda:</label>
                        <input type="text" name="tipo_di_azienda" class ="txt" />
                    </div>
                    <div>
                        <input type="submit"  value="Invia" class="btn" />
                    </div>
                </fieldset>
            </form>
            <p><a href="cancella_modifica_azienda_tag.jsp"> Accedi alla pagina per controllare i dati di un cliente </a> 
        </div>
        <div id="navigation">
            <li class="titolo">CLIENTE</li>
            <li><a href="inserimento_dati_cliente">Inserimento dati cliente</a></li>
            <li><a href="cancella_modifica_cliente_tag">cancella/modifica dati cliente</a></li>
            <li><a href="lettura_dati_cliente">Lettura dati clienti </a></li>
            <li class="titolo">ARTICOLO</li>
            <li><a href="inserimento_dati_articolo">Inserimento dati articolo</a></li>
            <li><a href="cancella_modifica_articolo_tag_1">cancella/modifica dati articolo</a></li>
            <li class="titolo">AZIENDA</li>    
            <li><a href="inserimento_dati_azienda">Inserimento dati azienda</a></li>
            <li><a href="cancella_modifica_azienda_tag">cancella/modifica dati azienda</a></li>
            <li class="titolo">ORDINE</li>   
            <li><a href="crea_ordine">Effettua ordine</a></li>
            <li><a href="visualizza_ordini">Visualizza ordini</a></li>
        </div>
        <% azienda.inserisciDati(); %>     

    </body>
</html>
