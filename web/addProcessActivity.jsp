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
        <link rel="icon" href="images/favicon-32x32_logo.png" type="image/png" sizes="32x32">

        <link rel="stylesheet" type="text/css" href="css/styles.css"/>
        <link rel="stylesheet" type="text/css" media="screen" href="css/form-stylings.css"/>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <script src="js/bootstrap.min.js"></script>

        <title>Add Process Activity</title>
        <style type="text/css">
             /* The Modal (background) */
            .modal {
                display: block; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 80px; /* Location of the box */
                left: 0;
                top: 10;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
/*                background-color: rgb(0,0,0);  Fallback color 
                background-color: rgba(0,0,0,0.4);  Black w/ opacity */
            }

            /* Modal Content */
            .modal-content {
                position: relative;
                background-color: #fefefe;
                margin: auto;
                padding: 0;
                border: 1px solid #888;
                width: 50%;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
                -webkit-animation-name: animatetop;
                -webkit-animation-duration: 0.4s;
                animation-name: animatetop;
                animation-duration: 0.4s
            }

            /* Add Animation */
            @-webkit-keyframes animatetop {
                from {top:-300px; opacity:0}
                to {top:0; opacity:1}
            }

            @keyframes animatetop {
                from {top:-300px; opacity:0}
                to {top:0; opacity:1}
            }

            /* The Close Button */
            .close {
                color: white;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

            .modal-header {
                padding: 2px 12px;
                background-color: #004a8d;
                color: white;

            }
            .btn-primary-spacing 
{
margin-right: 5px;
margin-bottom: 5px !important;
}

            .modal-body {padding: 2px 16px;}

            .modal-footer {
                padding: 2px 16px;
                background-color:#004a8d;
                color: white;
            }
            .btn-space {
    margin-right: 5px;
}
.btn-toolbar .btn{
    margin-right: 5px;
}
.btn-toolbar .btn:last-child{
    margin-right: 0;
}


        </style>
        <script type="text/javascript">
            function fillInFields() {
                var fields = document.getElementById("process_activity_name").value.split(",");
                document.getElementById("sub_activity_id").value = fields[1];
                document.getElementById("sub_activity_name").value = fields[2];
            }
        </script>
         <script>
                    
                   var Cancel_sbmt = document.getElementById("Cancel_sbmt");
                     // When the user clicks the Cancel button, redirect to the previous page
                    Cancel_sbmt.onclick = function (event) {
                        event.preventDefault();
                        window.location.href="process_activity.jsp";
                        
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

          <div id="myModal" class="modal">

                <!-- Modal content -->
                <div class="modal-content">
                    <div class="modal-header">
                        <p><center>Add New Leading Practice</center></p>
                    </div>
                   &nbsp;
                    <center>
                        <div class="modal-body">
                            <center>
                                <div id="bootstrap">
                                    <form   action="ActivityView" method="POST" class="form-horizontal">
                                     <input type="hidden" name="added_by" id="added_by" value="${username}" readonly/>

                          
                                        <div class="form-group">
                                            <label class="control-label col-sm-4" for="focus_area_name">Focus Area:</label>
                                            <div class="col-sm-5">
                                                <input type="text" class="form-control"name="focus_area_name" id="focus_area_name" value="${focusArea}" readonly>
                                            </div>
                                        </div>
                                     <div class="form-group">
                                            <label class="control-label col-sm-4" for="process_activity_name">Process Activity:</label>
                                            <div class="col-sm-5">
                                                <input type="text" class="form-control" id="process_activity_name" name="process_activity_name" value="${processActivity}" readonly >
                                            </div>
                                        </div>
                                     <div class="form-group">
                                            <label class="control-label col-sm-4" for="sub_activity_name">Sub Activity:</label>
                                            <div class="col-sm-5">
                                                <input type="text" class="form-control" name="sub_activity_name" id="sub_activity_name" value="${subActivity}" readonly>
                                            </div>
                                        </div>
                                     <div class="form-group">
                                            <label class="control-label col-sm-4" for="issues">Issues:</label>
                                            <div class="col-sm-5">
                                                <textarea type="text" class="form-control" id="issues" name="issues"  required></textarea>
                                            </div>
                                        </div>
                                            <div class="form-group">
                                            <label class="control-label col-sm-4" for="issues">Solutions:</label>
                                            <div class="col-sm-5">
                                                <textarea type="text" class="form-control" id="solutions" name="solutions" required></textarea>
                                            </div>
                                        </div>
                                     
                                        <div class="row">        
                                            <div class="col-sm-offset-4 col-sm-8" >
                                                <button type="submit" name="action" value="addLeadingPractice" class="btn btn-primary btn-xs col-lg-3 btn-space"style="margin-right: 35px;">Save</button>&nbsp;&nbsp;<button type="" id="Cancel_sbmt" class="btn btn-default btn-xs col-lg-3 btn-space" style="margin-right: 7px;">Cancel</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </center>

                            <br>

                        </div>
                    </center>

                </div>
            </div>
                <script>
                   var Cancel_sbmt = document.getElementById("Cancel_sbmt");
                     // When the user clicks the Cancel button, redirect to the previous page
                    Cancel_sbmt.onclick = function (event) {
                        event.preventDefault();
                        window.location.href="ActivityView?action=viewActivity&processActivityName=${processActivity}";
                        
                    } 
                </script>
                
<!--       <button style="float:bottom;" onclick="location.href = 'process_activity.jsp'" >Back</button>-->
        <div id="footer">
            <div class="shell" style="text-align: center;"> <span class="center">Copyright &copy; CSIR 2017. All Rights Reserved.</span> <span class="right"></span> </div>

        </div>
        
    </body>
</html>
