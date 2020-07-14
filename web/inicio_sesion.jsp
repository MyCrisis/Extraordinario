<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Verificadores.*" %>

<%@ page session="true" %>
<% 
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1);
HttpSession sesionOk = request.getSession();
HttpSession sesionerror = request.getSession();
if (sesionOk.getAttribute("usuario") != null && sesionOk.getAttribute("estado").equals(1)){
%>
<jsp:forward page="gerente.jsp">
<jsp:param name="Error" value="Tienes que identificarte de manera obligatoria"/>
</jsp:forward>
<%
}else if(sesionOk.getAttribute("usuario") != null && sesionOk.getAttribute("estado").equals(0)){
   %>
   <jsp:forward page="cliente.jsp">
<jsp:param name="Error" value="Tienes que identificarte de manera obligatoria"/>
</jsp:forward>

<%
}
%>
<!DOCTYPE html>
<html lang="es">
<head>
<script src="JavaScript/validar_usuario.js"></script>
    <meta charset="UTF-8">
    <title>
        Iniciar sesion
    </title> 
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/estilo_usuario.css">
</head>  
<body>
    <body background="imagenes/fondo_principal.jpg">
    <form class="formulario" method="POST" action="VerificarUsuario">
    <h1>
        Inicio de sesión
    </h1>
    <div class="contenedor">
        <div class="texto">
            <input type="email" placeholder="&#64; Correo Electronico" name="correo" onkeypress="return validara(event)">
        </div>
        <div class="texto">
            <input type="password" placeholder="&#128274; Contraseña" name="contra" onkeypress="return validarz(event)">
        </div>
        <div class="texto">
            <input type="hidden" name="Error">
        </div>
        <%if(sesionerror.getAttribute("Error") != null){%>
        <label for="Error">
            <font color="white">
                Usuario o contraseña incorrectos
            </font>
        </label>
        <%}%>
        <input type="submit" value="Login" class="button">
        <p>
            Al registrarte, aceptas nuestras Condiciones de uso y Política de privacidad.
        </p>
        <p>
            ¿No tienes una cuenta? 
            <a class="link" href="registrarse.jsp">
                REGISTRARSE
            </a>
        </p>
    </div>
    </form>
</body>
</html>