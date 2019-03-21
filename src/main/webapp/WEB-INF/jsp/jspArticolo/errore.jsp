<%-- 
    Document   : errore
    Created on : 13-feb-2012, 20.10.15
    Author     : sgh
--%>
<%@include file="/WEB-INF/jspf/preamboloAutenticazione.jspf" %>
<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
        <title>pagine di errore</title>
    </head>
    <body>
        <h1>si è verificato un errore </h1>
        <%out.print(exception.toString());%>
    </body>
</html>
