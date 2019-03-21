<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WebEsempioAutenticazioneBean - Pagina JSP in cui si controlla l'accesso</title>
    </head>
    <body>
        <jsp:useBean id="vincenzo" scope="session" class="miaroba.beans.controlloreBean" />
        <jsp:setProperty name="vincenzo" property="userID" />
        <jsp:setProperty name="vincenzo" property="password" />

        <c:choose>
            <c:when test="${vincenzo.autenticato}">

                <H2>OK!</H2>
                <c:redirect url="inizio.jsp"/> 
                

            </c:when>
            <c:otherwise>

                <H2>UTENTE ERRATO!</H2>
                La pagina richiesta e' accessibile solo tramite autenticazione!
                <%--il programma viene ridiretto alla servlet contenuta in 
                Source Package/default package/loginErratoServlet.java che ha nome "go"
                vedi WEB-INF/ web.xml--%>
                <c:redirect url="/go"/> 
                

            </c:otherwise>
        </c:choose>
    
    </body>
</html>
