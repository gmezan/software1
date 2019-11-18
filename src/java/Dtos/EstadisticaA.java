/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dtos;

/**
 *
 * @author Gustavo_Meza
 */
public class EstadisticaA {
    private int idActividad;
    private String nombreActividad;
    private String Descripcion;
    private String nombreDelegado;
    private int cantidad;

    /**
     * @return the idActividad
     */
    public int getIdActividad() {
        return idActividad;
    }

    /**
     * @param idActividad the idActividad to set
     */
    public void setIdActividad(int idActividad) {
        this.idActividad = idActividad;
    }

    /**
     * @return the nombreActividad
     */
    public String getNombreActividad() {
        return nombreActividad;
    }

    /**
     * @param nombreActividad the nombreActividad to set
     */
    public void setNombreActividad(String nombreActividad) {
        this.nombreActividad = nombreActividad;
    }

    /**
     * @return the Descripcion
     */
    public String getDescripcion() {
        return Descripcion;
    }

    /**
     * @param Descripcion the Descripcion to set
     */
    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    /**
     * @return the nombreDelegado
     */
    public String getNombreDelegado() {
        return nombreDelegado;
    }

    /**
     * @param nombreDelegado the nombreDelegado to set
     */
    public void setNombreDelegado(String nombreDelegado) {
        this.nombreDelegado = nombreDelegado;
    }

    /**
     * @return the cantidad
     */
    public int getCantidad() {
        return cantidad;
    }

    /**
     * @param cantidad the cantidad to set
     */
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
}
