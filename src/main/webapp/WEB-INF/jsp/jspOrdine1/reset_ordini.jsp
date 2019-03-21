<%-- 
    Document   : reset_ordini
    Created on : 9-giu-2012, 18.03.52
    Author     : sgh
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/jspf/preamboloAutenticazione.jspf" %>
<%@page errorPage = "/errore.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US">

<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>JSP Page</title>
        <link rel="st;ylesheet" type="text/;css" href="../CSS/form.css" />
        <link rel="stylesheet" type="text/css" href="../CSS/layout.css" />
        <link rel="stylesheet" type="text/css" href="../CSS/tabella.css" /> 
        <link rel="javascriptsheet" type="text/javascript" href="../javaScript/javascript.js" />
        <jsp:useBean id="cliente" scope="session" class="database.Cliente" />
        <jsp:useBean id="visDati" scope="session" class="database.VisualizzazioneDati" />
        <jsp:useBean id="articolo" scope="session" class="database.Articolo" />
        <jsp:useBean id="ordine" scope="session" class="database.Ordine" />
        <jsp:useBean id="ord_art" scope="session" class="database.Ord_art" />
        <jsp:useBean id="ord_cli" scope="session" class="database.Ord_cli" />
    </head>
    <body>
        <%--<%visDati.setStringa("");%>
        <%cliente.resetDati();%>
        <%articolo.resetLista();%>
        <%articolo.cancellaVettoreArticoli();%>--%>
        <c:redirect url="visualizza_ordini.jsp">
            
        </c:redirect>
    </body>
</html>
