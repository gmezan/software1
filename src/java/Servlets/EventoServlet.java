/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Evento;
import Beans.Usuario;
import Daos.EventoDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Fernando
 */
@WebServlet(name = "EventoServlet", urlPatterns = {"/EventoServlet"})
public class EventoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action") == null
                ? "listar" : request.getParameter("action");

        EventoDao eveDao = new EventoDao();
        RequestDispatcher rd = null;
        HttpSession session = request.getSession();

        Usuario u = (Usuario) session.getAttribute("usuario");

        switch (action) {
            case "listar":
                int cod = u.getCodigoPucp();
                ArrayList<Evento> listaEventos = eveDao.listarEventos(cod);
                request.setAttribute("lista", listaEventos);
                rd = request.getRequestDispatcher("/DA/activities.jsp");
                rd.forward(request, response);
                break;

            case "crearview":
                int idAct = u.getIdActividad();
                ArrayList<Evento> listaEve = eveDao.listarEventos(idAct);
                request.setAttribute("idAct", listaEve);
                rd = request.getRequestDispatcher("/DA/anadirActividad.jsp");
                rd.forward(request, response);
                break;

            case "crear":
                String descripcion = request.getParameter("descripcion");
                String hora = request.getParameter("hora");
                String fecha = request.getParameter("fecha");
                String lugar = request.getParameter("lugar");
                int idActividad = u.getIdActividad();

                eveDao.crearEvento(descripcion, lugar, fecha, hora, idActividad);

                response.sendRedirect(request.getContextPath() + "/EventoServlet?action=listar");
                break;

            case "editar":
                String description = request.getParameter("descripcion");
                String place = request.getParameter("lugar");
                String time = request.getParameter("hora");
                String date = request.getParameter("fecha");
                eveDao.editarEvento(Integer.parseInt(request.getParameter("eventoId")), description, place, time, date);
                response.sendRedirect(request.getContextPath() + "/EventoServlet?action=listar");
                break;

            case "borrar":
                eveDao.borrarEvento(Integer.parseInt(request.getParameter("eventoId")));
                response.sendRedirect(request.getContextPath() + "/EventoServlet?action=listar");
                break;

            /*
            case "crearTrabajo":
                rd = request.getRequestDispatcher("/CrearTrabajo.jsp");
                rd.forward(request, response);
                break;
            case "guardarTrabajo":
                String id = request.getParameter("id");
                String jobTitle = request.getParameter("jobTitle");
                int minSalary = Integer.parseInt(request.getParameter("minSalary"));
                int maxSalary = Integer.parseInt(request.getParameter("maxSalary"));

                Job job = new Job();
                job.setJobId(id);
                job.setJobTitle(jobTitle);
                job.setMaxSalary(maxSalary);
                job.setMinSalary(minSalary);

                jobDao.crearTrabajo(job);
                request.setAttribute("lista", jobDao.listarTrabajos());

                response.sendRedirect(request.getContextPath());

                break;
            
                
                
             */
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
