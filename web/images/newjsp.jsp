<%-- 
    Document   : newjsp
    Created on : 21 Oct 2016, 12:58:10 PM
    Author     : LQwabe
--%>
<%@page import="java.util.List"%>
<%@page import="com.mining.service.LoginService"%>
<%@page import="java.util.Date"%>
<%@page import="com.mining.Entities.*"%>
<%@page import="com.mining.service.*"%>
<%@page import="com.mining.EntitiesBean.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Contact Form</title>
        <link rel="stylesheet" media="screen" href="style.css" />
        <link href="" rel="" type="text/css" media="screen" />
        <script src="calender/js/jquery.min.js" type="text/javascript"></script>
        <script src="calender/js/jquery.eventCalendar.js" type="text/javascript"></script> 
        <script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script  type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/jquery.validate.min.js"</script>
        <script type="text/javascript" src="js/bootstrapValidator.js"</script>
        <script type="text/javascript" src="js/history-stealer.js"></script>
        <link rel="stylesheet" type="text/css" href="css/dncalendar-skin.min.css">
        <script type="text/javascript" src="js/SessionTimers.js"></script>
        <link rel="stylesheet" type="text/css" href="css/styles.css"/>

    </head>
    <style type="text/css">
        form { width: 460px; padding: 20px; color: #333333; font-family: Verdana, Geneva, sans-serif; font-size: 12px; margin: 0 auto }
        fieldset { 
           position: relative; 
            padding: 10px;
            padding-top: 0;
            padding-top: 25px;
            display: inline-block;
            margin-bottom:30px;
            background: #F6F6F6; 
            -webkit-border-radius: 8px; 
            -moz-border-radius: 8px; 
            border-radius:8px;
            background: -webkit-gradient(linear, center top, left bottom, from(#EFEFEF), to(#FFFFFF));
            background: -moz-linear-gradient(center top, #EFEFEF, #FFFFFF 100%);
            box-shadow: 3px 3px 10px #ccc;
            -moz-box-shadow: 3px 3px 10px #ccc; 
            -webkit-box-shadow: 3px 3px 10px #ccc }

        legend { padding: 6px 12px;
                 position: absolute; left: 10px;
                 top: -11px; background-color: #4F709F;
                 color: white; -webkit-border-radius: 4px; 
                 -moz-border-radius: 4px; border-radius: 4px;
                 box-shadow: 2px 2px 4px #888; 
                 -moz-box-shadow: 2px 2px 4px #888;
                 -webkit-box-shadow: 2px 2px 4px #888 }

        label, span { float: left; 
                      clear: left;
                      display: block; 
                      width: 180px; 
                      padding-right: 20px;
                      text-align: right;
                      height: 26px; 
                      line-height: 26px }

        input, textarea, select { float: left;
                                  width: 200px;
                                  -moz-border-radius: 4px; border-radius: 4px;
                                  border: 1px solid #d9d9d9 }

        .submit,button { width: 150px;
                         float: right;
                         margin-right: 37px;
                         border: 0;
                         padding: 5px 10px; 
                         background:#709f4f; 
                         color: white; 
                         -webkit-border-radius: 4px; 
                         -moz-border-radius: 4px;
                         border-radius: 4px;
                         box-shadow: 2px 2px 4px #888; 
                         -moz-box-shadow: 2px 2px 4px #888;
                         -webkit-box-shadow: 2px 2px 4px #888;
                         margin-bottom: 4px }

        textarea { -moz-border-radius: 4px; border-radius: 4px;background: -webkit-gradient(linear, left top, left bottom, from(#FFFFFF), color-stop(1%, #EEEEEE), to(#FFFFFF)) }
        select { 
            width: 202px 
        }
        p { 
            overflow: hidden;
            margin-bottom: 10px 
        }
        p:first-of-type { 
            padding-top: 25px }

        .contact-method label {
            clear: none; width: auto 
        }
        .contact-method input { 
            float: none; width: 20px 
        }
    </style>

    <body>
        <ul>
            <li>
            </li>
        </ul>
        <%

            RegionService regionService = new RegionService();
            Region region = new Region("Region2");

            MineService ms = new MineService();

            request.setAttribute("mines", ms.getMineByRegion(region));

            String approved = "1";
            String approved_add = "6";
            String approved_update = "7";
            String delete_pending = "5";
            String delete_rejected = "5";

            //getiing the number of lift to be displays on the report
            Integer approved_lift = regionService.getLiftByRegion2(region, approved).size();
            Integer approved_add_lift = regionService.getLiftByRegion2(region, approved_add).size();
            Integer approved_update_lift = regionService.getLiftByRegion2(region, approved_update).size();
            Integer delete_pending_lift = regionService.getLiftByRegion2(region, delete_pending).size();

            //getiing the number of shaft to be displays on the report
            Integer approved_shaft = regionService.getShaftByRegion2(region, approved).size();
            Integer approved_add_shaft = regionService.getShaftByRegion2(region, approved_add).size();
            Integer approved_update_shaft = regionService.getShaftByRegion2(region, approved_update).size();
            Integer delete_pending_shaft = regionService.getShaftByRegion2(region, delete_pending).size();

            //getiing the number of chairlift to be displays on the report
            Integer approved_chairlift = regionService.getChairliftByRegion2(region, approved).size();
            Integer approved_add_chairlift = regionService.getChairliftByRegion2(region, approved_add).size();
            Integer approved_update_chairlift = regionService.getChairliftByRegion2(region, approved_update).size();
            Integer delete_pending_chairlift = regionService.getChairliftByRegion2(region, delete_pending).size();

            //getiing the number of winder to be displays on the report
            Integer approved_winder = regionService.getWinderByRegion2(region, approved).size();
            Integer approved_add_winder = regionService.getWinderByRegion2(region, approved_add).size();
            Integer approved_update_winder = regionService.getWinderByRegion2(region, approved_update).size();
            Integer delete_pending__winder = regionService.getWinderByRegion2(region, delete_pending).size();

            //getiing the number of boiler to be displays on the report
            Integer approved_boiler = regionService.getBoilerByRegion2(region, approved).size();
            Integer approved_add_boiler = regionService.getBoilerByRegion2(region, approved_add).size();
            Integer approved_update_boiler = regionService.getBoilerByRegion2(region, approved_update).size();
            Integer delete_pending_boiler = regionService.getBoilerByRegion2(region, delete_pending).size();

            //getting the amount number of each equipment
            Integer LIFT_QTY = approved_lift + approved_add_lift + approved_update_lift + delete_pending_lift;
            Integer WINDER_QTY = approved_winder + approved_add_winder + approved_update_winder + delete_pending__winder;
            Integer BOILER_QTY = approved_boiler + approved_add_boiler + approved_update_boiler + delete_pending_boiler;
            Integer CHAIRLIFT_QTY = approved_chairlift + approved_add_chairlift + approved_update_chairlift + delete_pending_chairlift;
            Integer SHAFT_QTY = approved_shaft + approved_add_shaft + approved_update_shaft + delete_pending_shaft;

        %>

        <form>
            <table style="width:230%" align="center">
                <tbody> 
                    <tr>
                        <td>

                            <fieldset>
                                <legend>Maneger Details</legend>
                                <p><label for="name" >Full Name </label><input id="name" type="text" /></p>
                                <p><label for="company" >Email<span  style="color:red">*</span> </label><input id="company" type="text" /></p>
                                <p><label for="email">Mine Mane<span  style="color:red">*</span> </label><input id="email" type="email" /></p>
                                <p><label for="telephone">Mine Number<span  style="color:red">*</span> </label><input id="telephone" type="tel" /></p>
                                <p><label for="website">Region<span  style="color:red">*</span> </label><input id="website" type="url" /></p>

                            </fieldset>  

                        </td>
                        <td></td>
                        <td>
                            <fieldset>
                                <legend> Details</legend>
                                <p>
                                    <label for="project-type">Mines</label>
                                    <select id="project-type">
                                        <option>Mine1</option>
                                        <option>Mine2</option>
                                        <option>Mine3</option>
                                        <option>Mine4</option>
                                    </select>
                                </p>
                                <p><label for="completion-date">Date</label><input id="completion-date" type="date" /></p>
                                <p><label for="project-budget"></label><input id="project-budget" type="number" /></p>
                                <p><label for="project-details">Additional Details</label><textarea id="project-details" rows="5"></textarea></p>
                            </fieldset>   

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form action="insp_generalreport.jsp" method="POST" onsubmit="return checkCheckBoxes(this);">




                                <fieldset >
                                    <legend>General Report</legend>

                                    <table>
                                        <tr>

                                            <td>Select</td>
                                            <td><select id="mine_number" name="mine_number" onchange="fillInFields()">
                                                    <option value="Select">All Mines</option>
                                                    <c:forEach items="${mines}" var="mineList">
                                                        <option value="${mineList.mineNumber},${mineList.mineName}">${mineList.mineNumber}</option>    
                                                    </c:forEach>
                                                </select>  </td>
                                        </tr>
                                        <tr>
                                            <td>Mine Name</td>
                                            <td><input type="text"   name="mine_name" id="firstNameField" />     </td>
                                        </tr>

                                        <tr>
                                            <td> Lifts</td>  
                                            <td><input type="checkbox" id="cb1" name="CheckBoxGrp1" value="Lifts" /></td>  
                                        </tr>  
                                        <tr>
                                            <td>  Shafts</td>  
                                            <td><input type="checkbox" id="cb2" name="CheckBoxGrp2" value="Shafts" /> </td>  
                                        </tr>  
                                        <tr>
                                            <td>Winders  </td>  
                                            <td><input type="checkbox" id="cb3" name="CheckBoxGrp3" value="Winders" /></td>  
                                        </tr>  
                                        <tr>
                                            <td>Boilers </td>  
                                            <td><input type="checkbox" id="cb4" name="CheckBoxGrp4" value="Boilers" /></td>  
                                        </tr>  
                                        <tr>
                                            <td> Chairlifts</td>  
                                            <td><input type="checkbox" id="cb5" name="CheckBoxGrp5" value="Chairlifts" /></td>  
                                        </tr>  
                                        <tr>
                                            <td> </td>  
                                            <td><button type="submit" > Generate Report</button></td>  
                                        </tr>  



                                </fieldset>
            </table>
        </td>
        <td></td>
        <td>
            <fieldset>
                <legend>Individual Report</legend>
                <p class="contact-method">
                    <span>Generate by&hellip;</span>
                    <label><input id="contact-method" type="radio" value="Phone" checked="checked" /> Mine</label>
                    <label><input id="contact-method" type="radio" value="Email" /> Region</label>
                </p>
                <p><label for="contact-time"></label><input id="contact-time" type="time" /></p>
                <p><input class="submit" type="submit" id="submit" value="Generate Report" /></p>
            </fieldset>    

        </td>
    </tr>
</tbody>
</table>

</form>




<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date();
        a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-17442910-1', 'auto');
    ga('send', 'pageview');
    setTimeout(function () {
        ga('send', 'event', 'engagement', 'time on page >= 60 secs');
    }, 60000);
</script>

</body>
</html>