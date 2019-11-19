/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dtos;

import java.sql.Date;

/**
 *
 * @author Gustavo_Meza
 */
public class EstadisticaR {
    
    private int codigoPucp;
    private String nombre;
    private String condicion;
    private int cantidad ;
    private String cuota;
    private Date date ;

    /**
     * @return the codigoPucp
     */
    public int getCodigoPucp() {
        return codigoPucp;
    }

    /**
     * @param codigoPucp the codigoPucp to set
     */
    public void setCodigoPucp(int codigoPucp) {
        this.codigoPucp = codigoPucp;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the condicion
     */
    public String getCondicion() {
        return condicion;
    }

    /**
     * @param condicion the condicion to set
     */
    public void setCondicion(String condicion) {
        this.condicion = condicion;
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

    /**
     * @return the cuota
     */
    public String getCuota() {
        return cuota;
    }

    /**
     * @param cuota the cuota to set
     */
    public void setCuota(String cuota) {
        this.cuota = cuota;
    }

    /**
     * @return the date
     */
    public Date getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(Date date) {
        this.date = date;
    }
    
    
    
}
