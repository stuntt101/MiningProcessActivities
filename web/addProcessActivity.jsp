<%-- 
    Document   : addProcessActivity
    Created on : 18 Jan 2017, 12:07:12 PM
    Author     : ERavhengani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form class="form"  id="contact" action="ActivityView" method="POST" >
            <h3>Add new sub activity</h3>
            <hr/>
            <table border="1">
   
                <tbody>
                    <tr>
                        <td>Focus area</td>
                        <td><input type="text" name="focus_area_name"/></td>
                    </tr>
                    <tr>
                        <td>Sub activity</td>
                        <td><input type="text" name="sub_activity_name"/></td>
                    </tr>
                    <tr>
                        <td>Process activity</td>
                        <td><input type="text" name="process_activity_name"/></td>
                    </tr>
                    <tr>
                        <td>Issues</td>
                        <td><textarea></textarea></td>
                    </tr>
                    <tr>
                        <td>Issues</td>
                        <td><textarea></textarea></td>
                    </tr>
                </tbody>
            </table>

            

            <input type="submit" id="send" name="action" value="Send"/>
            <input type="button" id="cancel" value="Cancel"/>
            <br/>
        </form>


    </body>
</html>
