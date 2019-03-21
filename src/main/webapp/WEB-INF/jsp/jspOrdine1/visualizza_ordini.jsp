<%-- 
    Document   : visualizza_ordini
    Created on : 7-giu-2012, 11.14.24
    Author     : sgh
--%>

<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>

    <html>
        <head>
            <meta http-equiv="content-type" content="text/html; charset=utf-8" />

            <title>JSP Page</title>
            <%-- collegamento con i file dei CSS--%>
            <link href="<c:url value="/resources/css/form.css" />" rel="stylesheet">
            <link href="<c:url value="/resources/css/layout.css" />" rel="stylesheet">
            <link href="<c:url value="/resources/css/tabella.css" />" rel="stylesheet">
            <link rel="javascriptsheet" type="text/javascript" href="../javaScript/layout.css" />
            <jsp:useBean id="ordine" scope="session" class="database.Ordine" />
            <jsp:useBean id="articolo" scope="session" class="database.Articolo" />
            <jsp:useBean id="azienda" scope="session" class="database.Azienda" />
            <jsp:useBean id="visDati" scope="session" class="database.VisualizzazioneDati" />
            <jsp:useBean id="cliente" scope="session" class="database.Cliente" />
            <jsp:useBean id="ord_cli" scope="session" class="database.Ord_cli" />
            <jsp:useBean id="ord_art" scope="session" class="database.Ord_art" />
            <jsp:useBean id="ord_az" scope="session" class="database.Ord_az" />
            <jsp:useBean id="semaforo1" scope="session" class="database.Semaforo1" />
            <style type="text/css">

                .tabellauno th#header1, .tabellauno th#header2, .tabellauno th#header3, .tabellauno th#header4, .tabellauno th#header5, .tabellauno th#header6, .tabellauno th#header7, .tabellauno th#header8, .tabellauno th#header9, .tabellauno th#header10, .tabellauno th#header11 {
                    width: 70px;
                }
                .tabelladue td {                
                    width: 90px;                
                }             
                .divInternoCella{ /*uso un div per dare una dimensione MAX a td e th*/
                    width:80px; 
                }
                .bottone{
                    width: 9em;
                    height: 2em;
                    margin: 1em;
                    /*font: 1em Arial, Helvetica, sans-serif;*/
                }
                .etich{
                    font: bold 0.8em Arial, Helvetica, sans-serif;
                }
                #scritta{
                    font: bold 0.8em Arial, Helvetica, sans-serif;
                }

                span{
                    width:15em;

                    display:inline;
                    float:left;
                }

                #articolo .tabellauno th#header1, .tabellauno th#header2, .tabellauno th#header3, .tabellauno th#header4, .tabellauno th#header5, .tabellauno th#header6, .tabellauno th#header7, .tabellauno th#header8, .tabellauno th#header9, .tabellauno th#header10, .tabellauno th#header11 {
                    width: 90px;

                }
                #articolo .tabelladue td {                
                    width: 98px;                
                }             
                #articolo .divInternoCella{ /*uso un div per dare una dimensione MAX a td e th*/
                    width:90px; 
                }

                #articolo .divinterno{
                    height: 5em;
                }

                .bottone{
                    width: 9em;
                    height: 2em;
                    margin: 1em;
                    /*font: 1em Arial, Helvetica, sans-serif;*/
                }

                fieldset{
                    margin-top: 0.3em;
                    padding: 0.5em;
                }

                legend.piccolo{
                    font: bold 1.0em Arial, Helvetica, sans-serif;
                }

                #etichetta{
                    font: bold 0.9em Arial, Helvetica, sans-serif;
                }
                #scritta,#scrittaErrore{
                    font: bold 0.9em Arial, Helvetica, sans-serif;
                }
            </style>
            <script type="text/javascript">
                var id;

                var msg;

                function mostra(x) {

                    var messaggio = "";
                    for (var i = 0; i < 5; i++) {
                        if (i == 0) {
                            id = x.childNodes[i].textContent;
                            document.getElementById('idID').value = id;
                            messaggio += "ID:" + x.childNodes[i].textContent;
                        }
                        if (i == 1) {
                            importo_totale = x.childNodes[i].textContent;
                            document.getElementById('idImporto_totale').value = importo_totale;
                            messaggio += "&nbsp &nbsp &nbsp &nbspIMPORTO TOTALE:" + x.childNodes[i].textContent;
                        }

                        if (i == 2) {
                            importo_iva = x.childNodes[i].textContent;
                            document.getElementById('idImporto_iva').value = importo_iva;
                            messaggio += "&nbsp &nbsp &nbsp &nbspIMPORTO IVA:" + x.childNodes[i].textContent;
                        }

                        if (i == 3) {
                            sconto_ordine = x.childNodes[i].textContent;
                            document.getElementById('idSconto_ordine').value = sconto_ordine;
                            messaggio += "&nbsp &nbsp &nbsp &nbspSCONTO ORDINE:" + x.childNodes[i].textContent;
                        }
                        if (i == 4) {
                            importo_ordine = x.childNodes[i].textContent;
                            document.getElementById('idImporto_ordine').value = importo_ordine;
                            messaggio += "&nbsp &nbsp &nbsp &nbspIMPORTO ORDINE:" + x.childNodes[i].textContent;
                        }
                        //messaggio += "&nbsp &nbsp &nbsp &nbsp " + x.childNodes[i].textContent;
                        msg = messaggio;

                    }
                    document.getElementById('etichetta').innerHTML = msg;

                    //se non sono presenti bottoni cancella e modifica,
                    //creali
                    if (document.getElementById('idCancella') == null) {
                        var nodo = document.getElementById("bottoni");
                        //crea il bottone vedi
                        var cancella = document.createElement("input");
                        cancella.setAttribute("type", "submit");
                        cancella.setAttribute("name", "vedi");
                        cancella.setAttribute("value", "visualizza");
                        cancella.setAttribute("class", "bottone");
                        cancella.setAttribute("id", "idCancella");
                        nodo.appendChild(cancella);
                    }

                }


            </script>

        </head>

        <body>
            <div id="banner"></div>
            <div id="content">
                <form id="idForm" name="inserimentonome" method="post" action="" >
                    <%--bottoni nascosti,servono ad inviare al server i dati dell'ordine --%>
                    <input type="hidden" name="id" id="idID" >
                    <input type="hidden" name="importo_totale" id="idImporto_totale" value="nonValido">
                    <input type="hidden" name="importo_iva" id="idImporto_iva" value="nonValido">
                    <input type="hidden" name="sconto_ordine" id="idSconto_ordine" value="nonValido">
                    <input type="hidden" name="importo_ordine" id="idImporto_ordine" value="nonValido">

                    <fieldset id="tabella">
                        <legend>Ordini</legend>
                        <%--visualizza tabella ordini --%>
                        <% visDati.creaTabellaOrdine();%>
                        <% visDati.visualizzaTabellaScrollabileProvaJS();%>
                        <jsp:getProperty name="visDati" property="dati"  /> 

                        <fieldset >
                            <legend class="piccolo">Visualizza destinatario e articoli di un ordine</legend> 
                            <div id="scritta">seleziona una riga della tabella e fai click con il pulsante destro del mouse </div>
                            <div id="etichetta">&nbsp</div>
                            <div id="bottoni"></div>

                        </fieldset>

                        <c:choose>
                            <c:when test="${param.vedi!=null}">
                                <%--**********************************************************************
                                     visualizza i dati dell'ordine
                                 ************************************************************************--%>
                                <%--se la tabella ord_cli contiene l'id dell'ordine 
                                allora il destinatario è una persona--%> 
                                <jsp:setProperty name="ordine" property="idOrdine" param="id" />
                                <jsp:setProperty name="ordine" property="importo_totale" param="importo_totale" />
                                <jsp:setProperty name="ordine" property="importo_iva" param="importo_iva" />
                                <jsp:setProperty name="ordine" property="sconto_ordine" param="sconto_ordine" />
                                <jsp:setProperty name="ordine" property="importo_ordine" param="importo_ordine" />
                                <%--<%ordine.leggiRiga();%>--%>
                                <%ordine.setDati();%>
                                <fieldset class="piccolo">
                                    <legend class="piccolo">Ordine</legend>
                                    <div class="etich">&nbsp<jsp:getProperty name="ordine" property="dati"  /> </div>
                                </fieldset >


                                <%--**********************************************************************
                                     visualizza il destinatario quando è una persona
                                 ************************************************************************--%>
                                <%--se la tabella ord_cli contiene l'id dell'ordine 
                                allora il destinatario è una persona--%> 
                                <jsp:setProperty name="ord_cli" property="ordine_rifer" param="id" />
                                <c:if test="${ord_cli.verificaPresenzaID ()}">
                                    <%ord_cli.cercaDato();%>
                                    <%cliente.cercaDato(ord_cli.getCliente_rif());%>
                                    <%cliente.setDati();%>
                                    <fieldset class="piccolo">
                                        <legend class="piccolo">Destinatario</legend>
                                        <div class="etich">&nbsp<jsp:getProperty name="cliente" property="dati"  /> </div>
                                    </fieldset >
                                </c:if>

                                <%--**********************************************************************
                                      visualizza il destinatario quando è una azienda
                                ************************************************************************--%>    
                                <%--se la tabella ord_az contiene l'id dell'ordine 
                                allora il destinatario è una azienda--%> 
                                <jsp:setProperty name="ord_az" property="ordine_rif" param="id" />
                                <c:if test="${ord_az.verificaPresenzaID ()}">
                                    <%ord_az.cercaDato();%>
                                    <%azienda.cercaDato(ord_az.getAzienda_rif());%>
                                    <%azienda.setDati();%>                          

                                    <fieldset class="piccolo">
                                        <legend class="piccolo">Destinatario</legend>
                                        <div class="etich">&nbsp<jsp:getProperty name="azienda" property="dati"  /> </div>
                                    </fieldset >

                                </c:if>


                                <%--**********************************************************************
                                    visualizza gli articoli presenti nell'ordine
                                ************************************************************************--%>

                                <jsp:setProperty name="ord_art" property="ordine_rif" param="id" />
                                <%ord_art.cercaDato();%>

                                <%articolo.cercaArticoli(ord_art.getvettoreOrd_art());%>
                                <%articolo.restituisciListaArticoli();%>

                                <%--**********************************************************************
                                    sblocca semaforo
                                ************************************************************************--%>
                                <%semaforo1.setPassa();%>



                                <fieldset >
                                    <legend class="piccolo">Articoli presenti nell'ordine</legend>
                                    <div class="etich">&nbsp<jsp:getProperty name="articolo" property="lista"  /> </div>
                                </fieldset >                            
                            </c:when>
                        </c:choose> 

                    </fieldset>
                    <p><a href="crea_ordine"> crea ordine </a>    
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
        </body>
    </html>
