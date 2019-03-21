<%-- 
    Document   : lettura_dati_azienda
    Created on : 14-apr-2012, 11.38.44
    Author     : sgh
--%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@include file="/WEB-INF/jspf/preamboloAutenticazione.jspf" %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US">
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../CSS/form.css" />
        <link rel="stylesheet" type="text/css" href="../CSS/layout.css" />
        <link rel="stylesheet" type="text/css" href="../CSS/tabella.css" /> 
        
        <jsp:useBean id="articolo" scope="session" class="database.Articolo" />
        <jsp:useBean id="visDati" scope="session" class="database.VisualizzazioneDati" />
        <style>
            
            .tabellauno th#header1, .tabellauno th#header2, .tabellauno th#header3, .tabellauno th#header4, .tabellauno th#header5, .tabellauno th#header6, .tabellauno th#header7, .tabellauno th#header8, .tabellauno th#header9, .tabellauno th#header10, .tabellauno th#header11 {
                width: 90px;
            }
            .tabelladue td {                
                width: 98px;                
            }             
            .divInternoCella{ /*uso un div per dare una dimensione MAX a td e th*/
              width:90px; 
            }
        </style>
    </head>
    
    <body>        
       <jsp:setProperty name="cliente" property="*" />      
       
       <div id="banner"></div>
       <div id="content">
             <div class="contenitoreTabella">        
                <form method="post" class="form_tabella" action="">                
                    <%--<% azienda.leggiDatiTabellaScrollabile();%>                    
                    <jsp:getProperty name="azienda" property="dati"  />--%>
                    <% visDati.creaTabellaArticolo();%>                   
                    <% visDati.visualizzaTabellaScrollabile();%>
                    <jsp:getProperty name="visDati" property="dati"  />
                </form>
             </div>
                      
       </form>           
      </div>
      <div id="navigation">
          <li class="titolo">CLIENTE</li>
          <li><a href="../jspCliente/inserimento_dati_cliente.jsp">Inserimento dati cliente</a></li>
          <li><a href="../jspCliente/cancella_modifica_cliente_tag.jsp">cancella/modifica dati cliente</a></li>           
          <li class="titolo">ARTICOLO</li>
              <li><a href="../jspArticolo/inserimento_dati_articolo.jsp">Inserimento dati articolo</a></li>
              <li><a href="../jspArticolo/cancella_modifica_articolo_tag_1.jsp">cancella/modifica dati articolo</a></li>
          <li class="titolo">AZIENDA</li>    
              <li><a href="../jspAzienda/inserimento_dati_azienda.jsp">Inserimento dati azienda</a></li>
              <li><a href="../jspAzienda/cancella_modifica_azienda_tag.jsp">cancella/modifica dati azienda</a></li>
          <li class="titolo">ORDINE</li>   
              <li><a href="../jspOrdine1/crea_ordine.jsp">Effettua ordine</a></li>
              <li><a href="../jspOrdine1/visualizza_ordini.jsp">Visualizza ordini</a></li>
      </div>
       
       
       
               
    </body>
</html>
