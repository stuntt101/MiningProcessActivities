/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.activities.controller;

import com.activities.entities.Activities;
import com.activities.entities.FocusArea;
import com.activities.entities.LeadingPractice;
import com.activities.entities.ProcessActivity;
import com.activities.entities.SubActivity;
import com.activities.entities.User;
import com.activities.services.ActivitiesService;

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
//            String subActivityName = request.getParameter("sub_activity_name");

            FocusAreaService faService = new FocusAreaService();
            SubActivityService saService = new SubActivityService();
            ProcessActivityService paService = new ProcessActivityService();
            LeadingPracticeService lpService = new LeadingPracticeService();
            ActivitiesService aService = new ActivitiesService();
            
            LeadingPractice leadingPractice  = new LeadingPractice();
            SubActivity subActivity = new SubActivity();
            ProcessActivity processActivity = new ProcessActivity();
            FocusArea focusArea = new FocusArea();
            Activities activities = new Activities();
            User user = new User();

            if (action.equalsIgnoreCase("addProcessActivity")) {
                request.getRequestDispatcher("addProcessActivity.jsp").forward(request, response);
            }

            if (action.equalsIgnoreCase("viewActivity")) {
                String focusAreaname1 = "OHS";
                String focusAreaname2 = "Cost Reduction";
                String focusAreaname3 = "Efficiencies";
//                LeadingPracticeService lpService = new LeadingPracticeService();
                request.setAttribute("leadingPractices1", lpService.getLeadingPracticeByFocusAreaProcessActivity(new FocusArea(focusAreaname1), new ProcessActivity(processActivityName)));
                request.setAttribute("leadingPractices2", lpService.getLeadingPracticeByFocusAreaProcessActivity(new FocusArea(focusAreaname2), new ProcessActivity(processActivityName)));
                request.setAttribute("leadingPractices3", lpService.getLeadingPracticeByFocusAreaProcessActivity(new FocusArea(focusAreaname3), new ProcessActivity(processActivityName)));
                request.setAttribute("activities1", aService.getActivitiesByProcessActivity(new ProcessActivity(processActivityName)));
                request.setAttribute("processActivityName", processActivityName);
                request.setAttribute("OHS", focusAreaname1);
                request.setAttribute("Cost", focusAreaname2);
                request.setAttribute("Efficiencies", focusAreaname3);

                request.getRequestDispatcher("process_activity.jsp").forward(request, response);

            }

            if (action.equalsIgnoreCase("leadingPractices")) {
                //Integer leadingPracticeId = Integer.parseInt(request.getParameter("leadingPracticeId"));
                //request.setAttribute("testing", lpService.findLeadingPracticeById(leadingPracticeId));
                String focusAreaname1 = "OHS";
                String focusAreaname2 = "Cost Reduction";
                String focusAreaname3 = "Efficiencies";
//                LeadingPracticeService lpService = new LeadingPracticeService();
                request.setAttribute("leadingPractices1", lpService.getLeadingPracticeByFocusAreaProcessActivity(new FocusArea(focusAreaname1), new ProcessActivity(processActivityName)));
                request.setAttribute("leadingPractices2", lpService.getLeadingPracticeByFocusAreaProcessActivity(new FocusArea(focusAreaname2), new ProcessActivity(processActivityName)));
                request.setAttribute("leadingPractices3", lpService.getLeadingPracticeByFocusAreaProcessActivity(new FocusArea(focusAreaname3), new ProcessActivity(processActivityName)));

                request.setAttribute("processActivityName", processActivityName);
                request.setAttribute("processActivityName", processActivityName);
                request.setAttribute("OHS", focusAreaname1);
                request.setAttribute("Cost", focusAreaname2);
                request.setAttribute("Efficiencies", focusAreaname3);

                request.getRequestDispatcher("addProcessActivity.jsp").forward(request, response);
            }

            if (action.equalsIgnoreCase("addLeadingPractice")) {
                String focusAreaName = request.getParameter("focus_area_name");
                String paName = request.getParameter("process_activity_name");
                String subActivityName = request.getParameter("sub_activity_name");
                String issues = request.getParameter("issues");
                String solutions = request.getParameter("solutions");
                String added_by = request.getParameter("added_by");

                focusArea.setFocusAreaName(focusAreaName);
                processActivity.setProcessActivityName(paName);
                subActivity.setSubActivityName(subActivityName);
                user.setUsername(added_by);
                leadingPractice.setLeadingPracticeId(Integer.SIZE);
                leadingPractice.setFocusAreaName(focusArea);
                leadingPractice.setSubActivityName(subActivity);
                leadingPractice.setProcessActivityName(processActivity);
                leadingPractice.setIssues(issues);
                leadingPractice.setSolutions(solutions);
                leadingPractice.setAddedBy(user);
                boolean result = lpService.addLeadingPractice(leadingPractice);
                if (result) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('New Leading Practice sucessfully sdded.');");
                    out.println("location='process_activity.jsp';");
                    out.println("</script>");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Leading Practice already exists');");
                    out.println("location='process_activity.jsp';");
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
