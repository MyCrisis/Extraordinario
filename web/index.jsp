<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Funcionalidades.*"%>

<%@ page session="true" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1);
    HttpSession sesionOk = request.getSession();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>
            Servicios de belleza
        </title>
        <link rel="stylesheet" type="text/css" href="css/estilo_index.css">
    </head>
    <body>

        <header>
            <div class="contenedor">
                <div id="marca">
                    <h1>
                        <span class="resaltado">
                            Servicios de belleza
                        </span>
                    </h1>
                </div>
                <nav>
                    <ul>
                        <%if (sesionOk.getAttribute("usuario") == null) {%>
                        <li>
                            <a href="login.jsp">
                                Iniciar sesión
                            </a>
                        </li>
                        <li><a href="Registro.jsp">Registrarse</a></li>
                        <!--AÚN NO PROGRAMADOS LOS JSP-->
                        <%} else if (sesionOk.getAttribute("usuario") != null && sesionOk.getAttribute("estado").equals(0)) {%>
                        <li><a href="Cliente.jsp">Menú Principal</a></li>
                            <%} else if (sesionOk.getAttribute("usuario") != null && sesionOk.getAttribute("estado").equals(1)) {%>
                        <li><a href="Empleado.jsp">Menú Principal</a></li>
                            <%}%>
                        <!--TERMINA LA PARTE AÚN SIN PROGRAMAR-->
                    </ul>
                </nav>
            </div>


        </header>
        <section id="boletin">
            <div class="contenedor">
                <nav>
                    <ul>
                        <li class="actual"><a href="index.jsp">Inicio</a></li>
                        <li><a href="contactanos.html">Contáctanos</a></li>
                        <li><a href="metodos_de_pago.html">Métodos de Pago</a></li>
                    </ul>
                </nav>
            </div>
        </section>



        <section id="cabecera">
            <div class="contenedor">

                

            </div>
        </section>


        <div class="contenedor">

        </div>

        <section id="cajas">
            <div class="contenedor">
                <div class="caja">
                    <img src="imagenes/Maquillaje_y_peinado.jpg">
                    <h3>Maquillaje y peinado</h3>

                </div>

                <div class="caja">
                    <img src="imagenes/Manos_y_pies.jpg">
                    <h3>Manos y pies</h3>
                </div>
                <div class="caja">
                    <img src="imagenes/Peluquería.jpg">
                    <h3>
                        Peluquería
                    </h3>
                </div>


            </div>
        </section>
        <footer>
            <p> Tienda de servicios de belleza, los precios anunciados pueden variar por 
                promociones al comprar en cualquier sucursal. Servicios sujetos a disponibilidad y horarios. 
                Servicio a Clientes. Aviso de Privacidad. Términos y Condiciones de Uso. Formas de Pago
            </p>
        </footer>
    </body>
</html>