<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Datos.*" %>

<%@ page session="true" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1);
    String usuario = "";
    HttpSession sesionOk = request.getSession();
    if (sesionOk.getAttribute("usuario") == null) {
%>
<jsp:forward page="inicio_sesion.jsp">
    <jsp:param name="error" value="Tienes que identificarte de manera obligatoria"/>
</jsp:forward>
<%
    } else {
        usuario = (String) sesionOk.getAttribute("usuario");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/estilo_gerente.css">
        <title>Administración de las citas</title>
    </head>
    <body>
        <header>
            <div class="contenedor">
                <div id="marca">
                </div>
                <nav>
                    <ul>
                        <li class="actual">
                            <a href="gerente.jsp">
                                Inicio
                            </a>
                        </li>
                        <li>
                            <a href="admin_citas.jsp">
                                Administración de las citas y pagos
                            </a>
                        </li>
                        <li>
                            <a href="servicios_mas_vendidos.jsp">
                                Servicios más vendidos
                            </a>
                        </li>
                        <li>
                            <a href="ganancia_diaria.jsp">
                                Ganancias del día
                            </a>
                        </li>
                        <li>
                            <form action="CerrarSesion">
                                <input type="submit" value="cerrar sesion">
                            </form>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>
        