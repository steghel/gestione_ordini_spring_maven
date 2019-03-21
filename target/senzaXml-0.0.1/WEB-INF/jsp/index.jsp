<%-- 
    Document   : index
    Created on : 27-dic-2011, 11.57.15
    Author     : sgh
--%>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@page import ="database.*" %>--%>

<!DOCTYPE html >

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <%-- collegamento con i file dei CSS--%>
        <link href="<c:url value="/resources/css/form.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/layout.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/tabella.css" />" rel="stylesheet">
    </head>
    <body>
        <div id="banner"></div>
        <div id="content">
            <fieldset>
                <legend>Modulo di Login</legend>
                <div class="etich">Inserire Nome Account & Password: </div>

                <FORM name=form_login method=POST action="enter.jsp">
                    <TABLE  WIDTH="80%">
                        <TR>
                            <TD WIDTH="50%" align="right">
                                Nome Account:</TD>
                            <TD WIDTH="50%" align="left">
                                <INPUT name="userID" MAXLENGTH="12" >
                            </TD>
                        </TR>
                        <TR>
                            <TD align="right">
                                Password:</TD>
                            <TD align="left">
                                <INPUT TYPE="password" name="password" MAXLENGTH="12" >
                            </TD>
                        <TR>
                            <TD></TD>
                            <TD align="left">
                                <INPUT id="b_submit" name="cmdSubmit" TYPE="submit" VALUE="Accedi">
                                <INPUT id="b_reset" name="cmdReset" TYPE="reset" VALUE="Cancella">
                        </TR>
                    </TABLE>

                </FORM>
                <div><a href="inizio">Entra nel programma</a></div>
            </fieldset>


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
