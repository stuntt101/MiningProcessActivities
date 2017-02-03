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
        <title>View Process Activities</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

        <script>
            function openCity(evt, cityName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " active";
            }

            document.getElementById("defaultOpen").click();
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


            ul.tab {
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
                border: 1px solid #ccc;
                background-color: #f1f1f1;
            }

            /* Float the list items side by side */
            ul.tab li {float: left;}

            /* Style the links inside the list items */
            ul.tab li a {
                display: inline-block;
                color: black;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                transition: 0.3s;
                font-size: 17px;
                border-radius: 10px;
            }

            /* Change background color of links on hover */
            ul.tab li a:hover {
                background-color: #ddd;
            }

            /* Create an active/current tablink class */
            ul.tab li a:focus, .active {
                background-color: #ccc;
            }

            /* Style the tab content */
            .tabcontent {
                display: none;
                padding: 6px 12px;
                border: 1px solid #ccc;
                border-top: none;
            }

            .topright {
                float: right;
                cursor: pointer;
                font-size: 20px;
            }

            .topright:hover {color: red;}
            .center {
                text-align: center;
                vertical-align: middle;
            }


        </style>

    </head>
    <body>
        <%
            LeadingPracticeService lpService = new LeadingPracticeService();
            ActivitiesService aService = new ActivitiesService();
            String processActivityName = request.getParameter("processActivityName");
            String focusAreaname1 = "OHS";
            String focusAreaname2 = "Cost Reduction";
            String focusAreaname3 = "Efficiencies";

            request.setAttribute("leadingPractices1", lpService.getLeadingPracticeByFocusAreaProcessActivity(new FocusArea(focusAreaname1), new ProcessActivity(processActivityName)));
            request.setAttribute("leadingPractices2", lpService.getLeadingPracticeByFocusAreaProcessActivity(new FocusArea(focusAreaname2), new ProcessActivity(processActivityName)));
            request.setAttribute("leadingPractices3", lpService.getLeadingPracticeByFocusAreaProcessActivity(new FocusArea(focusAreaname3), new ProcessActivity(processActivityName)));
            request.setAttribute("activities1", aService.getActivitiesByProcessActivity(new ProcessActivity(processActivityName)));
            request.setAttribute("processActivityName", processActivityName);
            request.setAttribute("OHS", focusAreaname1);
            request.setAttribute("Cost", focusAreaname2);
            request.setAttribute("Efficiencies", focusAreaname3);
            List<Activities> list2 = aService.getActivitiesByProcessActivity(new ProcessActivity(processActivityName));

            ProcessActivityService paService = new ProcessActivityService();
            request.setAttribute("listProcess", paService.getAllProcessActivities());

            FocusAreaService faService = new FocusAreaService();
            request.setAttribute("listFocusAreas", faService.getAllFocusAreas());

            User user = (User) session.getAttribute("user");
            String firstname = user.getFirstname();
            String lastname = user.getLastname();
            String username = user.getUsername();
            request.setAttribute("firstname", firstname);
            request.setAttribute("lastname", lastname);
            request.setAttribute("username", username);
            request.setAttribute("user", user);

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
        <div class="left">
            <div id="contactdiv_pa">
                <form class="form_pa"  id="contact_pa" action="AddNewSubActivity" method="POST" >
                    <img src="images/button_cancel.png" class="img_pa" id="cancel_pa"/>
                    <h3>Add new process activity</h3>
                    <hr/><br/>
                    <label>Process activity: <span>*</span></label>
                    <br/>
                    <input type="text" id="name_pa" name="process_activity_name" placeholder="process activity" required=""/><br/>
                    <br/>
                    <input type="submit" id="send_pa" name="action" value="addProcessActivity"/>
                    <input type="button" id="cancel_pa" value="Cancel"/>
                    <br/>
                </form>
            </div>
            <br>
            <fieldset class="formFieldset">
                <legend class="formLegend"><b>Activities</b></legend>
                <div class="outerDIV">
                    <div class="innerDIV">
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
            <fieldset >
              
                <div id="contactdiv">
                    <form class="form"  id="contact" action="AddNewSubActivity" method="POST" >
                        <img src="images/button_cancel.png" class="img" id="cancel"/>
                        <h3>Add new sub activity</h3>
                        <hr/><br/>
                        <label>Process activity: <span>*</span></label>
                        <br/>

                        <input type="text" id="name" name="process_activity_name" value="${processActivityName}" readonly=""/><br/>
                        <br/>
                        <label>Sub-activity: <span>*</span></label>
                        <br/>
                        <input type="text" id="email"  name="sub_activity_name" placeholder="sub activity" required=""/><br/>
                        <br/>


                        <input type="submit" id="send" name="action" value="addActivities"/>
                        <input type="button" id="cancel" value="Cancel"/>
                        <br/>
                    </form>

                </div>


                <!--
                        <select name="viewall" id="viewall">
                            <option disabled selected value value="hide">Select to view</option>
                            <option value="view">OHS</option>
                            <option value="view_2">Cost Reduction</option>
                            <option value="view_3">Efficiencies</option>
                        </select>-->

                <form action="ActivityView" name="form" method="POST" autocomplete='off'>

                    <h2>Process Activity: <span style="color: red;">${processActivityName}</span></h2>
                    <h3>Select one focus area from the ones shown below </h3>
                    <div style="overflow: scroll; width: 100%; overflow: auto">
                    <ul class="tab">
                        <li><a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen">OHS</a></li>
                        <li><a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'Paris')" >Cost Reduction</a></li>
                        <li><a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'Tokyo')">Efficiencies</a></li>
                    </ul>  
                        </div>
                    <div id="London" class="tabcontent">
                        <span onclick="this.parentElement.style.display = 'none'" class="topright">x</span>

                        <table  class="main_table"  >
                            <thead class="thead">
                                <tr class="tr">
                                    <th class="main_th">Criteria</th>
                                </tr>
                                <tr class="tr">
                                    <th class="main_th" ></th>
                                        <%for (Activities activities : list2) {

                                                SubActivity subActivity = activities.getSubActivityName();

                                                Map<String, String> mapresult = lpService.getLeadingPracticeByFocusAreaProcessActivitySubActivity3(new FocusArea(focusAreaname1), new ProcessActivity(processActivityName), subActivity, new User(username));
                                        %>
                                    <th class="main_th" >
                                        <%=subActivity.getSubActivityName()%>
                                    </th>
                                    <%}%>
                                    <th> <img src="images/add_new.png" width="25" height="25" id="onclick" title="Add a new sub activity column"/></th>
                                </tr>
                            </thead>
                            
                            <tbody class="tbody">
                                <tr>
                                    <td><b>${OHS}</b></td>
                                    <%for (Activities activities : list2) {
                                            SubActivity subActivity = activities.getSubActivityName();
                                            Map<String, String> mapresult = lpService.getLeadingPracticeByFocusAreaProcessActivitySubActivity3(new FocusArea(focusAreaname1), new ProcessActivity(processActivityName), subActivity, new User(username));
                                    %>
                                    <td class="main_td" >
                                        <table  class="child_table">
                                            <tr> 
                                                <th >Issues </th>
                                                <th >Solutions</th>
                                            </tr>
                                            <%for (Map.Entry<String, String> entry : mapresult.entrySet()) {%>
                                            <tr>
                                                <td class="child_td" ><%=entry.getKey()%></td>
                                                <td class="child_td" ><%=entry.getValue()%></td>
                                            </tr>
                                            <%}%>
                                            <tr>
                                                <td colspan="2" class="center" style="background-color: transparent;">       
                                                    <a href="ActivityView?action=leadingPractices&focusArea=${OHS}&processActivity=${processActivityName}&subActivity=<%=subActivity.getSubActivityName()%>" title="Add new issues and solutions" ><img src="images/add_new_issues.png" width="15" height="15"/></a>
                                                </td> 
                                            <tr>
                                        </table> 
                                    </td>
                                    <%}%>

                                </tr>
                            </tbody>
                        </table>


                    </div>
                    <div id="Paris" class="tabcontent">
                        <span onclick="this.parentElement.style.display = 'none'" class="topright">x</span>
                        <table   class="main_table">
                            <thead class="thead">
                                <tr class="tr">
                                    <th class="main_th">Criteria</th>
                                </tr>
                                <tr class="tr">
                                    <th class="main_th"></th>
                                        <%for (Activities activities : list2) {
                                                SubActivity subActivity = activities.getSubActivityName();
                                                Map<String, String> mapresult = lpService.getLeadingPracticeByFocusAreaProcessActivitySubActivity3(new FocusArea(focusAreaname2), new ProcessActivity(processActivityName), subActivity, new User(username));
                                        %>
                                    <th class="main_th">
                                        <%=subActivity.getSubActivityName()%>
                                    </th>
                                    <%}%>
                                    <th  <button type="button" title="Add a new sub activity column"><img src="images/add_new.png" width="25" height="25" id="onclick_2" /></button>
                                    </th>
                                </tr>
                            </thead>
                            <tbody class="tbody">
                                <tr>
                                    <td><b>${Cost}</b></td>

                                    <%for (Activities activities : list2) {
                                            SubActivity subActivity = activities.getSubActivityName();
                                            Map<String, String> mapresult = lpService.getLeadingPracticeByFocusAreaProcessActivitySubActivity3(new FocusArea(focusAreaname2), new ProcessActivity(processActivityName), subActivity, new User(username));
                                    %>
                                    <td class="main_td">
                                        <table  class="child_table">
                                            <tr>
                                                <th>Issues </th>
                                                <th>Solutions</th>
                                            </tr>
                                            <%for (Map.Entry<String, String> entry : mapresult.entrySet()) {%>
                                            <tr>
                                                <td class="child_td"><%=entry.getKey()%></td>
                                                <td class="child_td"><%=entry.getValue()%></td>
                                            </tr>
                                            <%}%>
                                            <tr>
                                                <td colspan="2" class="center" style="background-color: transparent;">       
                                                    <a href="ActivityView?action=leadingPractices&focusArea=${Cost}&processActivity=${processActivityName}&subActivity=<%=subActivity.getSubActivityName()%>"  title="Add new issues and solutions" ><img src="images/add_new_issues.png" width="15" height="15"/></a>
                                                </td> 
                                            <tr>
                                        </table> 
                                    </td>
                                    <%}%>

                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div id="Tokyo" class="tabcontent">
                        <span onclick="this.parentElement.style.display = 'none'" class="topright">x</span>

                        <table   class="main_table">
                            <thead class="thead">
                                <tr class="tr">
                                    <th class="main_th">Criteria</th>
                                </tr>
                                <tr class="tr">
                                    <th class="main_th"></th>
                                        <%for (Activities activities : list2) {
                                                SubActivity subActivity = activities.getSubActivityName();
                                                Map<String, String> mapresult = lpService.getLeadingPracticeByFocusAreaProcessActivitySubActivity3(new FocusArea(focusAreaname3), new ProcessActivity(processActivityName), subActivity, new User(username));
                                        %>
                                    <th class="main_th">
                                        <%=subActivity.getSubActivityName()%>
                                    </th>
                                    <%}%>
                                    <th  <button type="button" title="Add a new sub activity column"><img src="images/add_new.png" width="25" height="25" id="onclick_3" /></button>
                                    </th>
                                </tr>
                            </thead>
                            <tbody class="tbody">
                                <tr>
                                    <td><b>${Efficiencies}</b></td>

                                    <%for (Activities activities : list2) {
                                            SubActivity subActivity = activities.getSubActivityName();
                                            Map<String, String> mapresult = lpService.getLeadingPracticeByFocusAreaProcessActivitySubActivity3(new FocusArea(focusAreaname3), new ProcessActivity(processActivityName), subActivity, new User(username));
                                    %>
                                    <td class="main_td">
                                        <table  class="child_table">
                                            <tr>
                                                <th>Issues </th>
                                                <th>Solutions</th>
                                            </tr>
                                            <%for (Map.Entry<String, String> entry : mapresult.entrySet()) {%>
                                            <tr>

                                                <td class="child_td"><%=entry.getKey()%></td>
                                                <td class="child_td"><%=entry.getValue()%></td>

                                            </tr>
                                            <%}%>
                                            <tr>
                                                <td colspan="2" class="center" style="background-color: transparent;">        
                                                    <a href="ActivityView?action=leadingPractices&focusArea=${Efficiencies}&processActivity=${processActivityName}&subActivity=<%=subActivity.getSubActivityName()%>" type="button" title="Add new issues and solutions"><img src="images/add_new_issues.png" width="15" height="15"/></a>
                                                </td> 
                                            <tr>
                                        </table> 
                                    </td>
                                    <%}%>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </form>

            </fieldset>
        </div>
        <div id="footer">
            <div class="shell" style="text-align: center;"> <span class="center">Copyright &copy; CSIR 2017. All Rights Reserved.</span> <span class="right"></span> </div>

        </div>
    </body>
</html>

