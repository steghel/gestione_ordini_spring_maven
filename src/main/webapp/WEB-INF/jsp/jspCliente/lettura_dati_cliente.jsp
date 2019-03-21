<%-- 
    Document   : lettura_dati_clienteTabella
    Created on : 19-mar-2012, 11.09.08
    Author     : sgh
--%>
<!DOCTYPE html>
<%@page errorPage = "../jspErrore/errore.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <html>
        <head>
            <meta http-equiv="content-type" content="text/html; charset=utf-8" />
            <title>JSP Page</title>
            <%-- collegamento con i file dei CSS--%>
            <link href="<c:url value="/resources/css/form.css" />" rel="stylesheet">
            <link href="<c:url value="/resources/css/layout.css" />" rel="stylesheet">
            <link href="<c:url value="/resources/css/tabella.css" />" rel="stylesheet">
            <%--<link rel="stylesheet" type="text/css" href="../CSS/tabellaScrollabile2.css"/>--%>
            <jsp:useBean id="cliente" scope="session" class="database.Cliente" />
            <jsp:useBean id="visDati" scope="session" class="database.VisualizzazioneDati" />
            <style>
                /*.contenitoreTabella {
                    
                    font-family: 'trebuchet ms',verdana,arial,helvetica,sans-serif;
                    font-size: 11px;
                    padding-top: 10em;
                    
                    
                }
                
                .tabellauno th#header1, .tabellauno th#header2, .tabellauno th#header3, .tabellauno th#header4, .tabellauno th#header5, .tabellauno th#header6, .tabellauno th#header7, .tabellauno th#header8, .tabellauno th#header9, .tabellauno th#header10, .tabellauno th#header11 {
                    padding-left: 0.5em;
                    text-align: left;
                    width: 10em;
                }
                .tabellauno {
                    background: none repeat scroll 0 0 #711515;
                    color: #FFFFFF;
                    
                }
                
                .tabellauno tbody {
                    background: none repeat scroll 0 0 #88AA99;
                    color: #000000;
                }
                .tabellauno td {
                    text-align: left;
                }
                
                .tabelladue td {
                    background: none repeat scroll 0 0 #E5E5E5;
                    color: #000000;
                    
                    width: 10em;
                    overflow: hidden;
                }
                
                .divinterno {
                    height: 14em;
                    overflow:  auto;
                }
                
                .divInternoCella{ /*uso un div per dare una dimensione MAX a td e th*/
                /*width:8em;
                overflow: hidden;
                
              }*/


                .contenitoreTabella {
                    /*color: #000000;*/
                    font-family: 'trebuchet ms',verdana,arial,helvetica,sans-serif;
                    font-size: 14px;
                    padding-top: 10em;
                    /*margin: 0;
                    text-align: center;*/
                }

                .tabellauno th#header1, .tabellauno th#header2, .tabellauno th#header3, .tabellauno th#header4, .tabellauno th#header5, .tabellauno th#header6, .tabellauno th#header7, .tabellauno th#header8, .tabellauno th#header9, .tabellauno th#header10, .tabellauno th#header11 {
                    padding-left: 0.5em;
                    text-align: left;
                    width: 70px;


                }
                .tabellauno {
                    background: none repeat scroll 0 0 #d1510d;
                    color: #FFFFFF;
                    border:solid 4px black;

                }

                .tabellauno tbody {
                    background: none repeat scroll 0 0 #black;
                    color: #000000;
                }
                .tabellauno td {
                    text-align: left;
                }

                .tabelladue{
                    background:white;
                    color: black;
                    border:solid 1px black;
                    border-collapse: collapse;

                }

                .tabelladue td {
                    background: none repeat scroll 0 0 #white;
                    color: #000000;

                    border: solid 2px black ;
                    /*padding-left: 10px;*/
                    width: 80px;
                    overflow: hidden;
                }

                .divinterno {
                    height: 10em;
                    overflow:  auto;
                }

                .divInternoCella{ /*uso un div per dare una dimensione MAX a td e th*/
                    width:80px;
                    overflow: hidden;

                }
            </style>
        </head>

        <body>        
            <jsp:setProperty name="cliente" property="*" />      

            <div id="banner"></div>
            <div id="content">
                <div class="contenitoreTabella">            
                    <form method="post" class="form_tabella" action="">                
                        <% visDati.creaTabellaCliente();%>                   
                        <% visDati.visualizzaTabellaScrollabileProvaJS();%>
                        <jsp:getProperty name="visDati" property="dati"  />
                    </form>
                </div>

            </form>           
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
        <% cliente.inserisciDati();%>



    </body>
</html>
