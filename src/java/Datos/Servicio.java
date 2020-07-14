package Datos;

import Funcionalidades.Conectarse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class Servicio {
    private String nombre;
    private String descripcion;
    private String tiempo;
    private int precio;
    private String disponibilidad;


    public Servicio() {
    }
    
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getTiempo() {
        return tiempo;
    }

    public void setTiempo(String tiempo) {
        this.tiempo = tiempo;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }
    
    public String getDisponibilidad() {
        return nombre;
    }

    public void setDisponibilidad(String disponibilidad) {
        this.disponibilidad = disponibilidad;
    }
    public static int GuardarS(Servicio e) {
        int estatus = 0;
        try {

            Connection con = Conectarse.getConexion();

            
            String q = "insert into servicios (nombre, descripcion, tiempo, precio, disponibilidad)"
                    + " values (?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, e.getNombre());
            ps.setString(2, e.getDescripcion());
            ps.setString(3, e.getTiempo());
            ps.setString(4, Integer.toString(e.getPrecio()));
            ps.setString(5, e.getDisponibilidad());

            estatus = ps.executeUpdate();

        } catch (Exception ed) {
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }
        return estatus;
    }
    public Servicio veriRepetido(String servicio) {
        Servicio u = null;
        Connection cn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            cn = Conectarse.getConexion();
            String sql = "SELECT * FROM servicios WHERE nombre=?";
            pr = cn.prepareStatement(sql);
            pr.setString(1, servicio);
            rs = pr.executeQuery();
            if (rs.next()) {
                u = new Servicio();
                u.setNombre(rs.getString("nombre"));
                u.setDescripcion(rs.getString("descripcion"));
                u.setTiempo(rs.getString("tiempo"));
                u.setPrecio(rs.getInt("precio"));
                u.setDisponibilidad(rs.getString("disponibilidad"));
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
    public Vector<Servicio> listaServicios(){
        Vector<Servicio> lp=new Vector<Servicio>();
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        try{
            cn=Conectarse.getConexion();
            String sql="SELECT * FROM servicios where precio>1";
            pr=cn.prepareStatement(sql);
            rs=pr.executeQuery();
            while(rs.next()){
                Servicio prod=new Servicio();
                prod.setNombre(rs.getString("nombre"));
                prod.setDescripcion(rs.getString("descripcion"));
                prod.setTiempo(rs.getString("tiempo"));
                prod.setPrecio(rs.getInt("precio"));
                prod.setDisponibilidad(rs.getString("disponibilidad"));

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
    public static int Eliminar(Servicio e) {
        int estatus = 0;
        try {

            Connection con = Conectarse.getConexion();
            String q = "Delete from servicios where disponibilidad = ?";
            PreparedStatement ps = con.prepareStatement(q);
            estatus = ps.executeUpdate();

        } catch (Exception ed) {
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());

        }
        return estatus;
    }    

    public void Modificar(Servicio e, int id){
        Connection cn=null;
        PreparedStatement pr=null;
        try{
            cn=Conectarse.getConexion();
            String sql="Update servicios set nombre=?, descripcion=?, tiempo=?, precio=?, disponibilidad=?";
            pr=cn.prepareStatement(sql);
            
            pr.setString(1, e.getNombre());
            pr.setString(2, e.getDescripcion());
            pr.setString(3, e.getTiempo());
            pr.setInt(4, e.getPrecio());
            pr.setString(5, e.getDisponibilidad());
           
        }catch(SQLException ex){
            ex.printStackTrace();
            System.out.println("error en modificar");
        }finally{
            try{
                pr.close();
                cn.close();
            }catch(SQLException ex){
                ex.printStackTrace();
                System.out.println("error en lista");
            }
        }
     
    }
}