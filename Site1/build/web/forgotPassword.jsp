<%-- 
    Document   : forgotPassword
    Created on : Jan 7, 2015, 3:28:12 PM
    Author     : ch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">

            .inputclass{
                border-color: #006666;
                background-color:#006666;
                color:whitesmoke;
                height:24px;
                border-radius: 4px;
            }
            .inputclass:hover { 
                border-color: #cccccc;
                cursor:pointer;
            }



        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot your Password?</title>
    </head>
    <body>
        <%@include file="header.jsp" %><br> 
        <div align="center">
            <div style=" 
                 //alignment-adjust: central;
                 padding:            0px;
                 width:              600px;
                 height:             350px;
                 //background-color:   #eeeeee;
                 border:             1px solid silver;
                 text-align:         center;
                 font-family:        cursive;
                 //font-style:         normal">  

                <h3 style="color:#006666;">Retrieve your password!</h3>
                <hr style="
                    margin-left: 20px;
                    margin-right: 20px;">
                <br>
                <form action="forgotPassword">
                    <table border="0" align="center" width="95%">
                        <tr>
                            <td align="left">Enter Email Address: </td>
                        </tr>
                        <tr>
                            <td><input type="text" style="width: 300px" name="forPass" required/></td>
                        </tr>
                        <tr>
                            <td><hr></td>
                        </tr>
                        <tr>                       
                            <td align="right">
                                <input class="inputclass" type="submit" name="emailID" value="Request"/>
                                <a href="index.jsp"><input class="inputclass" type="button" name="button1" value="Cancel"/></a>
                            </td>
                        </tr>
                    </table>
                </form>
                <%                    String str = (String) session.getAttribute("ConfirmMsg");
                    if (str != null) {
                %>
                <div style=" 
                     padding:            0px;               
                     color:              #006666;
                     text-align:         center;
                     font-family:        serif;
                     font-weight:bold;">    
                    <%                    out.println(str);
                        session.removeAttribute("ConfirmMsg");
                    %>                
                </div>
                <% }
                    String str1 = (String) session.getAttribute("ConfirmMsg1");
                    if (str1 != null) {
                %>
                <div style=" 
                     padding:            0px;               
                     color:              red;
                     text-align:         center;
                     font-family:        serif;">    
                    <%                    out.println(str1);
                            session.removeAttribute("ConfirmMsg1");
                        }
                    %>     
                </div>
            </div>
        </div>
    </body>
</html>
