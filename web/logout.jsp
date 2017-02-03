<%-- 
    Document   : logout.jsp
    Created on : 09 Jan 2017, 1:11:26 PM
    Author     : LQwabe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%		
		 session.removeAttribute("username");
		 session.removeAttribute("password");
		 session.invalidate();
                 response.sendRedirect("/MiningProcessActivities");            
	 %>
    </body>
</html>
