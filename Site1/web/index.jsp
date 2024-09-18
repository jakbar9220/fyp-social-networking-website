<%-- 
    Document   : index
    Created on : Jan 16, 2015, 2:25:40 PM
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
                color:whitesmoke;
                font-size:12px;
                text-decoration: none;
                font-weight: normal;
            }

            .aclass:hover {
                text-decoration: underline;

            }

            .inputclass{
                color:#006666;
                border-radius: 4px;

            }

            .inputclass:hover { 
                border-color: #cccccc;
                cursor:pointer;
            }


            .inputclass2{
                border-color: #006666;
                background-color:#006666;
                color:whitesmoke;
                width:100.5%;
                height:30px;
                font-size: 15px;
                font-weight: bold;
                border-radius: 4px;
            }

            .inputclass2:hover { 
                border-color: #cccccc;
                cursor:pointer;
            }


            .inputclass3{
                border-color: #006666;
                background-color:#006666;
                color:whitesmoke;
                height:24px;
                border-radius: 4px;
            }

            .inputclass3:hover { 
                border-color: #cccccc;
                cursor:pointer;
            }

            .divclass{
                //padding:            0px;
                color:              red;
                //font-weight:bold;
                //text-align:         center;
                font-family:        serif;
            }

            .hrclass{
                display: block;
                margin-top: 0.5em;
                margin-bottom: 0.5em;
                margin-left: 0;
                margin-right: 0;
                border-style: inset;
                border-width: 2px;
            }

            .hrclass2{
                display: block;
                margin-top: 0.5em;
                margin-bottom: 0.5em;
                margin-left: 0;
                margin-right: 0;
                border-style: inset;
                border-width: 2px;
            }
        </style>
        <title>Welcome to Friendlink</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="js/jquery-2.1.3.js"></script>
        <script>
            $(document).ready(function () {
                $('#fname').focusout(function () {
                    var fname = $('#fname').val();
                    if (fname === null || fname === "") {
                        $('#result').text(". Fill this field!");
                    } else
                        $('#result').text("");
                    {

                    }
                });
                $('#lname').focusout(function () {
                    var lname = $('#lname').val();
                    if (lname === null || lname === "") {
                        $('#result1').text(". Fill this field!");
                    } else {
                        $('#result1').text("");
                    }
                });
                $('#email').focusout(function () {
                    var email = $('#email').val();
                    if (email === null || email === "") {
                        $('#result2').text(". Fill this field!");
                    } else if (!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email))) {
                        $('#result2').text(". Invalid EmaiID!");
                    } else {
                        $('#result2').text("");
                    }
                });
                $('#pass').focusout(function () {
                    var pass = $('#pass').val();
                    if (pass === null || pass === "") {
                        $('#result3').text(". Fill this field!");
                    } else if (pass.length > 0 && pass.length < 6) {
                        $('#result3').text(". Password too short!");
                    } else {
                        $('#result3').text("");
                    }
                });
            });
        </script>
    </head>
    <body >
        <div style="background-color: #006666">
            <form name="form1" action="verifySignIn">
                <table border="0" style="width:100%;">
                    <tr><td width="550" height="60" style="color:whitesmoke;font-size:25px;font-family:cursive;text-align: center;"><a style="text-decoration: none;color:whitesmoke;" href="index.jsp"><b>friendlink</b></a></td>
                        <td><table border="0" align="center">
                                <tr style="font-size:15px;font-family:cursive;font-weight: bold;color:whitesmoke">
                                    <td >Email address</td>
                                    <td >Password <a href="forgotPassword.jsp" class="aclass">Forgot your password?</a></td>
                                    <td></td>
                                </tr>
                                <tr>                            
                                    <td><input type='text' name='emailId'/></td>
                                    <td><input type='password' name='password'/></td>
                                    <td><input class="inputclass" type="submit" name="signin" value="Sign In"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <hr class="hrclass">
        <form name="form2" method="post" action="joinnow">
            <br><h1 style="font-family:cursive;text-align: center" >Connect with friendlink...</h1><br>
            <table border="0" align="center">
                <tr><td width="200px"></td>
                    <td width="500"><img src="pic2.jpg" alt="Image not found" style="width:400px;height:300px"></td>
                    <td>
                        <table border="0">
                            <tr><td width="350px" style="font-size: 20px;font-family:cursive">Register!</td><td width="200px"></td></tr>
                                <%String fn = (String) session.getAttribute("FNAME");
                                    if (fn != null) {%>
                            <tr><td height="50" align="left"><input style="width:100%;height:25px;font-size: 15px;font-weight: bold" type="text" name="fname" value="<%=fn%>" required/></td>
                                <td width="200px"></td></tr>

                            <% } else {%>
                            <tr><td height="50" align="left"><input style="width:100%;height:25px;font-size: 15px;font-weight: bold" type="text" name="fname" id="fname" placeholder="First name" required /></td>
                                <td width="200px"><div class="divclass"><div id="result"></div></div></td></tr>
                                        <%}%>
                                        <%String ln = (String) session.getAttribute("LNAME");
                                            if (ln != null) {%>
                            <tr><td height="50" align="left"><input style="width:100%;height:25px;font-size: 15px;font-weight: bold" type="text" name="lname" value="<%=ln%>" required/></td>
                                <td width="200px"></td></tr>

                            <%} else {%> 
                            <tr><td height="50" align="right"><input style="width:100%;height:25px;font-size: 15px;font-weight: bold" type="text" name="lname" id="lname" placeholder="Last name" required/></td>
                                <td width="200px"><div class="divclass"><div id="result1"></div></div></td></tr>
                                        <%}%>
                                        <%String em = (String) session.getAttribute("EMAIL");
                                            if (em != null) {%>
                            <tr><td height="50"><input style="width:100%;height:25px;font-size: 15px;font-weight: bold" type="text" name="email" value="<%=em%>"/></td><td width="200px"></td></tr>
                                    <%} else {%> 
                                    <%
                                        String str = (String) session.getAttribute("MessageEmailId");
                                        if (str != null) {
                                    %>                          
                            <tr><td height="50" ><input style="width:100%;height:25px;font-size: 15px;font-weight: bold;border:1px solid red;" name="email" type="text" placeholder="Email address" required onChange="javascript:form2.submit();"/></td>
                                <td><div class="divclass">&nbsp;   
                                        <%                                    out.println(str);
                                            session.removeAttribute("MessageEmailId");
                                        %>                            
                                    </div> 
                                </td></tr> 
                                <%} else {%>                          
                            <tr><td height="50" ><input style="width:100%;height:25px;font-size: 15px;font-weight: bold" type="text" name="email" placeholder="Email address" id="email" required  /><br></td>
                                <td width="200px"><div class="divclass"><div id="result2"></div></div></td></tr>
                                        <%}
                                            }%>
                                        <%
                                            String str1 = (String) session.getAttribute("MessagePassword");
                                            if (str1 != null) {
                                        %>  
                            <tr><td height="50" ><input style="width:100%;height:25px;font-size: 15px;font-weight: bold;border:1px solid red; " type="password" name="pass" placeholder="Password(6 or more characters)" required /></td>
                                <td><div class="divclass">&nbsp;     
                                        <%                                    out.println(str1);
                                            session.removeAttribute("MessagePassword");
                                        %>                            
                                    </div> 
                                </td></tr> 
                                <%} else {%>  
                            <tr><td height="50" ><input style="width:100%;height:25px;font-size: 15px;font-weight: bold;" type="password" name="pass" id ="pass" placeholder="Password(6 or more characters)" required/></td>
                                <td width="200px"><div class="divclass"><div id="result3"></div></div></td></tr>
                                        <%}%>
                            <tr><td height="50" ><input class="inputclass2" 
                                                        type="submit" name="button1" value="Join now"/></td><td width="200px"></td></tr>
                        </table>
                    </td>
                </tr>

            </table>
        </form>        
        <br>
        <hr class="hrclass2"><br>
        <form name="form3" action="search">
            <table align="center">
                <tr>
                    <td style="font-weight: bold">Find People: </td>
                    <td><input style="height:20px" type="text" name="fname1" placeholder="First name"/></td>
                    <td><input style="height:20px" type="text" name="lname1" placeholder="Last name"/></td>
                    <td><input class="inputclass3" type="submit" name="button2" value="Search" /></td>
                </tr>
            </table>
            <%
                session.removeAttribute("FNAME");
                session.removeAttribute("LNAME");
                session.removeAttribute("EMAIL");
            %>
            <%
                String ac = (String) session.getAttribute("Account");
                if (ac != null) {
            %>
            <script type="text/javascript">
                alert('<%=ac%>');
            </script>
            <%
                    session.removeAttribute("Account");
                }
            %>
        </form>
    </body>
</html>

