<%-- 
    Document   : export_test
    Created on : 07 Feb 2017, 11:43:20 AM
    Author     : ERavhengani
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Export to Word - Demo</title>
</head>
<body>
    <%
        String exportToWord = request.getParameter("exportToWord");
        if (exportToWord != null
                && exportToWord.toString().equalsIgnoreCase("YES")) {
            response.setContentType("application/vnd.ms-word");
            response.setHeader("Content-Disposition", "inline; filename="
                    + "word.doc");
 
        }
    %>
    This is the plain text. 
    <p>
    <i>This is the italic text. </i>
    <p>
    <b>This is the bold text. </b>
    <p>
    <s>This is the strike text.</s> 
    <p>
    <font color="green">This is the color text. </font>
    <p>
    <a href="#">This is hyperlink. </a>
    <p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <%
        if (exportToWord == null) {
    %>
    <a href="word.jsp?exportToWord=YES">Export to Word</a>
    <%
        }
    %>
</body>
</html>