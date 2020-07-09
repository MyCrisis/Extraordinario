package Datos;

import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import Funcionalidades.Conexion;
import java.util.Vector;
import javax.servlet.http.HttpSession;

public class Usuario
{
    private String nombre;
    private String appat;
    private String apmat;
    private String telefono;
    private String calle;
    private int numero;
    private int cp;
    private String correo;
    private String contrasena;
    private int id;
    private int estado;
    
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(final String nombre) {
        this.nombre = nombre;
    }
    
    public String getAppat() {
        return this.appat;
    }
    
    public void setAppat(final String appat) {
        this.appat = appat;
    }
    
    public String getApmat() {
        return this.apmat;
    }
    
    public void setApmat(final String apmat) {
        this.apmat = apmat;
    }
    
    public String getTelefono() {
        return this.telefono;
    }
    
    public void setTelefono(final String telefono) {
        this.telefono = telefono;
    }
    public int getId() {
        return this.id;
    }
    
    public void setId(final int id) {
        this.id = id;
    }
    
    public int getEstado() {
        return this.estado;
    }
    
    public void setEstado(final int estado) {
        this.estado = estado;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public int getCp() {
        return cp;
    }

    public void setCp(int cp) {
        this.cp = cp;
    }
    

    
    public String getCorreo() {
        return this.correo;
    }
    
    public void setCorreo(final String correo) {
        this.correo = correo;
    }
    
    public String getContrasena() {
        return this.contrasena;
    }
    
    public void setContrasena(final String contrasena) {
        this.contrasena = contrasena;
    }
    
    public Usuario verius(String user, String clave) {
        Usuario u = null;
        Connection cn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            cn = Conexion.getConexion();
            String sql = "SELECT * FROM usuarios WHERE correo=? AND clave=?";
            pr = cn.prepareStatement(sql);
            pr.setString(1, user);
            pr.setString(2, clave);
            rs = pr.executeQuery();
            if (rs.next()) {
                u = new Usuario();
                u.setNombre(rs.getString("nombre"));
                u.setAppat(rs.getString("appat"));
                u.setApmat(rs.getString("apmat"));
                u.setTelefono(rs.getString("telefono"));
                u.setCalle(rs.getString("calle"));
                u.setNumero(rs.getInt("numero"));
                u.setCp(rs.getInt("cp"));
                u.setCorreo(rs.getString("correo"));
                u.setContrasena(rs.getString("clave"));
                u.setId(rs.getInt("id"));
                u.setEstado(rs.getInt("estado"));
            }
        }
        catch (SQLException ex) {
            ex.printStackTrace();
            u = null;
        }
        finally {
            try {
                rs.close();
                pr.close();
                rs.close();
            }
            catch (SQLException ex2) {}
        }
        return u;
    }
    
    public Usuario verirepetido(String user) {
        Usuario u = null;
        Connection cn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            cn = Conexion.getConexion();
            String sql = "SELECT * FROM usuarios WHERE correo=?";
            pr = cn.prepareStatement(sql);
            pr.setString(1, user);
            rs = pr.executeQuery();
            if (rs.next()) {
                u = new Usuario();
                u.setNombre(rs.getString("nombre"));
                u.setAppat(rs.getString("appat"));
                u.setApmat(rs.getString("apmat"));
                u.setTelefono(rs.getString("telefono"));
                u.setCalle(rs.getString("calle"));
                u.setNumero(rs.getInt("numero"));
                u.setCp(rs.getInt("cp"));
                u.setCorreo(rs.getString("correo"));
                u.setContrasena(rs.getString("clave"));
                u.setId(rs.getInt("id"));
                u.setEstado(rs.getInt("estado"));
            }
        }
        catch (SQLException ex) {
            ex.printStackTrace();
            u = null;
        }
        finally {
            try {
                rs.close();
                pr.close();
                rs.close();
            }
            catch (SQLException ex2) {}
        }
        return u;
    }
        public static int Guardar(Usuario e) {
        int estatus = 0;
        try {

            Connection con = Conexion.getConexion();

            String q = "insert into usuarios (nombre, appat, apmat, telefono, calle, numero, cp, correo, clave, estado)"
                    + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, e.getNombre());
            ps.setString(2, e.getAppat());
            ps.setString(3, e.getApmat());
            ps.setString(4, e.getTelefono());
            ps.setString(5, e.getCalle());
            ps.setString(6, Integer.toString(e.getNumero()));
            ps.setString(7, Integer.toString(e.getCp()));
            ps.setString(8, e.getCorreo());
            ps.setString(9, e.getContrasena());
            ps.setString(10, Integer.toString(e.getEstado()));
            


            estatus = ps.executeUpdate();

        } catch (Exception ed) {
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());

        }
        return estatus;
    }
        
        public static int Eliminar(Usuario e) {
        int estatus = 0;
        try {

            Connection con = Conexion.getConexion();
            String q = "Delete from usuarios where id = ?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, Integer.toString(e.getId()));
            estatus = ps.executeUpdate();

        } catch (Exception ed) {
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());

        }
        return estatus;
    }        
        
        
        
        
        
    public Vector<Usuario> listaUsuarios(){
        Vector<Usuario> lp=new Vector<Usuario>();
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        try{
            cn=Conexion.getConexion();
            String sql="SELECT * FROM usuarios where estado='0'";
            pr=cn.prepareStatement(sql);
            rs=pr.executeQuery();
            while(rs.next()){
                Usuario prod=new Usuario();
                prod.setNombre(rs.getString("nombre"));
                prod.setAppat(rs.getString("appat"));
                prod.setApmat(rs.getString("apmat"));
                prod.setTelefono(rs.getString("telefono"));
                prod.setCorreo(rs.getString("correo"));
                prod.setCalle(rs.getString("calle"));
                prod.setNumero(rs.getInt("numero"));
                prod.setCp(rs.getInt("cp"));
                prod.setId(rs.getInt("id"));
                
                lp.add(prod);
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            lp=null;
        }finally{
            try{
                rs.close();
                pr.close();
                cn.close();
            }catch(SQLException ex){
                ex.printStackTrace();
                System.out.println("error en lista");
            }
        }
        return lp;
    }
    
    
        public Vector<Usuario> listaDatos(int id){
        Vector<Usuario> lp=new Vector<Usuario>();
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        try{
            cn=Conexion.getConexion();
            String sql="SELECT * FROM usuarios where id=?";
            pr=cn.prepareStatement(sql);
            pr.setInt(1, id);
            rs=pr.executeQuery();
            while(rs.next()){
                Usuario prod=new Usuario();
                prod.setNombre(rs.getString("nombre"));
                prod.setAppat(rs.getString("appat"));
                prod.setApmat(rs.getString("apmat"));
                prod.setTelefono(rs.getString("telefono"));
                prod.setCorreo(rs.getString("correo"));
                prod.setCalle(rs.getString("calle"));
                prod.setNumero(rs.getInt("numero"));
                prod.setCp(rs.getInt("cp"));
                prod.setId(rs.getInt("id"));
                
                lp.add(prod);
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            lp=null;
        }finally{
            try{
                rs.close();
                pr.close();
                cn.close();
            }catch(SQLException ex){
                ex.printStackTrace();
                System.out.println("error en lista");
            }
        }
        return lp;
    } 
}