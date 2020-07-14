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
        <%
            Vector<Servicio> vecPro = new Servicio().listaServicios();
        %>
        <center>
            <table class="tabla_usuarios" width="75%" border="0">
                <tr bgcolor="cyan" style="color: white">
                    <td>
                        <h4>
                            Nombre:
                        </h4>
                    </td>
                    <td>
                        <h4>
                            Descripcion:
                        </h4>
                    </td>
                    <td>
                        <h4>
                            Tiempo:
                        </h4>
                    </td>
                    <td>
                        <h4>
                            Precio:
                        </h4>
                    </td>
                    <td>
                        <h4>
                            Disponibilidad:
                        </h4>
                    </td>
                    <td>
                        <h4>
                            Eliminar:
                        </h4>
                    </td>
                    <td>
                        <h4>
                            Modificar:
                        </h4>
                    </td>
                </tr>
                <%if (vecPro.size() == 0) {
                %>
                <center>
                    <h1>
                        No hay ningun servicio aun contratado
                    </h1>
                </center>
                <%} else {
                    for (Servicio pro : vecPro) {
                %>
                <script>
                    function pregunta<%=pro.getNombre()%>() {
                        var form = document.getElementById("<%=pro.getNombre()%>");
                        if (confirm('¿Estas seguro de eliminar el servicio:"<%=pro.getNombre()%> ?')) {
                            form.submit();
                        }
                    }
                </script>
                <tr>
                <td>
                    <%=pro.getNombre()%>
                </td>
                <td>
                    <%=pro.getDescripcion()%>
                </td>
                <td>
                    <%=pro.getTiempo()%>
                </td>
                <td>
                    $:<%=pro.getPrecio()%>
                </td>
                <td>
                    disponible: <%=pro.getDisponibilidad()%>
                </td>
                <td><form action="gestor_Productos" id="<%=pro.getNombre()%>">
                        <input name="usuario" type="hidden" value="<%=pro.getNombre()%>">
                        <input type="button" value="borrar producto" onclick="pregunta<%=pro.getNombre()%>()"> 
                    </form></td>
                    <td><form action="Modificar" method="POST">
                            <input name="idproducto"type="hidden" value="<%=pro.getNombre()%>">
                            <input name="nombre"type="hidden" value="<%=pro.getNombre()%>">
                            <input name="descripcion"type="hidden" value="<%=pro.getDescripcion()%>">
                            <input name="tiempo"type="hidden" value="<%=pro.getTiempo()%>">
                            <input name="precio"type="hidden" value="<%=pro.getPrecio()%>">
                            <input name="disponibilidad"type="hidden" value="<%=pro.getDisponibilidad()%>">
                    <input type="submit" value="modificar">
                        </form></td>  
            </tr>
            <%}
              }%>
            </table>
        </center>
    </body>
</html>