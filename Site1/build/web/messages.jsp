<%-- 
    Document   : messages
    Created on : Feb 27, 2015, 5:50:28 PM
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
            .inputclass1i{
                background-color: #e0ffff;
                border-color: #e0ffff;
                border-style: none;
                color:#006666;
                font-family: cursive;
                //font-size: 12px
            }
            .inputclassi{
                background-color: whitesmoke;
                border-color: whitesmoke;
                border-style: none;
                color:#006666;
                font-family: cursive;
                //font-size: 12px
            }

            .divclassm{
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

            .divclassm:hover {
                border-color:  #cccccc;


            }

            .inputclass2{
                background-color: #006666;
                border-color: #006666;
                border-style: none;
                color:whitesmoke;
                font-family: cursive;
                font-size: 17px;
            }

            .inputclass2:hover {
                font-weight:bold;
                cursor:pointer;

            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%session.removeAttribute("vuser1");
            session.setAttribute("editPhotos", "yes");%>
        <%@include file="head.jsp"%>
        <title>Messages</title>
    </head>
    <body style="background-color:whitesmoke"> 
        <div align="right">
            <a style="text-decoration: none;color:whitesmoke" href="editProfile.jsp">
                <div class="divclassm">
                    Edit Profile
                </div>
            </a>
        </div>     
        <div align="center"><br>
            <div style="width:600px;
                 //border:1px solid silver;
                 height:80px;
                 color:#006666;
                 font-family: cursive;
                 font-size: 30px;
                 font-weight: bold">
                Messages
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
            <div align="center" style="width:600px;height:100%" >               
                <%                        ArrayList list;
                    // personDAO pdao = new personDAO();
                    list = pdao.getAllMessagesP(st1);
                    if (list != null && !list.isEmpty()) {
                        for (int i = 0; i < list.size(); i++) {
                            String u = (String) list.get(i);
                            person p2 = pdao.getPersonP(u);
                            double m = pdao.getLatestMsg(st1, u);
                            person p1 = pdao.getMsgP(m);
                            int urm = pdao.getUnreadMessagesP(st1, u);
                %>
                <div align="center"
                     style="
                     width:600px;
                     height:100%;
                     border: 1px solid silver;                  
                     <%if ((urm > 0)) {%>background-color:#e0ffff;
                     <%} else {%> background-color:white;<%}%>
                     font-family: cursive;
                     color:#006666;
                     //
                     "> 
                    <div align="left"
                         style="
                         //width:600px;
                         height:100%;
                         //border: 1px solid silver;
                         font-family: cursive;                  
                         color:#006666;
                         margin: 10px;
                         ">
                        <table border="0" width="100%">
                            <tr>
                                <td rowspan="2" width="50px" >
                                    <% if (pdao.checkFriend(st1, p2.getEmailId())) {%>
                                    <%if (p2.getProPhoto() != null) {%>
                                    <img style="border: 1px solid silver" width="50" height="50" src="images\\<%=p2.getProPhoto()%>" alt="Not Found"/>
                                    <%} else {%>
                                    <img style="border: 1px solid silver" width="50" height="50" src="p1.jpg" alt=""/><%}%>
                                    <%} else {%>
                                    <%if (p2.getPublicProPhoto() != null) {%>
                                    <img style="border: 1px solid silver" width="50" height="50" src="images\\<%=p2.getPublicProPhoto()%>" alt="Not Found"/>
                                    <%} else {%>
                                    <img style="border: 1px solid silver" width="50" height="50" src="p1.jpg" alt=""/><%}%>
                                    <%}%>
                                </td>
                                <td>
                                    <table border="0" width="100%">
                                        <tr>
                                            <td colspan="2" height="25px" style="background-color: #006666;">
                                                <form method="post" action="viewProfile">
                                                    <input type="hidden" name="viewPro" value="<%=p2.getEmailId()%>">
                                                    <input class="inputclass2" 
                                                           type="submit" value="<%=p2.getFirstName()%> <%=p2.getLastName()%>">
                                                </form>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="250px" style="font-size: 10px;"><%=p1.getTime()%></td>
                                            <td align="right" width="110px">
                                                <!--<a style="color: #006666;font-size: 10px;" href="editPost">Edit</a>-->
                                                <div align="right" style="float:right;width:20px">
                                                    <form method="post" action="delMsgs">
                                                        <input type="hidden" name="sentto" value="<%=p2.getEmailId()%>">
                                                        <input type="hidden" name="sentby" value="<%=st1%>">
                                                        <%if (urm > 0) {%>
                                                        <input class="inputclass1i" type="image" name="delAll" value="submit" src="delete5.gif" onMouseOut="this.src = 'delete5.gif'" onMouseOver="this.src = 'delete4.gif'" alt="x" width="15" height="15" title="Delete All"
                                                               onclick="if (confirm('Are you sure you want to delete all messages with <%=p2.getFirstName()%> <%=p2.getLastName()%> ?'))
                                                                           form.action = 'delMsgs';
                                                                       else
                                                                           return false;">
                                                        <%} else {%>
                                                        <input class="inputclassi" type="image" name="delAll" value="submit" src="delete2.gif" onMouseOut="this.src = 'delete2.gif'" onMouseOver="this.src = 'delete3.gif'" alt="x" width="15" height="15" title="Delete All"
                                                               onclick="if (confirm('Are you sure you want to delete all messages with <%=p2.getFirstName()%> <%=p2.getLastName()%> ?'))
                                                                           form.action = 'delMsgs';
                                                                       else
                                                                           return false;">
                                                        <%}%>
                                                    </form>
                                                </div>
                                                <form method="get" action="viewAllMsgs.jsp">
                                                    <input type="hidden" name="viewmsgs" value="<%=p2.getEmailId()%>">
                                                    <%if (urm > 0) {%>
                                                    <input class="inputclass1i" type="image" name="msg" value="submit" src="view1.gif" onMouseOut="this.src = 'view1.gif'" onMouseOver="this.src = 'view2.gif'" alt="x" width="18" height="15" title="View All">
                                                    <%} else {%>
                                                    <input class="inputclassi" type="image" name="msg" value="submit" src="view4.gif" onMouseOut="this.src = 'view4.gif'" onMouseOver="this.src = 'view5.gif'" alt="x" width="18" height="15" title="View All">
                                                    <%}%>
                                                </form>
                                            </td>                                      
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <%=p1.getPost()%>
                        <%if (urm > 0) {%>
                        <div align="right" style="font-size: 12px;color:#cc3300"><%=urm%> new</div>
                        <%}%> 
                        <%if (st1.equals(p1.getEmailId())) {%>
                        <div align="right" style="font-size: 10px">(Your Reply)</div>
                        <%}%>                   
                    </div>
                </div>
                <%
                        }
                    }else {
                %>
                <div style="width:600px;
                     height:100%;
                     border: 1px solid silver;
                     background-color: white;
                     font-family: cursive;
                     color:#006666;">No Messages</div>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>

