<%-- 
    Document   : form_sample
    Created on : 06 Feb 2017, 4:57:51 PM
    Author     : ERavhengani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css" />

        <title>JSP Page</title>
    </head>
    <style type="text/css">
        .form-style-3{
            max-width: 450px;
            font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
            display: block;
        }
        .form-style-3 label{
            display:block;
            margin-bottom: 10px;
        }
        .form-style-3 label > span{
            float: left;
            width: 100px;
            color: black;
            font-weight: bold;
            font-size: 13px;
            text-shadow: 1px 1px 1px #fff;
        }
        .form-style-3 fieldset{
            border-radius: 10px;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            margin: 0px 0px 10px 0px;
            border: 1px solid #FFD2D2;
            padding: 20px;
            background: #F6F6F6;
            box-shadow: inset 0px 0px 15px #FFE5E5;
            -moz-box-shadow: inset 0px 0px 15px #FFE5E5;
            -webkit-box-shadow: inset 0px 0px 15px #FFE5E5;
        }
        .form-style-3 fieldset legend{
            color: black;
            border-top: 1px solid #FFD2D2;
            border-left: 1px solid #FFD2D2;
            border-right: 1px solid #FFD2D2;
            border-radius: 5px 5px 0px 0px;
            -webkit-border-radius: 5px 5px 0px 0px;
            -moz-border-radius: 5px 5px 0px 0px;
            background: #FFF4F4;
            padding: 0px 8px 3px 8px;
            box-shadow: -0px -1px 2px #F1F1F1;
            -moz-box-shadow:-0px -1px 2px #F1F1F1;
            -webkit-box-shadow:-0px -1px 2px #F1F1F1;
            font-weight: normal;
            font-size: 12px;
        }
        .form-style-3 textarea{
            width:250px;
            height:100px;
        }
        .form-style-3 input[type=text],
        .form-style-3 input[type=date],
        .form-style-3 input[type=datetime],
        .form-style-3 input[type=number],
        .form-style-3 input[type=search],
        .form-style-3 input[type=time],
        .form-style-3 input[type=url],
        .form-style-3 input[type=email],
        .form-style-3 select, 
        .form-style-3 textarea{
            border-radius: 3px;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border: 1px solid #FFC2DC;
            outline: none;
            color: black;
            padding: 8px 8px 8px 8px;
            box-shadow: inset 1px 1px 4px #FFD5E7;
            -moz-box-shadow: inset 1px 1px 4px #FFD5E7;
            -webkit-box-shadow: inset 1px 1px 4px #FFD5E7;
            background: #FFEFF6;
            width:50%;
        }
        .form-style-3  input[type=submit],
        .form-style-3  input[type=button]{
            background: #EB3B88;
            border: 1px solid #C94A81;
            padding: 5px 15px 5px 15px;
            color: black;
            box-shadow: inset -1px -1px 3px #FF62A7;
            -moz-box-shadow: inset -1px -1px 3px #FF62A7;
            -webkit-box-shadow: inset -1px -1px 3px #FF62A7;
            border-radius: 3px;
            border-radius: 3px;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;    
            font-weight: bold;
        }
        .required{
            color:red;
            font-weight:normal;
        }
    </style>
    <body>
          <div id="header">
            <div id="header-wrap">
                <table width="100%" height="40%" border="0" style="background-color: #004a8d; top: 0;">
                    <tr align=”left”>

                        <td style="vertical-align:bottom;text-align:right; background-color: #004a8d;"><span style="float: left;"><img src="images/new_logo.jpg"  width="120" height="122" style="float: right;" alt="Logo" /></span></td>
                        <td style="background-color: #004a8d; color: white;">
                    <center> <b> <h2><strong>Mining Activities Feedback Form</strong></h2></b> </center></td>
                    <td style="vertical-align: bottom; background-color: #004a8d;text-align:right; width: 47%; color: white;">   <div id="top"> Welcome <strong>${firstname} ${lastname}</strong> <span>|</span> <a href="logout.jsp" style="color: red;">Log out</a> </div>  </br>  
                    </td>
                    </tr>
                </table>
            </div>
        </div>
        <br>
        <br>

   
    <div class="form-style-3">
        <form>
            <fieldset><legend>Leading Practices</legend>
                <label for="field1"><span>Focus area <span class="required">*</span></span><input type="text" class="input-field" name="field1" value="" /></label>
                <label for="field2"><span>Process activity <span class="required">*</span></span><input type="text" class="input-field" name="field2" value="" /></label>
                <label for="field3"><span>Sub activity <span class="required">*</span></span><input type="text" class="input-field" name="field3" value="" /></label>


                <label for="field6"><span>Issues <span class="required">*</span></span><textarea name="field6" class="textarea-field"></textarea></label>
                <label for="field6"><span>Solutions <span class="required">*</span></span><textarea name="field6" class="textarea-field"></textarea></label>
                <!--<label><span>&nbsp;</span><input type="submit" value="Submit" /></label>-->
            </fieldset>
        </form>
    </div>
    <div class="form-style-3">
        <form>
            <fieldset><legend>Leading Practices</legend>
                <label for="field1"><span>Focus area <span class="required">*</span></span><input type="text" class="input-field" name="field1" value="" /></label>
                <label for="field2"><span>Process activity <span class="required">*</span></span><input type="text" class="input-field" name="field2" value="" /></label>
                <label for="field3"><span>Sub activity <span class="required">*</span></span><input type="text" class="input-field" name="field3" value="" /></label>


                <label for="field6"><span>Issues <span class="required">*</span></span><textarea name="field6" class="textarea-field"></textarea></label>
                <label for="field6"><span>Solutions <span class="required">*</span></span><textarea name="field6" class="textarea-field"></textarea></label>
                <!--<label><span>&nbsp;</span><input type="submit" value="Submit" /></label>-->
            </fieldset>
        </form>
    </div>
      <div id="footer">
            <div class="shell" style="text-align: center;"> <span class="center">Copyright &copy; CSIR 2017. All Rights Reserved.</span> <span class="right"></span> </div>

        </div>
</body>

</html>
