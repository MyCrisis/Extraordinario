package DAO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import Datos.Usuario;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServlet;

public class VerificarUsuario extends HttpServlet
{
    protected void processRequest(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("correo");
        String clave = request.getParameter("contra");
        Usuario u = new Usuario();
        u = u.verius(user, clave);
        if (u != null) {
            HttpSession sesion = request.getSession(true);
            sesion.setAttribute("usuarioObjeto", u);
            HttpSession sesionOk = request.getSession();
            sesionOk.setAttribute("usuario", user);
            sesionOk.setAttribute("estado", u.getEstado());
            sesionOk.setAttribute("id", u.getId());
            sesionOk.setAttribute("name", u.getNombre());
            if (u.getEstado() == 0) {
                response.sendRedirect("Cliente_Principal.jsp");
            }
            else {
                response.sendRedirect("Empleado_Principal.jsp");
            }
        }
        else {
             response.sendRedirect("login.jsp");   
             HttpSession sesionbad = request.getSession();
             sesionbad.setAttribute("error", "contraseña o correo incorrectos");
        }
    }
    
    protected void doGet(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        this.processRequest(request, response);
    }
    
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        this.processRequest(request, response);

    }
    
    public String getServletInfo() {
        return "Short description";
    }
}