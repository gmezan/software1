/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Evento;
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

        String action = request.getParameter("accion") == null
                ? "listar" : request.getParameter("accion");

        EventoDao eveDao = new EventoDao();
        RequestDispatcher rd = null;

        switch (action) {
            case "listar":
                ArrayList<Evento> listaEventos = eveDao.listarEventos();
                request.setAttribute("lista", listaEventos);
                rd = request.getRequestDispatcher("/DA/activities.jsp");
                rd.forward(request, response);
                break;
                
            case "crear":
                int idEvento = Integer.parseInt(request.getParameter("idEvento"));
                String descripcion = request.getParameter("descripcion");
                String hora = request.getParameter("hora");
                String fecha = request.getParameter("fecha");
                String lugar = request.getParameter("lugar");                
                int idActividad = Integer.parseInt(request.getParameter("idActividad"));
                
                eveDao.crearEvento(idEvento, descripcion, lugar, fecha, hora, idActividad);
                
                response.sendRedirect(request.getContextPath() + "EventoServlet?action=listar");
                rd = request.getRequestDispatcher("/DA/anadirActividad.jsp");
                rd.forward(request, response);
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
            case "borrarTrabajo":
                String jobID = request.getParameter("id");
                jobDao.borrartrabajo(jobID);
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
