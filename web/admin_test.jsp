<%-- 
    Document   : admin_test
    Created on : 28 Feb 2017, 10:01:02 AM
    Author     : LQwabe
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

        <title></title>
        <link rel="shortcut icon" type="image/png" href="/media/images/favicon.png">




        <!--<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />-->
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/layout-default-latest.css" type="text/css" media="all" />


        <!-- to change the theme replace "redmond" with "le-frog", "start", "ui-lightness" or "smoothness"  -->
        <style type="text/css" title="currentStyle">
            /*            @import "media/css/demo_page.css";*/
            @import "media/css/demo_table_jui.css";
            @import "media/css/redmond/jquery-ui.custom.css";
        </style>
<!--        <link rel="stylesheet" type="text/css" href="css/example-styles.css">
    <link rel="stylesheet" type="text/css" href="css/demo-styles.css">-->
        
        <!--         <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">-->
        <!--                <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />-->
        <link href="css/jquery.datatables.yadcf.css" rel="stylesheet" type="text/css" />
        <script src="media/js/jquery-ui.lightness.min.js" type="text/javascript"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.min.js"></script>
        <script src="js/jquery.dataTables.yadcf.js"></script>
        <script src="js/tableHeadFixer.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <script src="js/bootstrap.min.js"></script>
<!--         <script type="text/javascript" src="js/jquery.multi-select.js"></script>-->


        <script type="text/javascript" src="js/tableExport.js"></script>
        <script type="text/javascript" src="js/jquery.base64.js"></script>
        <script type="text/javascript" src="js/FileSaver.min.js"></script>
        <script type="text/javascript" src="jspdf/libs/sprintf.js"></script>
        <script type="text/javascript" src="jspdf/jspdf.js"></script>
        <script type="text/javascript" src="jspdf/jspdf.min.js"></script>
        <script type="text/javascript" src="jspdf/jspdf.plugin.autotable.js"></script>
        <script type="text/javascript" src="jspdf/libs/base64.js"></script>
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBQZWgKPoDDQ_RYDhmls5AivINjg6boL8Isensor=false"></script>



        <script type="text/javascript" src="testJs/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="testJs/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="testJs/buttons.flash.min.js"></script>
        <script type="text/javascript" src="testJs/jszip.min.js"></script>
        <script type="text/javascript" src="testJs/pdfmake.min.js"></script>
        <script type="text/javascript" src="testJs/vfs_fonts.js"></script>
        <script type="text/javascript" src="testJs/buttons.html5.min.js"></script>
        <script type="text/javascript" src="testJs/buttons.print.min.js"></script>
        <script type="text/javascript" src="testJs/buttons.colVis.min.js"></script>

        <!--                    <link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css"/>-->
        <link rel="stylesheet" type="text/css" href="css/buttons.dataTables.min.css"/>






        <style>
            /*            table {
                            font-family: arial, sans-serif;
                            border-collapse: collapse;
                            width: 100%;
                        }
            
                        td, th {
                            border: 1px solid #dddddd;
                            text-align: left;
                            padding: 8px;
                        }
            
                        tr:nth-child(even) {
                            background-color: #dddddd;
                        }*/
            body {
                /*                    background-image: url("images/white_background.jpg");*/
            }
            .containerDiv {
                /*	width: 30em;*/
                height: 300px;
                /*                    overflow-x: auto;*/
                white-space: nowrap;

                background: #255625 url(images/ui-bg_gloss-wave_55_5c9ccc_500x100.png) 20% 20% repeat-x;

                font-weight: bold;
                -moz-box-shadow:    inset 0 0 10px #000000;
                -webkit-box-shadow: inset 0 0 10px #000000;
                box-shadow:         inset 0 0 10px #000000;
            }
            .dataTables_info{
                font-weight: bold;
                color:black;
                font-size: 12px;

            }


            .loader {
                position: fixed;
                left: 0px;
                top: 0px;
                width: 100%;
                height: 100%;
                z-index: 9999;
                background: url('images/page-loader.gif') 50% 50% no-repeat rgb(249,249,249);
            }
            label {

                font-weight: bold;}
            tfoot input, textarea, select{
                width:150px;
                font-weight: bold;
                -moz-border-radius: 4px; border-radius: 4px;
                border: 1px solid #255625 }
            table.scroll {
                width: 100%;
                /* border-collapse: collapse; */
                border-spacing: 0;
                border: 0px solid black;
            }

            table.scroll tbody,
            table.scroll thead { display: block; }

            table.scroll thead tr th { 
                height: 20px;
                line-height: 30px;
                text-align: left;
            }

            table.scroll tbody {
                height: 250px;
                overflow-y: auto;

            }

            table.scroll tbody { border-top: 0px solid black; }

            table.scroll tbody td, thead th {
                width: 290px;  
                border-right: 0px solid black;
            }

            table.scroll tbody td:last-child, thead th:last-child {
                border-right: none;
            }
            label {
                font-weight: bold;
                color: #2e6e9e;
            }
            tfoot input, textarea, select{
                width:150px;
                font-weight: bold;
                color: #255625;
                -moz-border-radius: 4px; border-radius: 4px;
                border: 1px solid #255625 }

            .dt-button-collection a.buttons-columnVisibility:before,
            .dt-button-collection a.buttons-columnVisibility.active span:before {
                display:block;
                position:absolute;
                top:1.2em;
                left:0;
                width:12px;
                height:12px;
                box-sizing:border-box;
            }

            .dt-button-collection a.buttons-columnVisibility:before {
                content:' ';
                margin-top:-6px;
                margin-left:10px;
                border:1px solid black;
                border-radius:3px;
            }

            .dt-button-collection a.buttons-columnVisibility.active span:before {
                content:'\2714';
                margin-top:-11px;
                margin-left:12px;
                text-align:center;
                text-shadow:1px 1px #DDD, -1px -1px #DDD, 1px -1px #DDD, -1px 1px #DDD;
            }

            .dt-button-collection a.buttons-columnVisibility span {
                margin-left:20px;    
            }
            #parent {
                /*                    height: 500px;
                                                        background:url(images/body_background.jpg);
                                    overflow:hidden;
                                    width: 100%; 
                                    overflow: auto;
                                    z-index: -1;*/

            }

            #leading_practice {
                width: 100% !important;
                height: 500px;
                /*                    background:url(images/body_background.jpg);*/
            }
            #leading_practice tbody {

                overflow-y: auto;
                overflow-x: auto;
            }

            #leading_practice tr {
                cursor: pointer;}


            #leading_practice_filter 
            {
                display:none;
            }
            .dataTables_length
            {
                visibility: hidden;
            }
            .dataTables_paginate{


            }.buttons-collection{
                display: inline-table;

            }
            .glyphicon-refresh-animate {
                -webkit-animation-name: rotateThis;
                -webkit-animation-duration: 2s;
                -webkit-animation-iteration-count: infinite;
                -webkit-animation-timing-function: linear;
            }

            #myContent {
                display:none;
            }

            #map {
                height: 200px;
                width: 400px;
                display: none;
            }
            div.container {
                min-width: 980px;
                margin: 0 auto;
            }
            #button1 {
                background-color: Transparent;
                background-repeat:no-repeat;
                border: none;
                cursor:pointer;
                overflow: hidden;
                outline:none;
            }
        </style>
    

        <!--        <script type="text/javascript" class="init">
                    $(document).ready(function () {
                        $('#leading_practice').DataTable({
                            dom: 'Bfrtip',
                            buttons: [
                                {
                                    extend: 'print',
                                    exportOptions: {
                                        columns: ':visible'
                                    }
                                },
                                'colvis',
                                 'copy', 'csv', 'excel', 'pdf', 'print'
                                 
                            ],
                            columnDefs: [{
                                    targets: -1,
                                    visible: true
                                }]
                        });
                    });
                </script>-->
        
        <script type="text/javascript">
            $(document).ready(function () {
                $("#leading_practice").dataTable(({
                    "bJQueryUI": true,
                    "scrollY": "200px",
                    scrollX: '50vh',
                    fixedHeader: true,
                    scrollCollapse: true,
                    "pagingType": "full_numbers",
                    "pageLength": 50,
                    "sPaginationType": "full_numbers",
                    dom: 'Bfrtip',
                    buttons: [
                        {
                            extend: 'collection',
                            text: ' <p style="font-size:11px" >  <i   style="font-size:11px" class="fa fa-th-list"></i> Export<p>',
                            buttons: [
                                {
                                    extend: 'copy',
                                    text: '<i   style="font-size:15px" class="fa fa-copy"></i> Copy',
                                    exportOptions: {
                                        columns: ':visible'
                                    }
                                },
                                {
                                    extend: 'excelHtml5',
                                    text: '<i   style="font-size:15px" class="fa fa-file-excel-o"></i> Excel',
                                    title: 'Data export',
                                    exportOptions: {
                                        columns: ':visible'
                                    }
                                },
                                {
                                    extend: 'csvHtml5',
                                    text: '<i   style="font-size:15px" class="fa fa-file-text-o"></i> CSV',
                                    title: 'Data export',
                                    exportOptions: {
                                        columns: ':visible'
                                    }
                                }
                            ]
                        },
                        {
                            extend: 'colvis',
                            text: ' <p style="font-size:11px" >  <i   style="font-size:11px" class="fa fa-cog"></i> Show/Hide Columns<p>',
                            postfixButtons: ['colvisRestore'],
                            columns: ':not(.disable)',
//                                collectionLayout: 'fixed four-column'
                        }

                    ],
                    columnDefs: [{
                            targets: -1,
                            visible: true
                        }]


                })).yadcf([
                    {column_number: 0, data: ["Improving Efficiency", "Cost Reduction", "Efficiencies", "OHS"], filter_type: "multi_select", filter_default_label: "--select--", filter_container_id: "focusAreaName"},
                    {column_number: 1, filter_type: "multi_select", filter_default_label: "--select-- ", filter_container_id: "processActivityName"},
                    {column_number: 2, filter_type: "multi_select", filter_default_label: "--select--", filter_container_id: "subActivityName"},
                    {column_number: 3, filter_type: "multi_select", filter_default_label: "--select--", filter_container_id: "issues"},
                    {column_number: 4, filter_type: "multi_select", filter_default_label: "--select-- ", filter_container_id: "solutions"},
                    {column_number: 5, filter_type: "multi_select", filter_default_label: "--select-- ", filter_container_id: "username"},
                    {column_number: 6, filter_type: "multi_select", filter_default_label: "--select--", filter_container_id: "mineName"}


                ]);

                $("#NewPaginationContainer").append($(".dataTables_paginate"));
                $("#NewPaginationContainer").append($(".dataTables_info"));
//                     $("#bootstrap").append($(".dt-buttons"));
            });
        </script>

    </head>

    <body>

        <%
            LeadingPracticeService lpService = new LeadingPracticeService();
            request.setAttribute("viewAll", lpService.getAllLeadingPractices());


        %>
        <div id="header">
            <div id="header-wrap">
                <table width="100%" height="40%" border="0" style="background-color: #004a8d; top: 0;">
                    <tr align=”left”>

                        <td style="vertical-align:bottom;text-align:right; background-color: #004a8d;"><span style="float: left;"><img src="images/new_logo.jpg"  width="120" height="122" style="float: right;" alt="Logo" /></span></td>
                        <td style="background-color: #004a8d; color: white;">
                    <center> <b> <h2 style="font-size:25px;"><strong>Mining Activities Feedback Form</strong></h2></b> </center></td>
                    <td style="vertical-align: bottom; background-color: #004a8d;text-align:right; width: 47%; color: white;">   <div id="top"> Welcome <strong>${firstname} ${lastname}</strong> <span>|</span> <a href="logout.jsp" style="color: red;">Log out</a> </div>  </br>  
                    </td>
                    </tr>
                </table>
            </div>
        </div>
        <br>
        <br>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>




        <div  id="parent" >
            <div class="containerDiv">
                <table id="leading_practice" class="display nowrap" cellspacing="0" width="100%">


                    <thead>
                        <tr>
                          
                            <th  nowrap align="center">Focus Area</th>
                            <th  nowrap align="center">ProcessActivity</th>
                            <th  nowrap align="center">SubActivity</th>
                            <th  nowrap align="center">Issues</th>
                            <th >Solutions</th>
                            <th  nowrap align="center">Added By</th>
                            <th  nowrap align="center">Mine Name</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${viewAll}" var="lp">
                            <tr>
                                <td nowrap align="center">${lp.focusAreaName.focusAreaName}</td>
                                <td nowrap align="center">${lp.processActivityName.processActivityName}</td>
                                <td nowrap align="center">${lp.subActivityName.subActivityName}</td>
                                <td nowrap align="center">${lp.issues}</td>
                                <td nowrap align="center">${lp.solutions}</td>
                                <td nowrap align="center">${lp.addedBy.username}</td>
                                <td nowrap align="center">${lp.addedBy.mineName}</td>

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div id="NewPaginationContainer"></div>
        <div style="overflow: scroll; width: 100%; overflow: auto">
            <table>
                <tfoot id="filters">
                    <tr>
                         <th>Filter By</th>
                          <th><b>:</b></th>
                           <th><p>&nbsp;&nbsp;&nbsp;</p></th>
                        <th id="focusAreaName">Focus Area</th>	
                        <th id="processActivityName" >ProcessActivity</th>	
                        <th id="subActivityName">SubActivity</th>	
                        <th id="issues">Issues</th>
                        <th id="solutions">Solutions</th>		
                        <th id="username">Added By</th>		
                        <th id="mineName">Mine Name</th>		   		  	          
                    </tr>
                </tfoot>
            </table>
        </div>


        <div id="footer">
            <div class="shell" style="text-align: center;"> <span class="center">Copyright &copy; CSIR 2017. All Rights Reserved.</span> <span class="right"></span> </div>

        </div>
    </body>

</html>
