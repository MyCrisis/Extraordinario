<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Operaciones.Conexion"%>
<%@page import="Operaciones.Dventa"%>
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
    Dventa dv = new Dventa();
    ArrayList Productos = dv.Productos;
    ArrayList Cantidad = dv.Cantidad;
    Date fecha = new Date();
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
<html>
    <head>
        <title>Mi carrito</title>
        <link rel="stylesheet" type="text/css" href="css/estilo_cliente.css">
    </head>
    <body>
        <header>
            <div class="contenedor">
                <div id="marca">



                </div>
                <nav>
                    <ul>
                        <li class="actual"><a href="Cliente_Principal.jsp">Inicio</a></li>
                        <li class="actual"><a href="Carrito.jsp">Carrito</a></li>
                        <li><a href="MostrarProductoscliente.jsp">Catalogo</a></li>
                        <li><a href="Perfil.jsp">Perfil</a></li>
                        <li> <form action="CerrarSesion">
                                <input type="submit" value="cerrar sesion">
                            </form></li>

                    </ul>
                </nav>

            </div>
        </header>
        <%if(sesionOk.getAttribute("final") != null){
            sesionOk.removeAttribute("final");
        %>
        
    <center><h1>Compra guardada con exito</h1></center>
        <%}%>
        <%if (Productos.isEmpty()) {
        %>    

    <center><h1>Agregue Productos</h1></center>
        <%} else {%>
    <center><table class="tabla_usuarios" width="75%" border="0">
            <tr bgcolor="red" style="color: white">
                <td><h4>Nombre</h4></td>
                <td><h4>codigo_de_producto</h4></td>
                <td><h4>Precio</h4></td>
                <td><h4>Cantidad</h4></td>
                <td><h4>subtotal</h4></td>


            </tr>
            <%
                Producto u = null;
                Connection cn = null;
                PreparedStatement pr = null;
                ResultSet rs = null;
                cn = Conexion.getConexion();
                int total = 0;
                int cantotal = 0;
              try {%>
            <%for (int x = 0; x < Productos.size(); x++) {
                    
                    String sql = "SELECT * FROM peliculas WHERE id=?";
                    pr = cn.prepareStatement(sql);
                    pr.setString(1, Productos.get(x).toString());
                    rs = pr.executeQuery();
                    int cantidad = (Integer) Cantidad.get(x);
                    if (rs.next()) {

                        u = new Producto();
                        u.setNombre(rs.getString("nombre"));
                        u.setDescripcion(rs.getString("descripcion"));
                        u.setGenero(rs.getString("genero"));
                        u.setEstreno(rs.getInt("estreno"));
                        u.setDirector(rs.getString("director"));
                        u.setPrecio(rs.getInt("precio"));
                        u.setStock(rs.getInt("stock"));
                        total = total + u.getPrecio() * cantidad;
                        cantotal = cantotal + cantidad;
                    }

            %>
            <tr>
                <td><%=u.getNombre()%></td>
                <td><%=Productos.get(x)%></td>
                <td>$<%=u.getPrecio()%></td>
                <td><%=Cantidad.get(x)%></td>
                <td>$<%=u.getPrecio() * cantidad%></td>







                <%}%>

            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td>Productos totales: </td>
                <td><%=cantotal%></td>

            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td>Total a pagar: </td>
                <td>$<%=total%></td>

            </tr>
        </table></center>
    <br>
    <br>
    <center>Fecha de realizacion de su compra:<%=fecha%></center>


    <br>
    <br>
    <center><form method="POST" action="FinalizarCompra">
            <input type="hidden" name="total" value="<%=total%>">
            <input type="hidden" name="cantidad" value="<%=cantotal%>">
            
            <input type="submit" value="Finalizar Compra">
            


        </form></center>

    <%} catch (Exception ed) {
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());

        }finally {
            try {
                rs.close();
                pr.close();
                rs.close();
            }
            catch (SQLException ex2) {}
        }%>
    <%}%>
</body>
</html>
