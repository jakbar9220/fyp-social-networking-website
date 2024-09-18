<%-- 
    Document   : SignIn
    Created on : Jan 7, 2015, 3:17:35 PM
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
            
            .aclass{
                text-decoration: none;
                color:#006666;
            }

                    
            .aclass:hover{
                 text-decoration: underline; 
            }
            
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
        <title>Sign in</title>
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

                <h3 style="color:#006666;">Site Login</h3>
                <hr style="
                    margin-left: 20px;
                    margin-right: 20px;">
                <br>
                <div align="center">
                    <%
                        String chk = (String) session.getAttribute("Check");
                        String str = (String) session.getAttribute("Message");
                        if (str != null||chk!=null) {

                    %>
                    <div style=" 
                         padding:            0px;   
                         width:              400px;
                         height:             20px;
                         border:             1px solid lightcoral;
                         background-color:   #ffe2e2;
                         text-align:         center;
                         font-family:        serif;">    
                        <%     
                            if(chk!=null){out.println(chk);}
                            else if(str!=null){  out.println(str);}
                                session.removeAttribute("Message");
                                session.removeAttribute("Check");
                            }
                        %>                    
                    </div>  
                    <br>
                    <form name="forms" method="post" action="verifySignIn">
                        <table border="0" align="center">
                            <tr>
                                <td align="left">Email:</td>
                                <td align="left"><input type="text" name="emailId"/></td>
                            </tr>
                            <tr>
                                <td align="left">Password:</td>
                                <td align="left"><input type="password" name="password"/></td>
                            </tr>
                            <tr>
                                <td></td><td align="left"><input class="inputclass" type="submit" name="login1" value="Log in"></td>
                            </tr>
                            <tr><td></td><td align="left">or</td></tr>
                            <tr>
                                <td></td>
                                <td align="left"><a class="aclass" href="index.jsp">Sign up now!</a></td>
                            </tr>     
                            <tr>
                                <td></td>
                                <td align="left"><a class="aclass" href="forgotPassword.jsp">Forgot your password!</a></td>
                            </tr>   
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
