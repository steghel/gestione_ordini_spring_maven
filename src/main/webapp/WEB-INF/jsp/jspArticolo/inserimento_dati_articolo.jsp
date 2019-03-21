<%-- 
    Document   : inserimento_dati_cliente
    Created on : 27-dic-2011, 11.58.18
    Author     : sgh
--%>
<!DOCTYPE html>

<%@page errorPage = "../jspErrore/errore.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>JSP Page</title>
        <%-- collegamento con i file dei CSS--%>
        <link href="<c:url value="/resources/css/form.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/layout.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/tabella.css" />" rel="stylesheet">

        <jsp:useBean id="articolo" scope="session" class="database.Articolo" />


    </head>    
    <body>
        <%articolo.resetVariabili(); %> 
        <jsp:setProperty name="articolo" property="*" />    
        <jsp:setProperty name="articolo" property="id" param="id" />
        <jsp:setProperty name="articolo" property="azienda_produttrice" param="azienda_produttrice" />
        <div id="banner"></div>
        <div id="content">
            <form action="inserimento_dati_articolo" method="post"> 
                <h1>REGISTRAZIONE DATI PRODOTTO</h1>
                <fieldset>

                    <div>
                        <label for="id"> Codice del prodotto:</label>
                        <input type="text" name="id" class ="txt"/>
                    </div>
                    <div>
                        <label for="azienda_produttrice"> Azienda che lo produce:</label>
                        <input type="text" name="azienda_produttrice" class ="txt"/>
                    </div>
                    <div>
                        <label for="nome_prodotto"> Nome del prodotto:</label>
                        <input type="text" name="nome_prodotto" class ="txt"/>
                    </div>



                    <div>
                        <label for="informazione_prodotto"> Informazioni sul prodotto:</label>
                        <input type="text" name="informazione_prodotto" class ="txt" />
                    </div>

                    <div>
                        <label for="costo"> Costo in euro:</label>
                        <input type="text" name="costo" class ="txt"/>
                    </div>
                    <div>
                        <input type="submit" name="Invia" value="Invia" class="btn" />
                    </div>

                    <c:if test="${param.Invia!=null}">
                        <% articolo.inserisciDati(); %>
                        <% articolo.resetVariabili();%>
                        <c:redirect url="cancella_modifica_articolo_tag_1"/>                                     
                    </c:if>
                </fieldset>
            </form>
            <p><a href="cancella_modifica_articolo_tag_1"> Accedi alla pagina per controllare i dati di un articolo </a> 
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
