<%-- 
    Document   : profileVisits
    Created on : Feb 27, 2015, 11:02:27 AM
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
        <style type="text/css">                                   
            .tdclass{
                border:1px solid silver;
                //border-left-color: #006666;
                //border-left-width: 4px;
                border-top-color: #006666;
                border-top-width: 7px;
                //border-right-color: #006666;
                //border-right-width: 4px;
                background-color: white;   }
            .tdclass:hover {
                background-color: lightgray;

            }
                        
             .divclassp{
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

            .divclassp:hover {
                border-color:  #cccccc;


            }
            
            .inputclass{
                background-color: white;
                border-color: white;
                border-style: none;
                color:#006666;
                font-family: cursive;
                font-size: 17px;
            }
             .inputclass:hover {
                font-weight: bold;
                cursor:pointer;


            }
            
            .inputclass2{
                border-color: #006666;
                background-color:#006666;
                color:whitesmoke;
                height:24px;
                border-radius: 4px;
            }
            .inputclass2:hover { 
                border-color: #cccccc;
                cursor:pointer;
            }
</style>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <%session.setAttribute("editPhotos", "yes");%>
            <%@include file="head.jsp"%>
            <title>Profile Visits</title>
        </head>
        <body style="background-color:whitesmoke"> 
            <div align="right">
                <a style="text-decoration: none;color:whitesmoke" href="editProfile.jsp">
                        <div class="divclassp">
                        Edit Profile
                    </div>
                </a>
            </div>     
            <div align="center"><br>
                <div style="width:600px;
                     height:80px;
                     color:#006666;
                     font-family: cursive;
                     font-size: 30px;
                     font-weight: bold">
                         Profile Visits
                     </div>
                     <br>
                     <div style="float: left;
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
                     </div>  
                     <% ArrayList list = null;
                         list = pdao.profileVisits(st1);
                         if (list != null && !list.isEmpty()) { %>
                     <div align="center" style="width:600px">
                         <div align="right">
                             <form method="post" action="resetVisits">
                                 <input class="inputclass2" 
                                 type="submit" name="Reset" value="Reset">
                         </form>
                     </div>
                </div><br>
                <%
                    for (int i = 0; i < list.size(); i++) {
                        person p1 = (person) list.get(i);
                %>

                <div align="left"
                     style=" 
                     width: 600px;
                     height: 100%;            
                     border: 1px solid silver;
                     background-color: white;
                     font-family: cursive;
                     color:#006666"> 
                         <table >
                             <tr>
                                 <td rowspan="2">
                                     <div style=" 
                                          width:100px;
                                     height:100px;                                   
                                     border: 1px solid silver;
                                     ">
                                     <%if (pdao.checkFriend(st1, p1.getEmailId())) {%>
                                     <%if (p1.getProPhoto() != null) {%>
                                     <img width="100" height="100" src="images//<%=p1.getProPhoto()%>" alt="Not found"/>
                                     <%} else {%>
                                     <img width="100" height="100" src="p1.jpg" alt=""/>
                                     <%}%>
                                     <%} else {%>
                                     <%if (p1.getPublicProPhoto() != null) {%>
                                     <img width="100" height="100" src="images//<%=p1.getPublicProPhoto()%>" alt="Not found"/>
                                     <%} else {%>
                                     <img width="100" height="100" src="p1.jpg" alt=""/>
                                     <%}%>  
                                     <%}%>
                                 </div>
                             </td>
                             <td>
                                 <form method="post" action="viewProfile">
                                     <input type="hidden" name="getEmail" value="<%=p1.getEmailId()%>">
                                     <input class="inputclass" 
                                            type="submit" name="getUser" value="<%=p1.getFirstName()%> <%=p1.getLastName()%>">                                     
                                 </form>
                             </td>
                         </tr>
                         <tr><td>&nbsp;&nbsp;visited your profile at <%=p1.getTime()%> </td></tr></table>
                </div>
                <%
                        //session.removeAttribute("UsersList");
                    }
                } else {
                         //String st = (String) session.getAttribute("ShowResult");
                    //if (st != null) {
                %><div style="width:600px;
                     height:100%;
                     border: 1px solid silver;
                     background-color: white;
                     font-family: cursive;
                     color:#006666;">No Profile Visits</div><%
                             //}
                             //session.removeAttribute("ShowResult");
                         }
                %>


            </div>
        </body>
    </html>
