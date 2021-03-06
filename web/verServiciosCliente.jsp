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
        <script src="js/validar_usuario.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/estilo_ver.css">
        <title>
            Página de servicios
        </title>
    </head>
    <body>
        <header>
            <div class="contenedor">
                <div id="marca">
                </div>
                <nav>
                    <ul>
                        <li class="actual">
                            <a href="cliente.jsp">
                                Inicio
                            </a>
                        </li>
                        <li>
                            <a href="verServiciosCliente.jsp">
                                Nuestro catálogo
                            </a>
                        </li>
                        <li class="actual">
                            <a href="servicios.jsp">
                                Servicios
                            </a>
                        </li>
                        <li>
                            <a href="perfil.jsp">
                                Perfil
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
        <%
            Vector<Servicio> vecPro = new Servicio().listaServicios();
            Extraordinario extraordinario = new Extraordinario();
        %>

    <center>
        <table class="tabla_usuarios" width="75%">
            <tr bgcolor="pink" style="color: white">
                <h4>
                    <td>
                        Nombre:
                    </td>
                    <td>
                        Descripción:
                    </td>
                    <td>
                        Tiempo estimado:
                    </td>
                    <td>
                        precio
                    </td>
                    <td>
                        horario
                    </td>
                </h4>
            </tr>
            <%if (vecPro.size() == 0) {
            %>
            <center>
                <h1>
                    No hay usuarios registrados
                </h1>
            </center>
            <%} else {
                for (Servicio pro : vecPro) {
            %>
            <script>
                function pregunta<%=pro.getId()%>() {
                    var form = document.getElementById("<%=pro.getId()%>");
                    if (confirm('¿Estas seguro de Agregar el producto con id:<%=pro.getId()%> ?')) {
                <%%>
                        form.submit();
                    }
                }
            </script>
            <tr>
                <td><%=pro.getNombre()%></td>
                <td><%=pro.getDescripcion()%></td>
                <td><%=pro.getTiempo()%></td>
                <td><%=pro.getEstreno()%></td>
                <td><%=pro.getDirector()%></td>
                <td>$:<%=pro.getPrecio()%></td>
                <td>Cantidad Disponible: <%=pro.getStock()%></td>   
                <td><form method="POST" action="GestorCarrito" id="<%=pro.getId()%>">

                        <input type="button" value="Comprar" onclick="pregunta<%=pro.getId()%>()">
                        <input name="pelicula" type="hidden" value="<%=pro.getId()%>">
                        <input name="precio" type="hidden" value="<%=pro.getPrecio()%>">
                        <input name="cantidad" type="text" required autofocus onkeypress="return validarn(event)" maxlength="2">
                    </form></td> 

            </tr>
            </tr>
            <%}
              }%>

        </table></center>
</body>
</html>