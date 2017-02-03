<%-- 
    Document   : test
    Created on : 24 Jan 2017, 4:31:59 PM
    Author     : ERavhengani
--%>

<%@page import="com.activities.entities.Activities"%>
<%@page import="com.activities.services.ActivitiesService"%>
<%@page import="java.util.List"%>
<%@page import="com.activities.services.SubActivityService"%>
<%@page import="java.util.Map"%>
<%@page import="com.activities.entities.SubActivity"%>
<%@page import="com.activities.entities.ProcessActivity"%>
<%@page import="com.activities.entities.FocusArea"%>
<%@page import="com.activities.services.LeadingPracticeService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
   <%
        LeadingPracticeService leadingPracticeService = new LeadingPracticeService();
        SubActivityService subActivityService = new SubActivityService();
        ActivitiesService aService = new ActivitiesService();
//        Activities activities = new Activities();
        
//     List<SubActivity> list2 = subActivityService.getAllSubActivities();
 String focusAreaname1 = "OHS";
FocusArea focusArea =  new FocusArea(focusAreaname1);
 String paName = "Stopping";
 String saName = "Blasting";

List<Activities> list2 = aService.getActivitiesByProcessActivity(new ProcessActivity(paName));
 List<Activities> list = aService.getActivitiesBySubActivityName(new ProcessActivity(paName), new SubActivity(saName));


   %>
    </body>
    
    <table border="1">
        <%for (Activities activities : list2) {
            SubActivity subActivity = activities.getSubActivityName();
             Map<String, String> mapresult = leadingPracticeService.getLeadingPracticeByFocusAreaProcessActivitySubActivity2(focusArea,new ProcessActivity(paName), subActivity);
%>
        <thead>
            <tr>
                <th><%=subActivity.getSubActivityName()%></th>
                
            </tr>
        </thead>
        <thead>
            <tr>
                <th>Issues</th>
                <th>Solutions</th>
            </tr>
        </thead>
        <tbody>
            <%for (Map.Entry<String, String> entry : mapresult .entrySet()) {%>
            <tr>
                <td><%=entry.getKey()%></td>
                <td><%=entry.getValue()%></td>
            </tr>
            <%}%>
             <%}%>
        </tbody>
    </table>
        <%out.print(list.size());%>
</html>
