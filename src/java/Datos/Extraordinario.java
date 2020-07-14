package Datos;

import java.util.ArrayList;
import java.util.List;

public class Extraordinario{

    private List<Servicio> servicios;

    public Extraordinario() {
        this.servicios = new ArrayList<>();
    }

    public List<Servicio> getServicios() {
        return servicios;
    }

    public void setServicioss(List<Servicio> Servicios) {
        this.servicios = Servicios;
    }

    public List<Servicio> AgregarServicios(Servicio servicio) {

        this.servicios.add(servicio);

        return this.servicios;
    }
}