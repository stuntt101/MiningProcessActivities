/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.activities.controller;

import com.activities.entities.ProcessActivity;
import com.activities.entities.SubActivity;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ERavhengani
 */
@WebServlet(name = "ActivityServlet", urlPatterns = {"/ActivityServlet"})
public class ActivityServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public ActivityServlet(){
    }

    public SubActivity RegisterSubActivity (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        SubActivity sa = new SubActivity();
        
        sa.setSubActivityId(Integer.parseInt(request.getParameter("sub_activity_id")));
        sa.setProcessActivityName(new ProcessActivity(request.getParameter("process_activity_name")));
        sa.setSubActivityName(request.getParameter("sub_activity_name"));
        
        return sa;
    }
    


}
