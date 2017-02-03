/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.activities.controller;

import com.activities.entities.User;
import com.activities.services.UserService;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ERavhengani
 */
public class RegisterUser extends HttpServlet {

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
            UserService userService = new UserService();
            User user = new User();

            if (action.equalsIgnoreCase("addUser")) {

                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String emailAddress = request.getParameter("emailAddress");
                String mineName = request.getParameter("mineName");
                String commodity = request.getParameter("commodity");
                Integer role = Integer.parseInt(request.getParameter("role"));

                user.setUsername(username);
                user.setPassword(password);
                user.setFirstname(firstName);
                user.setLastname(lastName);
                user.setEmailAddress(emailAddress);
                user.setMineName(mineName);
                user.setCommodity(commodity);
                user.setRole(role);

                boolean result = userService.addUser(user);
                if (result) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('New user sucessfully added');");
                    out.println("location='admin_page.jsp';");
                    out.println("</script>");

                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('The user already exist');");
                    out.println("location='new_user.jsp';");
                    out.println("</script>");
                }

            }
            if (action.equalsIgnoreCase("updateUser")) {

                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String emailAddress = request.getParameter("emailAddress");
                String mineName = request.getParameter("mineName");
                String commodity = request.getParameter("commodity");
                Integer role = Integer.parseInt(request.getParameter("role"));

                user.setUsername(username);
                user.setPassword(password);
                user.setFirstname(firstName);
                user.setLastname(lastName);
                user.setEmailAddress(emailAddress);
                user.setMineName(mineName);
                user.setCommodity(commodity);
                user.setRole(role);

                userService.updateUser(user);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('User details succesfully updated!');");
                out.println("location='all_users.jsp';");
                out.println("</script>");
            }

            if (action.equalsIgnoreCase("edit")) {

                String username = request.getParameter("username");
                User users = userService.getUserByUsername(username);
                request.setAttribute("users", users);
                request.getRequestDispatcher("edit_users.jsp").forward(request, response);

            }

            if (action.equalsIgnoreCase("remove")) {
                String username = request.getParameter("username");
                userService.deleteUser(username);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('User  succesfully deleted!');");
                out.println("location='all_users.jsp';");
                out.println("</script>");
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
