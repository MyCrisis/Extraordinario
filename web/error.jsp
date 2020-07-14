<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Funcionalidades.*" %>

<%@ page session="true" %>
<%
String Error="";
String usuario = "";
HttpSession sesionOk = request.getSession();
if (sesionOk.getAttribute("usuario") == null) {
%>
<jsp:forward page="login.jsp">
<jsp:param name="Error" value="Tienes que identificarte de manera obligatoria"/>
</jsp:forward>
<%
} else {
}
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Muli&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/estilo_error.css">
    <title>Error</title>
</head>
<body>
   <section class="error-message">
        <h1 class="animated bounce"><font size="18" color="#CAE9FF" face="Muli">
            ERROR
        </h1>
        <p>
            <font size="5" color="white" face="Muli">
                Lo sentimos, hubo un error
            </font>
        </p> 
    </section>
    <footer class="footer">
        <!--Falta cambiar-->
        <a href="index.jsp">
            REGRESAR AL PRINCIPIO
        </a>
    </footer>
</body>
</html>