<%-- 
    Document   : admin_page
    Created on : 27 Jan 2017, 9:35:58 AM
    Author     : ERavhengani
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.activities.entities.User"%>
<%@page import="com.activities.services.FocusAreaService"%>
<%@page import="com.activities.services.ProcessActivityService"%>
<%@page import="com.activities.services.SubActivityService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>admin home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="images/favicon-32x32_logo.png" type="image/png" sizes="32x32">
        <link rel="stylesheet" type="text/css" href="styles.css"/>

        <!--                <script type="text/javascript" src="bootstrap.min.js"></script>
                        <link rel="stylesheet" type="text/css" href="bootstrap.min.css"/>-->
        <!--<link rel="stylesheet" type="text/css" href="table-stylings.css"/>-->


        <script src="https://code.jquery.com/jquery-1.11.2.js"></script>

        <!--<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">-->
        <script  src="js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.11.2.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <script src="js/tableHeadFixer.js"></script>
        <script src="js/jquery.min.js"></script>
        <link rel="stylesheet" href="css/jquery_popup.css" />
        <link rel="stylesheet" href="css/styles.css" />
        <script src="js/jquery_popup.js"></script>
        <script src="js/jquery_popup_one.js"></script>
        <script src="js/jquery_popup_two.js"></script>
        <script src="js/jquery_popup_pa.js"></script>
        <link rel="stylesheet" type="text/css" media="screen" href="css/table-stylings.css"/>
        <script type="text/javascript" src="js/jquery-1.2.6.min.js"></script>
        <script type="text/javascript" src="js/style-table.js"></script>
        <script type="text/javascript">

            $(document).ready(function () {
                // add row
                $('body').on('click', '.add-row', function () {
                    var tr = $(this).parents('.table-content').find('.table tbody tr:last');
                    if (tr.length > 0) {
                        var clone = tr.clone();
                        clone.find(':text').val('');
                        tr.after(clone);
                    } else {
                        var cols = $(this).closest('.table-content').find('th').length,
                                tr0 = $('<tr/>');
                        tr0.html('<td><span class="remove remove-row">x</span></td><td> <input type="text" class="form-control"> </td>');
                        for (var i = 2; i < cols; i++) {
                            tr0.append('<td> static element </td>')
                        }
                        $(this).closest('.table-content').find('.table tbody').append(tr0);
                        //$(this).closest('.table-content').find('.table tbody').append('<tr> <td><span class="remove remove-row">x</span></td><td> <input type="text" class="form-control"> </td><td> static element </td><td> static element </td></tr>');
                    }
                });

                // delete row
                $('body').on('click', '.remove-row', function () {
                    $(this).parents('tr').remove();
                });

                // add column
                $('body').on('click', '.add-col', function () {
                    $(this).parent().find('.table .thead .tr').clone('<th></th>');
                    $(this).parent().find('.table .thead .tr1').append('<th id="columnName"></th>');
                    $(this).parent().find('.table .thead .tr2').append('<th><table class="table" border="1"><tr><th>Issues</th><th>Solutions</th></tr></table></th>');
                    $(this).parent().find('.table .tbody .tr').append('<td><table class="table" border="2"><tr><td>1</td><td>1</td></tr><tr><td>2</td><td>2</td></tr><tr><td>3</td><td>3</td></tr><table></td>');
                });

                // remove column
                $('body').on('click', '.remove-col', function (event) {
                    // Get index of parent TD among its siblings (add one for nth-child)
                    var ndx = $(this).parent().index() + 1;
                    // Find all TD elements with the same index
                    $('th', event.delegateTarget).remove(':nth-child(' + ndx + ')');
                    $('td', event.delegateTarget).remove(':nth-child(' + ndx + ')');
                });
            });
        </script>
        <script>
            function getName() {
                var person = prompt("Please enter column name(Sub-activity name)", "Column#");
                var x = document.getElementById('columnName');
                x.textContent = person;

            }


        </script>

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
                    <td style="vertical-align: bottom; background-color: #004a8d;text-align:right; width: 47%; color: white;">   <div id="top"> Welcome <strong>${firstname} </strong> <span>|</span> <a href="logout.jsp" style="color: red;">Log out</a> </div>  </br>  
                    </td>
                    </tr>
                </table>
            </div>

        </div>

        <br>
        <br>
        <br>
        <div class="left">
            <div id="contactdiv_pa">
                <form class="form_pa"  id="contact_pa" action="AddNewSubActivity" method="POST" >
                    <img src="images/button_cancel.png" class="img_pa" id="cancel_pa"/>
                    <h3>Add new sub activity</h3>
                    <hr/><br/>
                    <label>Process activity: <span>*</span></label>
                    <br/>
                    <input type="text" id="name_pa" name="process_activity_name" placeholder="process activity"/><br/>
                    <br/>
                    <input type="submit" id="send_pa" name="action" value="addProcessActivity"/>
                    <input type="button" id="cancel_pa" value="Cancel"/>
                    <br/>
                </form>
            </div>
            <br>
            <fieldset class="formFieldset">
                <legend class="formLegend"><b>Activities</b></legend>
                <div class="side_outerDIV">
                    <div class="side_innerDIV">
                        <table>
                            <thead>
                                <tr>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listProcess}" var="pa">
                                    <tr>
                                        <td><button onclick="location.href = 'ActivityView?action=viewActivity&processActivityName=${pa.processActivityName}'" >${pa.processActivityName}</button></td>
                                    </tr>
                                </c:forEach>                                                           
                                <tr>
                                    <td>
                                        <img src="images/add_new_tab.png" width="25" height="25" id="onclick_pa" title="Add a new process activity" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </fieldset>
        </div>
        <br>
        <div class="center">
            <br>
            <fieldset class="menuFieldset">
                <legend class="menuLegend"><b>View and add users</b></legend>

                <div id="menu">


                    <button onclick="location.href = 'new_user.jsp'">Add new user</button><br>
                    <button onclick="location.href = 'all_users.jsp'">View all users</button>


                </div>
            </fieldset>
        </div>

        <div id="footer">
            <div class="shell" style="text-align: center;"> <span class="center">Copyright &copy; CSIR 2017. All Rights Reserved.</span> <span class="right"></span> </div>
        </div>
    </body>
</html>
