/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.activities.controller;

import com.activities.entities.ProcessActivity;
import com.activities.entities.SubActivity;
import com.activities.entitiesBean.ProcessActivityControlLocal;
import com.activities.services.ProcessActivityService;
import com.activities.services.SubActivityService;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ERavhengani
 */
public class AddNewSubActivity extends HttpServlet {

    private ActivityServlet aserv = new ActivityServlet();

    @EJB
    private ProcessActivityControlLocal pacl;

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
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            SubActivityService saService = new SubActivityService();
            ProcessActivityService paService = new ProcessActivityService();
            SubActivity subActivity = new SubActivity();
            ProcessActivity processActivity = new ProcessActivity();

            if (action.equalsIgnoreCase("addSubActivity")) {

                String processActivityName = request.getParameter("process_activity_name");
                String SubActivityName = request.getParameter("sub_activity_name");

                processActivity.setProcessActivityName(processActivityName);
                subActivity.setSubActivityId(Integer.SIZE);
                subActivity.setProcessActivityName(processActivity);
                subActivity.setSubActivityName(SubActivityName);

                boolean result = saService.addSubActivity(subActivity);
                if (result) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('New sub activity sucessfully added.');");
                    out.println("location='stopping.jsp';");
                    out.println("</script>");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Sub activity already exists.');");
                    out.println("location='stopping.jsp';");
                    out.println("</script>");
                }
            }
            if (action.equalsIgnoreCase("addProcessActivity")) {

                String processActivityName = request.getParameter("process_activity_name");
                processActivity.setProcessActivityName(processActivityName);
                boolean res = paService.addProcessActivity(processActivity);
                if (res) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Process activity added');");
                    out.println("location='index.jsp';");
                    out.println("</script>");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Process activity already exists');");
                    out.println("location='index.jsp';");
                    out.println("</script>");
                }

            }
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
