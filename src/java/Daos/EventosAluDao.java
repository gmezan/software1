/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Beans.Actividad;
import Beans.Estado;
import Beans.Evento;
import Beans.Rol;
import Beans.Usuario;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Labtel
 */
public class EventosAluDao extends BaseDao {

    public ArrayList<Evento> listarEventos() {

        ArrayList<Evento> listaEventos = new ArrayList<>();

        String sql = "SELECT e.descripcion, act.nombreActividad, e.lugar, e.fecha, e.hora\n"
                + "FROM Evento e\n"
                + "INNER JOIN Actividad act ON e.Actividad_idActividad = act.idActividad;";
        try (Connection conn = this.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);) {
            
            while (rs.next()) {
                Evento e = new Evento();
                e.setDescripcion(rs.getString(1));
                
                e.setLugar(rs.getString(3));
                e.setFecha(rs.getString(4));
                e.setHora(rs.getString(5));
                

                Actividad act = new Actividad();
                act.setNombreActividad(rs.getString(2));
                
                e.setAct(act);
                               
                listaEventos.add(e);

            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listaEventos;

    }
}
