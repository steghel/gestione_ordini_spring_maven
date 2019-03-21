<%-- 
    Document   : cancella_modifica_cliente_tag
    Created on : 15-mag-2012, 1.07.59
    Author     : sgh
--%>

<!DOCTYPE html>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page errorPage = "/errore.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
            <jsp:useBean id="cliente" scope="session" class="database.Cliente" />
            <jsp:useBean id="visDati" scope="session" class="database.VisualizzazioneDati" />
            <style type="text/css">

                .tabellauno th#header1, .tabellauno th#header2, .tabellauno th#header3, .tabellauno th#header4, .tabellauno th#header5, .tabellauno th#header6, .tabellauno th#header7, .tabellauno th#header8, .tabellauno th#header9, .tabellauno th#header10, .tabellauno th#header11 {
                    width: 60px;
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
                #etichetta{
                    font: bold 1.0em Arial, Helvetica, sans-serif;
                }
                #scritta,#scrittaErrore{
                    font: bold 0.9em Arial, Helvetica, sans-serif;
                }
            </style>
            <script type="text/javascript">
                var nome1;
                var nome2;
                var nome3;
                var codice_fiscale;
                var indirizzo;
                var citta;
                var provincia;
                var telefono;
                var fax;
                var email;
                var cap;

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
                    for (var i = 0; i < 11; i++) {
                        if (i == 0) {
                            nome1 = x.childNodes[i].textContent;
                            document.getElementById('idNome1').value = nome1;

                        }
                        if (i == 1) {
                            nome2 = x.childNodes[i].textContent;
                            document.getElementById('idNome2').value = nome2;
                        }
                        if (i == 2) {
                            nome3 = x.childNodes[i].textContent;
                            document.getElementById('idNome3').value = nome3;
                        }
                        if (i == 3) {
                            codice_fiscale = x.childNodes[i].textContent;
                            document.getElementById('idCodice_fiscale').value = codice_fiscale;
                            //window.alert(partita_iva);
                        }
                        if (i == 4) {
                            indirizzo = x.childNodes[i].textContent;
                            document.getElementById('idIndirizzo').value = indirizzo;
                            //window.alert(partita_iva);
                        }
                        if (i == 5) {
                            citta = x.childNodes[i].textContent;
                            document.getElementById('idCitta').value = citta;
                            //window.alert(partita_iva);
                        }
                        if (i == 6) {
                            provincia = x.childNodes[i].textContent;
                            document.getElementById('idProvincia').value = provincia;
                            //window.alert(partita_iva);
                        }
                        if (i == 7) {
                            telefono = x.childNodes[i].textContent;
                            document.getElementById('idTelefono').value = telefono;
                            //window.alert(partita_iva);
                        }
                        if (i == 8) {
                            fax = x.childNodes[i].textContent;
                            document.getElementById('idFax').value = fax;
                            //window.alert(partita_iva);
                        }
                        if (i == 9) {
                            email = x.childNodes[i].textContent;
                            document.getElementById('idEmail').value = email;
                            //window.alert(partita_iva);
                        }
                        if (i == 10) {
                            cap = x.childNodes[i].textContent;
                            document.getElementById('idCap').value = cap;
                            //window.alert(partita_iva);
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
                    <input type="hidden" name="nome1" id="idNome1" value="nonValido">
                    <input type="hidden" name="nome2" id="idNome2" value="nonValido">
                    <input type="hidden" name="nome3" id="idNome3" value="nonValido">
                    <input type="hidden" name="codice_fiscale" id="idCodice_fiscale" value="nonValido">
                    <input type="hidden" name="indirizzo" id="idIndirizzo" value="nonValido">
                    <input type="hidden" name="citta" id="idCitta" value="nonValido">
                    <input type="hidden" name="provincia" id="idProvincia" value="nonValido">
                    <input type="hidden" name="telefono" id="idTelefono" value="nonValido">
                    <input type="hidden" name="fax" id="idFax" value="nonValido">
                    <input type="hidden" name="email" id="idEmail" value="nonValido">
                    <input type="hidden" name="cap" id="idCap" value="nonValido">

                    <%--   <input type="hidden" name="azienda_produttrice" id="idAzienda_produttrice" >
                      <input type="hidden" name="nome_prodotto" id="idNome_prodotto" >
                      <input type="hidden" name="informazione_prodotto" id="idInformazione_prodotto" >
                      <input type="hidden" name="costo" id="idCosto" > --%>
                    <fieldset id="tabella">
                        <legend>Clienti</legend>
                        <% visDati.creaTabellaCliente();%>                   
                        <% visDati.visualizzaTabellaScrollabileProvaJS();%>                            
                        <jsp:getProperty name="visDati" property="dati"  />
                        <%-- includo la jsp che crea la tabella degli articoli
                        <%@include file="tabella_articoli.jsp" %>--%>
                    </fieldset>

                    <fieldset >
                        <legend>visualizza i dati di un articolo</legend> 
                        <div id="scritta">seleziona una riga della tabella e fai click con il pulsante destro del mouse </div>
                        <div id="etichetta">&nbsp</div>
                        <div id="bottoni"></div>
                        <div id="scrittaErrore" class="etich">&nbsp<jsp:getProperty name="cliente" property="stringaErrore"  /> </div>
                    </fieldset>

                    <c:choose>

                        <c:when test="${param.cancella!=null}">
                            <jsp:setProperty name="cliente" property="codice_fiscale" param="codice_fiscale" />

                            <% cliente.cancellaDati();%>
                            <c:redirect url="cancella_modifica_cliente_tag"/>

                            <%--visualizza dati 
                            stringa: <jsp:getProperty name="articolo" property="dati"/>
                            <jsp:getProperty name="articolo" property="id"/>
                            <jsp:getProperty name="articolo" property="cliente_produttrice"/>--%>
                        </c:when>

                        <c:when test="${param.modifica!=null}">

                            <jsp:setProperty name="cliente" property="nome1" param="nome1" />
                            <jsp:setProperty name="cliente" property="nome2" param="nome2" />
                            <jsp:setProperty name="cliente" property="nome3" param="nome3" />
                            <jsp:setProperty name="cliente" property="codice_fiscale" param="codice_fiscale" />
                            <jsp:setProperty name="cliente" property="indirizzo" param="indirizzo" />                                  
                            <jsp:setProperty name="cliente" property="citta" param="citta" />                                 
                            <jsp:setProperty name="cliente" property="provincia" param="provincia" />                                 
                            <jsp:setProperty name="cliente" property="telefono" param="telefono" />                                 
                            <jsp:setProperty name="cliente" property="fax" param="fax" />                                 
                            <jsp:setProperty name="cliente" property="email" param="email" /> 
                            <jsp:setProperty name="cliente" property="cap" param="cap" />

                            <c:redirect url="cancella_modifica_cliente_tag_menuModifica"/>                               
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

