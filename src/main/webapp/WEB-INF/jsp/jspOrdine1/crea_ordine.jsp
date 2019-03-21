<%-- 
    Document   : crea_ordine
    Created on : 5-giu-2012, 17.17.41
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
            <link rel="javascriptsheet" type="text/javascript" href="../javaScript/javascript.js" />
            <jsp:useBean id="cliente" scope="session" class="database.Cliente" />
            <jsp:useBean id="visDati" scope="session" class="database.VisualizzazioneDati" />
            <jsp:useBean id="articolo" scope="session" class="database.Articolo" />
            <jsp:useBean id="ordine" scope="session" class="database.Ordine" />
            <jsp:useBean id="ord_art" scope="session" class="database.Ord_art" />
            <jsp:useBean id="ord_cli" scope="session" class="database.Ord_cli" />
            <jsp:useBean id="ord_az" scope="session" class="database.Ord_az" />
            <jsp:useBean id="azienda" scope="session" class="database.Azienda" />
            <jsp:useBean id="semaforo1" scope="session" class="database.Semaforo1" />
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
                .etich{
                    font: bold 0.8em Arial, Helvetica, sans-serif;
                }
                #scritta{
                    font: bold 0.8em Arial, Helvetica, sans-serif;
                }

                span{
                    width:20em;

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

            </style>
            <script type="text/javascript">


                function js() {
                    //esegui solo se un bottone conferma non esiste già
                    if (document.getElementById('idConf') == null) {
                        var nodo = document.getElementById("bot");
                        //crea il bottone conferma

                        var conferma = document.createElement("input");
                        conferma.setAttribute("type", "submit");
                        conferma.setAttribute("name", "confermaCliInserito");
                        conferma.setAttribute("value", "Invia al database");
                        conferma.setAttribute("class", "bottone");
                        conferma.setAttribute("id", "idConferma");
                        conferma.setAttribute("onClick", "scrivi()");
                        nodo.appendChild(conferma);
                    }

                }

                function jsAzienda() {
                    //esegui solo se un bottone conferma non esiste già
                    if (document.getElementById('idConf') == null) {
                        var nodo = document.getElementById("bot");
                        //crea il bottone conferma

                        var conferma = document.createElement("input");
                        conferma.setAttribute("type", "submit");
                        conferma.setAttribute("name", "confermaAziendaCli");
                        conferma.setAttribute("value", "Invia al database");
                        conferma.setAttribute("class", "bottone");
                        conferma.setAttribute("id", "idConferma");
                        conferma.setAttribute("onClick", "scrivi()");
                        nodo.appendChild(conferma);
                    }

                }


                function mostra(x) {
                    //varibili di cliente
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
                    var messaggio = "";

                    //variabili di articolo
                    var id;
                    var azienda_produttrice;
                    var nome_prodotto;
                    var informazione_prodotto;
                    var costo;
                    var msg;

                    //variabili di azienda
                    var partita_iva;
                    var tipo_di_azienda;

                    //se la tabella, ha righe di 11 nodi, hai una tabella cliente
                    if (x.childNodes.length == 11) {
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

                            messaggio += "&nbsp &nbsp &nbsp &nbsp " + x.childNodes[i].textContent;
                            msg = messaggio;

                        }
                        document.getElementById('etichettaCli').innerHTML = msg;
                        //esegui solo se un bottone conferma non esiste già
                        if (document.getElementById('idConferma') == null) {
                            var nodo = document.getElementById("bottoni");
                            //crea il bottone conferma
                            var conferma = document.createElement("input");
                            conferma.setAttribute("type", "submit");
                            conferma.setAttribute("name", "confermaCli");
                            conferma.setAttribute("value", "conferma");
                            conferma.setAttribute("class", "bottone");
                            conferma.setAttribute("id", "idConferma");
                            conferma.setAttribute("onClick", "scrivi()");
                            nodo.appendChild(conferma);
                        }
                    }

                    //se la tabella, ha righe di 12 nodi, hai una tabella azienda
                    if (x.childNodes.length == 12) {
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
                                partita_iva = x.childNodes[i].textContent;
                                document.getElementById('idPartita_iva').value = partita_iva;
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
                            if (i == 11) {
                                tipo_di_azienda = x.childNodes[i].textContent;
                                document.getElementById('idTipo_di_azienda').value = tipo_di_azienda;
                                //window.alert(partita_iva);
                            }
                            messaggio += "&nbsp &nbsp &nbsp &nbsp " + x.childNodes[i].textContent;
                            msg = messaggio;

                        }
                        document.getElementById('etichettaCli').innerHTML = msg;
                        //esegui solo se un bottone conferma non esiste già
                        if (document.getElementById('idConferma') == null) {
                            var nodo = document.getElementById("bottoni");
                            //crea il bottone conferma
                            var conferma = document.createElement("input");
                            conferma.setAttribute("type", "submit");
                            conferma.setAttribute("name", "confermaAziendaCli");
                            conferma.setAttribute("value", "conferma");
                            conferma.setAttribute("class", "bottone");
                            conferma.setAttribute("id", "idAziendaConferma");
                            conferma.setAttribute("onClick", "scrivi()");
                            nodo.appendChild(conferma);
                        }
                    }

                    //se la tabella, ha righe di 5 nodi, hai una tabella articolo
                    if (x.childNodes.length == 5) {
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
                            messaggio += "&nbsp &nbsp &nbsp &nbsp " + x.childNodes[i].textContent;
                            msg = messaggio;

                        }
                        document.getElementById('etichettaArt').innerHTML = msg;
                        //esegui solo se un bottone conferma non esiste già
                        if (document.getElementById('idConferma') == null) {
                            var nodo = document.getElementById("bottoni");
                            //crea il text quantita
                            var quantita = document.createElement("input");
                            quantita.setAttribute("type", "text");
                            quantita.setAttribute("name", "quantita");
                            quantita.setAttribute("value", "1");
                            quantita.setAttribute("class", "bottone");
                            quantita.setAttribute("id", "idQuantita");
                            //quantita.setAttribute("onClick", "controllo()");

                            var etichettaquantita = document.createTextNode("quantità");
                            nodo.appendChild(etichettaquantita);
                            nodo.appendChild(quantita);

                            //crea il text iva
                            var iva = document.createElement("input");
                            iva.setAttribute("type", "text");
                            iva.setAttribute("name", "iva");
                            iva.setAttribute("value", "21");
                            iva.setAttribute("class", "bottone");
                            iva.setAttribute("id", "idIva");
                            //iva.setAttribute("onClick", "controllo()");
                            var etichettaiva = document.createTextNode("IVA in %");
                            nodo.appendChild(etichettaiva);
                            nodo.appendChild(iva);

                            //crea il text sconto
                            var sconto = document.createElement("input");
                            sconto.setAttribute("type", "text");
                            sconto.setAttribute("name", "sconto");
                            sconto.setAttribute("value", "0");
                            sconto.setAttribute("class", "bottone");
                            sconto.setAttribute("id", "idSconto");
                            //sconto.setAttribute("onClick", "controllo()");

                            var etichettasconto = document.createTextNode("Sconto");
                            nodo.appendChild(etichettasconto);
                            nodo.appendChild(sconto);

                            //crea il bottone controllo
                            var controllo = document.createElement("input");
                            controllo.setAttribute("type", "button");
                            controllo.setAttribute("name", "controlloArt");
                            controllo.setAttribute("value", "controllo");
                            controllo.setAttribute("class", "bottone");
                            controllo.setAttribute("id", "idConferma");
                            controllo.setAttribute("onClick", "controllo()");
                            nodo.appendChild(controllo);
                        }

                    }
                }

                function controllo() {
                    var str = "";
                    var errore = false;

                    var schemaQuantita = /^[0-9]{1,}$/;
                    var schemaIva = /^[0-9]{1,}$/;

                    var schemaSconto = /^[0-9]{1,}$/;

                    var quantita = document.getElementById('idQuantita').value;
                    var iva = document.getElementById('idIva').value;
                    var sconto = document.getElementById('idSconto').value;

                    if (!(schemaQuantita.test(quantita))) {
                        str += "la quantità non è esatta, correggila \n";
                        errore = true;
                        document.getElementById('idQuantita').value = 1;
                    }

                    if (!(schemaIva.test(iva))) {
                        str += "l'iva non è esatta, correggila \n";
                        errore = true;
                        document.getElementById('idIva').value = 21;
                    }

                    if (!(schemaSconto.test(sconto))) {
                        str += "lo sconto non è esatto, correggiloa \n";
                        errore = true;
                        document.getElementById('idSconto').value = "0";
                    }

                    if (errore) {
                        window.alert(str);
                    } else {

                        document.getElementById("idConferma").style.display = "none";

                        var nodo = document.getElementById("bottoni");
                        var conferma = document.createElement("input");
                        conferma.setAttribute("type", "submit");
                        conferma.setAttribute("name", "confermaArt");
                        conferma.setAttribute("value", "conferma");
                        conferma.setAttribute("class", "bottone");
                        conferma.setAttribute("id", "idConferma");
                        nodo.appendChild(conferma);

                    }

                }

                function scrivi() {
                    //cancella tabella, pulsante e scritta 
                    if (semaforo == "verde") {
                        document.getElementById("scritta").style.display = "none";
                        document.getElementById("idConferma").style.display = "none";
                        document.getElementById("idTabellauno").style.display = "none";

                        //fai il submit del form tramite javascript
                        document.getElementById('idForm').submit();
                    }
                }


            </script>
        </head>


        <%-- **************************************************************************************
            Esempio di uso di <c:set/>
            <body>
            <c:set var="salary" scope="session" value="${2000*2}"/>
            <c:if test="${salary > 2000}">
               <p>My salary is: <c:out value="${salary}"/><p>
            </c:if>
            </body>
         **************************************************************************************    --%>       


        <body>
            <div id="banner">            
            </div>

            <div id="content">
                <c:if test="${semaforo1.passa}">
                    <c:set var="vis" value="0" />
                    <%azienda.resetVariabili();%>
                    <%cliente.resetVariabili();%>
                    <%visDati.resetStringa();%>
                    <%articolo.resetLista();%>
                    <%articolo.cancellaVettoreArticoli();%>
                    <%ordine.resetVariabili();%>
                    <script>
                        document.getElementById("etichettaArt").style.display = "none";
                        document.getElementById("etichettaCli").style.display = "none";
                        document.getElementById("idImportoTotale").style.display = "none";
                        document.getElementById("idImportoIva").style.display = "none";
                        document.getElementById("idImportoOrdine").style.display = "none";


                    </script>
                </c:if>
                <form id="idForm" name="creaordine" method="post" action="" >

                    <%-- **************************************************************************************
                    *******************************************************************************************

                 DESTINATARIO DELL'ORDINE, può essere una persona od una azienda
                 
                 ******************************************************************************************
                 **************************************************************************************    --%>       

                    <fieldset id="idDestinatario">
                        <legend>Destinatario</legend>                    
                        <span>
                            <label for="destinatario" class="etich"> seleziona persona o azienda</label><br>
                            <input type="radio"  name="destinatario" value="azienda" /> Azienda/Studio<br />
                            <input type="radio"  name="destinatario" value="persona" /> Persona
                        </span>    
                        <div>   
                            <input type="submit" name="vai_alla_tabella" value="Vai alla tabella" />
                        </div>

                        <c:choose>
                            <%-- ***********************************************
                            PERSONA NEL DATABASE
                            ***************************************************
                            questa parte del programma viene raggiunta quando l'utente seleziona
                            persona e dato presente nel database e visualizza i dati dellatabella cliente su cui scegliamo il 
                            cliente desiderato --%>                            
                            <c:when test="${param.destinatario=='persona'}">
                                <c:set var="stato" scope="session" value="${'persona'}"/>

                                <%-- blocco il semaforo--%>
                                <%semaforo1.bloccaSemaforo();%>

                                <%--crea tabella dati per la visualizzazione --%>                                
                                <% visDati.creaTabellaCliente();%>                   
                                <% visDati.visualizzaTabellaScrollabileProvaJS();%>

                                <%--visualizza la tabella --%>
                                <jsp:getProperty name="visDati" property="dati"  />

                                <div id="scritta">per selezionare una persona, vai con il mouse su  una riga della tabella e fai click con il pulsante destro  </div>
                                <%--<div class="etichettaCli">&nbsp</div>--%>
                                <div id="bottoni"></div>

                                <%--creo i bottoni nascosti (hidden)per inviare i dati del 
                                cliente selezionato dal client al server--%>   
                                <input type="hidden" name="nome1" id="idNome1" >
                                <input type="hidden" name="nome2" id="idNome2" >
                                <input type="hidden" name="nome3" id="idNome3" >
                                <input type="hidden" name="codice_fiscale" id="idCodice_fiscale" >
                                <input type="hidden" name="indirizzo" id="idIndirizzo" >
                                <input type="hidden" name="citta" id="idCitta" >
                                <input type="hidden" name="provincia" id="idProvincia" >
                                <input type="hidden" name="telefono" id="idTelefono" >
                                <input type="hidden" name="fax" id="idFax" >
                                <input type="hidden" name="email" id="idEmail" >
                                <input type="hidden" name="cap" id="idCap" >                                
                            </c:when>
                            <%-- questa parte del programma viene raggiunta quando javascript 
                               crea il bottone CONFERMA e serve a trasferire i dati dal client al server 
                               (classe cliente) in modo da riutilizzarli più tardi--%>     
                            <c:when test="${param.confermaCli!=null}">
                                <%-- invia i dati contenuti nei pulsanti nascosti al bean cliente--%>
                                <jsp:setProperty name="cliente" property="*" />
                                <%visDati.setStringa("");%>
                                <%cliente.setDati();%>

                                <%visDati.setStringa(cliente.getDati());%>
                            </c:when>        


                            <%-- ***********************************************
                            AZIENDA NEL DATABASE
                            ***************************************************    
                            <%-- questa parte del programma viene raggiunta quando l'utente seleziona
                            azienda e dato presente nel database  --%>    
                            <c:when test="${param.destinatario=='azienda'}">
                                <c:set var="stato" scope="session" value="${'azienda'}"/>

                                <%-- blocco il semaforo--%>
                                <%semaforo1.bloccaSemaforo();%>

                                <%--crea tabella dati per la visualizzazione --%>                                
                                <% visDati.creaTabellaAzienda();%>                   
                                <% visDati.visualizzaTabellaScrollabileProvaJS();%>

                                <%--visualizza la tabella --%>
                                <jsp:getProperty name="visDati" property="dati"  />

                                <div id="scritta">per selezionare una azienda, vai con il mouse su  una riga della tabella e fai click con il pulsante destro  </div>
                                <%--<div class="etichettaCli">&nbsp</div>--%>
                                <div id="bottoni"></div>
                                <%--creo i bottoni nascosti (hidden)per inviare i dati della 
                                azienda selezionata dal client al server--%>   
                                <input type="hidden" name="nome1" id="idNome1" >
                                <input type="hidden" name="nome2" id="idNome2" >
                                <input type="hidden" name="nome3" id="idNome3" >
                                <input type="hidden" name="partita_iva" id="idPartita_iva" >
                                <input type="hidden" name="indirizzo" id="idIndirizzo" >
                                <input type="hidden" name="citta" id="idCitta" >
                                <input type="hidden" name="provincia" id="idProvincia" >
                                <input type="hidden" name="telefono" id="idTelefono" >
                                <input type="hidden" name="fax" id="idFax" >
                                <input type="hidden" name="email" id="idEmail" >
                                <input type="hidden" name="cap" id="idCap" >
                                <input type="hidden" name="tipo_di_azienda" id="idTipo_di_azienda" >
                            </c:when> 
                            <%-- questa parte del programma viene raggiunta quando javascript 
                               crea il bottone CONFERMAAZIENDACLI e serve a trasferire i dati dal client al server 
                               (classe azienda) in modo da riutilizzarli più tardi--%>     
                            <c:when test="${param.confermaAziendaCli!=null}">                                
                                <jsp:setProperty name="azienda" property="*" />
                                <%visDati.setStringa("");%>
                                <%azienda.setDati();%>

                                <%visDati.setStringa(azienda.getDati());%>
                            </c:when>     
                        </c:choose>
                        <c:if test="${param.memorizzaOrdine==null}">           
                            <div id="etichettaCli" class="etich">&nbsp<jsp:getProperty name="visDati" property="stringa"  /> </div>
                        </c:if>   
                    </fieldset>

                    <%-- **************************************************************************************
                      *******************************************************************************************

                 ARTICOLI PRESENTI NELL'ORDINE, possono essere più di uno
                 
                 ******************************************************************************************
                 **************************************************************************************    --%>             

                    <fieldset id="articolo">
                        <legend>Articoli</legend>

                        <div>
                            <label for="visualizza_articoli" class="etich"> Premendo il tasto vedrai la tabella degli articoli disponibili:</label>
                        </div>
                        <div>    
                            <input type="submit" name="visualizza_articoli" value="Visualizza" />
                        </div>


                        <%--<%articolo.cancellaVettoreArticoli(); %>--%>
                        <c:choose>                            
                            <c:when test="${param.visualizza_articoli!=null}"> 

                                <%-- blocco il semaforo--%>
                                <%semaforo1.bloccaSemaforo();%>

                                <%--crea tabella dati per la visualizzazione --%>
                                <% visDati.creaTabellaArticolo();%>                   
                                <% visDati.visualizzaTabellaScrollabileProvaJS();%>

                                <%--visualizza tabella articoli --%>                                
                                <jsp:getProperty name="visDati" property="dati"  />

                                <%--visualizza altri elementi html --%>
                                <div id="scritta">per selezionare un articolo, vai con il mouse su  una riga della tabella e fai click con il pulsante destro  </div>
                                <div id="bottoni"></div>

                                <%--creo i bottoni nascosti (hidden)per inviare i dati del 
                                cliente selezionato dal client al server--%>
                                <input type="hidden" name="id" id="idID" >
                                <input type="hidden" name="azienda_produttrice" id="idAzienda_produttrice" >
                                <input type="hidden" name="nome_prodotto" id="idNome_prodotto" >
                                <input type="hidden" name="informazione_prodotto" id="idInformazione_prodotto" >
                                <input type="hidden" name="costo" id="idCosto" >
                                <input type="hidden" name="id" id="idID" >
                                <input type="hidden" name="quantita" id="idQuantita" >
                                <input type="hidden" name="iva" id="idIva" >
                                <input type="hidden" name="sconto" id="idSconto" >
                            </c:when>

                            <%--<c:when test="${param.presenza1=='assente'}">
                                <c:redirect url="inserimento_dati_articolo.jsp"/>
                            </c:when>--%>

                            <%-- questa parte del programma viene raggiunta quando javascript 
                             crea il bottone CONFERMA e serve a trasferire i dati dal client al server 
                             (classe articolo) in modo da riutilizzarli più tardi--%>  
                            <c:when test="${param.confermaArt!=null}">
                                <jsp:setProperty name="articolo" property="*" />                                 
                                <%--%articolo.setDati();%>--%>
                                <%articolo.aggiungiArticoloAllaLista();%>                                
                                <%articolo.restituisciListaArticoli();%>


                            </c:when>    
                        </c:choose>
                        <c:if test="${param.memorizzaOrdine==null}">          
                            <div id="etichettaArt" class="etich">&nbsp<jsp:getProperty name="articolo" property="lista"  /></div>
                        </c:if>     
                    </fieldset>

                    <%-- **************************************************************************************
                     *******************************************************************************************

                 CREAZIONE DELL'ORDINE E INSERIMENTO DEI DATI NEI VARI DATABASE
                 
                 ******************************************************************************************
                 **************************************************************************************    --%>             


                    <fieldset>
                        <legend>Effettua ordine</legend> 
                        <%--<c:out value="${stato}"/>--%>
                        <%--<%ord_art.inserisciArrayDiDati(articolo.getVettoreArticoli());%>--%>
                        <%ordine.calcolaImportoTotale(articolo.getVettoreArticoli());%>
                        <%ordine.calcolaImportoIva(articolo.getVettoreArticoli());%>
                        <%ordine.calcolaImportoOrdineSenzaSconto(articolo.getVettoreArticoli());%>
                        <div><span class="etich" >IMPORTO  TOTALE:</span>
                            <span class ="etich" id="idImportoTotale"><jsp:getProperty name="ordine" property="importo_totale"  /></span>
                        </div>
                        <div><span class="etich" >IMPORTO IVA:</span>
                            <span class ="etich" id="idImportoIva"><jsp:getProperty name="ordine" property="importo_iva"  /></span>
                        </div>
                        <div><span class="etich" >IMPORTO ORDINE          (senza sconto):</span>
                            <span class ="etich" id="idImportoOrdine"><jsp:getProperty name="ordine" property="importo_ordine"  /></span>
                        </div>

                        <div>
                            <label for="sconto_ordine" class="etich"> inserisci lo sconto dell'ordine</label><br>
                            <input type="text" name="sconto_ordine" id="idScontoOrdine" value="0"><br> 
                        </div>
                        <div>
                            <label for="idOrdine" class="etich"> inserisci il codice dell'ordine</label><br>
                            <input type="text" name="idOrdine" id="IDidOrdine" value="codice da inserire" >
                            <%--<jsp:setProperty name="ordine" property="idOrdine" param="codiceOrdine"/>--%>
                        </div>
                        <div>                     
                            <input type="submit" name="memorizzaOrdine" value="Memorizza ordine" />
                            <input type="submit" name="cancellaOrdine"   value="Cancella dati" />
                        </div>

                        <c:choose>

                            <%--hai selezionato un cliente --%>

                            <c:when test="${param.memorizzaOrdine!=null && stato=='persona'}"> 

                                <%-- sblocca semaforo --%>
                                <%semaforo1.setPassa();%>

                                <%-- <c:out value="${'agisco su persona'}"/>--%>
                                <c:if test="${param.idOrdine!='codice da inserire' }">

                                    <jsp:setProperty name="ordine" property="idOrdine" param="idOrdine" />

                                    <%-- calcola importo ordine--%>
                                    <jsp:setProperty name="ordine" property="sconto_ordine" param="sconto_ordine" />
                                    <%ordine.calcolaImportoOrdine(articolo.getVettoreArticoli());%>



                                    <%-- inserimento dati ordine--%>
                                    <%ordine.inserisciDati();%>
                                    <%ord_cli.inserisciDati(ordine.getIdOrdine(), cliente.getCodice_fiscale());%>
                                    <%ord_art.inserisciListaDati(articolo.getVettoreArticoli(), ordine.getIdOrdine());%>

                                    <%-- cancella dati ordine--%>

                                    <%cliente.resetVariabili();%>
                                    <%articolo.resetLista();%>
                                    <%articolo.cancellaVettoreArticoli();%>
                                    <%ordine.resetVariabili();%>
                                    <%--<c:set var="vaiJsp" value="true" />--%>
                                    <script>
                                        document.getElementById("etichettaArt").style.display = "none";
                                        document.getElementById("etichettaCli").style.display = "none";
                                        document.getElementById("idImportoTotale").style.display = "none";
                                        document.getElementById("idImportoIva").style.display = "none";
                                        document.getElementById("idImportoOrdine").style.display = "none";

                                    </script>
                                    <%--<c:redirect url="visualizza_ordini.jsp"/>--%>
                                    <div class="etich" >ordine effettuato</div> 

                                </c:if>                           
                            </c:when> 

                            <%--hai selezionato una azienda --%>         
                            <c:when test="${param.memorizzaOrdine!=null && stato=='azienda'}"> 

                                <%-- sblocca semaforo --%>
                                <%semaforo1.setPassa();%>

                                <%--<c:out value="${'agisco su azienda'}"/>--%>
                                <c:if test="${param.idOrdine!='codice da inserire' }">
                                    <jsp:setProperty name="ordine" property="idOrdine" param="idOrdine" />

                                    <%-- calcola importo ordine--%>
                                    <jsp:setProperty name="ordine" property="sconto_ordine" param="sconto_ordine" />
                                    <%ordine.calcolaImportoOrdine(articolo.getVettoreArticoli());%>

                                    <%-- inserimento dati ordine--%>
                                    <%ordine.inserisciDati();%>
                                    <%ord_az.inserisciDati(ordine.getIdOrdine(), azienda.getPartita_iva());%>
                                    <%ord_art.inserisciListaDati(articolo.getVettoreArticoli(), ordine.getIdOrdine());%>

                                    <%-- cancella dati ordine--%>
                                    <%azienda.resetVariabili();%>

                                    <%articolo.resetLista();%>
                                    <%articolo.cancellaVettoreArticoli();%>
                                    <%ordine.resetVariabili();%>
                                    <%--<c:set var="vaiJsp" value="true" />--%>
                                    <script>
                                        document.getElementById("etichettaArt").style.display = "none";
                                        document.getElementById("etichettaCli").style.display = "none";
                                        document.getElementById("idImportoTotale").style.display = "none";
                                        document.getElementById("idImportoIva").style.display = "none";
                                        document.getElementById("idImportoOrdine").style.display = "none";

                                    </script>

                                    <div class="etich">ordine effettuato</div>



                                </c:if> 
                            </c:when>

                            <%-- **************************************************************************************
                                  *******************************************************************************************

                            CANCELLAZIONE  DELL'ORDINE 
                          ******************************************************************************************
                          **************************************************************************************    --%>                   
                            <c:when test="${param.cancellaOrdine!=null }">
                                <%--<%azienda.resetDati();%>
                                <%articolo.resetLista();%>
                                <%articolo.cancellaVettoreArticoli();%>
                                <%visDati.resetStringa();%>
                                <%articolo.resetLista();%>
                                <%ordine.reset();%>
                                <%ordine.setImporto_iva("0");%>
                                <%ordine.setImporto_totale("0");%>
                                <div class="etich">ordine cancellato</div>
                                <%--questo codice javascript, in questa posizione serve a cancellare
                                gli articoli e il destinatario dell'ordine--%>

                                <%azienda.resetVariabili();%>
                                <%cliente.resetVariabili();%>
                                <%articolo.resetLista();%>
                                <%articolo.cancellaVettoreArticoli();%>
                                <%ordine.resetVariabili();%>

                                <div class="etich">ordine cancellato</div>

                                <script>
                                    document.getElementById("etichettaArt").style.display = "none";
                                    document.getElementById("etichettaCli").style.display = "none";
                                    document.getElementById("idImportoTotale").style.display = "none";
                                    document.getElementById("idImportoIva").style.display = "none";
                                    document.getElementById("idImportoOrdine").style.display = "none";

                                </script>
                            </c:when>

                        </c:choose>

                        <%--<c:if test="${vaiJsp}">
                             <c:redirect url="visualizza_ordini.jsp"></c:redirect>
                        </c:if>--%>     
                    </fieldset>
                    <p><a href="visualizza_ordini"> tabella ordini </a>
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


