/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Beans.Actividad;
import Beans.Estado;
import Beans.Evento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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

    public ArrayList<Evento> listaEventosParaInscribirse(int idUsuario) {

        ArrayList<Evento> listaEventos = new ArrayList<>();

        String sql = "SELECT e.descripcion, act.nombreActividad, e.lugar,e.fecha, e.hora, e.idEvento, act.idActividad\n"
                + "FROM Evento e\n"
                + "INNER JOIN Actividad act ON e.Actividad_idActividad=act.idActividad\n"
                + "where e.idEvento not in (SELECT Evento_idEvento \n"
                + "from Participante_a_Evento where Participante_codigoPucp= ? )";

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
                    e.setIdEvento(rs.getInt(6));

                    Actividad act = new Actividad();
                    act.setIdActividad(rs.getInt(7));
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
    
    
    public ArrayList<Actividad> listaActParaInscribirse(int idUsuario) {

        ArrayList<Actividad> listaAct = new ArrayList<>();

        String sql = "SELECT act.idActividad, act.nombreActividad \n"
                + "FROM Evento e\n"
                + "INNER JOIN Actividad act ON e.Actividad_idActividad=act.idActividad\n"
                + "where e.idEvento not in (SELECT Evento_idEvento \n"
                + "from Participante_a_Evento where Participante_codigoPucp= ? )"
                + " GROUP BY act.idActividad";

        try (Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idUsuario);

            try (ResultSet rs = pstmt.executeQuery();) {

                while (rs.next()) {
                    Actividad act = new Actividad();
                    act.setIdActividad(rs.getInt(1));

                    act.setNombreActividad(rs.getString(2));

                    
                    listaAct.add(act);

                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listaAct;

    }
    
    public void crearPartiEvento(int idEvento, int  idUsuario) {
        

        try (Connection conn = this.getConnection();) {
            String sql = "INSERT INTO Participante_a_Evento "
                    + "(Participante_codigoPucp, Evento_idEvento, EstadoEvento_idEstadoEvento) "
                    + "VALUES ( ?, ?, 3)";

            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, idUsuario);
                pstmt.setInt(2, idEvento);
                pstmt.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(EventoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    

}
