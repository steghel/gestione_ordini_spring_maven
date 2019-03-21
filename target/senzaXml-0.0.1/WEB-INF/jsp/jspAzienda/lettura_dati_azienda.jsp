<%-- 
    Document   : lettura_dati_azienda
    Created on : 14-apr-2012, 11.38.44
    Author     : sgh
--%>


<%@include file="/WEB-INF/jspf/preamboloAutenticazione.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US">
    <html>
        <head>
            <meta http-equiv="content-type" content="text/html; charset=utf-8" />
            <title>JSP Page</title>
            <link rel="stylesheet" type="text/css" href="../CSS/form.css" />
            <link rel="stylesheet" type="text/css" href="../CSS/layout.css" />
            <link rel="stylesheet" type="text/css" href="../CSS/tabella.css" /> 

            <jsp:useBean id="azienda" scope="session" class="database.Azienda" />
            <jsp:useBean id="visDati" scope="session" class="database.VisualizzazioneDati" />
            <style>


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
                    width: 78px;
                    overflow: hidden;
                    text-align: center;
                }

                .divinterno {
                    height: 10em;
                    overflow:  auto;
                }

                .divInternoCella{ /*uso un div per dare una dimensione MAX a td e th*/
                    width:70px;
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
                        <fieldset>
                            <legend>Informazioni dell'azienda</legend>
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
                        <br></br>
                        <fieldset>
                            <legend>Elenco aziende</legend>
                            <%--<% azienda.leggiDatiTabellaScrollabile();%>                    
                            <jsp:getProperty name="azienda" property="dati"  />--%>
                            <% visDati.creaTabellaAzienda();%>                   
                            <% visDati.visualizzaTabellaScrollabileProvaJS();%>
                            <jsp:getProperty name="visDati" property="dati"  />
                        </fieldset>
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

            <% azienda.inserisciDati(); %>



        </body>
    </html>
