package Funcionalidades;

import java.util.ArrayList;


public class Compras{
    
    private int venta_Codigo;
    private int usuario_codigo;
    private int producto_Codigo;
    private int detVenta_Cantidad;
    private double detVenta_SubTotal;

    public Compras(){
    }
    public int getVenta_codigo(){
	return this.venta_Codigo;
    }

    public int getProducto_codigo(){
	return this.producto_Codigo;
    }
    public int getDetventa_cantidad(){
	return this.detVenta_Cantidad;
    }
    public double getDetventa_subtotal(){
	return this.detVenta_SubTotal;
    }

    public void setVenta_codigo(int venta_Codigo){
	this.venta_Codigo=venta_Codigo;
    }

    public void setProducto_codigo(int producto_Codigo){
	this.producto_Codigo=producto_Codigo;
    }
    public void setDetventa_cantidad(int detVenta_Cantidad){
	this.detVenta_Cantidad=detVenta_Cantidad;
    }
    public void setDetventa_subtotal(double detVenta_SubTotal){
	this.detVenta_SubTotal=detVenta_SubTotal;
    }

    public int getUsuario_codigo() {
        return usuario_codigo;
    }

    public void setUsuario_codigo(int usuario_codigo) {
        this.usuario_codigo = usuario_codigo;
    }
    
    public static ArrayList Servicios = new ArrayList();
    public static ArrayList Disponible = new ArrayList();
    
    public static void GuardarenArray(Compras e){
        Servicios.add(e.producto_Codigo);
        Disponible.add(e.detVenta_Cantidad);
    }
}