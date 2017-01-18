/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.activities.controller;

import com.activities.entities.ProcessActivity;
import com.activities.entities.SubActivity;
import com.activities.services.SubActivityService;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ERavhengani
 */
public class AddNewSubActivity {
     public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
              
       
        String processActivityName = request.getParameter("process_activity_name");
//        sa.setProcessActivityName(request.getParameter("process_activity_name"));
        String subActivityName = request.getParameter("sub_activity_name");

        // String mineName = request.getParameter("mineName").split(",")[1];
          SubActivity sa = new SubActivity();
          ProcessActivity pa = new ProcessActivity();
          pa.setProcessActivityName(processActivityName);
        
            sa.setSubActivityId(Integer.SIZE);
                sa.setProcessActivityName(pa);
                sa.setSubActivityName(subActivityName);

       

        try {

            SubActivityService subActivityService = new SubActivityService();

            //check if the username or email address is already exist in the database
            if (subActivityService.isSubActivityExists(sa)) {

                out.println("<script type=\"text/javascript\">");
                out.println("alert('Sub activity already exists');");
                out.println("location='index.jsp';");
                out.println("</script>");

            } else {

                boolean result = subActivityService.addSubActivity(sa);

                if (result) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('new sub activity added');");
                    out.println("location='index.jsp';");
                    out.println("</script>");

                }

            }

        } finally {
            out.close();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //doPost(request, response);
    }
}
