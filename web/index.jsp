<%-- 
    Document   : index
    Created on : 17 Jan 2017, 9:03:33 AM
    Author     : ERavhengani
--%>

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
        <script src="js/jquery_popup.js"></script>

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
            
                %>
        
        <h2> Mining Process Activities</h2>
                <div id="contactdiv">
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
        <fieldset>
            <!--<form action="ActivityView" method="POST">--> 
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
                
<!--                      <tr><td><button type="submit" name="development">Development</button></td> </tr>
                      <tr><td><button type="submit" name="Infrastructure">Infrastructure</button></td> </tr>
                      <tr><td><button type="submit" name="Processes">Processes</button></td> </tr>
                      <tr><td><button type="submit" name="RandC">Reporting and Control</button></td> </tr>
                      <tr><td><button type="submit" name="Services">Services</button></td> </tr>
                      <tr><td><button type="submit" name="sP">Stope Preparation</button></td> </tr>
                      <tr><td><button type="submit" name="Stopping">Stopping</button></td> </tr>
                      <tr><td><button type="submit" name="TandTInbound">Tramming and Transport(inbound)</button></td> </tr>
                      <tr><td><button type="submit" name="TandTInbound">Tramming and Transport(outbound)</button></td> </tr>
                      <tr><td><button>Add New</button></td> </tr>
                -->
                </tbody>
            </table>
                <!--</form>-->
              <div style="width: 18% ">
                <button id="onclick">Add New</button>
                </div>
        </fieldset>

    </body>
</html>

