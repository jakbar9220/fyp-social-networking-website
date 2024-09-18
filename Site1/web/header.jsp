<%-- 
    Document   : header
    Created on : Jan 15, 2015, 5:42:54 PM
    Author     : ch
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="daos.personDAO, beans.person"%>
<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">

            .aclass3{
                text-decoration: none;
                color:whitesmoke;
            }


            .aclass3:hover {
                text-decoration: underline;

            }


            .aclass4{
                text-decoration: none;
                color: whitesmoke;
                font-weight: bold;
                font-family: Verdana ;
                font-size:14px;
            }

            .td:hover{
                background-color:#005151
            }


            .inputc{
                color:#006666;
                border-radius: 4px;

            }

            .inputc:hover { 
                border-color: #cccccc;
                cursor:pointer;
            }

            .supclass{
                background-color:#cc3300;
                color:whitesmoke;
                font-size:13px;
                border:2px;
                border-color:#cc3300;
                border-style:solid;
                border-radius: 6px;
                font-family: Arial;
            }

                    
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body> 
        <%
            String mem = (String) session.getAttribute("UserLoggedIn");
            String newu = (String) session.getAttribute("UserRequest");
            String sfn = (String) session.getAttribute("fn");
            String sln = (String) session.getAttribute("ln");
            personDAO pdao = new personDAO();
            person p = pdao.header(mem);
            String pro = null;
            //"images\\" + p.getProPhoto();
            String fn = null;
            //p.getFirstName();
        %>
        <div style="background-color:#006666">
            <table border="0" width="100%">
                <tr>
                    <td width="120" height="60" style="font-size:25px;font-family:cursive;text-align: center;">
                        <%
                            if (mem != null) {
                        %>
                        <a style="text-decoration: none;color:whitesmoke;" href="Home.jsp"><b>friendlink</b></a>
                        <%
                        } else {
                        %>
                        <a style="text-decoration: none;color:whitesmoke;" href="index.jsp"><b>friendlink</b></a>
                        <%
                            }
                        %>
                    </td>              
                    <td  align="center">
                        <form method='post' action="search">
                            <%if (sfn != null) {%>
                            <input type="text" name="fname1" placeholder="First Name" value="<%=sfn%>">
                            <%session.removeAttribute("fn");
                            } else {%>
                            <input type="text" name="fname1" placeholder="First Name" value="">
                            <%}%>
                            <%if (sln != null) {%>
                            <input type="text" name="lname1" placeholder="Last Name" value="<%=sln%>">
                            <%session.removeAttribute("ln");
                            } else {%>
                            <input type="text" name="lname1" placeholder="Last Name" value="">
                            <%}%>
                            <input class="inputc" type="submit" name="search" value="Search">                           
                        </form>
                    </td>
                    <% if (mem == null && newu == null) {%>
                    <td><a href="SignIn.jsp" class="aclass3">Sign In</a></td>
                    <%                       }
                        if (mem != null) {
                            if (p.getProPhoto() != null) {
                                pro = "images//" + p.getProPhoto();
                            }
                            fn = p.getFirstName();
                    %>
                    <td width="140" align="center" class="td">
                        <a class="aclass4" href="messages.jsp">
                            <%if (pdao.getUnreadMessages(mem) != 0) {%>
                            Messages&nbsp;<sup class="supclass"> <%=pdao.getUnreadMessages(mem)%>&nbsp;</sup>
                            <%} else {%>
                            Messages
                            <%}%>
                        </a></td>
                    <td width="170" align="center" class="td">
                        <a class="aclass4" href="friendRequest.jsp">
                            <%if (pdao.getFriendRequests(mem) != 0) {%>
                            Friend Requests&nbsp;<sup class="supclass"> <%=pdao.getFriendRequests(mem)%>&nbsp;</sup>
                            <%} else {%>
                            Friend Requests
                            <%}%>
                        </a></td>
                    <td width="150" align="center" class="td">
                        <a class="aclass4" href="profileVisits.jsp">
                            <%if (pdao.getProfileVisits(mem) != 0) {%>
                            Profile Visits&nbsp;<sup class="supclass"> <%=pdao.getProfileVisits(mem)%>&nbsp;</sup>
                            <%} else {%>
                            Profile Visits
                            <%}%>
                        </a></td>
                    <td width="160" align="center" class="td">
                        <%if (p.getProPhoto() != null) {%>
                        <img width="30" height="30"  src="<%=pro%>" align="center" alt="image" >
                        <%} else {%>
                        <img width="30" height="30"  src="p1.jpg" align="center" alt="image" >
                        <%}%>


                        <a class="aclass4" href="Home.jsp"><%=fn%></a>
                    </td>
                    <td width="150" align="center"><a class="aclass3" href="signout.jsp">Sign Out</a></td>
                    <%
                        }
                    %>
                </tr>
            </table>          
        </div>        
        <hr style="display: block;
            margin-top: 0.5em;
            margin-bottom: 0.5em;
            margin-left: 0;
            margin-right: 0;
            border-style: inset;
            border-width: 2px;">      
    </body>
</html>
