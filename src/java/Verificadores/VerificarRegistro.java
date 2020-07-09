package Verificadores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import Datos.Usuario;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServlet;

public class VerificarRegistro extends HttpServlet
{
    protected void processRequest(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
    }
        
    protected void doGet(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        this.processRequest(request, response);
    }
    
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        
        this.processRequest(request, response);
        String nombre, appat, apmat, telefono, calle, user, clave, verif, gerenteContraseña;
        int estado = -1;
        int numero, cp;
        nombre = request.getParameter("textoNombre");
        appat = request.getParameter("textoApPat");
        apmat = request.getParameter("textoApMat");
        telefono = request.getParameter("textoTelefono");
        calle = request.getParameter("textoCalle");
        numero = Integer.parseInt(request.getParameter("textoNumero"));
        cp = Integer.parseInt(request.getParameter("textoCodigoPostal"));
        clave = request.getParameter("textoContraseña");
        user = request.getParameter("textoCorreo");
        verif = (String)request.getParameter("valor");
        gerenteContraseña = request.getParameter("contraGerente");
        
        if(verif.equals("1") && gerenteContraseña.equals("n0m3l0")){
            estado = 1;
        }else if(verif.equals("0")){
            estado = 0;
        }else{
            HttpSession sesion = request.getSession();
            sesion.setAttribute("errorGerente", "Contraseña incorrecta");
            response.sendRedirect("registrarse.jsp");
        }
       
        Usuario u = new Usuario();
        u = u.verirepetido(user);
        if (u != null) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("errorRepetir", "Usuario en uso");
            response.sendRedirect("registrarse.jsp");
        }
        else if(u == null && estado == 1  || u == null && estado == 0){
                        HttpSession sesion = request.getSession();
                        sesion.removeAttribute("errorGerente");
                        sesion.removeAttribute("errorRepetir");
                        Usuario e = new Usuario();
                        e.setNombre(nombre);
                        e.setAppat(appat);
                        e.setApmat(apmat);
                        e.setTelefono(telefono);
                        e.setCorreo(user);
                        e.setCalle(calle);
                        e.setNumero(numero);
                        e.setCp(cp);
                        e.setContrasena(clave);
                        e.setEstado(estado);


                        int regis = Usuario.Guardar(e);
                        if (regis > 0) {
                            response.sendRedirect("login.jsp");
                        } else {
                            response.sendRedirect("error.jsp");
                        }
            
            
            
      
        }else{
            response.sendRedirect("error.jsp");
        }

    }
    
    public String getServletInfo() {
        return "Short description";
    }
}