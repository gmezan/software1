/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Beans.Actividad;
import Beans.Evento;
import Servlets.EventoServlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Fernando
 */
public class EventoDao extends BaseDao {

    public ArrayList<Evento> listarEventos() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            System.err.println(ex);
        }

        /////////esta weaa es lo de siempre asi q no pienses xq esta ahi, solo avanza
        String sql = "SELECT *\n"
                + "FROM Evento e, Actividad a \n"
                + "WHERE e.Actividad_idActividad=a.idActividad AND a.delegado_codigoPucp=20160618;";
        String url = "jdbc:mysql://localhost:3306/mydb"; ////////esto hace falta cambiar puesto q estamos en otra base de datos, ya no estamos en HR
        ArrayList<Evento> listaEventos = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(url, "root", "root");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);) {

            /////////////esto igual es lo de siempre
            while (rs.next()) {

                Evento eve = new Evento();
                
                eve.setIdEvento(rs.getInt(1));
                eve.setDescripcion(rs.getString(2));
                eve.setFecha(rs.getString(3));
                eve.setHora(rs.getString(4));
                
                
                Actividad act= new Actividad();
                act.setDelegado_codigoPucp(rs.getInt(9));
                act.setIdActividad(rs.getInt(5));
                act.setNombreActividad(rs.getString(8));
                
                eve.setAct(act);
                eve.setLugar(rs.getString(6));
                
                listaEventos.add(eve);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EventoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listaEventos;
    }

}
