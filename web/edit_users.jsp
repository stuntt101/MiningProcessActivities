<%-- 
    Document   : new_user
    Created on : 27 Jan 2017, 12:14:22 PM
    Author     : ERavhengani
--%>

<%@page import="com.activities.services.UserService"%>
<%@page import="com.activities.entities.User"%>
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
        <br>
    <center>

        <form  id="register_user"    action ="RegisterUser"method="POST"  autocomplete="off">
            <fieldset class="formFieldset"><legend class="formLegend"><b>Register new user</b></legend>
                <table border="0" cellpading="7" cellspacing="7">
                    <tbody>
                        <tr>
                            <td>Username<span  style="color:red">*</span></td> <td><input type="text" name="username" maxlength="45" class="form-control" value="${users.username}" readonly/></td>
                        </tr>
                        <tr>
                            <td>Password<span  style="color:red">*</span></td> <td><input type="text" id="password"  name="password" maxlength="45" class="form-control" value="${users.password}" readonly/></td>
                        </tr>
                        <tr>
                            <td>First Name<span  style="color:red">*</span></td> <td><input type="text" id="firstName" name="firstName" maxlength="45" class="form-control" value="${users.firstname}" /></td>
                        </tr>
                        <tr>
                            <td>Last Name<span  style="color:red">*</span></td> <td><input type="text"  id="lastName" name="lastName" maxlength="45" class="form-control" value="${users.lastname}"/></td>
                        </tr>
                        <tr>
                            <td>Email Address<span  style="color:red">*</span></td> <td><input type="text" id="emailAddress"   name="emailAddress" maxlength="45" value="${users.emailAddress}"/></td>
                        </tr>
                        <tr>
                            <td>Mine Name<span  style="color:red">*</span></td> <td><input type="text" id="mineName" name="mineName" maxlength="45" value="${users.mineName}" /></td>
                        </tr>
                        <tr>
                            <td>Commodity<span  style="color:red">*</span></td></td> 
                            <td><select id="commodity" name= "commodity" > 
                                    <option  value="${users.commodity}">${users.commodity}</option>
                                    <option value="Gold"> Gold</option>
                                    <option value="Platinum"> Platinum</option>  
                                    <option value="Coal"> Coal</option>  
                                    <option value="Diamond"> Diamond</option>  


                                </select>      
                                <input type="hidden" id="role" name="role" maxlength="45" value="${users.role}" />
                            </td>
                        </tr>
                        <!--                        <tr>
                                                    <td>Role<span  style="color:red">*</span></td></td> 
                                                    <td><select id="role" name= "role" > 
                                                            <option value="">Select Role</option>
                        
                                                            <option value="1"> Admin</option>
                                                            <option value="0"> Other</option>  
                        
                        
                                                        </select>        </td>
                                                </tr>-->

                        <tr>
                            <td></td> <td><button type="submit"  class="button" name="action" value="updateUser"  >Save</button> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<button type="reset" class="button"name="clear_text" value="Clear All">Clear All</button></td>
                        </tr>

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
