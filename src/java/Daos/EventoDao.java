/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Beans.Actividad;
import Beans.Estado;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Fernando
 */
public class EventoDao extends BaseDao {

    public ArrayList<Evento> listarEventos(int cod) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            System.err.println(ex);
        }

        String sql = "SELECT *\n"
                + "FROM Evento e, Actividad a \n"
                + "WHERE e.Actividad_idActividad=a.idActividad AND a.delegado_codigoPucp=?;";
        ArrayList<Evento> listaEventos = new ArrayList<>();

        try (Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, cod);

            try (ResultSet rs = pstmt.executeQuery();) {
                /////////////esto igual es lo de siempre
                while (rs.next()) {

                    Evento eve = new Evento();

                    eve.setIdEvento(rs.getInt(1));
                    eve.setDescripcion(rs.getString(2));
                    eve.setLugar(rs.getString(3));
                    eve.setFecha(rs.getString(4));
                    eve.setHora(rs.getString(5));

                    Actividad act = new Actividad();
                    act.setDelegado_codigoPucp(rs.getInt(9));
                    act.setIdActividad(rs.getInt(7));
                    act.setNombreActividad(rs.getString(8));

                    eve.setAct(act);

                    listaEventos.add(eve);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(EventoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listaEventos;
    }

    public void crearEvento(String descripcion, String lugar, String fecha, String hora, int idActividad) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            System.err.println(ex);
        }

        try (Connection conn = this.getConnection();) {
            String sql = "INSERT INTO mydb.Evento "
                    + "(descripcion, lugar, fecha, hora, Actividad_idActividad)"
                    + "VALUES ( ?, ?, ?, ?, ?)";

            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, descripcion);
                pstmt.setString(2, lugar);
                pstmt.setString(3, fecha);
                pstmt.setString(4, hora);
                pstmt.setInt(5, idActividad);
                pstmt.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(EventoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarEvento(int eventoId, String descripcion, String lugar, String hora, String fecha) {
        String sql = "UPDATE Evento "
                + "SET descripcion = ?, lugar = ?, hora = ?, fecha = ?"
                + "WHERE idEvento = ?";

        try (Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(5, eventoId);
            pstmt.setString(1, descripcion);
            pstmt.setString(2, lugar);
            pstmt.setString(3, hora);
            pstmt.setString(4, fecha);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EventoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarEvento(int id) {
        String sql = "DELETE from Evento where idEvento = ?";

        try (Connection conn = this.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(EventoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    public void crearPartiEvento(int idEvento, int idUsuario) {

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
