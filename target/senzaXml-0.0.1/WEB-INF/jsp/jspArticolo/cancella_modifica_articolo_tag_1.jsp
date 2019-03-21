<%-- 
    Document   : cancella_modifica_articolo_tag
    Created on : 2-mag-2012, 16.12.18
    Author     : sgh
--%>
<!DOCTYPE html>
<%@page errorPage = "../jspErrore/errore.jsp"%>
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
            <jsp:useBean id="articolo" scope="session" class="database.Articolo" />
            <jsp:useBean id="visDati" scope="session" class="database.VisualizzazioneDati" />
            <style type="text/css">

                .tabellauno th#header1, .tabellauno th#header2, .tabellauno th#header3, .tabellauno th#header4, .tabellauno th#header5, .tabellauno th#header6, .tabellauno th#header7, .tabellauno th#header8, .tabellauno th#header9, .tabellauno th#header10, .tabellauno th#header11 {
                    width: 90px;
                }
                .tabelladue td {                
                    width: 98px;                
                }             
                .divInternoCella{ /*uso un div per dare una dimensione MAX a td e th*/
                    width:90px; 
                }
                .bottone{
                    width: 9em;
                    height: 2em;
                    margin: 1em;
                    /*font: 1em Arial, Helvetica, sans-serif;*/
                }
                #etichetta{
                    font: bold 1.0em Arial, Helvetica, sans-serif;
                }
                #scritta,#scrittaErrore{
                    font: bold 0.9em Arial, Helvetica, sans-serif;
                }
            </style>
            <script type="text/javascript">
                var id;
                var azienda_produttrice;
                var nome_prodotto;
                var informazione_prodotto;
                var costo;
                var msg;

                /*function mostra(x){
                 var messaggio="";
                 for(var i=0;i<5;i++){
                 if(i==0){                        
                 id=x.childNodes[i].textContent;
                 document.getElementById('idID').value=id;
                 }
                 if(i==1){                        
                 azienda_produttrice=x.childNodes[i].textContent;
                 document.getElementById('idAzienda_produttrice').value=azienda_produttrice;
                 }
                 messaggio += " " + x.childNodes[i].textContent;
                 msg=messaggio;
                 
                 }                  
                 document.getElementById('etichetta').innerHTML=msg;
                 //document.getElementById('idForm').submit();
                 }*/

                function mostra(x) {

                    var messaggio = "";
                    for (var i = 0; i < 5; i++) {
                        if (i == 0) {
                            id = x.childNodes[i].textContent;
                            document.getElementById('idID').value = id;
                        }
                        if (i == 1) {
                            azienda_produttrice = x.childNodes[i].textContent;
                            document.getElementById('idAzienda_produttrice').value = azienda_produttrice;
                        }
                        if (i == 2) {
                            nome_prodotto = x.childNodes[i].textContent;
                            document.getElementById('idNome_prodotto').value = nome_prodotto;
                        }
                        if (i == 3) {
                            informazione_prodotto = x.childNodes[i].textContent;
                            document.getElementById('idInformazione_prodotto').value = informazione_prodotto;
                        }
                        if (i == 4) {
                            costo = x.childNodes[i].textContent;
                            document.getElementById('idCosto').value = costo;
                        }

                        if (i == 0) {
                            messaggio += x.childNodes[i].textContent;
                        }
                        else {
                            messaggio += "&nbsp &nbsp &nbsp &nbsp " + x.childNodes[i].textContent;
                        }

                        msg = messaggio;

                    }
                    document.getElementById('etichetta').innerHTML = msg;
                    document.getElementById('scrittaErrore').innerHTML = "";
                    //se non sono presenti bottoni cancella e modifica,
                    //creali
                    if (document.getElementById('idCancella') == null) {
                        var nodo = document.getElementById("bottoni");
                        //crea il bottone cancella
                        var cancella = document.createElement("input");
                        cancella.setAttribute("type", "submit");
                        cancella.setAttribute("name", "cancella");
                        cancella.setAttribute("value", "cancella");
                        cancella.setAttribute("class", "bottone");
                        cancella.setAttribute("id", "idCancella");
                        //crea il bottone modifica
                        var modifica = document.createElement("input");
                        modifica.setAttribute("type", "submit");
                        modifica.setAttribute("name", "modifica");
                        modifica.setAttribute("value", "modifica");
                        modifica.setAttribute("class", "bottone");
                        modifica.setAttribute("id", "idModifica");
                        nodo.appendChild(cancella);
                        nodo.appendChild(modifica);
                    }

                }




            </script>
        </head>

        <body>
            <div id="banner"></div>
            <div id="content">
                <form id="idForm" name="inserimentonome" method="post" action="" >
                    <%--creo degli input nascosti (hidden) usati dal  form per inviare informazioni al server.
                    in questo caso vengono inviati al server id e azienda_produttrice.
                    uso dei valori di default per evitare di creare problemi a Tomcat 
                    se non viene selezionata una linea della tabella--%>
                    <input type="hidden" name="id" id="idID" value="nonValido">
                    <input type="hidden" name="azienda_produttrice" id="idAzienda_produttrice" value="nonValido">
                    <input type="hidden" name="nome_prodotto" id="idNome_prodotto" value="nonValido">
                    <input type="hidden" name="informazione_prodotto" id="idInformazione_prodotto" value="nonValido">
                    <input type="hidden" name="costo" id="idCosto" value="0">
                    <input type="hidden" name="id" id="idID" >
                    <%--   <input type="hidden" name="azienda_produttrice" id="idAzienda_produttrice" >
                      <input type="hidden" name="nome_prodotto" id="idNome_prodotto" >
                      <input type="hidden" name="informazione_prodotto" id="idInformazione_prodotto" >
                      <input type="hidden" name="costo" id="idCosto" > --%>
                    <fieldset id="tabella">
                        <legend>Articoli</legend>
                        <% visDati.creaTabellaArticolo();%>                   
                        <% visDati.visualizzaTabellaScrollabileProvaJS();%>
                        <jsp:getProperty name="visDati" property="dati"  />
                        <%-- includo la jsp che crea la tabella degli articoli
                        <%@include file="tabella_articoli.jsp" %>--%>
                    </fieldset>

                    <fieldset >
                        <legend>Cancella o modifica un articolo</legend> 
                        <div id="scritta">seleziona una riga della tabella e fai click con il pulsante destro del mouse</div> 
                        <div id="etichetta">&nbsp</div>
                        <div id="bottoni"></div>
                        <div id="scrittaErrore" class="etich">&nbsp<jsp:getProperty name="articolo" property="stringaErrore"  /> </div>
                    </fieldset>
                    <c:choose>

                        <c:when test="${param.cancella!=null}">
                            <jsp:setProperty name="articolo" property="id" param="id" />
                            <jsp:setProperty name="articolo" property="azienda_produttrice" param="azienda_produttrice" />
                            <% articolo.cancellaDati();%>
                            <c:redirect url="cancella_modifica_articolo_tag_1"/>
                            <%--visualizza dati 
                            stringa: <jsp:getProperty name="articolo" property="dati"/>
                            <jsp:getProperty name="articolo" property="id"/>
                            <jsp:getProperty name="articolo" property="azienda_produttrice"/>--%>
                        </c:when>

                        <c:when test="${param.modifica!=null}">                                 
                            <jsp:setProperty name="articolo" property="id" param="id" />
                            <jsp:setProperty name="articolo" property="azienda_produttrice" param="azienda_produttrice" />
                            <jsp:setProperty name="articolo" property="nome_prodotto" param="nome_prodotto" />
                            <jsp:setProperty name="articolo" property="informazione_prodotto" param="informazione_prodotto" />
                            <jsp:setProperty name="articolo" property="costo" param="costo" />
                            <c:redirect url="cancella_modifica_articolo_tag_menuModifica"/>                                 
                        </c:when>


                    </c:choose>  
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
