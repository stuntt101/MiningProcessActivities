<%-- 
    Document   : login
    Created on : 26 Jan 2017, 2:28:47 PM
    Author     : ERavhengani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/favicon-32x32_logo.png" type="image/png" sizes="32x32">
        <!--<link rel="stylesheet" type="text/css" href="css/styles.css"/>-->
        <link rel="stylesheet" href="css/login_styles.css" type="text/css" media="all" />
        <title>Login</title>

        <style>
            label {
                color: #555555;
                font-weight: bold;
                font-size:13px;
                font:  HelveticaNeue, Verdana, Arial,bold, Helvetica, sans-serif;
                display: block;
                width: 100px;
                float: left;
            }
            input, textarea, select { float: left;
                                      width:150px;
                                      -moz-border-radius: 4px; border-radius: 4px;
                                      border: 1px solid #555555 }
            body{
    font-family: sans-serif;
    font-size: medium;
    z-index: auto;
}  
            </style>
        </head>
        <body>
            <div id="header">
            <div id="header-wrap">
                <table class="header_table"width="100%" height="40%" border="0" style="background-color: #004a8d;" >
                    <tr rowspan="3"> <td colspan="3"><center>  </center></td></tr>
                    <tr align=”left”>

                        <td style="vertical-align:bottom;text-align:right;"><span style="float: left;"><img src="images/new_logo.jpg"  width="120" height="150" style="float: right;" alt="Logo" /></span></td>
                        <td>
                    <center> </center></td>

                     <td style="background-color: #004a8d; color: white;">
                    <center> <b> <h2 style="float: left;"><strong>Mining Activities Feedback Form</strong></h2></b> </center></td>
                    </tr>

                </table>
            </div>

        </div>

    <center>
        <p>&nbsp;</p>

        <p>&nbsp;</p>
                <p>&nbsp;</p>








        <!--<h2><strong>Welcome to Mining process activities main page</strong></h2>-->

        <div id="login" style="width: 450px;height: 200px; ">



            <div class="box">

                <div class="box-head">
                    <h2><strong>Sign In</strong></h2>
                </div>

                <div class="box-content"> 

                    <div class="cl">&nbsp;</div>

                    <form method="post" action="LoginServlet" autocomplete="off">
                        <table cellpadding = "3" cellspacing="12">
                            <tr>

                                <td>  <label><Strong><b>Username:</b></Strong></label></td> <td> <input type="text"  name="username"size="45" required=""></td>
                            </tr>
                            <tr>
                                <td> <label><Strong>Password:</Strong></label></td> <td> <input type="password" name="password"size="45" required=""></td>
                            </tr>
                            <tr>
                                <td></td> <td><button style="color: #fff" class="button"type="submit" value="Login" ><b>Login</b></button>
                                    <button  class="button" style="color: #fff" type="reset" value="Reset" ><b>Reset</b></button></td>
                            </tr>
                        </table>
                    </form>
                </div>

            </div>
        </div>
    </center>




    <div id="footer">
        <div class="shell" style="text-align: center;"> <span class="center">Copyright &copy; CSIR 2017. All Rights Reserved.</span> <span class="right"></span> </div>

    </div>
</body>
</html>
