<%-- 
    Document   : addProcessActivity
    Created on : 18 Jan 2017, 12:07:12 PM
    Author     : ERavhengani
--%>

<%@page import="com.activities.entities.User"%>
<%@page import="com.activities.entities.LeadingPractice"%>
<%@page import="com.activities.entities.SubActivity"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.activities.services.FocusAreaService"%>
<%@page import="com.activities.services.ProcessActivityService"%>
<%@page import="com.activities.services.SubActivityService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles.css"/>
        <link rel="stylesheet" type="text/css" media="screen" href="css/form-stylings.css"/>

        <title>JSP Page</title>
        <style type="text/css">
            input, textarea{
                width:100%;
                height:35px;
                margin-top:5px;
                border:1px solid #999;
                border-radius:3px;
                padding:5px;
            }



        </style>
        <script type="text/javascript">
            function fillInFields() {
                var fields = document.getElementById("process_activity_name").value.split(",");
                document.getElementById("sub_activity_id").value = fields[1];
                document.getElementById("sub_activity_name").value = fields[2];
            }
        </script>
    </head>
    <body>
        <%
            SubActivityService subActivityService = new SubActivityService();
            request.setAttribute("listSubActivities", subActivityService.getAllSubActivities());

            ProcessActivityService paService = new ProcessActivityService();
            request.setAttribute("listProcess", paService.getAllProcessActivities());

            FocusAreaService faService = new FocusAreaService();
            request.setAttribute("listFocusAreas", faService.getAllFocusAreas());
//         LeadingPractice leadingPractice = (LeadingPractice) request.getAttribute("testing");

            String focusArea = request.getParameter("focusArea");
            String processActivity = request.getParameter("processActivity");
            String subActivity = request.getParameter("subActivity");
            request.setAttribute("focusArea", focusArea);
            request.setAttribute("processActivity", processActivity);
            request.setAttribute("subActivity", subActivity);

            User user = (User) session.getAttribute("user");
            String firstname = user.getFirstname();
            String lastname = user.getLastname();
            String username = user.getUsername();
            request.setAttribute("firstname", firstname);
            request.setAttribute("lastname", lastname);
            request.setAttribute("user", user);
            request.setAttribute("username", username);


        %>
               <div id="header">
            <div id="header-wrap">
                <table width="100%" height="40%" border="0" style="background-color: #004a8d; top: 0;">
                    <tr align=”left”>

                        <td style="vertical-align:bottom;text-align:right; background-color: #004a8d;"><span style="float: left;"><img src="images/new_logo.jpg"  width="120" height="122" style="float: right;" alt="Logo" /></span></td>
                        <td style="background-color: #004a8d; color: white;">
                    <center> <b> <h2><strong>Mining Activities Feedback Form</strong></h2></b> </center></td>
                    <td style="vertical-align: bottom; background-color: #004a8d;text-align:right; width: 47%; color: white;">   <div id="top"> Welcome <strong>${firstname} ${lastname}</strong> <span>|</span> <a href="logout.jsp" style="color: red;">Log out</a> </div>  </br>  
                    </td>
                    </tr>
                </table>
            </div>

        </div>
        <br>
        <br>
        <br>
        <br>
        <form class="form"  id="contact" action="ActivityView" method="POST" >

            <center>
                <fieldset class="formFieldset"><legend class="formLegend"><b>Add Leading practice issues and solutions</b></legend>

                    <table cellpading="7" cellspacing="7">

                        <tbody>

                            <tr>
                                <td>Process activity</td>
                                <td>
                                    <input type="text" name="focus_area_name" id="focus_area_name" value="${focusArea}" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>Focus area</td>
                                <td>
                                    <input type="text" name="process_activity_name" id="process_activity_name" value="${processActivity}" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>Sub activity</td>
                                <td>
                                    <input type="text" name="sub_activity_name" id="sub_activity_name" value="${subActivity}" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>Issues</td>
                                <td><textarea name="issues" required=""></textarea></td>
                            </tr>
                            <tr>
                                <td>Solutions</td>
                                <td>
                                    <textarea name="solutions" required=""></textarea>
                                    <input type="hidden" name="added_by" id="added_by" value="${username}" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>  </td>
                                <td>
                                    <button type="submit" id="send" name="action" value="addLeadingPractice">Add Leading Practice</button> 
                                </td>
                            </tr>
                        </tbody>
                    </table>
            <%}%>
                </fieldset>
            </center>




            <br/>
        </form>
        <div id="footer">
            <div class="shell" style="text-align: center;"> <span class="center">Copyright &copy; CSIR 2017. All Rights Reserved.</span> <span class="right"></span> </div>

        </div>
    </body>
</html>
