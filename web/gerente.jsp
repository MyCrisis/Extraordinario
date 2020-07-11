<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Operaciones.*" %>

<%@ page session="true" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1);
    String usuario = "";
    HttpSession sesionOk = request.getSession();
    if (sesionOk.getAttribute("usuario") == null) {
%>
<jsp:forward page="login.jsp">
    <jsp:param name="error" value="Es
               obligatorio identificarse"/>
</jsp:forward>
<%
    } else {
        usuario = (String) sesionOk.getAttribute("usuario");
    }
%>
<!DOCTYPE html>
<html>
    <head>

        <title>Inicio</title>
    </head>
    <meta charset="utf-8">
    <body oncopy="return false" onpaste="return false" ondrop="return false">
        <link rel="stylesheet" type="text/css" href="css/estilo_ver.css">


    </head>
<body>

    <header>
        <div class="contenedor">
            <div id="marca">



            </div>
            <nav>
                <ul>
                    <li class="actual"><a href="Empleado_Principal.jsp">Inicio</a></li>
                    <li><a href="Gestion_Usuarios.jsp">Gestionar Usuarios</a></li>
                    <li><a href="AgregarProductos.jsp">Agregar productos</a></li>
                    <li><a href="MostrarProductosadmin.jsp">Gestionar Productos</a></li>
                    <li><a href="Perfiladmin.jsp">Perfil</a></li>
                    <li> <form action="CerrarSesion">
                            <input type="submit" value="cerrar sesion">
                        </form></li>
                </ul>
            </nav>

        </div>
    </header>
<center><h1>Bienvenido: <%=usuario%></h1></center>


</body>
</html>