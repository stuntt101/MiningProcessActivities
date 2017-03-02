<%-- 
    Document   : index
    Created on : 17 Jan 2017, 9:03:33 AM
    Author     : ERavhengani
--%>

<%@page import="com.activities.entities.User"%>
<%@page import="java.util.Map"%>
<%@page import="com.activities.entities.SubActivity"%>
<%@page import="com.activities.entities.Activities"%>
<%@page import="java.util.List"%>
<%@page import="com.activities.services.ActivitiesService"%>
<%@page import="com.activities.services.LeadingPracticeService"%>
<%@page import="com.activities.entities.FocusArea"%>
<%@page import="com.activities.entities.ProcessActivity"%>
<%@page import="com.activities.services.FocusAreaService"%>
<%@page import="com.activities.services.ProcessActivityService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.activities.services.SubActivityService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title>DataTables example - File export</title>
        <link rel="shortcut icon" type="image/png" href="/media/images/favicon.png">




        <script type="text/javascript" src="testJs/jquery-1.12.4.js"></script>
        <script type="text/javascript" src="testJs/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="testJs/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="testJs/buttons.flash.min.js"></script>
        <script type="text/javascript" src="testJs/jszip.min.js"></script>
        <script type="text/javascript" src="testJs/pdfmake.min.js"></script>
        <script type="text/javascript" src="testJs/vfs_fonts.js"></script>
        <script type="text/javascript" src="testJs/buttons.html5.min.js"></script>
        <script type="text/javascript" src="testJs/buttons.print.min.js"></script>
        <script type="text/javascript" src="testJs/buttons.colVis.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/buttons.dataTables.min.css"/>
        <link rel="stylesheet" href="css/styles.css" />





        <style>
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #dddddd;
            }
        </style>

        <script type="text/javascript" class="init">
            $(document).ready(function () {
                $('#example').DataTable({
                    dom: 'Bfrtip',
                    buttons: [
                        {
                            extend: 'print',
                            exportOptions: {
                                columns: ':visible'
                            }
                        },
                        'colvis',
                         'copy', 'csv', 'excel', 'pdf', 'print'
                         
                    ],
                    columnDefs: [{
                            targets: -1,
                            visible: true
                        }]
                });
            });
        </script>

    </head>

    <body>

        <%
            LeadingPracticeService lpService = new LeadingPracticeService();
            request.setAttribute("viewAll", lpService.getAllLeadingPractices());


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
        <p>&nbsp;</p>

        <table id="example" class="display nowrap" cellspacing="0" width="100%">


            <thead>
                <tr>
                    <th>Focus Area</th>
                    <th>ProcessActivity</th>
                    <th>SubActivity</th>
                    <th>Issues</th>
                    <th>Solutions</th>
                    <th>Added By</th>
                    <th>Mine Name</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <th>Focus Area</th>
                    <th>ProcessActivity</th>
                    <th>SubActivity</th>
                    <th>Issues</th>
                    <th>Solutions</th>
                    <th>Added By</th>
                    <th>Mine Name</th>
                </tr>
            </tfoot>
            <tbody>
                <c:forEach items="${viewAll}" var="lp">
                    <tr>
                        <td nowrap align="center">${lp.focusAreaName.focusAreaName}</td>
                        <td nowrap align="center">${lp.processActivityName.processActivityName}</td>
                        <td nowrap align="center">${lp.subActivityName.subActivityName}</td>
                        <td nowrap align="center">${lp.issues}</td>
                        <td nowrap align="center">${lp.solutions}</td>
                        <td nowrap align="center">${lp.addedBy.username}</td>
                        <td nowrap align="center">${lp.addedBy.mineName}</td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div id="NewPaginationContainer"></div>
                <div style="overflow: scroll; width: 100%; overflow: auto">
                    <table>
                        <tfoot>
                            <tr>
                                	
                                <th id="focusAreaName">focusArea Name</th>
                                <th id="processActivityName">processActivity Name</th>		
                                <th id="subActivityName">PROVINCE</th>		
                                <th id="issues">LOCALITY</th>		
                                <th id="username">SITE</th>		
                                <th id="mineName">LOCATION</th>		
                                <th id="longitude"></th>		
                                
                            </tr>
                        </tfoot>
                    </table>
                </div>

        <div id="footer">
            <div class="shell" style="text-align: center;"> <span class="center">Copyright &copy; CSIR 2017. All Rights Reserved.</span> <span class="right"></span> </div>

        </div>
    </body>

</html>
