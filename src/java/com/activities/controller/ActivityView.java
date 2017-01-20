/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.activities.controller;

import com.activities.entities.FocusArea;
import com.activities.entities.LeadingPractice;
import com.activities.entities.ProcessActivity;
import com.activities.entities.SubActivity;
import com.activities.entitiesBean.ProcessActivityControlLocal;
import com.activities.entitiesBean.SubActivityControlLocal;
import com.activities.services.FocusAreaService;
import com.activities.services.LeadingPracticeService;
import com.activities.services.ProcessActivityService;
import com.activities.services.SubActivityService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ERavhengani
 */
@WebServlet(name = "ActivityView", urlPatterns = {"/ActivityView"})
public class ActivityView extends HttpServlet {

    @EJB
    private SubActivityControlLocal sacl;
    @EJB
    private ProcessActivityControlLocal pacl;

    private ActivityServlet aserv = new ActivityServlet();

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
            String processActivityName = request.getParameter("processActivityName");

            LeadingPracticeService lpService = new LeadingPracticeService();
            FocusAreaService faService = new FocusAreaService();
            SubActivityService saService = new SubActivityService();
            ProcessActivityService paService = new ProcessActivityService();
            SubActivity subActivity = new SubActivity();
            ProcessActivity processActivity = new ProcessActivity();
            FocusArea focusArea = new FocusArea();
            LeadingPractice leadingPractice = new LeadingPractice();

            if (action.equalsIgnoreCase("addProcessActivity")) {
                request.getRequestDispatcher("addProcessActivity.jsp").forward(request, response);
            }

            if (action.equalsIgnoreCase("viewActivity")) {

                String focusAreaname1 = "OHS";
                String focusAreaname2 = "Cost Reduction";
                String focusAreaname3 = "Efficiencies";
//                LeadingPracticeService lpService = new LeadingPracticeService();
                request.setAttribute("leadingPractices1", lpService.getLeadingPracticeByFocusAreaProcessActivitySubActivity(new FocusArea(focusAreaname1), new ProcessActivity(processActivityName)));
                request.setAttribute("leadingPractices2", lpService.getLeadingPracticeByFocusAreaProcessActivitySubActivity(new FocusArea(focusAreaname2), new ProcessActivity(processActivityName)));
                request.setAttribute("leadingPractices3", lpService.getLeadingPracticeByFocusAreaProcessActivitySubActivity(new FocusArea(focusAreaname3), new ProcessActivity(processActivityName)));

                request.setAttribute("processActivityName", processActivityName);
                request.setAttribute("OHS", focusAreaname1);
                request.setAttribute("Cost", focusAreaname2);
                request.setAttribute("Efficiencies", focusAreaname3);

                request.getRequestDispatcher("process_activity.jsp").forward(request, response);

            }

            if (action.equalsIgnoreCase("leadingPractices")) {
                String focusAreaname1 = "OHS";
                String focusAreaname2 = "Cost Reduction";
                String focusAreaname3 = "Efficiencies";
//                LeadingPracticeService lpService = new LeadingPracticeService();
                request.setAttribute("leadingPractices1", lpService.getLeadingPracticeByFocusAreaProcessActivitySubActivity(new FocusArea(focusAreaname1), new ProcessActivity(processActivityName)));
                request.setAttribute("leadingPractices2", lpService.getLeadingPracticeByFocusAreaProcessActivitySubActivity(new FocusArea(focusAreaname2), new ProcessActivity(processActivityName)));
                request.setAttribute("leadingPractices3", lpService.getLeadingPracticeByFocusAreaProcessActivitySubActivity(new FocusArea(focusAreaname3), new ProcessActivity(processActivityName)));

                request.setAttribute("processActivityName", processActivityName);
                request.setAttribute("OHS", focusAreaname1);
                request.setAttribute("Cost", focusAreaname2);
                request.setAttribute("Efficiencies", focusAreaname3);

                request.getRequestDispatcher("addProcessActivity.jsp").forward(request, response);
            }

            if (action.equalsIgnoreCase("addLeadingPractice")) {
                String focusAreaName = request.getParameter("focus_area_name");
                String paName = request.getParameter("process_activity_name").split(",")[0];
                Integer subActivityId = Integer.parseInt(request.getParameter("sub_activity_id"));
                String issues = request.getParameter("issues");
                String solutions = request.getParameter("solutions");

                focusArea.setFocusAreaName(focusAreaName);
                subActivity.setSubActivityId(subActivityId);
                processActivity.setProcessActivityName(paName);

                leadingPractice.setLeadingPracticeId(Integer.SIZE);
                leadingPractice.setFocusAreaName(focusArea);
                leadingPractice.setSubActivityId(subActivity);
                leadingPractice.setProcessActivityName(processActivity);
                leadingPractice.setIssues(issues);
                leadingPractice.setSolutions(solutions);

                boolean result = lpService.addLeadingPractice(leadingPractice);
                if (result) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Leading practice sucessfully added.');");
                    out.println("location='index.jsp';");
                    out.println("</script>");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Leading practice already exists');");
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
