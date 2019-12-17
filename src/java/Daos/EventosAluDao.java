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
import java.sql.PreparedStatement;
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

    public ArrayList<Evento> listarEventosPart(int idUsuario) {

        ArrayList<Evento> listaEventos = new ArrayList<>();

        String sql = "SELECT e.descripcion, a.nombreActividad, e.lugar, e.fecha, e.hora, ee.estado\n"
                + "FROM Evento e\n"
                + "INNER JOIN Participante_a_Evento pE ON pE.Evento_idEvento= e.idEvento\n"
                + "INNER JOIN Actividad a ON a.idActividad = e.Actividad_idActividad\n"
                + "INNER JOIN EstadoEvento ee ON pE.EstadoEvento_idEstadoEvento = ee.idEstadoEvento\n"
                + "WHERE pE.Participante_codigoPucp = ? and pE.EstadoEvento_idEstadoEvento not in (3)";

        try (Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idUsuario);

            try (ResultSet rs = pstmt.executeQuery();) {
                while (rs.next()) {
                    Evento e = new Evento();
                    e.setDescripcion(rs.getString(1));

                    e.setLugar(rs.getString(3));
                    e.setFecha(rs.getString(4));
                    e.setHora(rs.getString(5));

                    Actividad act = new Actividad();
                    act.setNombreActividad(rs.getString(2));
                    e.setAct(act);
                    
                    Estado est = new Estado();
                    est.setEstado(rs.getString(6));
                    e.setEst(est);
                    
                    
                    listaEventos.add(e);

                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listaEventos;

    }

    public ArrayList<Evento> listarEventosNoRegistrado(int idUsuario) {

        ArrayList<Evento> listaEventos = new ArrayList<>();

        String sql = "SELECT e.descripcion, a.nombreActividad, e.lugar, e.fecha, e.hora, ee.estado\n"
                + "FROM Evento e\n"
                + "INNER JOIN Participante_a_Evento pE ON pE.Evento_idEvento= e.idEvento\n"
                + "INNER JOIN Actividad a ON a.idActividad = e.Actividad_idActividad\n"
                + "INNER JOIN EstadoEvento ee ON pE.EstadoEvento_idEstadoEvento = ee.idEstadoEvento\n"
                + "WHERE pE.Participante_codigoPucp = ? and pE.EstadoEvento_idEstadoEvento in (3)";

        try (Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idUsuario);

            try (ResultSet rs = pstmt.executeQuery();) {
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
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listaEventos;

    }
}
