<%-- 
    Document   : all_users
    Created on : 27 Jan 2017, 2:03:26 PM
    Author     : ERavhengani
--%>

<%@page import="com.activities.services.UserService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.activities.entities.User"%>
<%@page import="com.activities.services.FocusAreaService"%>
<%@page import="com.activities.services.ProcessActivityService"%>
<%@page import="com.activities.services.SubActivityService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/favicon-32x32_logo.png" type="image/png" sizes="32x32">
                <link rel="stylesheet" type="text/css" href="styles.css"/>
                 <link rel="stylesheet" type="text/css" href="css/styles.css"/>
        <link rel="stylesheet" type="text/css" media="screen" href="css/form-stylings.css"/>
         <link rel="stylesheet" type="text/css" media="screen" href="css/table-stylings.css"/>
                

        <title>View all users</title>
        <style type="text/css">
            #top{
                float: right;
            }
            #menu{
                float: right;

            }
        </style>
    </head>

    <body>
        <%
            SubActivityService subActivityService = new SubActivityService();
            request.setAttribute("listSubActivities", subActivityService.getAllSubActivities());

            ProcessActivityService paService = new ProcessActivityService();
            request.setAttribute("listProcess", paService.getAllProcessActivities());

            FocusAreaService faService = new FocusAreaService();
            request.setAttribute("listFocusAreas", faService.getAllFocusAreas());
            
            User user = (User) session.getAttribute("admin");
            String firstname = user.getFirstname();
            String lastname = user.getLastname();
            request.setAttribute("firstname", firstname);
            request.setAttribute("lastname", lastname);
            request.setAttribute("user", user);
            
            
            UserService userService = new UserService();
            request.setAttribute("listUsers", userService.getAllusers());
            
            Integer role = 0;
            request.setAttribute("roles",userService.getUserByRole(role) );
            

        %>
      <div id="header">
            <div id="header-wrap">
                <table width="100%" height="40%" border="0" style="background-color: #004a8d; top: 0;">
                    <tr align=”left”>

                        <td style="vertical-align:bottom;text-align:right; background-color: #004a8d;"><span style="float: left;"><img src="images/new_logo.jpg"  width="120" height="122" style="float: right;" alt="Logo" /></span></td>
                        <td style="background-color: #004a8d; color: white;">
                    <center> <b> <h2><strong>Mining Activities Feedback Form</strong></h2></b> </center></td>
                    <td style="vertical-align: bottom; background-color: #004a8d;text-align:right; width: 47%; color: white;">   <div id="top"> Welcome <strong>${firstname}</strong> <span>|</span> <a href="logout.jsp" style="color: red;">Log out</a> </div>  </br>  
                    </td>
                    </tr>
                </table>
            </div>

        </div>
        <br>
        <br>
        <br>
     
        <button onclick="location.href = 'new_user.jsp'" style="float: right;">Add new user</button><br>
    <center>
        <form  id="register_user"    action ="RegisterUser"method="POST"  autocomplete="off">
            <fieldset class="formFieldset"><legend class="formLegend"><b>All users</b></legend>
                <table  class="main_table"   >
                    <thead>
                        <tr>
                            <th class="main_th">Username</th>
                            <th class="main_th">Password</th>
                            <th class="main_th">First Name</th>
                            <th class="main_th">Last Name</th>
                            <th class="main_th">Email Address</th>
                            <th class="main_th">Mine Name</th>
                            <th class="main_th">Edit</th>
                            <th class="main_th">Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${roles}" var="users">
                            <tr>
                                <td>${users.username}</td>
                                <td>${users.password}</td>
                                <td>${users.firstname}</td>
                                <td>${users.lastname}</td>
                                <td>${users.emailAddress}</td>
                                <td>${users.mineName}</td>
                                <td><a href="RegisterUser?action=edit&username=${users.username}">Edit</a></td>
                                <td><a href="RegisterUser?action=remove&username=${users.username}" onclick="return confirm('Are you sure that you want to permanently delete ${users.firstname} ${users.lastname} ?');">Remove</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </fieldset>
        </form>
    </center>
    <div id="footer">
            <div class="shell" style="text-align: center;"> <span class="center">Copyright &copy; CSIR 2017. All Rights Reserved.</span> <span class="right"></span> </div>
        </div>
</body>
</html>
