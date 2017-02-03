/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.activities.controller;

import com.activities.entities.User;
import com.activities.services.LoginService;
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
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        LoginService loginService = new LoginService();
        UserService userService = new UserService();
        
        
        boolean result = loginService.authenticateUser(username, password);
        User user = userService.getUserByUsername(username);
        if(result==true ){
            if(user.getRole()==1){
            request.getSession().setAttribute("admin", user);
            response.sendRedirect("admin_page.jsp");
        }
            else{
            request.getSession().setAttribute("user", user);
            response.sendRedirect("process_activity.jsp");}
        }     
        
        
        else {
            response.sendRedirect("loginFailed.jsp");
        }
        
        }
    }
}

    