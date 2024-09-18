<%-- 
    Document   : search
    Created on : Jan 22, 2015, 12:12:03 PM
    Author     : ch
--%>

<%@page import="java.util.ArrayList"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
        <style type="text/css">                                   
            .tdclass{
                border:1px solid silver;
                //border-left-color: #006666;
                //border-left-width: 4px;
                border-top-color: #006666;
                border-top-width: 7px;
                //border-right-color: #006666;
                //border-right-width: 4px;
                background-color: white;    }
            .tdclass:hover {
                background-color: lightgray;

            }
                    
            .divclass{
                width:100px;
                //height:100%;
                margin-right:20px;
                border: 1px solid #006666;
                text-align: center;
                font-family: cursive;
                background-color:#006666;
                height:24px;
                border-radius: 4px;
               

            }

            .divclass:hover {
                border-color:  #cccccc;


            }
            
            .inputclass{
                background-color: white;
                //border-color: whitesmoke;
                border-style: none;
                color:#006666;
                font-family: cursive;
                font-size: 15px;
                
            }
            
              .inputclass:hover { 
                 font-weight: bold;
                cursor:pointer;
            }
</style>
    </head>
    <body style="background-color:whitesmoke">

        <%
            String st = (String) session.getAttribute("UserLoggedIn");
            String fn_ = (String) session.getAttribute("fn");
            String ln_ = (String) session.getAttribute("ln");
            session.setAttribute("editPhotos", "yes");
            if (st != null) {
        %>
        <%@include file="head.jsp" %>
        <%        } else {
        %>
        <%@include file="header.jsp" %>
        <%            }
        %>
        <%if (st != null) {%><div align="right">
            <a style="text-decoration: none;color:whitesmoke" href="editProfile.jsp">
                <div class="divclass">
                    Edit Profile
                </div>
            </a>
        </div><%}%> 
        <div align="center"><br>
            <div style="width:600px;
                 height:80px;
                 color:#006666;
                 font-family: cursive;
                 font-size: 25px;
                 font-weight: bold">
                Results for "<%if (fn_ != null) {%><%=fn_%><%}%> <%if (ln_ != null) {%><%=ln_%><%}%>"
            </div><br>
            <%if (st != null) {%><div style="float: left;
                 margin-left: 10px;
                 font-family: cursive;
                 font-size:17px">
                <table style="width:200px;">
                    <tr>
                        <td align="center" class="tdclass">
                            <a style="text-decoration: none;color:#006666;" href="timeline.jsp">Home</a>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="tdclass">
                            <a style="text-decoration: none;color:#006666" href="mylikes.jsp">My Likes</a>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="tdclass">
                            <a style="text-decoration: none;color:#006666" href="Home.jsp">My Posts</a>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="tdclass">
                            <a style="text-decoration: none;color:#006666" href="friends.jsp">Friends</a>
                        </td>
                    </tr>
                </table>
            </div><%}%>    
            <div
                style=" 
                width: 600px;
                height: 100%;            
                border: 1px solid silver;
                background-color: white;
                font-family: cursive;
                color:#006666">

                <%
                    Object obj = session.getAttribute("UsersList");
                    ArrayList list = null;
                    if (obj != null) {
                        list = (ArrayList) obj;
                    }
                    if (list != null && !list.isEmpty()) {
                        for (int i = 0; i < list.size(); i++) {
                            person p1 = (person) list.get(i);
                %>
                <table>
                    <tr>
                        <td width="400">                          
                            <div style="
                                 position: relative;
                                 width:400px;
                                 height:150px;
                                 border: 1px solid silver;           
                                 "
                                 >
                                <% personDAO pdao1 = new personDAO();
                                    if (st != null && (pdao1.checkFriend(st, p1.getEmailId()) || st.equals(p1.getEmailId()))) {%>
                                <%if (p1.getCovPhoto() != null) {%>
                                <img  width="400" height="100" src="images//<%=p1.getCovPhoto()%>" alt="Not found"/>
                                <%} else {%>
                                <div style="background-color: lightgrey;width:400px;height:100px"></div><%}%>
                                <%} else {%>
                                <%if (p1.getPublicCovPhoto() != null) {%>
                                <img width="400" height="100" src="images//<%=p1.getPublicCovPhoto()%>" alt="Not found"/>
                                <%} else {%>
                                <div style="background-color: lightgrey;width:400px;height:100px"></div><%}%>
                                <%}%>
                                <div style=" 
                                     position: absolute;
                                     width:100px;
                                     height:100px;
                                     top: 49px;
                                     left: 10px;
                                     border: 1px solid silver;
                                     ">
                                    <%if (st != null && (pdao1.checkFriend(st, p1.getEmailId()) || st.equals(p1.getEmailId()))) {%>
                                    <%if (p1.getProPhoto() != null) {%>
                                    <img width="100" height="100" src="images//<%=p1.getProPhoto()%>" alt="Not found"/>
                                    <%} else {%>
                                    <img width="100" height="100" src="p1.jpg" alt="Not found"/><%}%>
                                    <%} else {%>
                                    <%if (p1.getPublicProPhoto() != null) {%>
                                    <img width="100" height="100" src="images//<%=p1.getPublicProPhoto()%>" alt="Not found"/>
                                    <%} else {%>
                                    <img width="100" height="100" src="p1.jpg" alt="Not found"/><%}%>
                                    <%}%>                                 
                                </div> 
                                <div style=" 
                                     position: absolute;
                                     width:200px;
                                     height:20px;
                                     top: 110px;
                                     left: 150px;
                                     //border: 1px solid silver;
                                     ">
                                    <form method="post" action="viewProfile">
                                        <input type="hidden" name="getEmail" value="<%=p1.getEmailId()%>">
                                        <input class="inputclass" 
                                               type="submit" name="getUser" value="<%=p1.getFirstName()%> <%=p1.getLastName()%>">                                     
                                    </form>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
                <%
                            session.removeAttribute("UsersList");
                        }
                    } else {
                        String st1 = (String) session.getAttribute("ShowResult");
                        //if (st1 != null) {
                        out.println(st1);
                        //}
                        //session.removeAttribute("ShowResult");                      
                    }
                %>
            </div>
        </div>
    </body>
</html>
