<%-- 
    Document   : addProcessActivity
    Created on : 18 Jan 2017, 12:07:12 PM
    Author     : ERavhengani
--%>

<%@page import="com.activities.entities.LeadingPractice"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.activities.services.FocusAreaService"%>
<%@page import="com.activities.services.ProcessActivityService"%>
<%@page import="com.activities.services.SubActivityService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
        <style type="text/css">
            .table-content {
                padding: 20px;
            }
            .remove {
                margin-left: 10px;
                color: red;
            }
            .remove:hover {
                cursor: pointer;
            }
            .form-control {
                width: 90px;
            }
            #table{ 
                width:100px;
                float: left;
                position: fixed;
                overflow-x:  scroll;
                z-index: -1;
                overflow-y: scroll; 
                overflow: scroll;  
            }
            .table td{
                width:100px;
                height:20px;
                background:#cccccc;
            }
            button{
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

        %>

        <form class="form"  id="contact" action="ActivityView" method="POST" >
            <h3>Add Leading practice issues and solutions</h3>
            <hr/>
            <center>
                <fieldset>

                    <table cellpading="7" cellspacing="7">

                        <tbody>
                            <tr>
                                <td>Focus area</td>
                                <td>

                                    <input type="text" name="focus_area_name" id="focus_area_name" value="${OHS}" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>Process activity</td>
                                <td>
                                    <select name="process_activity_name" id="process_activity_name" onchange="fillInFields()">
                                        <option disabled selected value value="hide">Select focus area</option>
                                        <c:forEach items="${listSubActivities}" var="sa">
                                            <option value="${sa.processActivityName.processActivityName},${sa.subActivityId},${sa.subActivityName}">${sa.processActivityName.processActivityName}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Sub activity</td>


                                <td>
                                    <!--                                                                        <select name="sub_activity_name" id="sub_activity_name">
                                                                                                                <option disabled selected value value="hide">Select focus area</option>
                                    <c:forEach items="${subActivityName}" var="sa">
                                        <option value="${sa.subActivityName}">${sa.subActivityName}</option>
                                    </c:forEach>
                                </select>-->
                                    <input type="hidden" name="sub_activity_id" id="sub_activity_id" readonly/>
                                    <input type="text" name="sub_activity_name" id="sub_activity_name" readonly/>
                                </td>

                            </tr>
                            <tr>
                                <td>Issues</td>
                                <td><textarea name="issues"></textarea></td>
                            </tr>
                            <tr>
                                <td>Issues</td>
                                <td><textarea name="solutions"></textarea></td>
                            </tr>
                            <tr>


                                <td>  </td>
                                <td><input type="submit" id="send" name="action" value="addLeadingPractice"/> <input type="button" id="cancel" value="Cancel"/></td>
                            </tr>
                        </tbody>
                    </table>

                </fieldset>
            </center>




            <br/>
        </form>

    </body>
</html>
