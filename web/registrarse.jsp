<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="Verificadores.*" %>
<%@page session="true" %>
<%
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);
String usuario = "";
HttpSession sesionOk = request.getSession();
HttpSession sesionerror = request.getSession();
if (sesionOk.getAttribute("usuario") != null) {
%>
    <jsp:forward page="index.jsp">
    <jsp:param name="Error" value="Tienes que identificarte de manera obligatoria"/>
    </jsp:forward>
    <%
}
%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>
        Registrarse
    </title> 
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
    <body oncopy="return false" onpaste="return false" ondrop="return false">
    <link rel="stylesheet" type="text/css" href="css/estilo_usuario.css">
    <script src="JavaScript/validar_usuario.js"></script>
</head> 
<body>
    <body background="imagenes/fondo_principal.jpg">
    <form method="POST" action="VerificarRegistro" class="formulario" onsubmit="return validar();">
        <h1>
            Registro
        </h1>
        <div class="contenedor">
            <div class="texto">
                <input type="text" id ="nombre" name="textoNombre" placeholder="&#128100;Nombre(s)" required autofocus maxlength="30" onkeypress="return validars(event)" autocomplete="off" pattern="[A-Za-z\s]{3,30}">
            </div>
            <div class="texto"> 
                <input type="text" id ="apellido1" name="textoApPat" pattern="[A-Za-z\s]{3,30}" placeholder="&#128100;Apellido Paterno" required autofocus maxlength="15"  onkeypress="return validars(event)" autocomplete="off">
            </div>
            <div class="texto">
                <input type="text"  id ="apellido2" name="textoApMat" pattern="[A-Za-z\s]{3,30}"  placeholder="&#128100;Apellido Materno" required autofocus maxlength="15"  onkeypress="return validars(event)" autocomplete="off">
            </div>
            <div class="texto">
                <input type="text" name="textoNumero"  placeholder="&#127968; Numero de domicilio" required autofocus maxlength="5" pattern="[0-9]{1,5}" onkeypress="return validarn(event)"  autocomplete="off">
            </div>
            <div class="texto">
                <input type="text" name="textoCalle"  placeholder="&#127968; Calle" required autofocus maxlength="30" pattern="[A-Za-z\s]{3,30}" onkeypress="return validars(event)"  autocomplete="off">
            </div>
            <div class="texto">
                <input type="text" name="textoCodigoPostal"  placeholder="&#127968; Codigo Postal" required autofocus maxlength="10"pattern="[0-9]{1,10}" onkeypress="return validarn(event)"  autocomplete="off">
            </div>
            <div class="texto">
                <input type="text"  id ="tel" name="textoTelefono" placeholder="&#128222; Telefono" required autofocus maxlength="15" onkeypress="return validarn(event)" autocomplete="off" pattern="^(\(\+?\d{2,3}\)[\*|\s|\-|\.]?(([\d][\*|\s|\-|\.]?){6})(([\d][\s|\-|\.]?){2})?|(\+?[\d][\s|\-|\.]?){8}(([\d][\s|\-|\.]?){2}(([\d][\s|\-|\.]?){2})?)?)$">
            </div>
            <div class="texto">
                <input type="email" id ="email" name="textoCorreo"  placeholder="&#64;Correo Electronico" required autofocus maxlength="76" autocomplete="off" onkeypress="return validara(event)">
            </div>
            <div class="texto">
                <input type="password" id ="contra" name="textoContraseña"  placeholder="&#128274;Contraseña" required autofocus maxlength="20" onkeypress="return validarz(event)">
            </div>
            <p align="left">
            <font color='white'>
                ¿Eres un gerente?
            </font>
            <br>
            <div class="input-contenedor">    
                <input type="button" value="si" onclick="respuestaSi()" onclick>
                <input type="button" value="no" onclick="respuestaNo()">
                <br>
                <br>
                <center>
                    <input type="contraseña" name="contraGerente" style="display: none" id ="administrador" onkeypress="return validarz(event)" placeholder="Clave" disabled="true" required="false">
                </center>
            </div>
            <div class="input-contenedor">
                <input type="hidden" name="Error">
                <input type="hidden" name="errorGerente">
            </div>
            <%if(sesionerror.getAttribute("errorRepetido") != null){%>
            <label for="Error">
                <font color="white">
                    Usuario ya existente
                </font>
            </label>
            <%}%>
            <%if(sesionerror.getAttribute("errorAdmin") != null){%>
            <label for="Error">
                <font color="white">
                    Clave de gerente incorrecta
                </font>
            </label>
            <%}%>
            <input name="valor" id="confirmacion" type="hidden" value="0">
            <input type="submit" id="botonSubmit"  value="Regístrate" class="button">
            <p>
                Al registrarte, aceptas nuestras Condiciones de uso y Política de privacidad.
            </p>
            <p>
                ¿Ya tienes una cuenta?
                <a class="link" href="inicio_sesion.jsp">
                    Inicia Sesión
                </a>
            </p>
        </div>
    </form>
</body>
</html>