/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Daos.ActividadesDao;
import Daos.EstadisticasDgDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GUSTAVO
 */
@WebServlet(name = "EstadisticasDgServlet", urlPatterns = {"/EstadisticasDgServlet"})
public class EstadisticasDgServlet extends HttpServlet {

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
        RequestDispatcher view = null;
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        
        EstadisticasDgDao e = new EstadisticasDgDao();
        
        switch(action){
            
            case "estadisticaApoyos":
                request.setAttribute("estadisticas", e.estadisticaA());
                view = request.getRequestDispatcher("/DG/statisticsA.jsp");
                view.forward(request, response);
                break;
                
            case "estadisticaRecaudaciones":
                request.setAttribute("estadisticas", e.estadisticaR());
                view = request.getRequestDispatcher("/DG/statisticsP.jsp");
                view.forward(request, response);
                break;
                
            case "estadisticaPersonas":
                request.setAttribute("estadisticas", e.estadisticaP());
                view = request.getRequestDispatcher("/DG/statisticsR.jsp");
                view.forward(request, response);
                break;
            
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
