<%@page import="Datos.Usuario"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Funcionalidades.*" %>

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
    <jsp:param name="Error" value="Tienes que identificarte de manera obligatoria"/>
</jsp:forward>
<%
    } else {
        usuario = (String) sesionOk.getAttribute("usuario");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Perfil del cliente</title>
    </head>
        <meta charset="utf-8">
        <body oncopy="return false" onpaste="return false" ondrop="return false">
        <link rel="stylesheet" type="text/css" href="css/estilo_cliente.css">
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
                        <a href="perfil_cliente.jsp">
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
    <center><table>   
     <%
Vector<Usuario> vecPro=new Usuario().listaDatos((Integer)sesionOk.getAttribute("id"));
for(Usuario pro:vecPro){
          %>
          
          <tr>
              <td><h1>Nombre:</h1></td>
              <td><h1><%=pro.getNombre()%> <%=pro.getAppat()%> <%=pro.getApmat()%></h1></td>
          </tr>
          <tr>
              <td><h1>Domicilio:</h1></td>
              <td><h1><%=pro.getCalle()%> <%=pro.getNumero()%> <%=pro.getCp()%></h1></td>
          </tr>
          <tr>
              <td><h1>Correo:</h1></td>
              <td><h1><%=pro.getCorreo()%></h1></td>
          </tr>
          <tr>
              <td><h1>Telefono:</h1></td>
              <td><h1><%=pro.getTelefono()%></h1></td>
          </tr>
          <tr>
              <td><h1>ID:</h1></td>
              <td><h1><%=pro.getId()%></h1></td>
          </tr>
            
          
          <%}%>

        </table></center> 
    <br>
    <br>
    
       <form action="MostrarHistorial">
        <input name="usuario" type="hidden" value="<%=sesionOk.getAttribute("id")%>">
              <input name="nombre" type="hidden" value="<%=sesionOk.getAttribute("name")%>">
              <center><input type="submit" value="Historial de compras"> </center>
          </form>    
        
    </body>
</html>
