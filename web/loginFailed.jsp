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
        <title>JSP Page</title>

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
            </style>
        </head>
        <body>
            <div id="header">
            <div id="header-wrap">
                <table class="header_table"width="100%" height="40%" border="0" style="background-color: #004a8d;" >
                    <tr rowspan="3"> <td colspan="3"><center>  </center></td></tr>
                    <tr align=”left”>

                        <td style="vertical-align:bottom;text-align:right;"><span style="float: left;"></span></td>
                        <td>
                    <center> <img src="images/new_logo.jpg"  width="100" height="150" style="float: right;" alt="Logo" /></center></td>

                    <td style="vertical-align: bottom; text-align:right; width: 47%; color: #fff;"> <b> <h2><strong>Mining process activities</strong></h2></b> 
                    </td>
                    </tr>

                </table>
            </div>

        </div>

    <center>
        <p>&nbsp;</p>

        <p>&nbsp;</p>

        <center>
            <div id="login" style="width: 450px;height: 200px">
                <div class=" msg msg-error" style="width: 450px ;">
                    <p> <img src="images/favicon-32x32.png" alt="alt text" style="float: left"></img><strong>Login failed! Invalid Username and/or Password. Please Try again.</strong></p>
                </div>



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
                                    <td></td> <td><button class="button"type="submit" value="Login" style="color: #fff" ><b>Login</b></button>
                                        <button  class="button" type="reset" value="Reset"  style="color: #fff"><b>Reset</b></button></td>
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
