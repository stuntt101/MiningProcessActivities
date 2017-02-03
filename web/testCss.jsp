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
        <link rel="stylesheet" type="text/css" href="css/styles.css"/>
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
        <script src="js/jquery_popup.js"></script>
        <script src="js/jquery_popup_one.js"></script>
        <script src="js/jquery_popup_two.js"></script>
        <script src="js/jquery_popup_pa.js"></script>

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

// Get the element with id="defaultOpen" and click on it
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
            button{
                width:100%;
                height:35px;
                margin-top:5px;
                border:1px solid #999;
                border-radius:3px;
                padding:5px;
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
        <div id="contactdiv_pa">
            <form class="form"  id="contact" action="AddNewSubActivity" method="POST" >
                <img src="images/button_cancel.png" class="img" id="cancel"/>
                <h3>Add new sub activity</h3>
                <hr/><br/>
                <label>Process activity: <span>*</span></label>
                <br/>


                <input type="text" id="name" name="process_activity_name" placeholder="process activity"/><br/>
                <br/>
                <input type="submit" id="send" name="action" value="addProcessActivity"/>
                <input type="button" id="cancel" value="Cancel"/>
                <br/>
            </form>

        </div>
        <!--        <fieldset>-->
        <table>
            <thead>
                <tr>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <c:forEach items="${listProcess}" var="pa">
                        <td><button onclick="location.href = 'ActivityView?action=viewActivity&processActivityName=${pa.processActivityName}'" >${pa.processActivityName}</button></td>
                        </c:forEach>
                </tr>
            </tbody>
        </table>
        <div>
            <img src="images/add_new_tab.png" width="25" height="25" id="onclick_pa" />
        </div>
        <!--</fieldset>-->



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
                <input type="text" id="email"  name="sub_activity_name" placeholder="sub activity"/><br/>
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
            <p>&nbsp;</p>
            <h2>Process Activity: ${processActivityName}</h2><br><br>
            <h3>Select one focus area from the ones shown below </h3>
            <ul class="tab">
                <li><a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen">OHS</a></li>
                <li><a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'Paris')">Cost Reduction</a></li>
                <li><a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'Tokyo')">Efficiencies</a></li>
            </ul>  
            <p>&nbsp;</p>
            <div id="London" class="tabcontent">
                <span onclick="this.parentElement.style.display = 'none'" class="topright">x</span>

                <table border="1" class="table" >
                    <thead class="thead">
                        <tr class="tr">
                            <th>Criteria</th>
                        </tr>
                        <tr class="tr">
                            <th></th>
                                <%for (Activities activities : list2) {

                                        SubActivity subActivity = activities.getSubActivityName();

                                        Map<String, String> mapresult = lpService.getLeadingPracticeByFocusAreaProcessActivitySubActivity3(new FocusArea(focusAreaname1), new ProcessActivity(processActivityName), subActivity, new User(username));
                                %>
                            <th>
                                <%=subActivity.getSubActivityName()%>
                            </th>
                            <%}%>
                        </tr>
                    </thead>
                    <tbody class="tbody">
                        <tr>
                            <th>${OHS}</th>
                                <%for (Activities activities : list2) {
                                        SubActivity subActivity = activities.getSubActivityName();
                                        Map<String, String> mapresult = lpService.getLeadingPracticeByFocusAreaProcessActivitySubActivity3(new FocusArea(focusAreaname1), new ProcessActivity(processActivityName), subActivity, new User(username));
                                %>
                            <td>
                                <table border="1" class="table">
                                    <tr>
                                        <th>Issues </th>
                                        <th>Solutions</th>
                                    </tr>
                                    <%for (Map.Entry<String, String> entry : mapresult.entrySet()) {%>
                                    <tr>
                                        <td><%=entry.getKey()%></td>
                                        <td><%=entry.getValue()%></td>
                                    </tr>
                                    <%}%>
                                    <tr>
                                        <td colspan="2" class="center">       
                                            <button type="button"  title="Add new issues and solutions" onclick="location.href = 'ActivityView?action=leadingPractices&focusArea=${OHS}&processActivity=${processActivityName}&subActivity=<%=subActivity.getSubActivityName()%>'"><img src="images/add_new_issues.png" width="15" height="15"/></button>
                                        </td> 
                                    <tr>
                                </table> 
                            </td>
                            <%}%>
                            <th>
                                <button type="button" title="Add a new sub activity column"><img src="images/add_new.png" width="25" height="25" id="onclick" /></button>
                            </th>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="Paris" class="tabcontent">
                <span onclick="this.parentElement.style.display = 'none'" class="topright">x</span>
                <table border="1" class="table" >
                    <thead class="thead">
                        <tr class="tr">
                            <th>Criteria</th>
                        </tr>
                        <tr class="tr">
                            <th></th>
                                <%for (Activities activities : list2) {
                                        SubActivity subActivity = activities.getSubActivityName();
                                        Map<String, String> mapresult = lpService.getLeadingPracticeByFocusAreaProcessActivitySubActivity3(new FocusArea(focusAreaname2), new ProcessActivity(processActivityName), subActivity, new User(username));
                                %>
                            <th>
                                <%=subActivity.getSubActivityName()%>
                            </th>
                            <%}%>
                        </tr>
                    </thead>
                    <tbody class="tbody">
                        <tr>
                            <th>${Cost}</th>

                            <%for (Activities activities : list2) {
                                    SubActivity subActivity = activities.getSubActivityName();
                                    Map<String, String> mapresult = lpService.getLeadingPracticeByFocusAreaProcessActivitySubActivity3(new FocusArea(focusAreaname2), new ProcessActivity(processActivityName), subActivity, new User(username));
                            %>
                            <td>
                                <table border="1" class="table">
                                    <tr>
                                        <th>Issues </th>
                                        <th>Solutions</th>
                                    </tr>
                                    <%for (Map.Entry<String, String> entry : mapresult.entrySet()) {%>
                                    <tr>
                                        <td><%=entry.getKey()%></td>
                                        <td><%=entry.getValue()%></td>
                                    </tr>
                                    <%}%>
                                    <tr>
                                        <td colspan="2" class="center">       
                                            <button type="button"  title="Add new issues and solutions" onclick="location.href = 'ActivityView?action=leadingPractices&focusArea=${Cost}&processActivity=${processActivityName}&subActivity=<%=subActivity.getSubActivityName()%>'"><img src="images/add_new_issues.png" width="15" height="15"/></button>
                                        </td> 
                                    <tr>
                                </table> 
                            </td>
                            <%}%>
                            <th>
                                <button type="button" title="Add a new sub activity column"><img src="images/add_new.png" width="25" height="25" id="onclick_2" /></button>
                            </th>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div id="Tokyo" class="tabcontent">
                <span onclick="this.parentElement.style.display = 'none'" class="topright">x</span>

                <table border="1" class="table" >
                    <thead class="thead">
                        <tr class="tr">
                            <th>Criteria</th>
                        </tr>
                        <tr class="tr">
                            <th></th>
                                <%for (Activities activities : list2) {
                                        SubActivity subActivity = activities.getSubActivityName();
                                        Map<String, String> mapresult = lpService.getLeadingPracticeByFocusAreaProcessActivitySubActivity3(new FocusArea(focusAreaname3), new ProcessActivity(processActivityName), subActivity, new User(username));
                                %>
                            <th>
                                <%=subActivity.getSubActivityName()%>
                            </th>
                            <%}%>
                        </tr>
                    </thead>
                    <tbody class="tbody">
                        <tr>
                            <th>${Efficiencies}</th>

                            <%for (Activities activities : list2) {
                                    SubActivity subActivity = activities.getSubActivityName();
                                    Map<String, String> mapresult = lpService.getLeadingPracticeByFocusAreaProcessActivitySubActivity3(new FocusArea(focusAreaname3), new ProcessActivity(processActivityName), subActivity, new User(username));
                            %>
                            <td>
                                <table border="1" class="table">
                                    <tr>
                                        <th>Issues </th>
                                        <th>Solutions</th>
                                    </tr>
                                    <%for (Map.Entry<String, String> entry : mapresult.entrySet()) {%>
                                    <tr>

                                        <td><%=entry.getKey()%></td>
                                        <td><%=entry.getValue()%></td>

                                    </tr>
                                    <%}%>
                                    <tr>
                                        <td colspan="2" class="center">       
                                            <button type="button" title="Add new issues and solutions" onclick="location.href = 'ActivityView?action=leadingPractices&focusArea=${Efficiencies}&processActivity=${processActivityName}&subActivity=<%=subActivity.getSubActivityName()%>'"><img src="images/add_new_issues.png" width="15" height="15"/></button>
                                        </td> 
                                    <tr>
                                </table> 
                            </td>
                            <%}%>
                            <th>
                                <button type="button" title="Add a new sub activity column"><img src="images/add_new.png" width="25" height="25" id="onclick_3" /></button>
                            </th>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>          

    </body>
</html>

